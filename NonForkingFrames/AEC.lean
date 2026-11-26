/-
Formalization of: A. Jarden and S. Shelah, Non-forking frames in abstract elementary
classes, Ann. Pure Appl. Logic 164 (2013), no. 3, 135-191. Text formalized: arXiv:0901.0852v2.

Formalization (definitions, statements and proofs; no `sorry`) of

  A. Jarden and S. Shelah, "Non-forking frames in abstract elementary classes"
  (semi-good frames), Annals of Pure and Applied Logic.
  Source: the LaTeX source of arXiv:0901.0852v2 (line numbers in comments refer to it).

NUMBERING. The paper uses `\newtheorem{theorem}{Theorem}[subsection]` with one shared counter,
so items are numbered section.subsection.n; in a section without subsections the middle number
is 0 (e.g. Definition 1.0.3 = AEC, Definition 1.0.25 = saturated, Definition 2.1.1 = good frame).
Lean names keep this numbering: `thm_7_1_13`, `prop_2_5_6`, `cor_7_1_17`, ...
Items of an enumerated list get a suffix: `prop_1_0_23_2` is item (2) of Prop 1.0.23.
Only the active text of the .tex file is used (`\begin{comment}` blocks and `%` lines are
ignored); in particular items 4.2.x (Hypothesis 4.5 ... Corollary 4.17 of an older version) are
inside a comment block and are not part of the paper.

ENCODING (details and reasons in NOTES.md, Part B):
* `lam` stands for the paper's `λ` (`λ` is a Lean keyword). `λ⁺` is `Order.succ lam`, the ordinal
  `λ⁺` is `(Order.succ lam).ord`, and `λ^{+n}` is `plusN lam n` (Def 11.0.1).
* A model is an `L`-structure whose universe is a subset of a fixed type `U`
  (`Model U L`). The type `U` carries no structure; the structures of two models are not
  required to agree on their intersection.

  The ambient type `U` does NOT appear in the paper. It is an encoding device of this
  formalization; it is not needed mathematically. The theorems quantify over every `U`
  satisfying `Room U lam`, so they are stated for every `U` satisfying the size hypothesis
  `Room U lam`.

  (Why it is there: the paper never fixes a structure of which all models are substructures.
  `U` is introduced only so that `M ∩ N`, `N − M` and unions of chains can be written as
  operations on subsets of `U`, and so that no direct limits or disjoint unions have to be
  constructed.)

  Precisely: the intersection and the difference
  of two models are the intersection and the difference of their universes; containment
  `M ⊆ N` of models is not mere inclusion of universes but `IsSubstr M N` (the universe of `M`
  is included in that of `N` and the inclusion is an `L`-embedding); and a union of a chain is
  `IsUnionOf`: its universe is the union of the universes and every member is a submodel.
  The paper's class `K` is a `Set (Model U L)`; `(K, ≼)` is a `KSys U L` (class + relation, no
  axioms). Results that involve a cardinal `lam` assume the encoding hypothesis `Room U lam`
  (`#U` is a strong limit cardinal above `lam`), which stands for "the universe of sets has room
  for all the models the paper builds".
* Functions (embeddings, isomorphisms) are total maps `U → U`; only their values on the
  relevant universe matter.
* A Galois type is a set of triples `(M, N, a)` (an equivalence class, Def 1.0.24), so
  equality of types is equality of sets.
* Sequences `⟨M_α : α ∈ I⟩` are functions `Ordinal → Model U L` constrained only on `I`.
-/
import Mathlib.ModelTheory.Basic
import Mathlib.ModelTheory.LanguageMap
import Mathlib.SetTheory.Cardinal.Arithmetic
import Mathlib.SetTheory.Cardinal.Cofinality.Ordinal
import Mathlib.SetTheory.Ordinal.Enum
import Mathlib.Logic.Relation
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Set.Card
import Mathlib.SetTheory.Cardinal.Regular

open FirstOrder FirstOrder.Language Cardinal Set

universe u

namespace SemiGoodFrames

noncomputable section

/-! ════════════════════════════════════════════════════════════════════════════
    PART 0 : ENCODING (not definitions of the paper)
    ════════════════════════════════════════════════════════════════════════════ -/

/-- ENCODING. A model: an `L`-structure whose universe is a subset of the ambient type `U`. -/
structure Model (U : Type u) (L : Language.{u, u}) where
  /-- the universe of the model -/
  carrier : Set U
  /-- the interpretation of the vocabulary -/
  str : L.Structure carrier

variable {U : Type u} {L : Language.{u, u}}

instance (M : Model U L) : L.Structure M.carrier := M.str

/-- ENCODING. `‖M‖`, the cardinality of the universe of `M`. -/
def Model.card (M : Model U L) : Cardinal.{u} := #M.carrier

/-- ENCODING. `M ⊆ N` in the sense of the paper ("`⊆` denotes the relation of being submodel",
Introduction, Notations): `M`'s universe is included in `N`'s and the inclusion map is an
`L`-embedding. -/
def IsSubstr (M N : Model U L) : Prop :=
  ∃ h : M.carrier ⊆ N.carrier, ∃ e : M.carrier ↪[L] N.carrier, ∀ x, e x = Set.inclusion h x

/-- ENCODING. `f` restricted to the universe of `M` is an isomorphism of `M` onto `N`.
In particular `N = f[M]` (with the transported structure). -/
def IsoOn (f : U → U) (M N : Model U L) : Prop :=
  ∃ g : M.carrier ≃[L] N.carrier, ∀ x : M.carrier, (g x : U) = f x

/-- Def 1.0.19(2): a function `f : M → N` is *over* `A` if `A ⊆ M ∩ N` and `f` is the identity
on `A`. -/
def Over (f : U → U) (M N : Model U L) (A : Set U) : Prop :=
  A ⊆ M.carrier ∩ N.carrier ∧ ∀ x ∈ A, f x = x

/-- ENCODING. A class of models `K` together with a 2-place relation `≼` on it. No axioms are
bundled: the axioms of an AEC are in `IsAEC`. -/
structure KSys (U : Type u) (L : Language.{u, u}) where
  /-- the class `K` -/
  K : Set (Model U L)
  /-- the relation `≼` -/
  le : Model U L → Model U L → Prop

namespace KSys

variable (S : KSys U L)

/-- Def 1.0.13: `K_κ = {M ∈ K : ‖M‖ = κ}`. -/
def Kc (κ : Cardinal.{u}) : Set (Model U L) := {M | M ∈ S.K ∧ M.card = κ}

/-- Def 1.0.13 ("etc."): `K_{<κ}`. -/
def KLt (κ : Cardinal.{u}) : Set (Model U L) := {M | M ∈ S.K ∧ M.card < κ}

/-- Def 1.0.13 ("etc."): `K_{≥κ}`. -/
def KGe (κ : Cardinal.{u}) : Set (Model U L) := {M | M ∈ S.K ∧ κ ≤ M.card}

/-- Def 1.0.13 ("etc."): `K_{>κ}`. -/
def KGt (κ : Cardinal.{u}) : Set (Model U L) := {M | M ∈ S.K ∧ κ < M.card}

/-- Def 1.0.14: `M ≺ N` when `M ≼ N` and `M ≠ N`. -/
def lt (M N : Model U L) : Prop := S.le M N ∧ M ≠ N

/-- ENCODING of `(C, ≼ ↾ C)` for a subclass `C`. -/
def restrict (C : Set (Model U L)) : KSys U L :=
  ⟨C, fun M N => M ∈ C ∧ N ∈ C ∧ S.le M N⟩

end KSys

/-- ENCODING of `(K, ⊆)` (Remark 1.0.4): the relation of being a submodel, on `K`. -/
def subKSys (K : Set (Model U L)) : KSys U L :=
  ⟨K, fun M N => M ∈ K ∧ N ∈ K ∧ IsSubstr M N⟩

/-! ### Sequences, unions, clubs -/

/-- `⟨M_α : α ∈ I⟩` is `R`-increasing: `α < β` in `I` implies `R M_α M_β`. -/
def IsIncreasing (R : Model U L → Model U L → Prop) (M : Ordinal.{u} → Model U L)
    (I : Set Ordinal.{u}) : Prop :=
  ∀ α ∈ I, ∀ β ∈ I, α < β → R (M α) (M β)

/-- `⟨M_α : α ∈ I⟩` is continuous: for limit `β ∈ I`, `M_β = ⋃_{α<β} M_α`. -/
def IsContinuous (M : Ordinal.{u} → Model U L) (I : Set Ordinal.{u}) : Prop :=
  ∀ β ∈ I, Order.IsSuccLimit β → (M β).carrier = ⋃ α ∈ Iio β, (M α).carrier

/-- `N` is the union model `⋃ {M_α : α ∈ I}`: its universe is the union and every `M_α` is a
submodel (this determines the structure of `N`). -/
def IsUnionOf (M : Ordinal.{u} → Model U L) (I : Set Ordinal.{u}) (N : Model U L) : Prop :=
  N.carrier = ⋃ α ∈ I, (M α).carrier ∧ ∀ α ∈ I, IsSubstr (M α) N

/-- `⟨M_α : α ∈ I⟩` is a `≼`-increasing continuous sequence of models in `C`. -/
def IsIncCont (S : KSys U L) (M : Ordinal.{u} → Model U L) (I : Set Ordinal.{u})
    (C : Set (Model U L)) : Prop :=
  IsIncreasing S.le M I ∧ IsContinuous M I ∧ ∀ α ∈ I, M α ∈ C

/-- A sequence of functions `⟨f_α : α ∈ I⟩` (`f_α` with domain `M_α`) is increasing. -/
def FunIncreasing (f : Ordinal.{u} → U → U) (M : Ordinal.{u} → Model U L)
    (I : Set Ordinal.{u}) : Prop :=
  ∀ α ∈ I, ∀ β ∈ I, α < β → ∀ x ∈ (M α).carrier, f β x = f α x

/-- A sequence of functions `⟨f_α : α ∈ I⟩` is continuous: at limit `β`, `f_β = ⋃_{α<β} f_α`. -/
def FunContinuous (f : Ordinal.{u} → U → U) (M : Ordinal.{u} → Model U L)
    (I : Set Ordinal.{u}) : Prop :=
  ∀ β ∈ I, Order.IsSuccLimit β → ∀ x ∈ (M β).carrier,
    ∃ α < β, x ∈ (M α).carrier ∧ f β x = f α x

/-- Standard (not defined in the paper): `C` is a club of the ordinal `κ`. -/
def IsClubIn (κ : Ordinal.{u}) (C : Set Ordinal.{u}) : Prop :=
  C ⊆ Iio κ ∧ (∀ α < κ, ∃ β ∈ C, α < β) ∧
    ∀ γ < κ, Order.IsSuccLimit γ → (∀ α < γ, ∃ β ∈ C, α < β ∧ β < γ) → γ ∈ C

/-- Standard (not defined in the paper): `T` is a stationary subset of the ordinal `κ`. -/
def IsStationaryIn (κ : Ordinal.{u}) (T : Set Ordinal.{u}) : Prop :=
  T ⊆ Iio κ ∧ ∀ C, IsClubIn κ C → (T ∩ C).Nonempty

/-- Standard: `X / D_κ = Y / D_κ` where `D_κ` is the club filter on `κ` (Def 9.1.3), i.e. `X`
and `Y` agree on a club. -/
def ClubEq (κ : Ordinal.{u}) (X Y : Set Ordinal.{u}) : Prop :=
  ∃ C, IsClubIn κ C ∧ X ∩ C = Y ∩ C

-- DEVIATION (added hypothesis, encoding): every theorem that involves a cardinal `lam` takes
-- `hU : Room U lam`. It is not a hypothesis of the paper (see NOTES.md, B.1).
/-- ENCODING hypothesis on the ambient type: `#U` is a strong limit cardinal above `lam`, so
every model the paper constructs (of cardinality `λ^{+n}`, or `2^{λ^{+n}}` many models) has
isomorphic copies inside `U`. Not a hypothesis of the paper. -/
def Room (U : Type u) (lam : Cardinal.{u}) : Prop := IsStrongLimit #U ∧ lam < #U

/-- Def 11.0.1: `λ^{+n}`, the `n`-th cardinal after `λ` (`λ^{+0} = λ`). Placed here because
it is used throughout. -/
def plusN (lam : Cardinal.{u}) (n : ℕ) : Cardinal.{u} := Order.succ^[n] lam

/-! ════════════════════════════════════════════════════════════════════════════
    PART 1 : SECTION 1  (Introduction: AECs, types, saturation)
    ════════════════════════════════════════════════════════════════════════════
    Theorems 1.0.1 and 1.0.2 use notions defined only in Sections 2–11; they are stated at the
    end of this file (`thm_1_0_1`, `thm_1_0_2`). -/

namespace KSys

variable (S : KSys U L)

/-- Def 1.0.3(1)(a): `K, ≼` are closed under isomorphisms: "if `M₁ ∈ K`, `M₀ ≼ M₁` and
`f : M₁ → N₁` is an isomorphism, then `N₁ ∈ K` and `f[M₀] ≼ f[M₁] = N₁`". -/
def AxIso : Prop :=
  ∀ (M₀ M₁ N₁ : Model U L) (f : U → U), M₁ ∈ S.K → S.le M₀ M₁ → IsoOn f M₁ N₁ →
    N₁ ∈ S.K ∧ ∃ M₀' : Model U L, IsoOn f M₀ M₀' ∧ S.le M₀' N₁

/-- Def 1.0.3(1)(b), first half: `≼` is a partial order on `K`. -/
def AxPO : Prop :=
  (∀ M N, S.le M N → M ∈ S.K ∧ N ∈ S.K) ∧ (∀ M ∈ S.K, S.le M M) ∧
    (∀ M N, S.le M N → S.le N M → M = N) ∧ (∀ M N P, S.le M N → S.le N P → S.le M P)

/-- Def 1.0.3(1)(b), second half: `≼` is included in the (sub)model inclusion relation. -/
def AxIncl : Prop := ∀ M N, S.le M N → IsSubstr M N

-- AGENT-CHOICE (reading): `δ` ranges over limit ordinals, by the paper's convention on the letter `δ`
-- (Introduction, Notations); the same reading is used in Axiom d, Def 2.1.1(3)(c),(g), Thm 2.6.8.
/-- Def 1.0.3(1)(c) for chains of length `δ`: if `⟨M_α : α < δ⟩` is `≼`-increasing continuous,
then `M₀ ≼ ⋃ {M_α : α < δ} ∈ K`. (`δ` is a limit ordinal by the paper's convention on the
letter `δ`, Introduction, Notations.) -/
def AxUnion (δ : Ordinal.{u}) : Prop :=
  ∀ M : Ordinal.{u} → Model U L, IsIncreasing S.le M (Iio δ) → IsContinuous M (Iio δ) →
    ∃ N, IsUnionOf M (Iio δ) N ∧ N ∈ S.K ∧ S.le (M 0) N

/-- Def 1.0.3(1)(d), smoothness, for chains of length `δ`. -/
-- PROOF-STAGE CHANGE: added `N' ∈ S.K` (the union is in the class). Without it Remark
-- 1.0.4(1),(3) are false (step: smoothness for `(K, ⊆)` when the union is not in `K`); in an
-- AEC the union is in `K` by Axiom c, so `IsAEC` is unchanged.
def AxSmooth (δ : Ordinal.{u}) : Prop :=
  ∀ (M : Ordinal.{u} → Model U L) (N : Model U L), IsIncreasing S.le M (Iio δ) →
    IsContinuous M (Iio δ) → (∀ α < δ, S.le (M α) N) →
      ∀ N', IsUnionOf M (Iio δ) N' → N' ∈ S.K → S.le N' N

/-- Def 1.0.3(1)(e): if `M₀ ⊆ M₁ ⊆ M₂`, `M₀ ≼ M₂` and `M₁ ≼ M₂`, then `M₀ ≼ M₁`. -/
def AxCoh : Prop :=
  ∀ M₀ M₁ M₂, IsSubstr M₀ M₁ → IsSubstr M₁ M₂ → S.le M₀ M₂ → S.le M₁ M₂ → S.le M₀ M₁

/-- Def 1.0.3(1)(f), the property defining the Löwenheim–Skolem–Tarski number: for every
`N ∈ K` and `A ⊆ N` there is `M ∈ K` with `A ⊆ M ≼ N` and `‖M‖ ≤ κ + |A|`. -/
def HasLST (κ : Cardinal.{u}) : Prop :=
  ∀ N ∈ S.K, ∀ A ⊆ N.carrier, ∃ M ∈ S.K, A ⊆ M.carrier ∧ S.le M N ∧ M.card ≤ κ + #A

/-- Def 1.0.3(1)(f): there is a Löwenheim–Skolem–Tarski number. -/
def AxLST : Prop := ∃ κ, S.HasLST κ

/-- Def 1.0.3(1)(f): `LST(K, ≼)`, the first cardinal with the property `HasLST`. -/
def LST : Cardinal.{u} := sInf {κ | S.HasLST κ}

end KSys

/-- Def 1.0.3(1): `(K, ≼)` is an AEC. -/
structure IsAEC (S : KSys U L) : Prop where
  /-- (a) -/
  iso : S.AxIso
  /-- (b), partial order -/
  po : S.AxPO
  /-- (b), included in the submodel relation -/
  incl : S.AxIncl
  /-- (c) -/
  union : ∀ δ : Ordinal.{u}, Order.IsSuccLimit δ → S.AxUnion δ
  /-- (d) smoothness -/
  smooth : ∀ δ : Ordinal.{u}, Order.IsSuccLimit δ → S.AxSmooth δ
  /-- (e) -/
  coh : S.AxCoh
  /-- (f) -/
  lst : S.AxLST

/-- Def 1.0.3(2): `(K, ≼)` is an AEC in `lam`: every model has cardinality `lam`, Axioms
a, b, d, e hold, and Axiom c holds for sequences of length `δ < lam⁺`. -/
structure IsAECIn (S : KSys U L) (lam : Cardinal.{u}) : Prop where
  card : ∀ M ∈ S.K, M.card = lam
  iso : S.AxIso
  po : S.AxPO
  incl : S.AxIncl
  smooth : ∀ δ : Ordinal.{u}, Order.IsSuccLimit δ → S.AxSmooth δ
  coh : S.AxCoh
  union : ∀ δ : Ordinal.{u}, Order.IsSuccLimit δ → δ < (Order.succ lam).ord → S.AxUnion δ

/-- ENCODING for Def 1.0.15: isomorphism of models of `K_κ`. -/
def isoSetoid (S : KSys U L) (κ : Cardinal.{u}) : Setoid {M // M ∈ S.Kc κ} where
  r M N := Nonempty (M.1.carrier ≃[L] N.1.carrier)
  iseqv := ⟨fun _ => ⟨Language.Equiv.refl L _⟩, fun ⟨f⟩ => ⟨f.symm⟩,
    fun ⟨f⟩ ⟨g⟩ => ⟨g.comp f⟩⟩

/-- Def 1.0.15: `I(κ, K)`, the number of models in `K_κ` up to isomorphism. -/
def numModels (S : KSys U L) (κ : Cardinal.{u}) : Cardinal.{u} :=
  #(Quotient (isoSetoid S κ))

-- AGENT-CHOICE (reading): "directed order" = nonempty directed preorder given by a relation `r`;
-- in `≼^up`, `I ⊆ J` carries the induced order.
/-- Def 1.0.16(1): `M ∈ K^up`: there are a directed order `I` (here: a type with a directed
preorder `r`) and models `{M_s : s ∈ I}` with `M = ⋃ {M_s : s ∈ I}` and
`s ≤_I t → M_s ≼ M_t`. -/
def InUp (S : KSys U L) (M : Model U L) : Prop :=
  ∃ (I : Type u) (r : I → I → Prop), IsPreorder I r ∧ Nonempty I ∧
    (∀ s t, ∃ w, r s w ∧ r t w) ∧ ∃ Ms : I → Model U L,
      M.carrier = (⋃ s, (Ms s).carrier) ∧ (∀ s, IsSubstr (Ms s) M) ∧
        ∀ s t, r s t → S.le (Ms s) (Ms t)

/-- Def 1.0.16(2): `M ≼^up N` for `M, N ∈ K^up`: there are directed orders `I ⊆ J` and models
`{M_s : s ∈ I}`, `{N_t : t ∈ J}` with `M = ⋃ M_s`, `N = ⋃ N_t`, `s ≤_J t → N_s ≼ N_t` and
`s ≤_I t → M_s ≼ M_t ≼ N_t`. (`I` is a subset of `J` with the induced order.) -/
def LeUp (S : KSys U L) (M N : Model U L) : Prop :=
  InUp S M ∧ InUp S N ∧
  ∃ (J : Type u) (r : J → J → Prop), IsPreorder J r ∧ Nonempty J ∧
    (∀ s t, ∃ w, r s w ∧ r t w) ∧ ∃ I : Set J, I.Nonempty ∧
      (∀ s ∈ I, ∀ t ∈ I, ∃ w ∈ I, r s w ∧ r t w) ∧
      ∃ (Ms : J → Model U L) (Ns : J → Model U L),
        M.carrier = (⋃ s ∈ I, (Ms s).carrier) ∧ (∀ s ∈ I, IsSubstr (Ms s) M) ∧
        N.carrier = (⋃ t, (Ns t).carrier) ∧ (∀ t, IsSubstr (Ns t) N) ∧
        (∀ s t, r s t → S.le (Ns s) (Ns t)) ∧
        (∀ s ∈ I, ∀ t ∈ I, r s t → S.le (Ms s) (Ms t) ∧ S.le (Ms t) (Ns t))

/-- Def 1.0.16: `(K, ≼)^up := (K^up, ≼^up)`. -/
def KSys.up (S : KSys U L) : KSys U L := ⟨{M | InUp S M}, LeUp S⟩

-- AGENT-CHOICE (reading): "injection with Im(f) ≼ N" is read as "isomorphism of M onto a model
-- Im(f) ≼ N" (an embedding must preserve the structure).
/-- Def 1.0.19(1): `f : M → N` is a `≼`-embedding: `M, N ∈ K`, `f` is injective on `M` and
`Im(f) ≼ N`. ENCODING/READING: `f` is required to be an isomorphism of `M` onto the model
`Im(f) ≼ N` (see NOTES.md, B.4). -/
def IsEmb (S : KSys U L) (f : U → U) (M N : Model U L) : Prop :=
  M ∈ S.K ∧ N ∈ S.K ∧ ∃ M' : Model U L, S.le M' N ∧ IsoOn f M M'

/-- Def 1.0.20(1): `(f₁, f₂, M₃)` is an amalgamation of `M₁` and `M₂` over `M₀`:
`fₙ : Mₙ → M₃` is an embedding over `M₀` (`n = 1, 2`). -/
def IsAmalg (S : KSys U L) (f₁ f₂ : U → U) (M₃ M₀ M₁ M₂ : Model U L) : Prop :=
  IsEmb S f₁ M₁ M₃ ∧ IsEmb S f₂ M₂ M₃ ∧ Over f₁ M₁ M₃ M₀.carrier ∧ Over f₂ M₂ M₃ M₀.carrier

-- AGENT-CHOICE (reading): an "amalgamation" in a `K_λ` context has its amalgam in `K_λ`
-- (Def 1.0.20 is stated for `(K_λ, ≼ ↾ K_λ)`); used in Sections 1, 4, 5.
/-- Def 1.0.20(1) inside `(K_λ, ≼ ↾ K_λ)`: an amalgamation whose amalgam `M₃` is in `K_λ`. -/
def IsAmalgIn (S : KSys U L) (lam : Cardinal.{u}) (f₁ f₂ : U → U) (M₃ M₀ M₁ M₂ : Model U L) :
    Prop :=
  IsAmalg S f₁ f₂ M₃ M₀ M₁ M₂ ∧ M₃ ∈ S.Kc lam

/-- Def 1.0.20(1): `(K_λ, ≼ ↾ K_λ)` satisfies the amalgamation property. -/
def AP (S : KSys U L) (lam : Cardinal.{u}) : Prop :=
  ∀ M₀ ∈ S.Kc lam, ∀ M₁ ∈ S.Kc lam, ∀ M₂ ∈ S.Kc lam, S.le M₀ M₁ → S.le M₀ M₂ →
    ∃ (f₁ f₂ : U → U) (M₃ : Model U L), IsAmalgIn S lam f₁ f₂ M₃ M₀ M₁ M₂

/-- Def 1.0.20(2): `K_λ` satisfies the joint embedding property. -/
def JEP (S : KSys U L) (lam : Cardinal.{u}) : Prop :=
  ∀ M₁ ∈ S.Kc lam, ∀ M₂ ∈ S.Kc lam, ∃ (f₁ f₂ : U → U) (M₃ : Model U L),
    M₃ ∈ S.Kc lam ∧ IsEmb S f₁ M₁ M₃ ∧ IsEmb S f₂ M₂ M₃

/-- Def 1.0.20(3): `M ∈ K` is `≼`-maximal: there is no `N ∈ K` with `M ≺ N`. -/
def IsMaximal (S : KSys U L) (M : Model U L) : Prop :=
  M ∈ S.K ∧ ¬ ∃ N ∈ S.K, S.lt M N

/-- ENCODING. Triples `(M, N, a)`. -/
abbrev Tri (U : Type u) (L : Language.{u, u}) := Model U L × Model U L × U

/-- Def 1.0.21(1): `K³ = {(M, N, a) : M, N ∈ K, M ≼ N, a ∈ N}`. -/
def KSys.K3 (S : KSys U L) : Set (Tri U L) :=
  {t | t.1 ∈ S.K ∧ t.2.1 ∈ S.K ∧ S.le t.1 t.2.1 ∧ t.2.2 ∈ t.2.1.carrier}

/-- Def 1.0.21(2): `K³_λ = {(M, N, a) : M, N ∈ K_λ, M ≼ N, a ∈ N}`. -/
def KSys.K3c (S : KSys U L) (lam : Cardinal.{u}) : Set (Tri U L) :=
  {t | t.1 ∈ S.Kc lam ∧ t.2.1 ∈ S.Kc lam ∧ S.le t.1 t.2.1 ∧ t.2.2 ∈ t.2.1.carrier}

-- DEVIATION (author-confirmed erratum): the paper has `N₂ ∈ K_λ`; the author confirmed that
-- `N₂` ranges over all of `K`. For triples in `K³_λ` nothing changes when `LST ≤ λ`.
/-- Def 1.0.22: the class from which the model `N₂` in the definition of `E*` is taken.
Original text: "for some `N₂ ∈ K_λ` with `N₁ ≼ N₂` there is an embedding `f : N₀ → N₂` over
`M₀` with `f(a₀) = a₁`". Erratum (confirmed by the author): `N₂ ∈ K`. The cardinal argument is
kept for uniformity but is no longer used. -/
def typePool (S : KSys U L) (_lam : Cardinal.{u}) : Set (Model U L) := S.K

/-- Def 1.0.22(1): `(M₀, N₀, a₀) E* (M₁, N₁, a₁)` iff (both are in `K³`,) `M₁ = M₀` and for some
`N₂ ∈ K_λ` [erratum: `N₂ ∈ K`, see `typePool`] with `N₁ ≼ N₂` there is an embedding
`f : N₀ → N₂` over `M₀` with `f(a₀) = a₁`. -/
def EStar (S : KSys U L) (lam : Cardinal.{u}) (t t' : Tri U L) : Prop :=
  t ∈ S.K3 ∧ t' ∈ S.K3 ∧ t'.1 = t.1 ∧
    ∃ N₂ ∈ typePool S lam, S.le t'.2.1 N₂ ∧
      ∃ f : U → U, IsEmb S f t.2.1 N₂ ∧ Over f t.2.1 N₂ t.1.carrier ∧ f t.2.2 = t'.2.2

-- AGENT-CHOICE (reading): "closure of E* under transitivity, i.e., the closure to an equivalence
-- relation" is formalized as the equivalence closure `Relation.EqvGen`.
/-- Def 1.0.22(2): `E`, "the closure of `E*` under transitivity, i.e., the closure to an
equivalence relation". -/
def ERel (S : KSys U L) (lam : Cardinal.{u}) : Tri U L → Tri U L → Prop :=
  Relation.EqvGen (EStar S lam)

/-- Def 1.0.24(1): `tp(a, M, N)`, the Galois-type of `a` in `N` over `M`: the equivalence class
of `(M, N, a)` under `E`. -/
def tp (S : KSys U L) (lam : Cardinal.{u}) (a : U) (M N : Model U L) : Set (Tri U L) :=
  {t | ERel S lam (M, N, a) t}

/-- Def 1.0.24(2): `S(M) = {tp(a, M, N) : (M, N, a) ∈ K³}`. -/
def SAll (S : KSys U L) (lam : Cardinal.{u}) (M : Model U L) : Set (Set (Tri U L)) :=
  {p | ∃ (N : Model U L) (a : U), (M, N, a) ∈ S.K3 ∧ p = tp S lam a M N}

/-- Def 1.0.24(2): `S^na(M) = {tp(a, M, N) : (M, N, a) ∈ K³, a ∈ N - M}`. -/
def Sna (S : KSys U L) (lam : Cardinal.{u}) (M : Model U L) : Set (Set (Tri U L)) :=
  {p | ∃ (N : Model U L) (a : U), (M, N, a) ∈ S.K3 ∧ a ∉ M.carrier ∧ p = tp S lam a M N}

-- DEVIATION (encoding): `p ↾ M₀` is the union over all representatives of `p` (no choice).
/-- Def 1.0.24(3): for `p = tp(a, M₁, N)` and `M₀ ≼ M₁`, `p ↾ M₀ = tp(a, M₀, N)`.
ENCODING: the union of `tp(a, M₀, N)` over all representatives `(M₁, N, a)` of `p` (equal to
`tp(a, M₀, N)` whenever the paper's definition is independent of the representative). -/
def res (S : KSys U L) (lam : Cardinal.{u}) (p : Set (Tri U L)) (M₀ : Model U L) :
    Set (Tri U L) :=
  {t | ∃ (M₁ N : Model U L) (a : U), (M₁, N, a) ∈ p ∧ t ∈ tp S lam a M₀ N}

/-- `M` realizes the type `p` over `N` (used in Def 1.0.25): `p = tp(a, N, M)` for some
`a ∈ M`. -/
def Realizes (S : KSys U L) (lam : Cardinal.{u}) (M N : Model U L) (p : Set (Tri U L)) : Prop :=
  ∃ a ∈ M.carrier, tp S lam a N M = p

/-- Def 1.0.25: for `N ≼ M`, `M` is full over `N` when `M` realizes `S(N)`. -/
def Full (S : KSys U L) (lam : Cardinal.{u}) (M N : Model U L) : Prop :=
  S.le N M ∧ ∀ p ∈ SAll S lam N, Realizes S lam M N p

/-- Def 1.0.25: `M` is saturated in `λ⁺` over `λ`: `M ∈ K_{λ⁺}` and `M` is full over every
`N ∈ K_λ` with `N ≼ M`. -/
def Saturated (S : KSys U L) (lam : Cardinal.{u}) (M : Model U L) : Prop :=
  M ∈ S.Kc (Order.succ lam) ∧ ∀ N ∈ S.Kc lam, S.le N M → Full S lam M N

/-- Def 1.0.28: `M ∈ K_{λ⁺}` is homogenous in `λ⁺` over `λ`: for all `N₁, N₂ ∈ K_λ` with
`N₁ ≼ M` and `N₁ ≼ N₂` there is a `≼`-embedding `f : N₂ → M` over `N₁`. -/
def Homogeneous (S : KSys U L) (lam : Cardinal.{u}) (M : Model U L) : Prop :=
  M ∈ S.Kc (Order.succ lam) ∧ ∀ N₁ ∈ S.Kc lam, ∀ N₂ ∈ S.Kc lam, S.le N₁ M → S.le N₁ N₂ →
    ∃ f : U → U, IsEmb S f N₂ M ∧ Over f N₂ M N₁.carrier

-- AGENT-CHOICE (reading): "if ‖M‖ = λ⁺ then ‖M_α‖ = λ" is read for every cardinal `κ` with
-- `‖M‖ = κ⁺` (here `λ` is a generic cardinal).
-- PROOF-STAGE CHANGE: added the last clause `∀ α < ‖M‖, M_α ⊆ M` (each `M_α` is a submodel of
-- `M`). Clarification of the encoding, approved by the author: in the paper `M = ⋃ M_α` is a union
-- of structures; with only the equality of universes, `R` could represent another structure on the
-- universe of `M`, and Prop 6.1.6(a) fails (NOTES.md, section F). Needed for Prop 6.1.6(a).
/-- Def 1.0.29: `⟨M_α : α < ‖M‖⟩` is a representation of `M`: `≼`-increasing continuous with
union `M`, `‖M_α‖ < ‖M‖`, and if `‖M‖ = κ⁺` then `‖M_α‖ = κ`. -/
def IsRepresentation (S : KSys U L) (M : Model U L) (Ms : Ordinal.{u} → Model U L) : Prop :=
  IsIncreasing S.le Ms (Iio M.card.ord) ∧ IsContinuous Ms (Iio M.card.ord) ∧
    M.carrier = (⋃ α ∈ Iio M.card.ord, (Ms α).carrier) ∧
    (∀ α < M.card.ord, (Ms α).card < M.card) ∧
    (∀ κ : Cardinal.{u}, M.card = Order.succ κ → ∀ α < M.card.ord, (Ms α).card = κ) ∧
    ∀ α < M.card.ord, IsSubstr (Ms α) M


/-! ════════════════════════════════════════════════════════════════════════════
    AUX LEMMAS (not in the paper): models, isomorphisms, substructures, renaming
    ════════════════════════════════════════════════════════════════════════════ -/

/-- AUX: not in paper. The image of `M` under an isomorphism `f` is `f '' M`. -/
theorem IsoOn.carrier_eq {f : U → U} {M N : Model U L} (h : IsoOn f M N) :
    N.carrier = f '' M.carrier := by
  obtain ⟨g, hg⟩ := h
  ext y; constructor
  · intro hy
    refine ⟨(g.symm ⟨y, hy⟩ : U), (g.symm ⟨y, hy⟩).2, ?_⟩
    rw [← hg]; simp
  · rintro ⟨x, hx, rfl⟩; rw [← hg ⟨x, hx⟩]; exact (g ⟨x, hx⟩).2

/-- AUX: not in paper. -/
theorem IsoOn.mapsTo {f : U → U} {M N : Model U L} (h : IsoOn f M N) {x : U}
    (hx : x ∈ M.carrier) : f x ∈ N.carrier := by
  rw [h.carrier_eq]; exact ⟨x, hx, rfl⟩

/-- AUX: not in paper. -/
theorem IsoOn.injOn {f : U → U} {M N : Model U L} (h : IsoOn f M N) : InjOn f M.carrier := by
  obtain ⟨g, hg⟩ := h
  intro x hx y hy hxy
  have : g ⟨x, hx⟩ = g ⟨y, hy⟩ := Subtype.ext (by rw [hg, hg]; exact hxy)
  simpa using congrArg Subtype.val (g.injective this)

/-- AUX: not in paper. Two structures on the same type related by an equivalence that is the
identity are equal. -/
theorem structure_eq_of_equiv_id {C : Type u} (S1 S2 : L.Structure C)
    (g : @Language.Equiv L C C S1 S2) (hg : ∀ x, g x = x) : S1 = S2 := by
  have hF : ∀ {n} (f : L.Functions n) (x : Fin n → C),
      @Structure.funMap L C S1 n f x = @Structure.funMap L C S2 n f x := by
    intro n f x
    have h1 := @Language.Equiv.map_fun L C C S1 S2 g n f x
    have e : (⇑g ∘ x) = x := funext fun i => hg (x i)
    rw [e, hg] at h1
    exact h1
  have hR : ∀ {n} (r : L.Relations n) (x : Fin n → C),
      @Structure.RelMap L C S1 n r x ↔ @Structure.RelMap L C S2 n r x := by
    intro n r x
    have h1 := @Language.Equiv.map_rel L C C S1 S2 g n r x
    have e : (⇑g ∘ x) = x := funext fun i => hg (x i)
    rw [e] at h1
    exact h1.symm
  rcases S1 with ⟨F1, R1⟩
  rcases S2 with ⟨F2, R2⟩
  congr
  · funext n f x; exact hF f x
  · funext n r x; exact propext (hR r x)

/-- AUX: not in paper. A model isomorphic to `M` via the identity is `M`. -/
theorem Model.eq_of_isoOn_id {M N : Model U L} (h : IsoOn id M N) : M = N := by
  have hc : N.carrier = M.carrier := by rw [h.carrier_eq, Set.image_id]
  obtain ⟨g, hg⟩ := h
  rcases M with ⟨C, S1⟩
  rcases N with ⟨C', S2⟩
  simp only at hc
  subst hc
  congr 1
  exact structure_eq_of_equiv_id S1 S2 g (fun x => Subtype.ext (hg x))

/-- AUX: not in paper. `IsoOn id M M`. -/
theorem IsoOn.refl (M : Model U L) : IsoOn id M M := ⟨Language.Equiv.refl L _, fun _ => rfl⟩

/-- AUX: not in paper. Only the values of `f` on `M` matter. -/
theorem IsoOn.congr {f f' : U → U} {M N : Model U L} (h : IsoOn f M N)
    (e : ∀ x ∈ M.carrier, f x = f' x) : IsoOn f' M N := by
  obtain ⟨g, hg⟩ := h
  exact ⟨g, fun x => by rw [hg, e x x.2]⟩

/-- AUX: not in paper. -/
theorem IsoOn.comp {f g : U → U} {M N P : Model U L} (h₁ : IsoOn f M N) (h₂ : IsoOn g N P) :
    IsoOn (g ∘ f) M P := by
  obtain ⟨φ, hφ⟩ := h₁
  obtain ⟨ψ, hψ⟩ := h₂
  exact ⟨ψ.comp φ, fun x => by simp [Language.Equiv.comp_apply, hψ, hφ]⟩

/-- AUX: not in paper. The image of a model under an isomorphism is unique. -/
theorem IsoOn.unique {f : U → U} {M N N' : Model U L} (h : IsoOn f M N) (h' : IsoOn f M N') :
    N = N' := by
  obtain ⟨φ, hφ⟩ := h
  obtain ⟨ψ, hψ⟩ := h'
  apply Model.eq_of_isoOn_id
  refine ⟨ψ.comp φ.symm, fun y => ?_⟩
  simp only [Language.Equiv.comp_apply, hψ, id]
  rw [← hφ]; simp

/-- AUX: not in paper. Inverse of an isomorphism. -/
theorem IsoOn.exists_inv {f : U → U} {M N : Model U L} (h : IsoOn f M N) :
    ∃ g : U → U, IsoOn g N M ∧ (∀ x ∈ M.carrier, g (f x) = x) ∧
      ∀ y ∈ N.carrier, f (g y) = y := by
  classical
  obtain ⟨φ, hφ⟩ := h
  refine ⟨fun y => if hy : y ∈ N.carrier then (φ.symm ⟨y, hy⟩ : U) else y, ⟨φ.symm, ?_⟩, ?_, ?_⟩
  · intro y; simp
  · intro x hx
    have hfx : f x ∈ N.carrier := by rw [← hφ ⟨x, hx⟩]; exact (φ ⟨x, hx⟩).2
    simp only [hfx, dite_true]
    have : (⟨f x, hfx⟩ : N.carrier) = φ ⟨x, hx⟩ := Subtype.ext (hφ ⟨x, hx⟩).symm
    rw [this]; simp
  · intro y hy
    simp only [hy, dite_true]
    rw [← hφ]; simp

/-- AUX: not in paper. A map injective on `M` has an image model. -/
theorem exists_isoOn {f : U → U} {M : Model U L} (hf : InjOn f M.carrier) :
    ∃ N : Model U L, IsoOn f M N := by
  let e := Equiv.Set.imageOfInjOn f M.carrier hf
  refine ⟨⟨f '' M.carrier, e.inducedStructure⟩, e.inducedStructureEquiv, fun x => rfl⟩


theorem IsSubstr.sub {M N : Model U L} (h : IsSubstr M N) : M.carrier ⊆ N.carrier := h.1

theorem IsSubstr.refl (M : Model U L) : IsSubstr M M :=
  ⟨subset_rfl, Language.Embedding.refl L _, fun _ => rfl⟩

theorem IsSubstr.of_sub {M N P : Model U L} (hM : IsSubstr M P) (hN : IsSubstr N P)
    (h : M.carrier ⊆ N.carrier) : IsSubstr M N := by
  obtain ⟨hMP, eM, heM⟩ := hM
  obtain ⟨hNP, eN, heN⟩ := hN
  have key : ∀ z : M.carrier, eN (Set.inclusion h z) = eM z := fun z =>
    Subtype.ext (by rw [heN, heM])
  refine ⟨h, ⟨⟨Set.inclusion h, Set.inclusion_injective h⟩, ?_, ?_⟩, fun x => rfl⟩
  · intro n f x
    apply eN.injective
    change eN (Set.inclusion h (Structure.funMap f x)) =
      eN (Structure.funMap f (Set.inclusion h ∘ x))
    rw [key, eM.map_fun, eN.map_fun]
    congr 1; funext i; exact (key (x i)).symm
  · intro n r x
    change Structure.RelMap r (Set.inclusion h ∘ x) ↔ Structure.RelMap r x
    rw [← eN.map_rel, ← eM.map_rel]
    have : (⇑eN ∘ (Set.inclusion h ∘ x)) = ⇑eM ∘ x := funext fun i => key (x i)
    rw [this]

theorem IsSubstr.trans {M N P : Model U L} (h₁ : IsSubstr M N) (h₂ : IsSubstr N P) :
    IsSubstr M P := by
  obtain ⟨h1, e1, he1⟩ := h₁
  obtain ⟨h2, e2, he2⟩ := h₂
  exact ⟨h1.trans h2, e2.comp e1, fun x => Subtype.ext (by
    simp [Language.Embedding.comp_apply, he1, he2])⟩

/-- AUX: not in paper. A submodel with the same universe is the model itself. -/
theorem IsSubstr.eq_of_carrier {M N : Model U L} (h : IsSubstr M N)
    (hc : N.carrier ⊆ M.carrier) : M = N := by
  obtain ⟨h1, e, he⟩ := h
  apply Model.eq_of_isoOn_id
  have hsurj : Function.Surjective e := fun y => ⟨⟨y, hc y.2⟩, Subtype.ext (by rw [he])⟩
  exact ⟨Language.Equiv.mk (Equiv.ofBijective e ⟨e.injective, hsurj⟩) e.map_fun' e.map_rel',
    fun x => by
      change ((e x : N.carrier) : U) = (x : U)
      rw [he]⟩

theorem Model.card_le_of_sub {M N : Model U L} (h : M.carrier ⊆ N.carrier) :
    M.card ≤ N.card := Cardinal.mk_le_mk_of_subset h

theorem IsoOn.card_eq {f : U → U} {M N : Model U L} (h : IsoOn f M N) : N.card = M.card := by
  obtain ⟨g, -⟩ := h
  exact (Cardinal.mk_congr g.toEquiv).symm

/-! ### Room -/

theorem Room.aleph0_le {lam : Cardinal.{u}} (h : Room U lam) : ℵ₀ ≤ #U :=
  h.1.aleph0_le

theorem Room.infinite {lam : Cardinal.{u}} (h : Room U lam) : Infinite U :=
  Cardinal.infinite_iff.2 h.aleph0_le

/-- AUX: not in paper. Renaming inside `U`: a partial injection `h₀` defined on `D ⊆ X` extends
to a map injective on `X` sending `X - D` outside a small set `B ∪ h₀[D]`. -/
theorem exists_rename (hinf : Infinite U) {D X B : Set U} (h₀ : U → U) (hinj : InjOn h₀ D)
    (hsmall : #(B ∪ h₀ '' D : Set U) < #U) :
    ∃ f : U → U, InjOn f X ∧ (∀ x ∈ D, f x = h₀ x) ∧ ∀ x ∈ X \ D, f x ∉ B ∪ h₀ '' D := by
  classical
  have hT : #((B ∪ h₀ '' D)ᶜ : Set U) = #U := Cardinal.mk_compl_of_infinite _ hsmall
  have hle : #(X \ D : Set U) ≤ #((B ∪ h₀ '' D)ᶜ : Set U) := by
    rw [hT]; exact Cardinal.mk_subtype_le _
  obtain ⟨e⟩ := Cardinal.le_def _ _ |>.1 hle
  refine ⟨fun x => if x ∈ D then h₀ x else if hx : x ∈ X \ D then (e ⟨x, hx⟩ : U) else x,
    ?_, ?_, ?_⟩
  · intro x hx y hy hxy
    by_cases hxD : x ∈ D <;> by_cases hyD : y ∈ D
    · simp only [hxD, hyD, ite_true] at hxy; exact hinj hxD hyD hxy
    · have hy' : y ∈ X \ D := ⟨hy, hyD⟩
      simp only [hxD, hyD, hy', ite_true, ite_false, dite_true] at hxy
      exact absurd (hxy ▸ Or.inr ⟨x, hxD, rfl⟩) (e ⟨y, hy'⟩).2
    · have hx' : x ∈ X \ D := ⟨hx, hxD⟩
      simp only [hxD, hyD, hx', ite_true, ite_false, dite_true] at hxy
      exact absurd (hxy.symm ▸ Or.inr ⟨y, hyD, rfl⟩) (e ⟨x, hx'⟩).2
    · have hx' : x ∈ X \ D := ⟨hx, hxD⟩
      have hy' : y ∈ X \ D := ⟨hy, hyD⟩
      simp only [hxD, hyD, hx', hy', ite_false, dite_true] at hxy
      have := e.injective (Subtype.ext hxy)
      simpa using congrArg Subtype.val this
  · intro x hx; simp [hx]
  · intro x hx
    have hxD : x ∉ D := hx.2
    simp only [hxD, hx, ite_false, dite_true]
    exact (e ⟨x, hx⟩).2


/-- AUX: not in paper. The image of a submodel under an isomorphism is a submodel. -/
theorem IsSubstr.image {f : U → U} {M₀ M₁ M₀' N₁ : Model U L} (h : IsSubstr M₀ M₁)
    (h₁ : IsoOn f M₁ N₁) (h₀ : IsoOn f M₀ M₀') : IsSubstr M₀' N₁ := by
  obtain ⟨hsub, e, he⟩ := h
  obtain ⟨φ, hφ⟩ := h₁
  obtain ⟨ψ, hψ⟩ := h₀
  have hval : ∀ y : M₀'.carrier, ((φ.toEmbedding.comp (e.comp ψ.symm.toEmbedding)) y : U) = y := by
    intro y
    simp only [Language.Embedding.comp_apply, Language.Equiv.coe_toEmbedding, hφ, he]
    rw [← hψ]; simp
  have hsub' : M₀'.carrier ⊆ N₁.carrier := fun y hy => by
    have h2 : ((φ.toEmbedding.comp (e.comp ψ.symm.toEmbedding)) ⟨y, hy⟩ : U) = y := hval ⟨y, hy⟩
    rw [← h2]; exact Subtype.prop _
  exact ⟨hsub', φ.toEmbedding.comp (e.comp ψ.symm.toEmbedding), fun y => Subtype.ext (hval y)⟩

namespace IsAEC

variable {S : KSys U L} (hS : IsAEC S)
include hS

theorem mem_left {M N : Model U L} (h : S.le M N) : M ∈ S.K := (hS.po.1 M N h).1
theorem mem_right {M N : Model U L} (h : S.le M N) : N ∈ S.K := (hS.po.1 M N h).2
theorem refl {M : Model U L} (h : M ∈ S.K) : S.le M M := hS.po.2.1 M h
theorem trans {M N P : Model U L} (h₁ : S.le M N) (h₂ : S.le N P) : S.le M P :=
  hS.po.2.2.2 M N P h₁ h₂
theorem sub {M N : Model U L} (h : S.le M N) : M.carrier ⊆ N.carrier := (hS.incl M N h).sub

/-- AUX: not in paper. Coherence, with the submodel condition read off the universes. -/
theorem le_of_sub {M₀ M₁ M₂ : Model U L} (h₀ : S.le M₀ M₂) (h₁ : S.le M₁ M₂)
    (hs : M₀.carrier ⊆ M₁.carrier) : S.le M₀ M₁ :=
  hS.coh _ _ _ (IsSubstr.of_sub (hS.incl _ _ h₀) (hS.incl _ _ h₁) hs) (hS.incl _ _ h₁) h₀ h₁

theorem iso_mem {f : U → U} {M N : Model U L} (hM : M ∈ S.K) (hf : IsoOn f M N) : N ∈ S.K :=
  (hS.iso M M N f hM (hS.refl hM) hf).1

/-- AUX: not in paper. Axiom a with a given image of the small model. -/
theorem iso_le {f : U → U} {M₀ M₁ N₀ N₁ : Model U L} (h : S.le M₀ M₁) (h₁ : IsoOn f M₁ N₁)
    (h₀ : IsoOn f M₀ N₀) : S.le N₀ N₁ := by
  obtain ⟨-, M₀', hM₀', hle⟩ := hS.iso M₀ M₁ N₁ f (hS.mem_right h) h h₁
  rwa [h₀.unique hM₀']

end IsAEC

/-- AUX: not in paper. -/
theorem IsEmb.injOn {S : KSys U L} {f : U → U} {M N : Model U L} (h : IsEmb S f M N) :
    InjOn f M.carrier := by
  obtain ⟨-, -, M', -, hM'⟩ := h; exact hM'.injOn

/-- AUX: not in paper. -/
theorem IsEmb.mapsTo {S : KSys U L} (hS : IsAEC S) {f : U → U} {M N : Model U L}
    (h : IsEmb S f M N) {x : U} (hx : x ∈ M.carrier) : f x ∈ N.carrier := by
  obtain ⟨-, -, M', hle, hM'⟩ := h; exact hS.sub hle (hM'.mapsTo hx)

/-- AUX: not in paper. -/
theorem IsEmb.of_le {S : KSys U L} (hS : IsAEC S) {M N : Model U L} (h : S.le M N) :
    IsEmb S id M N :=
  ⟨hS.mem_left h, hS.mem_right h, M, h, IsoOn.refl M⟩

/-- AUX: not in paper. An embedding followed by an isomorphism. -/
theorem IsEmb.comp_iso {S : KSys U L} (hS : IsAEC S) {f h : U → U} {M N N' : Model U L}
    (hf : IsEmb S f M N) (hh : IsoOn h N N') : IsEmb S (h ∘ f) M N' := by
  obtain ⟨hM, hN, P, hP, hfP⟩ := hf
  obtain ⟨P', hP'⟩ := exists_isoOn (hh.injOn.mono (hS.sub hP))
  exact ⟨hM, hS.iso_mem hN hh, P', hS.iso_le hP hh hP', hfP.comp hP'⟩

/-- AUX: not in paper. An isomorphism followed by an embedding. -/
theorem IsEmb.iso_comp {S : KSys U L} {f h : U → U} {M M' N : Model U L}
    (hh : IsoOn h M M') (hM : M ∈ S.K) (hf : IsEmb S f M' N) : IsEmb S (f ∘ h) M N := by
  obtain ⟨-, hN, P, hP, hfP⟩ := hf
  exact ⟨hM, hN, P, hP, hh.comp hfP⟩

/-- AUX: not in paper. Composition of embeddings. -/
theorem IsEmb.comp {S : KSys U L} (hS : IsAEC S) {f g : U → U} {M N P : Model U L}
    (hf : IsEmb S f M N) (hg : IsEmb S g N P) : IsEmb S (g ∘ f) M P := by
  obtain ⟨hM, -, Q, hQ, hfQ⟩ := hf
  obtain ⟨-, hP, R, hR, hgR⟩ := hg
  obtain ⟨Q', hQ'⟩ := exists_isoOn (hgR.injOn.mono (hS.sub hQ))
  exact ⟨hM, hP, Q', hS.trans (hS.iso_le hQ hgR hQ') hR, hfQ.comp hQ'⟩

/-- AUX: not in paper. Restriction of an embedding to a `≼`-submodel. -/
theorem IsEmb.restrict {S : KSys U L} (hS : IsAEC S) {f : U → U} {M N P : Model U L}
    (hf : IsEmb S f N P) (hMN : S.le M N) : IsEmb S f M P :=
  (IsEmb.of_le hS hMN).comp hS hf

/-- AUX: not in paper. Only the values on `M` matter. -/
theorem IsEmb.congr {S : KSys U L} {f f' : U → U} {M N : Model U L} (hf : IsEmb S f M N)
    (e : ∀ x ∈ M.carrier, f x = f' x) : IsEmb S f' M N := by
  obtain ⟨hM, hN, P, hP, hfP⟩ := hf
  exact ⟨hM, hN, P, hP, hfP.congr e⟩

/-- AUX: not in paper. Renaming a model `N` inside `U` along an isomorphism `g : P ≅ Q` of a
`≼`-submodel `P ≼ N`, keeping the new elements outside a small set. -/
theorem IsAEC.rename {S : KSys U L} (hS : IsAEC S) (hinf : Infinite U) {P N Q : Model U L}
    {g : U → U} (B : Set U) (hPN : S.le P N) (hg : IsoOn g P Q)
    (hsmall : #(B ∪ Q.carrier : Set U) < #U) :
    ∃ (h : U → U) (N' : Model U L), IsoOn h N N' ∧ (∀ x ∈ P.carrier, h x = g x) ∧
      S.le Q N' ∧ N' ∈ S.K ∧ ∀ x ∈ N.carrier \ P.carrier, h x ∉ B ∪ Q.carrier := by
  have hgP : g '' P.carrier = Q.carrier := hg.carrier_eq.symm
  obtain ⟨h, hinj, hD, hout⟩ := exists_rename hinf g hg.injOn (D := P.carrier) (X := N.carrier)
    (B := B) (by rwa [hgP])
  obtain ⟨N', hN'⟩ := exists_isoOn hinj
  have hPQ : IsoOn h P Q := hg.congr fun x hx => (hD x hx).symm
  refine ⟨h, N', hN', hD, hS.iso_le hPN hN' hPQ, hS.iso_mem (hS.mem_right hPN) hN', ?_⟩
  intro x hx; rw [← hgP]; exact hout x hx

/-! ### Galois types -/

/-- AUX: not in paper. `E` preserves the base model. -/
theorem ERel.fst {S : KSys U L} {lam : Cardinal.{u}} {t t' : Tri U L} (h : ERel S lam t t') :
    t'.1 = t.1 := by
  induction h with
  | rel x y hxy => exact hxy.2.2.1
  | refl => rfl
  | symm x y _ ih => exact ih.symm
  | trans x y z _ _ ih₁ ih₂ => exact ih₂.trans ih₁

/-- AUX: not in paper. -/
theorem mem_tp_self (S : KSys U L) (lam : Cardinal.{u}) (a : U) (M N : Model U L) :
    (M, N, a) ∈ tp S lam a M N := Relation.EqvGen.refl _

/-- AUX: not in paper. Equality of types is `E`-equivalence. -/
theorem tp_eq_iff {S : KSys U L} {lam : Cardinal.{u}} {a b : U} {M N M' N' : Model U L} :
    tp S lam a M N = tp S lam b M' N' ↔ ERel S lam (M, N, a) (M', N', b) := by
  constructor
  · intro h
    have : (M', N', b) ∈ tp S lam a M N := h ▸ mem_tp_self S lam b M' N'
    exact this
  · intro h
    ext t
    constructor
    · intro ht; exact Relation.EqvGen.trans _ _ _ (Relation.EqvGen.symm _ _ h) ht
    · intro ht; exact Relation.EqvGen.trans _ _ _ h ht

/-- AUX: not in paper. Membership in a type is `E`-equivalence. -/
theorem mem_tp_iff {S : KSys U L} {lam : Cardinal.{u}} {a : U} {M N : Model U L}
    {t : Tri U L} : t ∈ tp S lam a M N ↔ tp S lam t.2.2 t.1 t.2.1 = tp S lam a M N := by
  rw [tp_eq_iff]
  exact ⟨fun h => Relation.EqvGen.symm _ _ h, fun h => Relation.EqvGen.symm _ _ h⟩

/-- AUX: not in paper. An `E*`-step between triples whose element lies in the base fixes the
element; `E` preserves algebraic elements. -/
theorem ERel.alg {S : KSys U L} {lam : Cardinal.{u}} {t t' : Tri U L}
    (h : ERel S lam t t') :
    (t.2.2 ∈ t.1.carrier → t'.2.2 = t.2.2) ∧ (t'.2.2 ∈ t'.1.carrier → t.2.2 = t'.2.2) := by
  induction h with
  | rel x y hxy =>
    obtain ⟨hx, hy, h1, N₂, -, -, f, hf, hover, hfa⟩ := hxy
    refine ⟨fun ha => ?_, fun hb => ?_⟩
    · rw [← hfa]; exact hover.2 _ ha
    · rw [h1] at hb
      apply hf.injOn hx.2.2.2 (hover.1 hb).1
      rw [hfa, hover.2 _ hb]
  | refl => exact ⟨fun _ => rfl, fun _ => rfl⟩
  | symm x y _ ih => exact ⟨ih.2, ih.1⟩
  | trans x y z hxy hyz ih₁ ih₂ =>
    have e₁ := ERel.fst hxy
    have e₂ := ERel.fst hyz
    refine ⟨fun ha => ?_, fun hc => ?_⟩
    · have hb := ih₁.1 ha
      rw [ih₂.1 (by rw [e₁, hb]; exact ha), hb]
    · have hb := ih₂.2 hc
      rw [ih₁.2 (by rw [hb, ← e₂]; exact hc), hb]

/-- AUX: not in paper. `E` restricts to smaller bases. -/
theorem ERel.restrict {S : KSys U L} (hS : IsAEC S) {lam : Cardinal.{u}} {t t' : Tri U L}
    (h : ERel S lam t t') :
    ∀ M₀, S.le M₀ t.1 → ERel S lam (M₀, t.2.1, t.2.2) (M₀, t'.2.1, t'.2.2) := by
  induction h with
  | rel x y hxy =>
    intro M₀ hM₀
    obtain ⟨hx, hy, h1, N₂, hN₂, hle, f, hf, hover, hfa⟩ := hxy
    refine Relation.EqvGen.rel _ _ ⟨⟨hS.mem_left hM₀, hx.2.1, hS.trans hM₀ hx.2.2.1, hx.2.2.2⟩,
      ⟨hS.mem_left hM₀, hy.2.1, hS.trans (h1 ▸ hM₀) hy.2.2.1, hy.2.2.2⟩, rfl, N₂, hN₂, hle, f, hf,
      ⟨fun z hz => hover.1 (hS.sub hM₀ hz), fun z hz => hover.2 z (hS.sub hM₀ hz)⟩, hfa⟩
  | refl => intro M₀ _; exact Relation.EqvGen.refl _
  | symm x y hxy ih =>
    intro M₀ hM₀
    exact Relation.EqvGen.symm _ _ (ih M₀ ((ERel.fst hxy) ▸ hM₀))
  | trans x y z hxy hyz ih₁ ih₂ =>
    intro M₀ hM₀
    exact Relation.EqvGen.trans _ _ _ (ih₁ M₀ hM₀) (ih₂ M₀ ((ERel.fst hxy).symm ▸ hM₀))

/-- AUX: not in paper. Restriction of `tp(a, M₁, N)` to `M₀ ≼ M₁` is `tp(a, M₀, N)`. -/
theorem res_tp {S : KSys U L} (hS : IsAEC S) {lam : Cardinal.{u}} {a : U} {M₀ M₁ N : Model U L}
    (h : S.le M₀ M₁) : res S lam (tp S lam a M₁ N) M₀ = tp S lam a M₀ N := by
  ext t
  constructor
  · rintro ⟨M₁', N', b, hmem, ht⟩
    have hE : ERel S lam (M₁, N, a) (M₁', N', b) := hmem
    have hr := ERel.restrict hS hE M₀ h
    have : tp S lam b M₀ N' = tp S lam a M₀ N := tp_eq_iff.2 (Relation.EqvGen.symm _ _ hr)
    rwa [← this]
  · intro ht; exact ⟨M₁, N, a, mem_tp_self S lam a M₁ N, ht⟩

/-- AUX: not in paper. Restriction is transitive. -/
theorem res_res {S : KSys U L} (hS : IsAEC S) {lam : Cardinal.{u}} {a : U}
    {M₀ M₁ M₂ N : Model U L} (h₀ : S.le M₀ M₁) (h₁ : S.le M₁ M₂) :
    res S lam (res S lam (tp S lam a M₂ N) M₁) M₀ = res S lam (tp S lam a M₂ N) M₀ := by
  rw [res_tp hS h₁, res_tp hS h₀, res_tp hS (hS.trans h₀ h₁)]


/-- AUX: not in paper. Models of `K_λ` are small when `#U` is a strong limit above `λ`. -/
theorem Room.small_union {lam : Cardinal.{u}} (hU : Room U lam) {A B : Set U}
    (hA : #A ≤ lam) (hB : #B ≤ lam) : #(A ∪ B : Set U) < #U :=
  lt_of_le_of_lt (Cardinal.mk_union_le A B)
    (Cardinal.add_lt_of_lt hU.aleph0_le (hA.trans_lt hU.2) (hB.trans_lt hU.2))

/-- AUX: not in paper. Amalgamation in `K_λ` along an embedding: if `N₁ ≼ N₂` and
`g : N₁ → N₄` is an embedding (all in `K_λ`), there are `N₅ ≽ N₄` in `K_λ` and an embedding
`k : N₂ → N₅` extending `g`. -/
theorem IsAEC.amalg_along {S : KSys U L} (hS : IsAEC S) {lam : Cardinal.{u}} (hU : Room U lam)
    (hAP : AP S lam) {N₁ N₂ N₄ : Model U L} {g : U → U} (h₁ : N₁ ∈ S.Kc lam)
    (h₂ : N₂ ∈ S.Kc lam) (h₄ : N₄ ∈ S.Kc lam) (h12 : S.le N₁ N₂) (hg : IsEmb S g N₁ N₄) :
    ∃ (k : U → U) (N₅ : Model U L), N₅ ∈ S.Kc lam ∧ S.le N₄ N₅ ∧ IsEmb S k N₂ N₅ ∧
      ∀ x ∈ N₁.carrier, k x = g x := by
  have hinf := hU.infinite
  obtain ⟨-, -, Q, hQ4, hgQ⟩ := hg
  have hQc : Q.card = lam := by rw [hgQ.card_eq, h₁.2]
  -- rename `N₂` along `g`
  obtain ⟨h, N₂', hN₂', hhg, hQN₂', hN₂'K, -⟩ := hS.rename hinf ∅ h12 hgQ
    (by rw [Set.empty_union]; change Q.card < #U; rw [hQc]; exact hU.2)
  have hN₂'c : N₂'.card = lam := by rw [hN₂'.card_eq, h₂.2]
  -- amalgamate `N₂'` and `N₄` over `Q`
  obtain ⟨k₁, k₂, N₅, ⟨hk₁, hk₂, ho₁, ho₂⟩, hN₅⟩ := hAP Q ⟨hS.mem_left hQ4, hQc⟩ N₂'
    ⟨hN₂'K, hN₂'c⟩ N₄ h₄ hQN₂' hQ4
  -- rename `N₅` so that `k₂` becomes the identity
  obtain ⟨-, -, P, hP5, hk₂P⟩ := hk₂
  obtain ⟨k₂i, hk₂i, hk₂i1, -⟩ := hk₂P.exists_inv
  obtain ⟨r₂, N₅', hN₅', hh₂, hN₄N₅', hN₅'K, -⟩ := hS.rename hinf ∅ hP5 hk₂i
    (by rw [Set.empty_union]; change N₄.card < #U; rw [h₄.2]; exact hU.2)
  refine ⟨r₂ ∘ k₁ ∘ h, N₅', ⟨hN₅'K, by rw [hN₅'.card_eq, hN₅.2]⟩, hN₄N₅', ?_, ?_⟩
  · have e1 : IsEmb S (k₁ ∘ h) N₂ N₅ := IsEmb.iso_comp hN₂' h₂.1 hk₁
    exact e1.comp_iso hS hN₅'
  · intro x hx
    have hgx : g x ∈ Q.carrier := hgQ.mapsTo hx
    simp only [Function.comp_apply]
    rw [hhg x hx, ho₁.2 _ hgx]
    have hk2 : k₂ (g x) = g x := ho₂.2 _ hgx
    have hgx4 : g x ∈ N₄.carrier := hS.sub hQ4 hgx
    have hmem : k₂ (g x) ∈ P.carrier := hk₂P.mapsTo hgx4
    rw [hh₂ _ (hk2 ▸ hmem)]
    conv_lhs => rw [← hk2]
    exact hk₂i1 _ hgx4

/-- AUX: not in paper. A finite tuple from the union of a chain lies in one member. -/
theorem exists_mem_chain {δ : Ordinal.{u}} (hδ : Order.IsSuccLimit δ) {M : Ordinal.{u} → Model U L}
    (hM : ∀ α < δ, ∀ β < δ, α < β → (M α).carrier ⊆ (M β).carrier) {n : ℕ} (x : Fin n → U)
    (hx : ∀ i, x i ∈ ⋃ α ∈ Iio δ, (M α).carrier) : ∃ α < δ, ∀ i, x i ∈ (M α).carrier := by
  classical
  have hx' : ∀ i, ∃ α < δ, x i ∈ (M α).carrier := fun i => by
    obtain ⟨α, hα, h⟩ := Set.mem_iUnion₂.1 (hx i); exact ⟨α, hα, h⟩
  choose a ha hxa using hx'
  have hpos : (⊥ : Ordinal.{u}) < δ := hδ.bot_lt
  refine ⟨Finset.univ.sup a, (Finset.sup_lt_iff hpos).2 fun i _ => ha i, fun i => ?_⟩
  have hle : a i ≤ Finset.univ.sup a := Finset.le_sup (Finset.mem_univ i)
  rcases hle.lt_or_eq with hlt | heq
  · exact hM _ (ha i) _ ((Finset.sup_lt_iff hpos).2 fun i _ => ha i) hlt (hxa i)
  · rw [← heq]; exact hxa i

/-- AUX: not in paper. If every finite tuple of `N'` lies in a member `M_α` of a family of
submodels of both `N'` and `N`, and `N' ⊆ N`, then `N'` is a submodel of `N`. -/
theorem IsSubstr.of_union {I : Set Ordinal.{u}} {M : Ordinal.{u} → Model U L}
    {N' N : Model U L} (hsub : N'.carrier ⊆ N.carrier) (h' : ∀ α ∈ I, IsSubstr (M α) N')
    (h : ∀ α ∈ I, IsSubstr (M α) N)
    (htuple : ∀ {n : ℕ} (x : Fin n → U), (∀ i, x i ∈ N'.carrier) →
      ∃ α ∈ I, ∀ i, x i ∈ (M α).carrier) : IsSubstr N' N := by
  refine ⟨hsub, ⟨⟨Set.inclusion hsub, Set.inclusion_injective hsub⟩, ?_, ?_⟩, fun _ => rfl⟩
  · intro n f x
    obtain ⟨α, hα, hxα⟩ := htuple (fun i => (x i : U)) (fun i => (x i).2)
    obtain ⟨sA, eA, heA⟩ := h' α hα
    obtain ⟨sB, eB, heB⟩ := h α hα
    let x' : Fin n → (M α).carrier := fun i => ⟨x i, hxα i⟩
    have hxA : (⇑eA ∘ x') = x :=
      funext fun i => Subtype.ext (by rw [Function.comp_apply, heA] <;> rfl)
    have hxB : (⇑eB ∘ x') = Set.inclusion hsub ∘ x :=
      funext fun i => Subtype.ext (by rw [Function.comp_apply, heB] <;> rfl)
    have e1 : Structure.funMap f x = eA (Structure.funMap f x') := by rw [eA.map_fun, hxA]
    have e2 : Structure.funMap f (Set.inclusion hsub ∘ x) = eB (Structure.funMap f x') := by
      rw [eB.map_fun, hxB]
    apply Subtype.ext
    change ((Structure.funMap f x : N'.carrier) : U) =
      ((Structure.funMap f (Set.inclusion hsub ∘ x) : N.carrier) : U)
    rw [e1, e2, heA, heB]
  · intro n r x
    obtain ⟨α, hα, hxα⟩ := htuple (fun i => (x i : U)) (fun i => (x i).2)
    obtain ⟨sA, eA, heA⟩ := h' α hα
    obtain ⟨sB, eB, heB⟩ := h α hα
    let x' : Fin n → (M α).carrier := fun i => ⟨x i, hxα i⟩
    have hxA : (⇑eA ∘ x') = x :=
      funext fun i => Subtype.ext (by rw [Function.comp_apply, heA] <;> rfl)
    have hxB : (⇑eB ∘ x') = Set.inclusion hsub ∘ x :=
      funext fun i => Subtype.ext (by rw [Function.comp_apply, heB] <;> rfl)
    change Structure.RelMap r (Set.inclusion hsub ∘ x) ↔ Structure.RelMap r x
    rw [← hxB, ← hxA, eA.map_rel, eB.map_rel]


/-- AUX: not in paper. The LST number has the LST property. -/
theorem KSys.hasLST_LST {S : KSys U L} (h : S.AxLST) : S.HasLST S.LST := csInf_mem h

/-- AUX: not in paper. The LST property is upward closed. -/
theorem KSys.HasLST.mono {S : KSys U L} {κ κ' : Cardinal.{u}} (h : S.HasLST κ) (hκ : κ ≤ κ') :
    S.HasLST κ' := fun N hN A hA => by
  obtain ⟨M, hM, hAM, hMN, hc⟩ := h N hN A hA
  exact ⟨M, hM, hAM, hMN, hc.trans (by gcongr)⟩

/-- AUX: not in paper. With `LST ≤ λ` and `λ` infinite, `M ∪ {x}` (with `M ∈ K_λ`) is contained
in a `≼`-submodel of `N` in `K_λ`. -/
theorem IsAEC.exists_small {S : KSys U L} (hS : IsAEC S) {lam : Cardinal.{u}}
    (hlst : S.LST ≤ lam) (hinf : ℵ₀ ≤ lam) {M N : Model U L} {x : U} (hM : M ∈ S.Kc lam)
    (hN : N ∈ S.K) (hMN : M.carrier ⊆ N.carrier) (hx : x ∈ N.carrier) :
    ∃ W ∈ S.Kc lam, M.carrier ∪ {x} ⊆ W.carrier ∧ S.le W N := by
  have hL : S.HasLST lam := (KSys.hasLST_LST hS.lst).mono hlst
  obtain ⟨W, hW, hAW, hWN, hc⟩ := hL N hN (M.carrier ∪ {x}) (Set.union_subset hMN
    (Set.singleton_subset_iff.2 hx))
  refine ⟨W, ⟨hW, le_antisymm ?_ ?_⟩, hAW, hWN⟩
  · refine hc.trans (Cardinal.add_le_of_le hinf le_rfl ?_)
    refine (Cardinal.mk_union_le _ _).trans (Cardinal.add_le_of_le hinf (le_of_eq hM.2) ?_)
    rw [Cardinal.mk_singleton]; exact Cardinal.one_le_aleph0.trans hinf
  · rw [← hM.2]
    exact Model.card_le_of_sub (Set.subset_union_left.trans hAW)

/-- AUX: not in paper. A proper superset in the same finite cardinality is impossible: if
`M ⊆ N`, `x ∈ N - M` and `‖M‖ = ‖N‖ = λ`, then `λ` is infinite. -/
theorem aleph0_le_of_ssubset {M N : Model U L} {lam : Cardinal.{u}} (hM : M.card = lam)
    (hN : N.card = lam) (hsub : M.carrier ⊆ N.carrier) {x : U} (hx : x ∈ N.carrier)
    (hxM : x ∉ M.carrier) : ℵ₀ ≤ lam := by
  by_contra hlt
  have hlt' : N.card < ℵ₀ := by rw [hN]; exact not_le.1 hlt
  have hfin : N.carrier.Finite := Cardinal.lt_aleph0_iff_set_finite.1 hlt'
  have hss : M.carrier ⊂ N.carrier := Set.ssubset_iff_subset_ne.2 ⟨hsub, fun h => hxM (h ▸ hx)⟩
  have h1 := Set.ncard_lt_ncard hss hfin
  have e1 := Set.cast_ncard (hfin.subset hsub)
  have e2 := Set.cast_ncard hfin
  have : (M.carrier.ncard : Cardinal.{u}) = N.carrier.ncard := by
    rw [e1, e2]; exact hM.trans hN.symm
  exact absurd (Nat.cast_injective this) h1.ne


/-- AUX: not in paper. `E` relates `K³`-triples only to `K³`-triples. -/
theorem ERel.K3_iff {S : KSys U L} {lam : Cardinal.{u}} {t t' : Tri U L} (h : ERel S lam t t') :
    t ∈ S.K3 ↔ t' ∈ S.K3 := by
  induction h with
  | rel x y hxy => exact ⟨fun _ => hxy.2.1, fun _ => hxy.1⟩
  | refl => exact Iff.rfl
  | symm x y _ ih => exact ih.symm
  | trans x y z _ _ ih₁ ih₂ => exact ih₁.trans ih₂


/-- AUX: not in paper. A strict `≼`-extension has a new element. -/
theorem IsAEC.exists_diff_of_lt {S : KSys U L} (hS : IsAEC S) {M N : Model U L}
    (h : S.lt M N) : ∃ a ∈ N.carrier, a ∉ M.carrier := by
  by_contra hc
  push Not at hc
  exact h.2 ((hS.incl _ _ h.1).eq_of_carrier hc)

/-- AUX: not in paper. Shrinking the ambient model does not change the type. -/
theorem tp_eq_of_le {S : KSys U L} (hS : IsAEC S) {lam : Cardinal.{u}} {a : U}
    {M N W : Model U L} (hK : (M, N, a) ∈ S.K3) (hWN : S.le W N) (hMW : S.le M W)
    (ha : a ∈ W.carrier) : tp S lam a M W = tp S lam a M N :=
  tp_eq_iff.2 (Relation.EqvGen.rel _ _ ⟨⟨hK.1, hS.mem_left hWN, hMW, ha⟩, hK, rfl, N, hK.2.1,
    hS.refl hK.2.1, id, IsEmb.of_le hS hWN,
    ⟨fun x hx => ⟨hS.sub hMW hx, hS.sub hK.2.2.1 hx⟩, fun _ _ => rfl⟩, rfl⟩)

/-- AUX: not in paper. Unfolding membership in `S^na`. -/
theorem mem_Sna {S : KSys U L} {lam : Cardinal.{u}} {a : U} {M N : Model U L}
    (h : tp S lam a M N ∈ Sna S lam M) : (M, N, a) ∈ S.K3 ∧ a ∉ M.carrier := by
  obtain ⟨N₁, a₁, hK, ha₁, heq⟩ := h
  have hE : ERel S lam (M, N, a) (M, N₁, a₁) := tp_eq_iff.1 heq
  refine ⟨(ERel.K3_iff hE).2 hK, fun ha => ha₁ ?_⟩
  have e : a₁ = a := (ERel.alg hE).1 ha
  rw [e]; exact ha

/-- AUX: not in paper. A type over `M ∈ K_λ` is realized in some `W ∈ K_λ`, `M ≼ W ≼ N`. -/
theorem IsAEC.exists_small_tp {S : KSys U L} (hS : IsAEC S) {lam : Cardinal.{u}}
    (hlst : S.LST ≤ lam) (hinf : ℵ₀ ≤ lam) {M N : Model U L} {a : U} (hM : M ∈ S.Kc lam)
    (hK : (M, N, a) ∈ S.K3) :
    ∃ W ∈ S.Kc lam, S.le M W ∧ S.le W N ∧ a ∈ W.carrier ∧ tp S lam a M W = tp S lam a M N := by
  obtain ⟨W, hW, hsub, hWN⟩ :=
    hS.exists_small hlst hinf hM hK.2.1 (hS.sub hK.2.2.1) hK.2.2.2
  have hMW : S.le M W := hS.le_of_sub hK.2.2.1 hWN (Set.subset_union_left.trans hsub)
  exact ⟨W, hW, hMW, hWN, hsub (Or.inr rfl), tp_eq_of_le hS hK hWN hMW (hsub (Or.inr rfl))⟩


/-- AUX: not in paper. The union of the universes of two models of `K_λ` has size `≤ λ`. -/
theorem card_union_le {S : KSys U L} {lam : Cardinal.{u}} {A B : Model U L} (hA : A ∈ S.Kc lam)
    (hB : B ∈ S.Kc lam) (hinf : ℵ₀ ≤ lam) : #(A.carrier ∪ B.carrier : Set U) ≤ lam :=
  (Cardinal.mk_union_le _ _).trans (Cardinal.add_le_of_le hinf (le_of_eq hA.2) (le_of_eq hB.2))

/-- AUX: not in paper. LST hull: a set of size `≤ λ` containing a model of `K_λ` is contained in
a `≼`-submodel in `K_λ`. -/
theorem IsAEC.exists_hull {S : KSys U L} (hS : IsAEC S) {lam : Cardinal.{u}}
    (hlst : S.LST ≤ lam) (hinf : ℵ₀ ≤ lam) {M X : Model U L} {A : Set U} (hM : M ∈ S.Kc lam)
    (hX : X ∈ S.K) (hMA : M.carrier ⊆ A) (hAX : A ⊆ X.carrier) (hA : #A ≤ lam) :
    ∃ W ∈ S.Kc lam, A ⊆ W.carrier ∧ S.le W X := by
  have hL : S.HasLST lam := (KSys.hasLST_LST hS.lst).mono hlst
  obtain ⟨W, hW, hAW, hWX, hc⟩ := hL X hX A hAX
  refine ⟨W, ⟨hW, le_antisymm (hc.trans (Cardinal.add_le_of_le hinf le_rfl hA)) ?_⟩, hAW, hWX⟩
  rw [← hM.2]; exact Model.card_le_of_sub (hMA.trans hAW)


/-! ### Transfinite constructions -/

/-- AUX: not in paper. Transfinite construction: if an invariant `Inv α c` depends only on
`c ↾ [0, α]` and can always be satisfied at stage `α ≤ θ` once it holds below `α`, then some
sequence satisfies it at every stage `α ≤ θ`. -/
theorem transfinite_construction {X : Type*} [Nonempty X] (θ : Ordinal.{u})
    (Inv : Ordinal.{u} → (Ordinal.{u} → X) → Prop)
    (hloc : ∀ α (c c' : Ordinal.{u} → X), (∀ β ≤ α, c β = c' β) → Inv α c → Inv α c')
    (hstep : ∀ α ≤ θ, ∀ c : Ordinal.{u} → X, (∀ β < α, Inv β c) →
      ∃ x : X, Inv α (fun β => if β < α then c β else x)) :
    ∃ c : Ordinal.{u} → X, ∀ α ≤ θ, Inv α c := by
  classical
  let F : ∀ α : Ordinal.{u}, (∀ β : Ordinal.{u}, β < α → X) → X := fun α h =>
    Classical.epsilon fun x => Inv α (fun β => if hβ : β < α then h β hβ else x)
  let c : Ordinal.{u} → X := Ordinal.lt_wf.fix F
  have hc : ∀ α, c α = F α (fun β _ => c β) := fun α => Ordinal.lt_wf.fix_eq F α
  refine ⟨c, fun α => ?_⟩
  refine Ordinal.lt_wf.induction (motive := fun α => α ≤ θ → Inv α c) α ?_
  intro α ih hα
  · have ih' : ∀ β < α, Inv β c := fun β hβ => ih β hβ (hβ.le.trans hα)
    obtain ⟨x, hx⟩ := hstep α hα c ih'
    have hex : ∃ x, Inv α (fun β => if hβ : β < α then c β else x) :=
      ⟨x, hloc α _ _ (fun β _ => by by_cases h : β < α <;> simp [h]) hx⟩
    have hspec := Classical.epsilon_spec hex
    refine hloc α _ _ (fun β hβ => ?_) hspec
    rcases hβ.lt_or_eq with h | h
    · simp [h]
    · subst h; simp only [lt_irrefl, dite_false]; exact (hc β).symm


/-! ### Unions of chains -/

/-- AUX: not in paper. A union of `≤ λ` sets of size `≤ λ` indexed by ordinals has size `≤ λ`. -/
theorem card_biUnion_le {lam : Cardinal.{u}} (hinf : ℵ₀ ≤ lam) {δ : Ordinal.{u}}
    (hδ : δ.card ≤ lam) {X : Ordinal.{u} → Set U} (hX : ∀ β < δ, #(X β) ≤ lam) :
    #(⋃ β ∈ Iio δ, X β : Set U) ≤ lam := by
  let e := Ordinal.ToType.mk (o := δ)
  have : (⋃ β ∈ Iio δ, X β) = ⋃ i : δ.ToType, X (e.symm i : Ordinal) := by
    ext x; simp only [mem_iUnion]
    constructor
    · rintro ⟨β, hβ, hx⟩; exact ⟨e ⟨β, hβ⟩, by simpa using hx⟩
    · rintro ⟨i, hx⟩; exact ⟨_, (e.symm i).2, hx⟩
  rw [this]
  refine (Cardinal.mk_iUnion_le _).trans ?_
  rw [Cardinal.mk_toType]
  calc δ.card * ⨆ i, #(X (e.symm i : Ordinal)) ≤ lam * lam :=
        mul_le_mul' hδ (ciSup_le' fun i => hX _ (e.symm i).2)
    _ = lam := Cardinal.mul_eq_self hinf

/-- AUX: not in paper. The union model of a chain is unique. -/
theorem IsUnionOf.unique {δ : Ordinal.{u}} (hδ : Order.IsSuccLimit δ)
    {M : Ordinal.{u} → Model U L}
    (hM : ∀ α < δ, ∀ β < δ, α < β → (M α).carrier ⊆ (M β).carrier) {N N' : Model U L}
    (h : IsUnionOf M (Iio δ) N) (h' : IsUnionOf M (Iio δ) N') : N = N' := by
  have hsub : ∀ {A B : Model U L}, IsUnionOf M (Iio δ) A → IsUnionOf M (Iio δ) B →
      IsSubstr A B := fun {A B} hA hB =>
    IsSubstr.of_union (I := Iio δ) (M := M) (by rw [hA.1, hB.1]) hA.2 hB.2 (fun x hx => by
      obtain ⟨α, hα, hxα⟩ := exists_mem_chain hδ hM x (fun i => hA.1 ▸ hx i)
      exact ⟨α, hα, hxα⟩)
  exact (hsub h h').eq_of_carrier (by rw [h.1, h'.1])

/-- AUX: not in paper. In an AEC, the union of an increasing continuous chain of limit length is
in `K` and every member is `≼` it (Axiom c applied to a tail of the chain). -/
theorem IsAEC.le_union {S : KSys U L} (hS : IsAEC S) {δ : Ordinal.{u}}
    (hδ : Order.IsSuccLimit δ) {M : Ordinal.{u} → Model U L}
    (hinc : IsIncreasing S.le M (Iio δ)) (hcont : IsContinuous M (Iio δ)) {N : Model U L}
    (hN : IsUnionOf M (Iio δ) N) : N ∈ S.K ∧ ∀ β < δ, S.le (M β) N := by
  classical
  have hsubM : ∀ α < δ, ∀ β < δ, α < β → (M α).carrier ⊆ (M β).carrier :=
    fun α hα β hβ h => hS.sub (hinc α hα β hβ h)
  have key : ∀ β < δ, N ∈ S.K ∧ S.le (M β) N := by
    intro β hβ
    have hβ1 : β + 1 < δ := hδ.add_one_lt hβ
    have hMβ : M β ∈ S.K := hS.mem_left (hinc β hβ (β + 1) hβ1 (Order.lt_add_one_iff.2 le_rfl))
    let T : Ordinal.{u} → Model U L := fun γ => if γ ≤ β then M β else M γ
    have hTU : ∀ η, β < η → η ≤ δ →
        (⋃ γ ∈ Iio η, (T γ).carrier) = ⋃ γ ∈ Iio η, (M γ).carrier := by
      intro η hβη hηδ
      apply Set.Subset.antisymm
      · refine Set.iUnion₂_subset fun γ hγ => ?_
        by_cases h : γ ≤ β
        · simp only [T, h, ite_true]; exact Set.subset_biUnion_of_mem (u := fun γ => (M γ).carrier) hβη
        · simp only [T, h, ite_false]; exact Set.subset_biUnion_of_mem (u := fun γ => (M γ).carrier) hγ
      · refine Set.iUnion₂_subset fun γ hγ => ?_
        by_cases h : γ ≤ β
        · refine subset_trans ?_ (Set.subset_biUnion_of_mem (u := fun γ => (T γ).carrier) hγ)
          simp only [T, h, ite_true]
          rcases h.lt_or_eq with h' | h'
          · exact hsubM γ (lt_of_le_of_lt h hβ) β hβ h'
          · rw [h']
        · refine subset_trans ?_ (Set.subset_biUnion_of_mem (u := fun γ => (T γ).carrier) hγ)
          simp only [T, h, ite_false]; exact le_rfl
    have hTinc : IsIncreasing S.le T (Iio δ) := by
      intro γ hγ γ' hγ' hlt
      by_cases h1 : γ ≤ β <;> by_cases h2 : γ' ≤ β
      · simp only [T, h1, h2, ite_true]; exact hS.refl hMβ
      · simp only [T, h1, h2, ite_true, ite_false]
        exact hinc β hβ γ' hγ' (not_le.1 h2)
      · exact absurd (hlt.le.trans h2) h1
      · simp only [T, h1, h2, ite_false]; exact hinc γ hγ γ' hγ' hlt
    have hTcont : IsContinuous T (Iio δ) := by
      intro γ hγ hγl
      by_cases h : γ ≤ β
      · simp only [T, h, ite_true]
        apply Set.Subset.antisymm
        · have h0 : (0 : Ordinal.{u}) < γ := by simpa using hγl.bot_lt
          refine subset_trans ?_ (Set.subset_biUnion_of_mem (u := fun γ => (T γ).carrier)
            (Set.mem_Iio.2 h0))
          simp [T]
        · refine Set.iUnion₂_subset fun ξ hξ => ?_
          simp [(le_of_lt (lt_of_lt_of_le hξ h))]
      · simp only [T, h, ite_false]
        rw [hTU γ (not_le.1 h) (le_of_lt hγ)]
        exact hcont γ hγ hγl
    have hTN : IsUnionOf T (Iio δ) N := by
      refine ⟨by rw [hTU δ hβ le_rfl]; exact hN.1, fun γ hγ => ?_⟩
      by_cases h : γ ≤ β
      · simp only [T, h, ite_true]; exact hN.2 β hβ
      · simp only [T, h, ite_false]; exact hN.2 γ hγ
    obtain ⟨N', hN', hN'K, hle⟩ := hS.union δ hδ T hTinc hTcont
    have e : N' = N := IsUnionOf.unique hδ (fun α hα β hβ h => hS.sub (hTinc α hα β hβ h)) hN' hTN
    have hT0 : T 0 = M β := by simp [T]
    refine ⟨e ▸ hN'K, ?_⟩
    rw [← e, ← hT0]; exact hle
  have h0 : (0 : Ordinal.{u}) < δ := by simpa using hδ.bot_lt
  exact ⟨(key 0 h0).1, fun β hβ => (key β hβ).2⟩

/-- AUX: not in paper. At a limit stage, the union of an increasing chain of embeddings is an
embedding (smoothness). -/
theorem IsAEC.emb_limit {S : KSys U L} (hS : IsAEC S) {α : Ordinal.{u}} (hα : Order.IsSuccLimit α)
    {M N : Ordinal.{u} → Model U L} {f : Ordinal.{u} → U → U}
    (hMinc : IsIncreasing S.le M (Iic α)) (hMcont : IsContinuous M (Iic α))
    (hNinc : IsIncreasing S.le N (Iic α)) (hemb : ∀ β < α, IsEmb S (f β) (M β) (N β))
    (hfinc : FunIncreasing f M (Iic α)) : IsEmb S (f α) (M α) (N α) := by
  classical
  have hαm : α ∈ Iic α := Set.mem_Iic.2 le_rfl
  have hMα : (M α).carrier = ⋃ β ∈ Iio α, (M β).carrier := hMcont α hαm hα
  have hle : ∀ β < α, S.le (M β) (M α) := fun β hβ => hMinc β hβ.le α hαm hβ
  have hNle : ∀ β < α, S.le (N β) (N α) := fun β hβ => hNinc β hβ.le α hαm hβ
  have hfeq : ∀ β < α, ∀ x ∈ (M β).carrier, f α x = f β x :=
    fun β hβ x hx => hfinc β hβ.le α hαm hβ x hx
  have h0 : (0 : Ordinal.{u}) < α := by simpa using hα.bot_lt
  have hMK : M α ∈ S.K := hS.mem_right (hle 0 h0)
  have hNK : N α ∈ S.K := hS.mem_right (hNle 0 h0)
  have hsubM : ∀ β < α, ∀ γ < α, β < γ → (M β).carrier ⊆ (M γ).carrier :=
    fun β hβ γ hγ h => hS.sub (hMinc β hβ.le γ hγ.le h)
  have hinj : InjOn (f α) (M α).carrier := by
    intro x hx y hy hxy
    rw [hMα] at hx hy
    obtain ⟨βx, hβx, hxβ⟩ := Set.mem_iUnion₂.1 hx
    obtain ⟨βy, hβy, hyβ⟩ := Set.mem_iUnion₂.1 hy
    have hsub' : ∀ γ < α, ∀ ξ ≤ γ, (M ξ).carrier ⊆ (M γ).carrier := fun γ hγ ξ hξ => by
      rcases hξ.lt_or_eq with h | h
      · exact hsubM ξ (lt_of_lt_of_le h hγ.le) γ hγ h
      · rw [h]
    have hβ : max βx βy < α := max_lt hβx hβy
    have hxβ' := hsub' _ hβ βx (le_max_left _ _) hxβ
    have hyβ' := hsub' _ hβ βy (le_max_right _ _) hyβ
    rw [hfeq _ hβ x hxβ', hfeq _ hβ y hyβ'] at hxy
    exact (hemb _ hβ).injOn hxβ' hyβ' hxy
  obtain ⟨Pα, hPα⟩ := exists_isoOn hinj
  let P : Ordinal.{u} → Model U L := fun β =>
    if h : β < α then (hemb β h).2.2.choose else Pα
  have hP : ∀ β (h : β < α), S.le (P β) (N β) ∧ IsoOn (f β) (M β) (P β) := fun β h => by
    simp only [P, h, dite_true]; exact (hemb β h).2.2.choose_spec
  have hPα' : ∀ β (h : β < α), IsoOn (f α) (M β) (P β) := fun β h =>
    (hP β h).2.congr fun x hx => (hfeq β h x hx).symm
  have hPcar : ∀ β (h : β < α), (P β).carrier = f α '' (M β).carrier := fun β h =>
    (hPα' β h).carrier_eq
  have hPinc : IsIncreasing S.le P (Iio α) := by
    intro β hβ γ hγ hβγ
    refine hS.le_of_sub (hS.trans (hP β hβ).1 (hNinc β (Set.mem_Iic.2 (le_of_lt hβ)) γ
      (Set.mem_Iic.2 (le_of_lt hγ)) hβγ)) (hP γ hγ).1 ?_
    rw [hPcar β hβ, hPcar γ hγ]; exact Set.image_mono (hsubM β hβ γ hγ hβγ)
  have hPcont : IsContinuous P (Iio α) := by
    intro γ hγ hγl
    rw [hPcar γ hγ, hMcont γ (Set.mem_Iic.2 (le_of_lt hγ)) hγl, Set.image_iUnion₂]
    refine Set.iUnion₂_congr fun ξ hξ => ?_
    rw [hPcar ξ (lt_trans hξ hγ)]
  have hPU : IsUnionOf P (Iio α) Pα := by
    refine ⟨?_, fun β hβ => (hS.incl _ _ (hle β hβ)).image hPα (hPα' β hβ)⟩
    rw [hPα.carrier_eq, hMα, Set.image_iUnion₂]
    exact Set.iUnion₂_congr fun β hβ => (hPcar β hβ).symm
  have hPαK : Pα ∈ S.K := hS.iso_mem hMK hPα
  have hsm := hS.smooth α hα P (N α) hPinc hPcont
    (fun β hβ => hS.trans (hP β hβ).1 (hNle β hβ)) Pα hPU hPαK
  exact ⟨hMK, hNK, Pα, hsm, hPα⟩


/-- AUX: not in paper. The images of an increasing chain under an increasing chain of embeddings
form an increasing continuous chain. -/
theorem IsAEC.image_chain {S : KSys U L} (hS : IsAEC S) {α : Ordinal.{u}}
    {M N : Ordinal.{u} → Model U L} {f : Ordinal.{u} → U → U}
    (hMinc : IsIncreasing S.le M (Iic α)) (hMcont : IsContinuous M (Iic α))
    (hNinc : IsIncreasing S.le N (Iic α)) (hemb : ∀ β ≤ α, IsEmb S (f β) (M β) (N β))
    (hfinc : FunIncreasing f M (Iic α)) :
    ∃ P : Ordinal.{u} → Model U L, (∀ β ≤ α, IsoOn (f β) (M β) (P β) ∧ S.le (P β) (N β)) ∧
      IsIncreasing S.le P (Iic α) ∧ IsContinuous P (Iic α) := by
  classical
  let P : Ordinal.{u} → Model U L := fun β =>
    if h : β ≤ α then (hemb β h).2.2.choose else M β
  have hP : ∀ β (h : β ≤ α), IsoOn (f β) (M β) (P β) ∧ S.le (P β) (N β) := fun β h => by
    simp only [P, h, dite_true]; exact ⟨(hemb β h).2.2.choose_spec.2, (hemb β h).2.2.choose_spec.1⟩
  have hPcar : ∀ β (h : β ≤ α), (P β).carrier = f β '' (M β).carrier := fun β h =>
    (hP β h).1.carrier_eq
  refine ⟨P, hP, fun β hβ γ hγ hβγ => ?_, fun γ hγ hγl => ?_⟩
  · have hβ' : β ≤ α := hβ
    have hγ' : γ ≤ α := hγ
    refine hS.le_of_sub (hS.trans (hP β hβ').2 (hNinc β hβ γ hγ hβγ)) (hP γ hγ').2 ?_
    rw [hPcar β hβ', hPcar γ hγ']
    rintro _ ⟨x, hx, rfl⟩
    exact ⟨x, hS.sub (hMinc β hβ γ hγ hβγ) hx, hfinc β hβ γ hγ hβγ x hx⟩
  · have hγ' : γ ≤ α := hγ
    rw [hPcar γ hγ', hMcont γ hγ hγl, Set.image_iUnion₂]
    refine Set.iUnion₂_congr fun ξ hξ => ?_
    have hξ' : ξ ≤ α := (le_of_lt hξ).trans hγ'
    rw [hPcar ξ hξ']
    exact Set.image_congr fun x hx => hfinc ξ hξ' γ hγ' hξ x hx


/-- AUX: not in paper. The transfinite partial sums `σ` of a sequence of ordinals `β`. -/
theorem exists_ordSum (β : Ordinal.{u} → Ordinal.{u}) :
    ∃ σ : Ordinal.{u} → Ordinal.{u}, σ 0 = 0 ∧ (∀ ε, σ (ε + 1) = σ ε + β ε) ∧ Monotone σ ∧
      ∀ δ, Order.IsSuccLimit δ → ∀ ξ < σ δ, ∃ γ < δ, ξ < σ γ := by
  let σ : Ordinal.{u} → Ordinal.{u} := fun o =>
    Ordinal.limitRecOn o (motive := fun _ => Ordinal.{u}) 0 (fun o s => s + β o)
      (fun o _ IH => sSup (Set.range fun x : Iio o => IH x.1 x.2))
  have h0 : σ 0 = 0 := Ordinal.limitRecOn_zero _ _ _
  have hs : ∀ ε, σ (ε + 1) = σ ε + β ε := fun ε => Ordinal.limitRecOn_add_one _ _ _ _
  have hl : ∀ δ, Order.IsSuccLimit δ → σ δ = sSup (Set.range fun x : Iio δ => σ x.1) := fun δ h =>
    Ordinal.limitRecOn_limit _ _ _ _ h
  have hbdd : ∀ δ : Ordinal.{u}, BddAbove (Set.range fun x : Iio δ => σ x.1) := fun δ =>
    Ordinal.bddAbove_of_small
  have hmono : ∀ b, ∀ a ≤ b, σ a ≤ σ b := by
    intro b
    induction b using Ordinal.lt_wf.induction with
    | ind b ih =>
    intro a hab
    rcases hab.lt_or_eq with h | h
    swap
    · rw [h]
    rcases Ordinal.zero_or_succ_or_isSuccLimit b with h0' | ⟨c, hc⟩ | hlim
    · subst h0'; exact absurd h (not_lt.2 zero_le)
    · rw [Order.succ_eq_add_one] at hc
      subst hc
      have hc1 : c < c + 1 := Order.lt_add_one_iff.2 le_rfl
      rw [hs c]
      exact (ih c hc1 a (Order.lt_add_one_iff.1 h)).trans (le_self_add)
    · rw [hl b hlim]
      exact le_csSup (hbdd b) ⟨⟨a, h⟩, rfl⟩
  refine ⟨σ, h0, hs, fun a b h => hmono b a h, fun δ hδ ξ hξ => ?_⟩
  rw [hl δ hδ] at hξ
  obtain ⟨_, ⟨x, rfl⟩, hx⟩ := exists_lt_of_lt_csSup
    (⟨_, ⟨⟨0, hδ.bot_lt⟩, rfl⟩⟩ : (Set.range fun x : Iio δ => σ x.1).Nonempty) hξ
  exact ⟨x.1, x.2, hx⟩

/-- AUX: not in paper. Every ordinal below `σ ε` lies in one of the blocks. -/
theorem ordSum_cover {β σ : Ordinal.{u} → Ordinal.{u}} (h0 : σ 0 = 0)
    (hs : ∀ ε, σ (ε + 1) = σ ε + β ε)
    (hl : ∀ δ, Order.IsSuccLimit δ → ∀ ξ < σ δ, ∃ γ < δ, ξ < σ γ) :
    ∀ ε, ∀ ξ < σ ε, ∃ γ < ε, ∃ η < β γ, ξ = σ γ + η := by
  intro ε
  induction ε using Ordinal.lt_wf.induction with
  | ind ε ih =>
  intro ξ hξ
  rcases Ordinal.zero_or_succ_or_isSuccLimit ε with h | ⟨c, hc⟩ | hlim
  · subst h; rw [h0] at hξ; exact absurd hξ (not_lt.2 zero_le)
  · rw [Order.succ_eq_add_one] at hc
    subst hc
    have hc1 : c < c + 1 := Order.lt_add_one_iff.2 le_rfl
    by_cases h : ξ < σ c
    · obtain ⟨γ, hγ, η, hη, e⟩ := ih c hc1 ξ h
      exact ⟨γ, lt_trans hγ hc1, η, hη, e⟩
    · have hle : σ c ≤ ξ := not_lt.1 h
      have e : σ c + (ξ - σ c) = ξ := Ordinal.add_sub_cancel_of_le hle
      refine ⟨c, hc1, ξ - σ c, ?_, e.symm⟩
      rw [hs c, ← e] at hξ
      exact (add_lt_add_iff_left _).1 hξ
  · obtain ⟨γ, hγ, hx⟩ := hl ε hlim ξ hξ
    obtain ⟨γ', hγ', η, hη, e⟩ := ih γ hγ ξ hx
    exact ⟨γ', lt_trans hγ' hγ, η, hη, e⟩

/-- AUX: not in paper. Concatenation of a transfinite sequence of increasing continuous chains
`D_ε` from `M_ε` to `M_{ε+1}` (of length `β_ε`) along an increasing continuous chain `M`; the
result `G` satisfies `G(σ_ε + ξ) = D_ε(ξ)`. -/
theorem IsAEC.concat_chain {S : KSys U L} (hS : IsAEC S) {β σ : Ordinal.{u} → Ordinal.{u}}
    (h0 : σ 0 = 0) (hs : ∀ ε, σ (ε + 1) = σ ε + β ε) (hm : Monotone σ)
    (hl : ∀ δ, Order.IsSuccLimit δ → ∀ ξ < σ δ, ∃ γ < δ, ξ < σ γ) {αs : Ordinal.{u}}
    {M : Ordinal.{u} → Model U L} {D : Ordinal.{u} → Ordinal.{u} → Model U L}
    (hMinc : IsIncreasing S.le M (Iic αs)) (hMcont : IsContinuous M (Iic αs))
    (hMK : ∀ ε ≤ αs, M ε ∈ S.K)
    (hDinc : ∀ ε < αs, IsIncreasing S.le (D ε) (Iic (β ε)))
    (hDcont : ∀ ε < αs, IsContinuous (D ε) (Iic (β ε)))
    (hD0 : ∀ ε < αs, D ε 0 = M ε) (hDt : ∀ ε < αs, D ε (β ε) = M (ε + 1)) :
    ∃ G : Ordinal.{u} → Model U L, (∀ ε ≤ αs, G (σ ε) = M ε) ∧
      (∀ ε < αs, ∀ ξ ≤ β ε, G (σ ε + ξ) = D ε ξ) ∧
      IsIncreasing S.le G (Iic (σ αs)) ∧ IsContinuous G (Iic (σ αs)) := by
  classical
  have hcov := ordSum_cover h0 hs hl
  have hMle : ∀ a ≤ αs, ∀ b ≤ αs, a ≤ b → S.le (M a) (M b) := fun a ha b hb h => by
    rcases h.lt_or_eq with h | h
    · exact hMinc a ha b hb h
    · rw [h]; exact hS.refl (hMK b hb)
  have hsucc : ∀ ε < αs, ε + 1 ≤ αs := fun ε h => Order.add_one_le_iff.2 h
  have hlt1 : ∀ ε : Ordinal.{u}, ε < ε + 1 := fun ε => Order.lt_add_one_iff.2 le_rfl
  let G : Ordinal.{u} → Model U L := fun ξ =>
    if h : ∃ ε < αs, ∃ η < β ε, ξ = σ ε + η then
      D h.choose (ξ - σ h.choose) else M αs
  have huniq : ∀ {ε₁ ε₂ η₁ η₂ : Ordinal.{u}}, η₁ < β ε₁ → η₂ < β ε₂ →
      σ ε₁ + η₁ = σ ε₂ + η₂ → ε₁ = ε₂ := by
    have key : ∀ {ε₁ ε₂ η₁ η₂ : Ordinal.{u}}, η₁ < β ε₁ → ε₁ < ε₂ →
        σ ε₁ + η₁ ≠ σ ε₂ + η₂ := by
      intro ε₁ ε₂ η₁ η₂ h1 hlt e
      have h2 : σ ε₁ + η₁ < σ (ε₁ + 1) := by rw [hs]; exact (add_lt_add_iff_left _).2 h1
      have h3 : σ (ε₁ + 1) ≤ σ ε₂ := hm (Order.add_one_le_iff.2 hlt)
      have h4 : σ ε₂ ≤ σ ε₂ + η₂ := le_self_add
      exact absurd (e ▸ h2) (not_lt.2 (h3.trans h4))
    intro ε₁ ε₂ η₁ η₂ h1 h2 e
    rcases lt_trichotomy ε₁ ε₂ with h | h | h
    · exact absurd e (key h1 h)
    · exact h
    · exact absurd e.symm (key h2 h)
  have hG1 : ∀ ε < αs, ∀ η < β ε, G (σ ε + η) = D ε η := by
    intro ε hε η hη
    have hex : ∃ ε' < αs, ∃ η' < β ε', σ ε + η = σ ε' + η' := ⟨ε, hε, η, hη, rfl⟩
    simp only [G, dif_pos hex]
    obtain ⟨-, η', hη', e⟩ := hex.choose_spec
    have hc : hex.choose = ε := (huniq hη' hη e.symm)
    rw [hc, Ordinal.add_sub_cancel]
  have hGtop : ∀ ξ, σ αs ≤ ξ → G ξ = M αs := by
    intro ξ hξ
    simp only [G]
    refine dif_neg ?_
    rintro ⟨ε, hε, η, hη, e⟩
    have h2 : ξ < σ (ε + 1) := by rw [hs, e]; exact (add_lt_add_iff_left _).2 hη
    exact absurd (lt_of_lt_of_le h2 (hm (hsucc ε hε))) (not_lt.2 hξ)
  have hconst : ∀ b ≤ αs, ∀ a ≤ b, σ a = σ b → M a = M b := by
    intro b
    induction b using Ordinal.lt_wf.induction with
    | ind b ih =>
    intro hb a hab he
    rcases hab.lt_or_eq with h | h
    swap
    · rw [h]
    rcases Ordinal.zero_or_succ_or_isSuccLimit b with h0' | ⟨c, hc⟩ | hlim
    · subst h0'; exact absurd h (not_lt.2 zero_le)
    · rw [Order.succ_eq_add_one] at hc
      subst hc
      have hac : a ≤ c := Order.lt_add_one_iff.1 h
      have hcb : c < αs := lt_of_lt_of_le (hlt1 c) hb
      have e1 : σ c = σ (c + 1) :=
        le_antisymm (hm (hlt1 c).le) (he ▸ hm hac)
      have hβ : β c = 0 := by
        have e2 : σ c + β c = σ c + 0 := by rw [← hs, ← e1, add_zero]
        exact add_left_cancel e2
      have e3 : M c = M (c + 1) := by
        rw [← hD0 c hcb, ← hDt c hcb, hβ]
      rw [ih c (hlt1 c) hcb.le a hac (he.trans e1.symm), e3]
    · have hle := hMle a (hab.trans hb) b hb hab
      have hsub : (M b).carrier ⊆ (M a).carrier := by
        rw [hMcont b hb hlim]
        intro x hx
        obtain ⟨ζ, hζ, hxζ⟩ := Set.mem_iUnion₂.1 hx
        have hζb : ζ < b := hζ
        rcases le_total ζ a with h' | h'
        · exact hS.sub (hMle ζ (h'.trans (hab.trans hb)) a (hab.trans hb) h') hxζ
        · have e4 : σ a = σ ζ := le_antisymm (hm h') (he ▸ hm hζb.le)
          rw [ih ζ hζb (hζb.le.trans hb) a h' e4]; exact hxζ
      exact hS.po.2.2.1 _ _ hle (hS.le_of_sub (hS.refl (hMK b hb)) hle hsub)
  have hGM : ∀ ε ≤ αs, G (σ ε) = M ε := by
    intro ε hε
    by_cases h : σ αs ≤ σ ε
    · rw [hGtop _ h]; exact (hconst αs le_rfl ε hε (le_antisymm (hm hε) h)).symm
    · obtain ⟨γ, hγ, η, hη, e⟩ := hcov αs (σ ε) (not_le.1 h)
      have hη0 : η = 0 := by
        by_contra hne
        have hpos : σ γ < σ γ + η := by
          conv_lhs => rw [← add_zero (σ γ)]
          exact (add_lt_add_iff_left _).2 (pos_iff_ne_zero.2 hne)
        rcases le_total ε γ with h' | h'
        · exact absurd (e ▸ hpos) (not_lt.2 (hm h'))
        · rcases h'.lt_or_eq with h'' | h''
          · have h2 : σ γ + η < σ (γ + 1) := by
              rw [hs]; exact (add_lt_add_iff_left _).2 hη
            exact absurd (e ▸ h2) (not_lt.2 (hm (Order.add_one_le_iff.2 h'')))
          · subst h''
            exact absurd e hpos.ne
      rw [hη0, add_zero] at e
      rcases le_total ε γ with h' | h'
      · rw [e, ← add_zero (σ γ), hG1 γ hγ 0 (hη0 ▸ hη), hD0 γ hγ]
        exact (hconst γ hγ.le ε h' e).symm
      · have hεγ : ε = γ := by
          rcases h'.lt_or_eq with h'' | h''
          · have h2 : σ γ < σ (γ + 1) := by
              rw [hs]
              conv_lhs => rw [← add_zero (σ γ)]
              exact (add_lt_add_iff_left _).2 (hη0 ▸ hη)
            exact absurd (e ▸ h2) (not_lt.2 (hm (Order.add_one_le_iff.2 h'')))
          · exact h''.symm
        rw [hεγ, ← add_zero (σ γ), hG1 γ hγ 0 (hη0 ▸ hη), hD0 γ hγ]
  have hGD : ∀ ε < αs, ∀ ξ ≤ β ε, G (σ ε + ξ) = D ε ξ := by
    intro ε hε ξ hξ
    rcases hξ.lt_or_eq with h | h
    · exact hG1 ε hε ξ h
    · rw [h, ← hs, hGM (ε + 1) (hsucc ε hε), hDt ε hε]
  have hDle1 : ∀ ε < αs, ∀ ξ ≤ β ε, S.le (M ε) (D ε ξ) := fun ε hε ξ hξ => by
    rcases (zero_le : (0 : Ordinal.{u}) ≤ ξ).lt_or_eq with h | h
    · rw [← hD0 ε hε]; exact hDinc ε hε 0 (Set.mem_Iic.2 zero_le) ξ hξ h
    · rw [← h, hD0 ε hε]; exact hS.refl (hMK ε hε.le)
  have hDle2 : ∀ ε < αs, ∀ ξ ≤ β ε, S.le (D ε ξ) (M (ε + 1)) := fun ε hε ξ hξ => by
    rcases hξ.lt_or_eq with h | h
    · rw [← hDt ε hε]; exact hDinc ε hε ξ hξ (β ε) (Set.mem_Iic.2 le_rfl) h
    · rw [h, hDt ε hε]; exact hS.refl (hMK _ (hsucc ε hε))
  have hinc : IsIncreasing S.le G (Iic (σ αs)) := by
    intro ξ₁ hξ₁ ξ₂ hξ₂ hlt
    have hξ₁lt : ξ₁ < σ αs := lt_of_lt_of_le hlt hξ₂
    obtain ⟨ε₁, hε₁, η₁, hη₁, e₁⟩ := hcov αs ξ₁ hξ₁lt
    rw [e₁, hG1 ε₁ hε₁ η₁ hη₁]
    rcases (show ξ₂ ≤ σ αs from hξ₂).lt_or_eq with h | h
    · obtain ⟨ε₂, hε₂, η₂, hη₂, e₂⟩ := hcov αs ξ₂ h
      rw [e₂, hG1 ε₂ hε₂ η₂ hη₂]
      rcases lt_trichotomy ε₁ ε₂ with h' | h' | h'
      · exact hS.trans (hDle2 ε₁ hε₁ η₁ hη₁.le) (hS.trans (hMle _ (hsucc ε₁ hε₁) ε₂ hε₂.le
          (Order.add_one_le_iff.2 h')) (hDle1 ε₂ hε₂ η₂ hη₂.le))
      · subst h'
        rw [e₁, e₂] at hlt
        exact hDinc ε₁ hε₁ η₁ hη₁.le η₂ hη₂.le ((add_lt_add_iff_left _).1 hlt)
      · have h2 : σ ε₂ + η₂ < σ (ε₂ + 1) := by rw [hs]; exact (add_lt_add_iff_left _).2 hη₂
        have h3 : σ (ε₂ + 1) ≤ σ ε₁ + η₁ :=
          (hm (Order.add_one_le_iff.2 h')).trans le_self_add
        rw [e₁, e₂] at hlt
        exact absurd hlt (not_lt.2 (h2.le.trans h3))
    · rw [h, hGM αs le_rfl]
      exact hS.trans (hDle2 ε₁ hε₁ η₁ hη₁.le) (hMle _ (hsucc ε₁ hε₁) αs le_rfl (hsucc ε₁ hε₁))
  have hL : ∀ ε ≤ αs, Order.IsSuccLimit (σ ε) →
      (M ε).carrier ⊆ ⋃ ξ ∈ Iio (σ ε), (G ξ).carrier := by
    intro ε
    induction ε using Ordinal.lt_wf.induction with
    | ind ε ih =>
    intro hε hlim x hx
    rcases Ordinal.zero_or_succ_or_isSuccLimit ε with h | ⟨c, hc⟩ | hl'
    · subst h; rw [h0] at hlim; exact absurd hlim Order.not_isSuccLimit_bot
    · rw [Order.succ_eq_add_one] at hc
      subst hc
      have hcα : c < αs := lt_of_lt_of_le (hlt1 c) hε
      by_cases hβ : β c = 0
      · have e1 : σ (c + 1) = σ c := by rw [hs, hβ, add_zero]
        have e3 : M c = M (c + 1) := by rw [← hD0 c hcα, ← hDt c hcα, hβ]
        rw [e1] at hlim ⊢
        rw [← e3] at hx
        exact ih c (hlt1 c) hcα.le hlim hx
      · rw [hs] at hlim ⊢
        have hβl : Order.IsSuccLimit (β c) := by
          rcases Ordinal.isSuccLimit_add_iff.1 hlim with h | h
          · exact h
          · exact absurd h.1 hβ
        rw [← hDt c hcα, hDcont c hcα (β c) (Set.mem_Iic.2 le_rfl) hβl] at hx
        obtain ⟨η, hη, hxη⟩ := Set.mem_iUnion₂.1 hx
        refine Set.mem_iUnion₂.2 ⟨σ c + η, Set.mem_Iio.2 ((add_lt_add_iff_left _).2 hη), ?_⟩
        rw [hG1 c hcα η hη]; exact hxη
    · rw [hMcont ε hε hl'] at hx
      obtain ⟨ζ, hζ, hxζ⟩ := Set.mem_iUnion₂.1 hx
      have hζε : ζ < ε := hζ
      rcases (hm hζε.le).lt_or_eq with h | h
      · refine Set.mem_iUnion₂.2 ⟨σ ζ, h, ?_⟩
        rw [hGM ζ (hζε.le.trans hε)]; exact hxζ
      · rw [← h] at hlim ⊢
        exact ih ζ hζε (hζε.le.trans hε) hlim hxζ
  refine ⟨G, hGM, hGD, hinc, fun γ hγ hlim => ?_⟩
  apply Set.Subset.antisymm
  swap
  · intro x hx
    obtain ⟨ξ, hξ, hxξ⟩ := Set.mem_iUnion₂.1 hx
    exact hS.sub (hinc ξ (Set.mem_Iic.2 ((le_of_lt (show ξ < γ from hξ)).trans hγ)) γ hγ hξ) hxξ
  rcases (show γ ≤ σ αs from hγ).lt_or_eq with h | h
  · obtain ⟨ε, hε, η, hη, e⟩ := hcov αs γ h
    by_cases hη0 : η = 0
    · rw [e, hη0, add_zero] at hlim ⊢
      rw [hGM ε hε.le]
      exact hL ε hε.le hlim
    · rw [e] at hlim ⊢
      have hηl : Order.IsSuccLimit η := by
        rcases Ordinal.isSuccLimit_add_iff.1 hlim with h' | h'
        · exact h'
        · exact absurd h'.1 hη0
      rw [hG1 ε hε η hη]
      intro x hx
      rw [hDcont ε hε η hη.le hηl] at hx
      obtain ⟨η', hη', hxη⟩ := Set.mem_iUnion₂.1 hx
      refine Set.mem_iUnion₂.2 ⟨σ ε + η', Set.mem_Iio.2 ((add_lt_add_iff_left _).2 hη'), ?_⟩
      rw [hG1 ε hε η' (lt_trans hη' hη)]; exact hxη
  · rw [h] at hlim ⊢
    rw [hGM αs le_rfl]
    exact hL αs le_rfl hlim

/-- AUX: not in paper. For `αs < λ⁺` and blocks of length `< λ⁺`, the sum is `< λ⁺`. -/
theorem ordSum_lt {lam : Cardinal.{u}} (hinf : ℵ₀ ≤ lam) {β σ : Ordinal.{u} → Ordinal.{u}}
    (h0 : σ 0 = 0) (hs : ∀ ε, σ (ε + 1) = σ ε + β ε)
    (hl : ∀ δ, Order.IsSuccLimit δ → ∀ ξ < σ δ, ∃ γ < δ, ξ < σ γ) {αs : Ordinal.{u}}
    (hαs : αs < (Order.succ lam).ord) (hβ : ∀ ε < αs, β ε < (Order.succ lam).ord) :
    σ αs < (Order.succ lam).ord := by
  have hreg : (Order.succ lam).IsRegular := Cardinal.isRegular_succ hinf
  have key : ∀ ε ≤ αs, σ ε < (Order.succ lam).ord := by
    intro ε
    induction ε using Ordinal.lt_wf.induction with
    | ind ε ih =>
    intro hε
    have hεκ := lt_of_le_of_lt hε hαs
    rcases Ordinal.zero_or_succ_or_isSuccLimit ε with h | ⟨c, hc⟩ | hlim
    · subst h; rw [h0]
      exact (Cardinal.isSuccLimit_ord (hinf.trans (Order.le_succ lam))).bot_lt
    · rw [Order.succ_eq_add_one] at hc
      subst hc
      have hc1 : c < c + 1 := Order.lt_add_one_iff.2 le_rfl
      have hcα := lt_of_lt_of_le hc1 hε
      have h1 := ih c hc1 hcα.le
      have h2 := hβ c hcα
      rw [hs, Cardinal.lt_ord, Order.lt_succ_iff, Ordinal.card_add]
      rw [Cardinal.lt_ord, Order.lt_succ_iff] at h1 h2
      exact Cardinal.add_le_of_le hinf h1 h2
    · let e := Ordinal.ToType.mk (o := ε)
      let f : ε.ToType → Ordinal.{u} := fun i => σ (e.symm i : Ordinal.{u})
      have hcard : #ε.ToType < (Order.succ lam).ord.cof := by
        rw [hreg.cof_ord, Cardinal.mk_toType, Order.lt_succ_iff]
        exact Order.lt_succ_iff.1 (Cardinal.lt_ord.1 hεκ)
      have hsup : iSup f < (Order.succ lam).ord := Ordinal.iSup_lt_of_lt_cof hcard fun i =>
        ih _ (e.symm i).2 ((le_of_lt (e.symm i).2).trans hε)
      refine lt_of_le_of_lt (not_lt.1 fun hlt => ?_) hsup
      obtain ⟨γ, hγ, hx⟩ := hl ε hlim _ hlt
      have : σ γ ≤ iSup f := by
        have h3 := Ordinal.le_iSup f (e ⟨γ, hγ⟩)
        simpa [f] using h3
      exact absurd hx (not_lt.2 this)
  exact key αs le_rfl

end

end SemiGoodFrames

import NonForkingFrames.Frames

/-!
# Main statements, written out in full (checked)

Formalization of: A. Jarden and S. Shelah, Non-forking frames in abstract elementary
classes, Ann. Pure Appl. Logic 164 (2013), no. 3, 135-191. Text formalized: arXiv:0901.0852v2.

This file is for reading the main results without the 21 000 lines of `Frames.lean`.

* **Statements.** Each main theorem is restated in full as `example : <statement> := …`. The
  proof is `by with_reducible exact <theorem>`. With reducible transparency, Lean unfolds only
  `@[reducible]` definitions when it compares the written statement with the theorem. So if
  the statement below differs from the real one (beyond reducible abbreviations), this file
  does not compile.
* **Definitions.** The definitions these statements depend on are shown with `#print`, from
  the compiled library (no copies), grouped by topic. `#print` shows the type and the body of
  each definition. It does not show the docstring (the place in the paper) or the tags
  (`PROOF-STAGE CHANGE`, `DEVIATION`, `AGENT-CHOICE`, `ENCODING`, `CITED`). For those, open the
  declaration in the source (go to definition) or see `docs/FIDELITY_REVIEW.md`.
* **Encoding.** Encoding conventions (the ambient type `U`, `Room U lam`, sequences as
  functions on ordinals, Galois types as sets of triples) are explained in the module comment
  of `AEC.lean`.
* **Cited results.** The six results the paper cites and does not prove are fields of the
  class `CitedResults` (group 8). Every theorem below takes `[CitedResults]` as an explicit
  hypothesis.

Imported from the root module `NonForkingFrames`, so `lake build` checks it.
-/

open FirstOrder FirstOrder.Language Cardinal Set

universe u

namespace SemiGoodFrames

/-! ## The main theorems -/

/-- **Thm 1.0.1** (stated in Section 1, proved as Thm 11.1.1 with the same statement).

Hypotheses:
1. `s` is a semi-good `λ`-frame with the conjugation property;
2. the uniqueness triples `K^{3,uq}` are dense;
3. `I(λ^{+2}, K) < 2^{λ^{+2}}`.

Conclusion:
* `s⁺` is a good `λ⁺`-frame, `K^sat ⊆ K_{λ⁺}`, and `≼^NF` on `K^sat` is contained in `≼`;
* `s⁺` has the conjugation property;
* `K` has models of cardinality `λ^{+2}` and `λ^{+3}`.

`Room U lam` is the encoding hypothesis that the ambient type `U` is big enough. -/
example : ∀ {U : Type u} {L : Language.{u, u}} [CitedResults.{u}]
    (lam : Cardinal.{u}) (_ : Room U lam) (s : Frame U L),
    -- (1) semi-good λ-frame with conjugation
    s.IsSemiGood lam ∧ ConjProp s lam →
    -- (2) density of the uniqueness triples
    s.Dense lam (s.K3uq lam) →
    -- (3) I(λ^{+2}, K) < 2^{λ^{+2}}
    numModels s.S (plusN lam 2) < 2 ^ (plusN lam 2) →
    -- conclusion
    ((s.splus lam).IsGood (Order.succ lam) ∧ s.Ksat lam ⊆ s.S.Kc (Order.succ lam) ∧
      ∀ M ∈ s.Ksat lam, ∀ N ∈ s.Ksat lam, s.leNF lam M N → s.S.le M N) ∧
    ConjProp (s.splus lam) (Order.succ lam) ∧
    (s.S.Kc (plusN lam 2)).Nonempty ∧ (s.S.Kc (plusN lam 3)).Nonempty := by
  with_reducible exact thm_1_0_1

/-- **Thm 1.0.2**, with `μ_unif` a free parameter `μunif`.

The paper's active text does not define `μ_unif` (see `ERRATA.md` C.8). Hypothesis `hunif` was
added by the formalization (`PROOF-STAGE CHANGE`): it is the commented-out Prop "unifleq" of the
tex at `μ = λ^{+(1+m)}`. This version holds for every function `μunif` that satisfies (2) and
`hunif`.

Hypotheses (1)–(4) are those of the paper. Because `∧` binds tighter than `→`, the two parts
of (3) form a single premise. Conclusion: `K_{λ^{+n}} ≠ ∅` for every `n`. -/
example : ∀ {U : Type u} {L : Language.{u, u}} [CitedResults.{u}]
    (lam : Cardinal.{u}) (_ : Room U lam) (s : Frame U L)
    (μunif : Cardinal.{u} → Cardinal.{u} → Cardinal.{u}),
    -- (1) semi-good λ-frame with conjugation
    s.IsSemiGood lam ∧ ConjProp s lam →
    -- (2) I(λ^{+(2+m)}, K) < μ_unif(λ^{+(2+m)}, 2^{λ^{+(1+m)}})
    (∀ m : ℕ, numModels s.S (plusN lam (2 + m)) < μunif (plusN lam (2 + m))
      (2 ^ (plusN lam (1 + m)))) →
    -- hunif (added): μ_unif(λ^{+(2+m)}, 2^{λ^{+(1+m)}}) ≤ 2^{λ^{+(2+m)}}
    (∀ m : ℕ, μunif (plusN lam (2 + m)) (2 ^ (plusN lam (1 + m))) ≤
      2 ^ (plusN lam (2 + m))) →
    -- (3) 2^{λ^{+m}} < 2^{λ^{+(m+1)}}, and the weak diamond ideal is not saturated
    (∀ m : ℕ, (2 : Cardinal.{u}) ^ (plusN lam m) < 2 ^ (plusN lam (m + 1))) ∧
      (∀ m : ℕ, NotSaturatedIn (WDmId (plusN lam (1 + m))) (plusN lam (1 + m))
        (plusN lam (2 + m))) →
    -- (4) Conjecture 11.1.4
    Conjecture_11_1_4.{u} →
    -- conclusion: K_{λ^{+n}} ≠ ∅ for every n
    ∀ n : ℕ, (s.S.Kc (plusN lam n)).Nonempty := by
  with_reducible exact thm_1_0_2

/-- **Thm 1.0.2** with `μ_unif` the function `muUnif` defined as in [Sh:88r], without `hunif`
(AUX `thm_1_0_2_muUnif`; `hunif` is discharged by AUX `muUnif_le`). The author confirmed that the
`μ_unif` of the paper is the one of [Sh:88r] (`ERRATA.md` C.8). The definition of `muUnif` is
printed in group 14 below. -/
example : ∀ {U : Type u} {L : Language.{u, u}} [CitedResults.{u}]
    (lam : Cardinal.{u}) (_ : Room U lam) (s : Frame U L),
    -- (1) semi-good λ-frame with conjugation
    s.IsSemiGood lam ∧ ConjProp s lam →
    -- (2) I(λ^{+(2+m)}, K) < μ_unif(λ^{+(2+m)}, 2^{λ^{+(1+m)}}), μ_unif as in [Sh:88r]
    (∀ m : ℕ, numModels s.S (plusN lam (2 + m)) < muUnif (plusN lam (2 + m))
      (2 ^ (plusN lam (1 + m)))) →
    -- (3)
    (∀ m : ℕ, (2 : Cardinal.{u}) ^ (plusN lam m) < 2 ^ (plusN lam (m + 1))) ∧
      (∀ m : ℕ, NotSaturatedIn (WDmId (plusN lam (1 + m))) (plusN lam (1 + m))
        (plusN lam (2 + m))) →
    -- (4) Conjecture 11.1.4
    Conjecture_11_1_4.{u} →
    ∀ n : ℕ, (s.S.Kc (plusN lam n)).Nonempty := by
  with_reducible exact thm_1_0_2_muUnif

/-! ## The definitions the statements depend on

Grouped by topic. Read the groups in order: each group uses only earlier ones. -/

/-! ### 1. Encoding of models and sequences (no paper item unless stated) -/

#print Model
#print instStructureElemCarrier
#print Model.card
#print IsSubstr
#print IsoOn
#print Over
#print KSys
#print KSys.Kc
#print KSys.KGe
#print KSys.KGt
#print KSys.lt
#print KSys.restrict
#print IsIncreasing
#print IsContinuous
#print IsUnionOf
#print IsIncCont
#print IsClubIn
#print IsStationaryIn
#print Room
#print plusN

/-! ### 2. AECs (Def 1.0.3) -/

#print KSys.AxIso
#print KSys.AxPO
#print KSys.AxIncl
#print KSys.AxUnion
#print KSys.AxSmooth
#print KSys.AxCoh
#print KSys.HasLST
#print KSys.AxLST
#print KSys.LST
#print IsAEC
#print IsAECIn

/-! ### 3. Counting models, `K^up` (Defs 1.0.15–1.0.16) -/

#print isoSetoid
#print numModels
#print InUp
#print LeUp
#print KSys.up

/-! ### 4. Embeddings and amalgamation (Defs 1.0.19–1.0.20) -/

#print IsEmb
#print IsAmalg
#print IsAmalgIn
#print AP
#print JEP
#print IsMaximal

/-! ### 5. Galois types and saturation (Defs 1.0.21–1.0.28) -/

#print Tri
#print KSys.K3
#print typePool
#print EStar
#print ERel
#print tp
#print SAll
#print res
#print Realizes
#print Full
#print Saturated
#print Homogeneous

/-! ### 6. Cited results of Section 1 (statements only; fields of `CitedResults`) -/

#print Fact_1_0_18
#print Fact_1_0_18_up
#print Prop_1_0_31
#print Thm_1_0_32_1
#print Thm_1_0_32_2

/-! ### 7. Frames (Defs 2.1.1, 2.1.3) -/

#print Frame
#print Frame.NotFork
#print Frame.IsNFExt
#print Frame.Ax0a
#print Frame.Ax0b
#print Frame.Ax1a
#print Frame.Ax1b
#print Frame.Ax1c
#print Frame.Ax2a
#print Frame.Ax2c
#print Frame.Ax2b
#print Frame.BasicStab
#print Frame.Ax3a
#print Frame.Ax3b
#print Frame.Ax3c
#print Frame.Ax3d
#print Frame.Ax3e
#print Frame.Ax3f
#print Frame.Ax3g
#print Frame.Core
#print Frame.IsGood
#print Frame.IsSemiGood

/-! ### 8. Conjugation; the cited Prop 2.5.7; `CitedResults` -/

#print Conjugate
#print ConjProp
#print Prop_2_5_7
#print CitedResults

/-! ### 9. Forking for big models (Section 2.6) -/

#print Frame.nfGe
#print Frame.NotForkGe
#print Frame.SbsGt

/-! ### 10. Basic and uniqueness triples (Sections 3–4) -/

#print Frame.K3bs
#print Frame.leBs
#print Frame.Dense
#print Amalg
#print AmalgEquiv
#print Frame.UqCond
#print Frame.K3uq

/-! ### 11. `NF`, `NF^`, `≼^NF` (Sections 5–6) -/

#print QRel
#print Frame.NFStarWit
#print Frame.NFStar
#print Frame.NF
#print Frame.NFhat
#print Frame.leNF

/-! ### 12. `K^sat` and the frame `s⁺` (Sections 7, 10) -/

#print Frame.Ksat
#print Frame.satKSys
#print Frame.upKSys
#print Frame.tpPlus
#print Frame.SbsPlus
#print Frame.nfPlus
#print Frame.splus

/-! ### 13. Weak diamond and the conjecture (Section 11) -/

#print WDmId
#print NotSaturatedIn
#print Conjecture_11_1_4

/-! ### 14. `μ_unif` as in [Sh:88r] (AUX; used only by `thm_1_0_2_muUnif`) -/

#print muUnif

end SemiGoodFrames

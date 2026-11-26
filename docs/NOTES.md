# Standing instructions (read first)

This section is the working contract for this formalization. Everything below it is the log.

Project: formalize Jarden–Shelah, "Non-forking frames in AECs" (semi-good frames). Source:
the LaTeX source of arXiv:0901.0852v2. Lean 4 + Mathlib v4.34.1. Code:
`NonForkingFrames/AEC.lean` and `Frames.lean`, both imported from
`NonForkingFrames.lean`. Talk to the author in English; code, identifiers and comments in English.
(Changed 2026-11-09 at the author's request: messages were in Hebrew before; the terminal shows Hebrew
with reversed word order.)

## 1. Policies

**Hard rules**
* Never write `import Mathlib` (it exhausts memory); targeted imports only.
* No `axiom`, no `native_decide`. No `sorry` inside definitions.
* No git commands; the author makes the commits.
* Do not change the toolchain, `lakefile.toml` or the manifest; never run `lake update`.
* Build only the two SemiGoodFrames modules. Run builds in the background and poll, so that they are
  not cut off by the 10-minute limit. Avoid heavy `simp`/`aesop` over big contexts.
* After each batch, update "Progress" in this file; at a checkpoint, build, update "Progress", stop
  and wait for the author.

**Changing definitions and statements**
* Small definition or statement changes are allowed only when a proof requires them.
* Tag each in Lean with `-- PROOF-STAGE CHANGE:`, stating the reason and the proof step, and log old /
  new / reason in "Proof-stage changes".
* Never make a definition vacuous or unsatisfiable, or its hypotheses contradictory.
* Add a hypothesis only if the statement is false without it. Never weaken a conclusion. No `sorry`
  in final proofs (a statement that is really stuck gets `-- STUCK: <why>` and is reported).
* If a statement seems false as written, report it (section F), do not silently fix it.
* If a fact can be derived from a definition, derive it rather than assume it.
* If a derivation that should follow from a definition fails, say exactly why and wait: the encoding
  may differ from the paper.

**Tags**
* `-- PROOF-STAGE CHANGE:` as above.
* `-- AGENT-CHOICE:` a reading chosen by the agent; listed in section E.
* `-- DEVIATION (…):` a departure from the paper's text. Variants: `(author-confirmed erratum)`,
  `(author-confirmed)`, `(typo fixed to evident intent)`,
  `(author-confirmed: α* ≠ 0 omitted in the paper)`. Keep the original text in the docstring and list the
  item in the errata (section C) or typos (section D).
* `AUX: not in paper` starts the docstring of every auxiliary lemma.
* Gaps in the paper's *proofs* go in "Gaps in the paper's proofs", not in the errata.

**Main theorems and scope**
* Frozen: Thm 1.0.1, Thm 1.0.2, Thm 11.1.7 (and 11.1.1).
* Prove only the closure of the main theorems under the dependency map. Out-of-closure statements keep
  their statement and `sorry`, and are listed here. The map is built from the paper's references and
  can miss uses, so a proof may turn out to need more.
* A CITED result that some proof uses is a `def … : Prop` and a field of `class CitedResults`
  (`Frames.lean`); every theorem depending on it takes `[C : CitedResults]` (author's decision,
  2026-11-10: no `sorry` in the published files). A newly used cited result gets the same treatment.
  CITED results not used by any proof are still `theorem … := by sorry` (waiting for the author).
  Do not spend time on CITED or schematic statements. Record which proofs use which cited results in
  "Cited results used by proofs".
* Prop 2.5.7 (CITED) has the weakened hypothesis `Core ∧ Ax3g ∧ Ax3e`; see "Cited results used under
  weaker hypotheses than stated".

## 2. Author's standing decisions

* Prove the strongest version of each statement that the proof supports.
* Never restrict a model to `K_λ` when that makes a definition vacuous.
* Typos are fixed to evident intent (section D).
* Disclosure for publication: the ambient type `U` and the hypothesis `Room U lam` are not in the
  paper; they are encoding devices (see the module docstring of `AEC.lean`).
  The ambient type `U` does NOT appear in the paper. It is an encoding device of this
  formalization: the paper never fixes a structure of which all models are substructures. It is
  not needed mathematically; it is introduced only so that `M ∩ N`, `N − M` and unions of chains
  can be written as operations on subsets of `U`, and so that no direct limits or disjoint unions
  have to be constructed. The theorems quantify over every `U` satisfying `Room U lam`, so they do
  not depend on the choice of `U`.
* `α* ≠ 0` is implicit everywhere: `α*` is the length of a sequence. Where a statement needs it, add it
  with the tag above; list it in the single item of section C.
* Keep Ax3b with `M₃** ∈ K_λ`; keep Remark 2.6.7 with `R ⊆ ≺`. Def 5.4.1(3) has `M₄ ∈ K_λ` (approved).
* Def 5.4.2 / Prop 5.4.3, Thm 5.3.7(c), Props 3.2.5, 5.3.8, Prop 8.1.3(a),(b): corrected as in section C.
* Prop 3.1.10: `θ^a < λ⁺` is a restriction of the formalized statement, not an erratum (author, 2026-11-13;
  `ERRATA.md` C.9). The Lean tag still reads `-- DEVIATION (author-confirmed):`; Lean files were not changed.
* Cited results: keep the instance-implicit binder `[C : CitedResults]` (author's decision, 2026-11-10).

## 3. Build

Run in the background, then poll:

```
timeout 590 lake build NonForkingFrames.AEC NonForkingFrames.Frames
```

Count of `sorry`s: `declaration uses` warnings in the output. To see what a theorem really rests on, use
`#print axioms` in a scratch file importing `NonForkingFrames.Frames`, run with
`lake env lean <file>`.

## 4. Next steps

State at the last checkpoint (2026-11-10, after the cleanup): both modules build; 0 errors, 0 `sorry` warnings; no `sorryAx` anywhere. All of
Sections 1–11 in the closure of the main theorems are proved; Thm 1.0.1, 1.0.2, 11.1.1, 11.1.7 are proved and
rest on `sorry` only through CITED results (see the last "Progress" section). Out of the closure: as listed;
Prop 6.1.6(a) waits for a decision of the author (section F).

1. Done: `prop_6_1_6_a` proved (author's decision on `IsRepresentation` applied).
2. Done (2026-11-10): Prop 6.1.6(a); cited results as `CitedResults`; cleanup (no `sorry`); `FIDELITY_REVIEW.md`.

**Next checkpoint:** to be named by the author.

## 5. Publication decisions

* **Name and primary reference (author, 2026-11-26).** The formalization is named after the published paper:
  A. Jarden and S. Shelah, "Non-forking frames in abstract elementary classes", Ann. Pure Appl. Logic 164 (2013),
  no. 3, 135–191.
* **Text formalized.** arXiv:0901.0852v2, listed on arXiv as "Good Frames With A Weak Stability". The tex was
  downloaded from arXiv without choosing a version, so it is v2; its source carries the published title
  (l. 271 of the source).
* Differences between the arXiv source and the printed version were not checked.

---

# NOTES — Stage 1 (definitions and statements) for *arXiv:0901.0852v2*

Files (namespace `SemiGoodFrames`, both imported from `NonForkingFrames.lean`):
* `NonForkingFrames/AEC.lean`: general infrastructure (encoding, AECs, `KSys`,
  embeddings, chains and unions, amalgamation, JEP, maximal models, `E*`, Galois types, saturation).
  Contains no theorem statements.
* `NonForkingFrames/Frames.lean`: imports `AEC.lean`. Contains the
  frame-specific definitions (Sections 2–11) and every theorem statement, including those of
  Section 1.

Build only these modules, from the project root:
`lake build NonForkingFrames.AEC NonForkingFrames.Frames`.

**Compiler status (after the split into two modules):** 0 errors. 148 `declaration uses 'sorry'`
warnings, one per theorem, the same as before the split.

The library build enables `weak.linter.mathlibStandardSet` (lakefile), which the earlier
`lake env lean` check did not use, so the build now also shows 7 style warnings. All of them come
from moved text: one "module doc-string should be the first command after the imports" in
`AEC.lean`, and six "line exceeds 100 characters" (`AEC.lean` 200; `Frames.lean` 821, 926, 1495,
1508, 1893). They are left unchanged because the split must not change any text. No `axiom`, no `native_decide`, no
`sorry` inside a definition, no `import Mathlib` (the imports are 7 specific Mathlib modules).

**Tags in the Lean file (find them with grep):**

| tag | meaning |
|---|---|
| `-- DEVIATION (author-confirmed erratum):` | an error of the paper, corrected as confirmed by the author (Part C) |
| `-- DEVIATION (typo fixed to evident intent):` | a typo corrected by author decision Q6 (Part D) |
| `-- DEVIATION (author decision …):` | a hypothesis added by author decision (Q3, Q4) |
| `-- DEVIATION (encoding):` / `(added hypothesis, encoding)` | an encoding choice with no mathematical content (`Room`, `ExtLogic`, `enumOrd`, `nfPlus`, …) |
| `-- AGENT-CHOICE …:` | a reading chosen by me: an unclear or incomplete statement, or an added hypothesis (Part E) |
| `-- AGENT-CHOICE (statement false as written):` | a statement false under every reading (Part F) |
| `-- CITED:` | proved in the paper only by citation; kept as `theorem … := by sorry` (Q7) |

No `LITERAL` tags remain.

**Numbering.** The compiled numbers are section.subsection.n, because the paper uses
`\newtheorem{theorem}{Theorem}[subsection]` with one shared counter; in a section with no
subsections the middle number is 0. The numbers were computed from the active text only, i.e. with
`\begin{comment}` blocks and `%` lines removed.

---

## A. Paper items → Lean names

### A.1 Items that were formalized

The table lists every paper item that has a Lean declaration. The docstring of each declaration
quotes or closely paraphrases the paper's statement. An item number with a suffix, e.g.
`prop_1_0_23_2`, denotes item (2) of that item.

| Paper item | Lean name | kind | file |
|---|---|---|---|
| Def 1.0.19(2) | `Over` | def | AEC.lean |
| Def 1.0.13 | `KLt` | def | AEC.lean |
| Def 1.0.13 | `KGe` | def | AEC.lean |
| Def 1.0.13 | `KGt` | def | AEC.lean |
| Def 1.0.14 | `lt` | def | AEC.lean |
| Def 11.0.1 | `plusN` | def | AEC.lean |
| Def 1.0.3(1)(a) | `AxIso` | def | AEC.lean |
| Def 1.0.3(1)(b) | `AxPO` | def | AEC.lean |
| Def 1.0.3(1)(b) | `AxIncl` | def | AEC.lean |
| Def 1.0.3(1)(c) | `AxUnion` | def | AEC.lean |
| Def 1.0.3(1)(d) | `AxSmooth` | def | AEC.lean |
| Def 1.0.3(1)(e) | `AxCoh` | def | AEC.lean |
| Def 1.0.3(1)(f) | `HasLST` | def | AEC.lean |
| Def 1.0.3(1)(f) | `AxLST` | def | AEC.lean |
| Def 1.0.3(1)(f) | `LST` | def | AEC.lean |
| Def 1.0.3(1) | `IsAEC` | structure | AEC.lean |
| Remark 1.0.4(1) | `rem_1_0_4_1` | theorem | Frames.lean |
| Remark 1.0.4(2) | `rem_1_0_4_2` | theorem | Frames.lean |
| Remark 1.0.4(3) | `rem_1_0_4_3` | theorem | Frames.lean |
| Def 1.0.15 | `numModels` | def | AEC.lean |
| Def 1.0.16(1) | `InUp` | def | AEC.lean |
| Def 1.0.16(2) | `LeUp` | def | AEC.lean |
| Def 1.0.16 | `KSys.up` | def | AEC.lean |
| Prop 1.0.17 | `prop_1_0_17` | theorem | Frames.lean |
| Fact 1.0.18 | `fact_1_0_18` | theorem | Frames.lean |
| Def 1.0.19(1) | `IsEmb` | def | AEC.lean |
| Def 1.0.20(1) | `IsAmalg` | def | AEC.lean |
| Def 1.0.20(1) | `IsAmalgIn` | def | AEC.lean |
| Def 1.0.20(1) | `AP` | def | AEC.lean |
| Def 1.0.20(2) | `JEP` | def | AEC.lean |
| Def 1.0.20(3) | `IsMaximal` | def | AEC.lean |
| Def 1.0.21(1) | `KSys.K3` | def | AEC.lean |
| Def 1.0.21(2) | `KSys.K3c` | def | AEC.lean |
| Def 1.0.22 | `typePool` | def | AEC.lean |
| Def 1.0.22(1) | `EStar` | def | AEC.lean |
| Def 1.0.22(2) | `ERel` | def | AEC.lean |
| Prop 1.0.23(1) | `prop_1_0_23_1` | theorem | Frames.lean |
| Prop 1.0.23(2) | `prop_1_0_23_2` | theorem | Frames.lean |
| Prop 1.0.23(3) | `prop_1_0_23_3` | theorem | Frames.lean |
| Def 1.0.24(1) | `tp` | def | AEC.lean |
| Def 1.0.24(2) | `SAll` | def | AEC.lean |
| Def 1.0.24(2) | `Sna` | def | AEC.lean |
| Def 1.0.24(3) | `res` | def | AEC.lean |
| Def 1.0.25 | `Full` | def | AEC.lean |
| Def 1.0.25 | `Saturated` | def | AEC.lean |
| Def 1.0.28 | `Homogeneous` | def | AEC.lean |
| Def 1.0.29 | `IsRepresentation` | def | AEC.lean |
| Prop 1.0.30 | `prop_1_0_30` | theorem | Frames.lean |
| Prop 1.0.31 | `prop_1_0_31` | theorem | Frames.lean |
| Thm 1.0.32(1) | `thm_1_0_32_1` | theorem | Frames.lean |
| Thm 1.0.32(2) | `thm_1_0_32_2` | theorem | Frames.lean |
| Def 2.1.1 | `Frame` | structure | Frames.lean |
| Def 2.1.1(0)(a) | `Ax0a` | def | Frames.lean |
| Def 2.1.1(0)(b) | `Ax0b` | def | Frames.lean |
| Def 2.1.1(1)(a) | `Ax1a` | def | Frames.lean |
| Def 2.1.1(1)(b) | `Ax1b` | def | Frames.lean |
| Def 2.1.1(1)(c) | `Ax1c` | def | Frames.lean |
| Def 2.1.1(2)(a) | `Ax2a` | def | Frames.lean |
| Def 2.1.1(2)(b) | `Ax2b` | def | Frames.lean |
| Def 2.1.1(2)(c) | `Ax2c` | def | Frames.lean |
| Def 2.1.1(2)(d) | `BasicStab` | def | Frames.lean |
| Def 2.1.1(3)(a) | `Ax3a` | def | Frames.lean |
| Def 2.1.1(3)(b) | `Ax3b` | def | Frames.lean |
| Def 2.1.1(3)(c) | `Ax3c` | def | Frames.lean |
| Def 2.1.1(3)(d) | `Ax3d` | def | Frames.lean |
| Def 2.1.1(3)(e) | `Ax3e` | def | Frames.lean |
| Def 2.1.1(3)(f) | `Ax3f` | def | Frames.lean |
| Def 2.1.1(3)(g) | `Ax3g` | def | Frames.lean |
| Def 2.1.1 | `IsGood` | def | Frames.lean |
| Def 2.1.3 | `IsSemiGood` | def | Frames.lean |
| Def 2.1.3 | `IsSemiGoodSome` | def | Frames.lean |
| Prop 2.1.2 | `prop_2_1_2` | theorem | Frames.lean |
| Remark 2.1.4 | `rem_2_1_4` | theorem | Frames.lean |
| Def 2.2.2 | `trivialFrame` | def | Frames.lean |
| Prop 2.2.3 | `prop_2_2_3` | theorem | Frames.lean |
| Def 2.2.5 | `InBoxK` | def | Frames.lean |
| Def 2.2.5 | `boxKSys` | def | Frames.lean |
| Prop 2.2.6 | `prop_2_2_6` | theorem | Frames.lean |
| Def 2.3.2 | `IsPCAleph0` | def | Frames.lean |
| Def 2.3.3 | `finDefFrame` | def | Frames.lean |
| Prop 2.3.4 | `prop_2_3_4` | theorem | Frames.lean |
| Prop 2.3.5 | `prop_2_3_5` | theorem | Frames.lean |
| Def 2.3.6 | `IsSmall` | def | Frames.lean |
| Thm 2.3.7 | `thm_2_3_7` | theorem | Frames.lean |
| Thm 2.3.8 | `thm_2_3_8` | theorem | Frames.lean |
| Prop 2.3.9 | `prop_2_3_9` | theorem | Frames.lean |
| Prop 2.3.10 | `prop_2_3_10` | theorem | Frames.lean |
| Def 2.4.1 | `IsTLO` | def | Frames.lean |
| Lemma 2.4.2 | `lem_2_4_2` | theorem | Frames.lean |
| Def 2.4.3 | `IsTPO` | def | Frames.lean |
| Def 2.4.4 | `tpoKSys` | def | Frames.lean |
| Prop 2.4.5 | `prop_2_4_5` | theorem | Frames.lean |
| Remark 2.4.7 | `rem_2_4_7` | theorem | Frames.lean |
| Claim 2.4.8 | `claim_2_4_8` | theorem | Frames.lean |
| Def 2.5.1 | `Conjugate` | def | Frames.lean |
| Prop 2.5.2 | `prop_2_5_2` | theorem | Frames.lean |
| Def 2.5.3 | `MapsType` | def | Frames.lean |
| Remark 2.5.4 | `rem_2_5_4` | theorem | Frames.lean |
| Def 2.5.5 | `ConjProp` | def | Frames.lean |
| Prop 2.5.6 | `prop_2_5_6` | theorem | Frames.lean |
| Prop 2.5.7 | `prop_2_5_7` | theorem | Frames.lean |
| Thm 2.5.8(1) | `thm_2_5_8_1` | theorem | Frames.lean |
| Thm 2.5.8(2) | `thm_2_5_8_2` | theorem | Frames.lean |
| Thm 2.5.8(3) | `thm_2_5_8_3` | theorem | Frames.lean |
| Thm 2.5.8(4) | `thm_2_5_8_4` | theorem | Frames.lean |
| Def 2.6.1 | `nfGe` | def | Frames.lean |
| Def 2.6.2 | `NotForkGe` | def | Frames.lean |
| Def 2.6.4 | `SbsGt` | def | Frames.lean |
| Def 2.6.4 | `SbsGe` | def | Frames.lean |
| Def 2.6.5 | `WLCFor` | def | Frames.lean |
| Def 2.6.6 | `WeakLC` | def | Frames.lean |
| Remark 2.6.3 | `rem_2_6_3` | theorem | Frames.lean |
| Remark 2.6.7 | `rem_2_6_7` | theorem | Frames.lean |
| Thm 2.6.8(1) | `thm_2_6_8_1` | theorem | Frames.lean |
| Thm 2.6.8(2) | `thm_2_6_8_2` | theorem | Frames.lean |
| Thm 2.6.8(3) | `thm_2_6_8_3` | theorem | Frames.lean |
| Thm 2.6.8(4) | `thm_2_6_8_4` | theorem | Frames.lean |
| Thm 2.6.8(5) | `thm_2_6_8_5` | theorem | Frames.lean |
| Hypothesis 3.0.1 | `Hyp_3_0_1` | def | Frames.lean |
| Def 3.1.1(1) | `K3bs` | def | Frames.lean |
| Def 3.1.1(2) | `leBs` | def | Frames.lean |
| Def 3.1.3 | `leBsDisj` | def | Frames.lean |
| Def 3.1.2 | `LTri` | def | Frames.lean |
| Def 3.1.2 | `triStr` | def | Frames.lean |
| Def 3.1.2 | `triModel` | def | Frames.lean |
| Remark 3.1.4 | `rem_3_1_4` | theorem | Frames.lean |
| Def 3.1.5 | `Frame.BsIncCont` | def | Frames.lean |
| Prop 3.1.6 | `prop_3_1_6` | theorem | Frames.lean |
| Prop 3.1.7 | `prop_3_1_7` | theorem | Frames.lean |
| Prop 3.1.8 | `prop_3_1_8` | theorem | Frames.lean |
| Prop 3.1.9 | `prop_3_1_9` | theorem | Frames.lean |
| Prop 3.1.10 | `prop_3_1_10` | theorem | Frames.lean |
| Def 3.2.1 | `IsoClosedTri` | def | Frames.lean |
| Def 3.2.1(1) | `Frame.Dense` | def | Frames.lean |
| Def 3.2.1(2) | `Frame.ExistProp` | def | Frames.lean |
| Def 3.2.2 | `IsDecomp` | def | Frames.lean |
| Def 3.2.2 | `Decomposable` | def | Frames.lean |
| Thm 3.2.3(1) | `thm_3_2_3_1` | theorem | Frames.lean |
| Thm 3.2.3(2) | `thm_3_2_3_2` | theorem | Frames.lean |
| Thm 3.2.3(3) | `thm_3_2_3_3` | theorem | Frames.lean |
| Prop 3.2.4 | `prop_3_2_4` | theorem | Frames.lean |
| Prop 3.2.5 | `prop_3_2_5` | theorem | Frames.lean |
| Def 3.3.1 | `IsDisjointAmalg` | def | Frames.lean |
| Def 3.3.2 | `Frame.K3r` | def | Frames.lean |
| Remark 3.3.3 | `rem_3_3_3` | theorem | Frames.lean |
| Prop 3.3.4 | `prop_3_3_4` | theorem | Frames.lean |
| Thm 3.3.5 | `thm_3_3_5` | theorem | Frames.lean |
| Hypothesis 4.1.1 | `Hyp_4_1_1` | def | Frames.lean |
| Def 4.1.2 | `AmalgEquiv` | def | Frames.lean |
| Prop 4.1.3 | `prop_4_1_3` | theorem | Frames.lean |
| Def 4.1.5 | `Frame.K3uq` | def | Frames.lean |
| Def 4.1.6 | `Frame.Dominates` | def | Frames.lean |
| Prop 4.1.7 | `prop_4_1_7` | theorem | Frames.lean |
| Prop 4.1.8 | `prop_4_1_8` | theorem | Frames.lean |
| Prop 4.1.10 | `prop_4_1_10` | theorem | Frames.lean |
| Prop 4.1.11(1) | `prop_4_1_11_1` | theorem | Frames.lean |
| Prop 4.1.11(2) | `prop_4_1_11_2` | theorem | Frames.lean |
| Prop 4.1.12(1) | `prop_4_1_12_1` | theorem | Frames.lean |
| Prop 4.1.12(2) | `prop_4_1_12_2` | theorem | Frames.lean |
| Hypothesis 5.1.1 | `Hyp_5_1_1` | def | Frames.lean |
| Def 5.2.1 | `OtDom` | def | Frames.lean |
| Def 5.2.1(a) | `OtA` | def | Frames.lean |
| Def 5.2.1(b) | `OtB` | def | Frames.lean |
| Def 5.2.1(c) | `OtC` | def | Frames.lean |
| Def 5.2.1(d) | `OtD` | def | Frames.lean |
| Def 5.2.1(e) | `OtE` | def | Frames.lean |
| Def 5.2.1(f) | `OtF` | def | Frames.lean |
| Def 5.2.1 | `Otimes` | structure | Frames.lean |
| Prop 5.2.2 | `prop_5_2_2` | theorem | Frames.lean |
| Prop 5.2.4 | `prop_5_2_4` | theorem | Frames.lean |
| Prop 5.2.5(1) | `prop_5_2_5_1` | theorem | Frames.lean |
| Prop 5.2.5(2) | `prop_5_2_5_2` | theorem | Frames.lean |
| Prop 5.2.5(3) | `prop_5_2_5_3` | theorem | Frames.lean |
| Def 5.2.6 | `Respects` | def | Frames.lean |
| Def 5.3.1 | `Frame.NFStarWit` | def | Frames.lean |
| Def 5.3.1 | `Frame.NFStar` | def | Frames.lean |
| Def 5.3.2 | `Frame.NF` | def | Frames.lean |
| Prop 5.3.3 | `prop_5_3_3` | theorem | Frames.lean |
| Prop 5.3.4 | `prop_5_3_4` | theorem | Frames.lean |
| Prop 5.3.5 | `prop_5_3_5` | theorem | Frames.lean |
| Prop 5.3.6 | `prop_5_3_6` | theorem | Frames.lean |
| Thm 5.3.7 | `thm_5_3_7` | theorem | Frames.lean |
| Prop 5.3.8 | `prop_5_3_8` | theorem | Frames.lean |
| Prop 5.3.9(1) | `prop_5_3_9_1` | theorem | Frames.lean |
| Prop 5.3.9(2) | `prop_5_3_9_2` | theorem | Frames.lean |
| Prop 5.3.9(3) | `prop_5_3_9_3` | theorem | Frames.lean |
| Prop 5.4.4 | `N_{1,α}, N^x_{2,α} ∈ K_λ` for `α < α*`; no relation between the `f^x_α` | `α ≤ α*`; `f^x_0 = id` on `N_{1,0}`; `⟨f^x_α⟩` increasing | The conclusion is an `E`-equivalence inside `K_λ`, which needs the top models in `K_λ`. For `α* = 0` the statement is false without `f^a_0 = f^b_0`, and the paper's proof uses `g_{x,0} = id` and unions of the `f^x_α`. The general form for tops outside `K_λ` is the AUX lemma `transit_weak`. |
| Def 5.4.1(3) `OtMinus` | no size condition on `M₄` | hypothesis `M₄ ∈ K_λ` | `R ⊆ ⁴(K_λ)` in the paper. Without it clause (3) is false for every nonempty `R`, since `M₄ ≼ M₅ ∈ K_λ` fails for `M₄` larger than `λ` (step: Prop 5.4.8). |
| Prop 5.3.9(4) | `prop_5_3_9_4` | theorem | Frames.lean |
| Def 5.4.1 | `OtMinus` | def | Frames.lean |
| Def 5.4.2 | `Frame.NFuq` | def | Frames.lean |
| Prop 5.4.3 | `prop_5_4_3` | theorem | Frames.lean |
| Prop 5.4.4 | `prop_5_4_4` | theorem | Frames.lean |
| Prop 5.4.5 | `prop_5_4_5` | theorem | Frames.lean |
| Prop 5.4.6 | `prop_5_4_6` | theorem | Frames.lean |
| Thm 5.4.7 | `thm_5_4_7` | theorem | Frames.lean |
| Prop 5.4.8 | `prop_5_4_8` | theorem | Frames.lean |
| Thm 5.4.9 | `thm_5_4_9` | theorem | Frames.lean |
| Thm 5.4.10 | `thm_5_4_10` | theorem | Frames.lean |
| Thm 5.5.1 | `thm_5_5_1` | theorem | Frames.lean |
| Prop 5.5.3(a) | `prop_5_5_3_a` | theorem | Frames.lean |
| Prop 5.5.3(b) | `prop_5_5_3_b` | theorem | Frames.lean |
| Thm 5.5.4 | `thm_5_5_4` | theorem | Frames.lean |
| Hypothesis 6.1.1 | `Hyp_6_1_1` | def | Frames.lean |
| Def 6.1.2 | `NFhat` | def | Frames.lean |
| Def 6.1.4 | `leNF` | def | Frames.lean |
| Thm 6.1.3(a) | `thm_6_1_3_a` | theorem | Frames.lean |
| Thm 6.1.3(b) | `thm_6_1_3_b` | theorem | Frames.lean |
| Thm 6.1.3(c) | `thm_6_1_3_c` | theorem | Frames.lean |
| Thm 6.1.3(d) | `thm_6_1_3_d` | theorem | Frames.lean |
| Thm 6.1.3(e) | `thm_6_1_3_e` | theorem | Frames.lean |
| Remark 6.1.5 | `rem_6_1_5` | theorem | Frames.lean |
| Prop 6.1.6(a) | `prop_6_1_6_a` | theorem | Frames.lean |
| Prop 6.1.6(b) | `prop_6_1_6_b` | theorem | Frames.lean |
| Prop 6.1.6(c) | `prop_6_1_6_c` | theorem | Frames.lean |
| Prop 6.1.6(d) | `prop_6_1_6_d` | theorem | Frames.lean |
| Prop 6.1.6(e) | `prop_6_1_6_e` | theorem | Frames.lean |
| Prop 6.1.6(f) | `prop_6_1_6_f` | theorem | Frames.lean |
| Prop 6.1.6(g) | `prop_6_1_6_g` | theorem | Frames.lean |
| Hypothesis 7.1.1 | `Hyp_7_1_1` | def | Frames.lean |
| Def 7.1.2 | `Ksat` | def | Frames.lean |
| Def 7.1.4 | `PlusWit` | def | Frames.lean |
| Def 7.1.4 | `ltPlus` | def | Frames.lean |
| Thm 7.1.3 | `thm_7_1_3` | theorem | Frames.lean |
| Prop 7.1.5 | `prop_7_1_5` | theorem | Frames.lean |
| Prop 7.1.6 | `prop_7_1_6` | theorem | Frames.lean |
| Prop 7.1.7 | `prop_7_1_7` | theorem | Frames.lean |
| Prop 7.1.10(a) | `prop_7_1_10_a` | theorem | Frames.lean |
| Prop 7.1.10(b) | `prop_7_1_10_b` | theorem | Frames.lean |
| Prop 7.1.10(c) | `prop_7_1_10_c` | theorem | Frames.lean |
| Prop 7.1.10(d) | `prop_7_1_10_d` | theorem | Frames.lean |
| Def 7.1.11 | `PlusStrategy` | abbrev | Frames.lean |
| Def 7.1.11 | `Frame.IsPlay` | def | Frames.lean |
| Def 7.1.11 | `Frame.Winning` | def | Frames.lean |
| Prop 7.1.12(a) | `prop_7_1_12_a` | theorem | Frames.lean |
| Prop 7.1.12(b) | `prop_7_1_12_b` | theorem | Frames.lean |
| Prop 7.1.12(c) | `prop_7_1_12_c` | theorem | Frames.lean |
| Thm 7.1.13(a) | `thm_7_1_13_a` | theorem | Frames.lean |
| Thm 7.1.13(b) | `thm_7_1_13_b` | theorem | Frames.lean |
| Thm 7.1.13(c) | `thm_7_1_13_c` | theorem | Frames.lean |
| Cor 7.1.17(a) | `cor_7_1_17_a` | theorem | Frames.lean |
| Cor 7.1.17(b) | `cor_7_1_17_b` | theorem | Frames.lean |
| Cor 7.1.17(c) | `cor_7_1_17_c` | theorem | Frames.lean |
| Thm 7.1.18(a) | `thm_7_1_18_a` | theorem | Frames.lean |
| Thm 7.1.18(b) | `thm_7_1_18_b` | theorem | Frames.lean |
| Thm 7.1.18(c) | `thm_7_1_18_c` | theorem | Frames.lean |
| Hypothesis 8.1.1 | `Hyp_8_1_1` | def | Frames.lean |
| Def 8.1.2 | `Frame.leOt` | def | Frames.lean |
| Prop 8.1.3(a) | `prop_8_1_3_a` | theorem | Frames.lean |
| Prop 8.1.3(b) | `prop_8_1_3_b` | theorem | Frames.lean |
| Prop 8.1.4 | `prop_8_1_4` | theorem | Frames.lean |
| Prop 8.1.5 | `prop_8_1_5` | theorem | Frames.lean |
| Prop 8.1.6 | `prop_8_1_6` | theorem | Frames.lean |
| Hypothesis 9.1.1 | `Hyp_9_1_1` | def | Frames.lean |
| Def 9.1.2 | `Frame.IncNFSucc` | def | Frames.lean |
| Def 9.1.3 | `Frame.TSet` | def | Frames.lean |
| Def 9.1.3 | `Frame.HasT` | def | Frames.lean |
| Prop 9.1.4 | `prop_9_1_4` | theorem | Frames.lean |
| Prop 9.1.5 | `prop_9_1_5` | theorem | Frames.lean |
| Prop 9.1.6 | `prop_9_1_6` | theorem | Frames.lean |
| Thm 9.1.7 | `thm_9_1_7` | theorem | Frames.lean |
| Thm 9.1.13 | `thm_9_1_13` | theorem | Frames.lean |
| Def 10.1.1 | `Frame.Successful` | def | Frames.lean |
| Hypothesis 10.1.2 | `Hyp_10_1_2` | def | Frames.lean |
| Def 10.1.3 | `tpPlus` | def | Frames.lean |
| Def 10.1.5 | `resPlus` | def | Frames.lean |
| Def 10.1.6(1) | `SbsPlus` | def | Frames.lean |
| Def 10.1.6(2) | `nfPlus` | def | Frames.lean |
| Def 10.1.6 | `splus` | def | Frames.lean |
| Prop 10.1.4 | `prop_10_1_4` | theorem | Frames.lean |
| Prop 10.1.7(a) | `prop_10_1_7_a` | theorem | Frames.lean |
| Prop 10.1.7(b) | `prop_10_1_7_b` | theorem | Frames.lean |
| Prop 10.1.8 | `prop_10_1_8` | theorem | Frames.lean |
| Thm 10.1.9 | `thm_10_1_9` | theorem | Frames.lean |
| Prop 10.1.10 | `prop_10_1_10` | theorem | Frames.lean |
| Prop 10.1.11 | `prop_10_1_11` | theorem | Frames.lean |
| Prop 10.1.12 | `prop_10_1_12` | theorem | Frames.lean |
| Prop 10.1.13 | `prop_10_1_13` | theorem | Frames.lean |
| Def 11.1.2 | `WDmId` | def | Frames.lean |
| Def 11.1.3 | `NotSaturatedIn` | def | Frames.lean |
| Conjecture 11.1.4 | `Conjecture_11_1_4` | def | Frames.lean |
| Thm 11.1.1 | `thm_11_1_1` | theorem | Frames.lean |
| Thm 11.1.5 | `thm_11_1_5` | theorem | Frames.lean |
| Cor 11.1.6 | `cor_11_1_6` | theorem | Frames.lean |
| Thm 11.1.7 | `thm_11_1_7` | theorem | Frames.lean |
| Thm 1.0.1 | `thm_1_0_1` | theorem | Frames.lean |
| Thm 1.0.2 | `thm_1_0_2` | theorem | Frames.lean |

The two main theorems of Section 1 use notions defined later in the paper. Lean needs every
definition before its first use, so Thm 1.0.1 (`thm_1_0_1`) and Thm 1.0.2 (`thm_1_0_2`) are placed
at the very end of the file.

The section hypotheses (Hyp 3.0.1, 4.1.1, 5.1.1, 6.1.1, 7.1.1, 8.1.1, 9.1.1, 10.1.2) are `def … : Prop`
named `Hyp_x_y_z`. Every theorem of a section takes its section's hypothesis as an explicit
argument `hs`.

### A.2 Items that were not formalized, and why

* **Examples** 1.0.5–1.0.12, 1.0.27, 2.2.1, 2.2.4, 2.2.7, 2.4.6, 4.1.4, 4.1.9, 5.2.3. These are
  illustrations. They involve first-order theories, groups, Banach spaces, graphs and so on, and they
  are neither definitions nor lemmas. Inside Example 2.4.6, Remark 2.4.7 and Claim 2.4.8 *are*
  formalized.
* **Informal remarks** 1.0.26 and 5.1.2. They make no mathematical claim.
* **Claims stated inside proofs:** 5.5.2 (proof of 5.5.1); 6.1.7–6.1.11 (proof of 6.1.6);
  7.1.8, 7.1.9 (proof of 7.1.7); 7.1.14–7.1.16 (proof of 7.1.13); 9.1.8–9.1.12 (proof of 9.1.7).
  Their statements refer to objects built inside the proof, such as the club `E`, the sequence
  `M_{α,ε}` or `f^{temp}`, so they cannot be stated as standalone theorems. Propositions
  10.1.10–10.1.13 also sit inside the proof of Thm 10.1.9, but they talk only about `s⁺`, so they
  *are* formalized.
* **The discussion paragraphs** (`\discussion`, Section 12 "Comparison to [Sh:h].II").

---

## B. Modelling decisions

**B.1 Universe of sets.** A model is an `L`-structure whose universe is a subset of an ambient type
`U` (`Model U L`), with `L : Language.{u,u}` from Mathlib. A class `K` is a `Set (Model U L)`.
`(K, ≼)` is a `KSys`, with no axioms bundled, so that derived classes such as
`((K^sat, ≼^NF ↾ K^sat)^up)` need no proofs inside definitions.

Encoding hypothesis: `Room U lam` says `#U` is a strong limit cardinal above `λ`. Every theorem that
involves `lam` takes it; it stands for "the universe of sets has room for every model the paper
builds".

**B.2** `λ⁺` is `Order.succ lam`; as an index set it is the ordinal `(Order.succ lam).ord`.
`λ^{+n}` is `plusN lam n` (Def 11.0.1, in `AEC.lean`). `cf` is `Ordinal.cof`.

**B.3 Sequences.** A sequence is a function `Ordinal → Model U L`, constrained only on its index
set. "Increasing" means `≼`, non-strict; "`≺`-increasing" means strict. "Continuous" is stated on
universes. A union *model* is `IsUnionOf`. `δ` is always a limit ordinal (paper's convention).
Section 1 results that state no hypothesis on `(K, ≼)` assume `IsAEC S`, the ambient context.

**B.4 Embeddings and isomorphisms.** Maps are total functions `U → U`. `IsoOn f M N` says `f`
restricted to `M` is an isomorphism onto `N`. An embedding is an isomorphism onto a `≼`-submodel.

**B.5 Galois types.** `tp S lam a M N : Set (Tri U L)` is the class of `(M, N, a)` under the
equivalence closure of `E*`. After the erratum (C.1), the model `N₂` in `E*` ranges over all of `K`
(`typePool S lam := S.K`), so the cardinal argument of `tp` is irrelevant. `S(M)`, `S^na(M)` and
`p ↾ M₀` are as in Def 1.0.24; the restriction is the union over the representatives of `p`.

**B.6 Frames.** `Frame U L` has fields `S`, `Sbs` and `nf` (= `⨿(M₀, M₁, a, M₃)`). Each axiom of
Def 2.1.1 is a separate `def` (`Ax0a` … `Ax3g`, `BasicStab μ`). `Core` collects the axioms shared by
all frame variants. The variants are `IsGood`, `IsSemiGood`, `IsSemiGoodExceptLC`, `Hyp_3_0_1` and
`Cond12`. Because the axioms are separate, a proposition can assume exactly the axioms its proof
uses (Q3).

**B.7 Triples.** `K^{3,bs}`, `≼_bs`, `K^{3,r}`, `K^{3,uq}` are on `Tri U L`. The vocabulary of
triples (Def 3.1.2) is literal: `LTri = {P, c}` and `triModel`.

**B.8 Amalgamations and `NF`.** An amalgamation is an `Amalg = (f₁, f₂, M₃)`; in a `K_λ` context
it has `M₃ ∈ K_λ`. `E_{M₀}` is `AmalgEquiv`. `⊗_R` has one field per clause. `NF*` keeps its
witnesses explicit (`NFStarWit`).

**B.9 External notions.** These are parameters, so the statements that use them are schematic
(Q8):

* `L_{∞,ω}` / `L_{ω₁,ω}`, `PC` classes, fragments, and Shelah's definable types: all in the
  structure `ExtLogic`.
* `μ_unif` is the parameter `μunif`.
* `χ`-tame and "stable in μ" are given standard renderings.

**B.10 Cited results (Q7).** Fact 1.0.18, Prop 1.0.31, Thm 1.0.32(1),(2), Thm 2.3.7, Thm 2.3.8,
Lemma 2.4.2, Prop 2.5.6 and Prop 2.5.7 are tagged `-- CITED` and kept as `theorem … := by sorry`.
Conjecture 11.1.4 is a `def … : Prop`, used as a hypothesis.

In Stage 2, NOTES.md will record which proof uses which cited result.

**B.11** "`2^{λ^{+2}}` pairwise non-isomorphic models in `K_{λ^{+2}}`" is encoded as
`2^{λ^{+2}} ≤ I(λ^{+2}, K)`.

**B.12** In Def 7.1.11 a strategy (`PlusStrategy`) sees only the history; `Winning` quantifies over
plays.

---

## C. Errata of the paper (confirmed by the author)

**C.1 (Q1) Def 1.0.22: "N₂ ∈ K_λ" in `E*`.** Original text: "for some `N₂ ∈ K_λ` with `N₁ ≼ N₂`
there is an embedding `f : N₀ → N₂` over `M₀` with `f(a₀) = a₁`". Corrected to `N₂ ∈ K`
(`typePool S lam := S.K`). For triples in `K³_λ` nothing changes when `LST ≤ λ`.

*Re-check of the inconsistency reported in Stage 1:*

* **Prop 1.0.23(2)** ("`E*` is reflexive and symmetric on `K³`"). Before the erratum, reflexivity
  failed for `N ∉ K_λ`. Now `(M, N, a) E* (M, N, a)` holds with `N₂ := N` and `f := id`, using
  reflexivity of `≼`. Symmetry follows by renaming `N₂` along `f⁻¹`, using Axiom a and the room
  in `U`. The statement is consistent and expected to be provable.
* **`K^sat = ∅`.** The Stage 1 argument used the fact that `tp(a, N, M)` was a singleton for
  `M ∈ K_{λ⁺}`. With `N₂ ∈ K`, `tp(a, N, M)` is a genuine equivalence class: for `N ∈ K_λ` the
  triples `(N, M, a)` and `(N, N', a')` are equivalent whenever they have a common extension in `K`.
  So "`M` realizes `S(N)`" is a real condition, the argument no longer applies, and Thm 2.5.8(3)
  asserts that `K^sat ≠ ∅`.
* **Prop 3.1.9(1), Prop 7.1.10(b), Prop 7.1.12(a).** The chain "every `M₀ ∈ K_{λ⁺}` has some
  `M₁ ≻⁺ M₀` (7.1.12(a)), and then `M₁ ∈ K^sat` (7.1.10(b)), but `K^sat = ∅`, so `K_{λ⁺} = ∅`,
  contradicting 3.1.9(1)" breaks at "`K^sat = ∅`". I found no other derivation of a contradiction
  among these statements; they are now mutually consistent as far as I can see. (This is a reading
  of the statements, not a proof. No `sorry` is discharged.)

**C.2 (Q2) Def 2.6.1, clause (3).** Original text: "for some model `N₀ ∈ K_λ` with `N₀ ≼ M₀`, for
each model `N ∈ K_λ`, `N₀ ∪ {a} ⊆ N ≼ M₁ ⇒ ⨿(N₀, a, N, M₂)`". As written it is vacuous, because
`a ∉ M₁`. Corrected (universal version): for some `N₀ ∈ K_λ`, `N₀ ≼ M₀`, for every `N ∈ K_λ` with
`N₀ ⊆ N ≼ M₁` and every `N' ∈ K_λ` with `N ∪ {a} ⊆ N' ≼ M₂`, `⨿(N₀, N, a, N')`, in the argument
order of Def 2.1.1.

**C.3 Conjecture 11.1.4: "WDmId(λ⁺) is not saturated in λ⁺".** The author checked the source.
It should read "not saturated in `λ^{+2}`". This matches the pattern "`WDmId(λ^{+1+m})` not
saturated in `λ^{+(2+m)}`" of Thm 11.1.5(3) and Thm 11.1.7, and the fact "`WDmId(μ)` not
saturated in `μ⁺`". The formalization now uses `plusN lam 2`, with the original text in the
docstring and the tag `DEVIATION (author-confirmed erratum)`. Hypothesis 11.1.5(3) (`λ^{+2}`) was
already correct and is unchanged.

---

**C.erratum Thm 5.3.7(c) (author-confirmed, found in Stage 2).** Original text: "If `N₁` is
decomposable over `N₀` by `K^{3,uq}` and `a ∈ N₁ − N₀`, then for some `N₃ ∈ K_λ`,
`NF*(N₀, N₁, N₂, N₃)`. Moreover, we can choose `a` as the first element in the first witness for
`NF*`." Corrected: if `a ∈ N₁ − N₀` and `tp(a, N₀, N₁)` is basic, then there are `N₃ ∈ K_λ` and
`N₁* ≽ N₁` in `K_λ` with `NF*(N₀, N₁*, N₂, N₃)` and `a` the first element of the first witness.
The paper omitted "basic" and the passage to an extension, which is what its proof via
Thm 3.2.3(3) produces. Tagged `-- DEVIATION (author-confirmed erratum):`; original text in the
docstring. Proved as `Frame.thm_5_3_7_c`, so `thm_5_3_7` has no `sorry` of its own.

*Uses of 5.3.7(c) in the paper* (searched in the active text with line breaks normalized): there
is exactly one, in the proof of Thm 5.4.10 ("`NF` respects `s`"). There `NF*(M₀, M₁, M₂, M₃)` and
`a ∈ M₁` with basic type are given; (c) is used to get `M₃*`, and the only things then used are
that `tp(a, M₂, M₃*)` does not fork over `M₀` (from the first witness) and weak uniqueness over
`M₁ ∪ M₂`. An extension `M₁*` is enough: by Def 5.3.2, `NF*(M₀, M₁*, M₂, M₃*)` with `M₁ ≼ M₁*`
gives `NF(M₀, M₁, M₂, M₃*)`, and weak uniqueness (Thm 5.4.7) is about `NF`. Decomposability of
`M₁` is no longer needed there, and the basic type is a hypothesis of 5.4.10. The other uses of
Thm 5.3.7 cite (a) or (b) (Thm 5.4.7, Prop 5.4.8, Thm 5.4.9, Claim 5.5.2, Prop 5.5.3, Thm 5.5.4,
Prop 7.1.12; Prop 7.1.7 cites the theorem with no letter, in the form of (a)). No use needs `N₁`
itself in (c), so no AGENT-CHOICE was necessary.

**C.erratum Props 3.2.5 and 5.3.8 (author-confirmed, found in Stage 2).** Both are false as written
for chains with `α* ≥ λ⁺` (the top model is not in `K_λ`) and for `α* = 0` (the bottom model need
not be in `K_λ`). Corrected: `α* < λ⁺` and the bottom model(s) in `K_λ`. Tagged
`-- DEVIATION (author-confirmed erratum):`; original text kept. Prop 5.3.8 also needs
`α* ≠ 0` (see the item on `α* ≠ 0` below).

*Uses, checked in the active text with line breaks normalized.* Prop 3.2.5 is cited only in the
proof of Prop 3.2.4, with `α* = ω < λ⁺` and `M₀, M₁ ∈ K_λ`: covered. Prop 5.3.8 is cited in the
proof of Prop 5.3.9(3), with `α* = 2` (in Lean the shorter `Frame.nfstar_comp`/`nfstarWit_snoc` is
used), and informally in Thm 5.4.7 ("a private case of transitivity", `α* = 2`) and in Thm 5.5.1
Case a ("concatenate all the sequences"). In Thm 5.5.1 the chains are `≺`-increasing in `K_λ` up to
and including `α*`, which forces `α* < λ⁺`, and the bottom models are in `K_λ`. For `α* = 0` in
5.5.1 the inequality `M_{a,0} ≼ M_{b,0}` will have to be looked at when 5.5.1 is reached. No use
found that the corrected hypotheses fail to cover.

**C.deviation Prop 3.1.10 (author-confirmed).** *Reclassified (author, 2026-11-13): not an erratum of the paper;
`θ^a < λ⁺` is a restriction of the formalized statement (`ERRATA.md` C.9). The author believes the same proof works
without it. It excludes only `θ^a = λ⁺` (the hypotheses force `θ^a ≤ λ⁺`). It is used once: the successor step
applies Prop 3.1.8, stated for a chain with a last model in `K_λ`, to a whole column, so for limit `θ^a` the union
`⋃ M_{a,α}` is added as a last model, which is in `K_λ` only if `θ^a < λ⁺` (`prop_3_1_10`, the case `hlim`;
`card_biUnion_le … hθa`). The paper's proof (l. 3227, "use Proposition 3.1.8.1") applies Prop 3.1.8 the same way, so
for `θ^a = λ⁺` it also needs Prop 3.1.8 for a chain of length `λ⁺` with no last model, which the paper does not
state; in the proof of 3.1.8 the last model is used only for the final renaming (l. 3100–3106). The Lean statement
keeps the hypothesis.* Original entry: Added `θ^a < λ⁺`; the paper has no bound. Tagged
`-- DEVIATION (author-confirmed):`, original text in the docstring. Use checked: Prop 3.1.10 is
cited only in Prop 5.4.6, with `θ^a = α* + 1`, `α* < λ⁺` (Def 5.3.1): covered. In Lean, 5.4.6 calls the
underlying `Frame.rectangle`. Item (7) now states the element as `f_{β+1}(d_{b,β}) ∈ M_{0,β+1}`
(author decision: not a change of meaning, so no deviation tag).

**C.erratum Def 5.4.2 and Prop 5.4.3 (author-confirmed).** Original: `NF^uq = {(M₀, M₁, M₂, M₃) : ∃ a ∈
M₁ − M₀, (M₀, M₁, a) ∈ K^{3,uq}, tp(a, M₂, M₃) does not fork over M₀}`; Prop 5.4.3: "(1) `⊗⁻_{NF^uq}`.
(2) For every `R`, `⊗_R → ⊗⁻_R`." Corrected: `Frame.NFuqE` has the element `a` explicit and includes
the conditions of Def 5.4.1(1); (1) is stated for it (`OtMinusE`: weak uniqueness compares
amalgamations moving the same element); (2) assumes `R` closed under isomorphisms (`IsoClosedQ`).
Tagged `-- DEVIATION (author-confirmed erratum):`; original text kept in the docstring and comment.
Prop 5.4.3(2): the statement needs `R` to be closed under isomorphisms (used twice in the formalized proof: in weak uniqueness, clause (2) of `⊗⁻`, the second amalgamation is moved by an isomorphism onto the same copies of `N₁, N₂` as the first, so that the weak uniqueness of `⊗_R`, which compares amalgamations of the same two models, applies; in clause (3) of `⊗⁻`, `R` is carried along the isomorphic copy of `M₃` that realizes the embedding `f`). The paper does not state this hypothesis. *Author-confirmed (2026-11-13): the omission is the author's (closure under isomorphisms is the author's convention, not written in the paper); an erratum (class A), not an implicit assumption.*

**C.erratum Def 7.1.4 (author-confirmed, found in Stage 2).** Original: "there are increasing continuous
sequences of models in `K_λ`, `⟨N_{0,α}⟩`, `⟨N_{1,α}⟩`, `⟨N^⊕_{1,α}⟩`, and there is a club `E` of `λ⁺`". As
written the definition is unsatisfiable: if `δ ∈ E` is a limit point of `E`, continuity of `⟨N_{1,α}⟩` and
`⟨N^⊕_{1,α}⟩` together with `N_{1,α} ≼ N^⊕_{1,α} ≼ N_{1,β}` (`α < β` in `E`; clauses (b), (c)) gives
`N_{1,δ} = N^⊕_{1,δ}`, so `N^⊕_{1,δ}` cannot realize a non-algebraic type over `N_{1,δ}`, contradicting
clause (d). The author confirmed that continuity was intended only for `⟨N_{0,α}⟩` and `⟨N_{1,α}⟩`.
`⟨N^⊕_{1,α}⟩` stays increasing in `K_λ`. Tagged `-- PROOF-STAGE CHANGE:` and
`-- DEVIATION (author-confirmed erratum):` on `Frame.PlusWit`; original text kept in the docstring.

**C.erratum Prop 7.1.7 (author-approved).** Added `N₀ ∈ K_λ` (`hN₀`). The paper leaves it implicit; the
conclusion `NF(M_{0,0}, M_{0,1}, N₀, N₁)` is a relation on `K_λ`, so the statement is false without it. Every
use in the paper (proof of Thm 7.1.13) has `N₀ = N_{2ε+1} ∈ K_λ`. Tagged `-- PROOF-STAGE CHANGE:`.

**C.erratum Def 7.1.11, the game (author-approved; tagged `-- PROOF-STAGE CHANGE:`, original text in the docstrings).**
*Why.* Paper's rule for player 0 is `N_{0,α} ≼ N_{0,α+1}`, so a constant sequence is legal; then `⋃ N_{0,α} ∈ K_λ`,
while `≺⁺_{λ⁺}` is a relation on `K_{λ⁺}` (Def 7.1.4), so player 1 cannot win and Prop 7.1.12(c) fails. Separately, in
the old encoding a strategy whose moves are incompatible could leave no complete play, so `Winning` held vacuously.
*Old definition.*
`IsPlay F A B`: `A 0, B 0 ∈ K_λ`, `A 0 ≼ B 0`; for limit `α < λ⁺`, `A α, B α` are the unions; for `α < λ⁺`:
`A (α+1) ∈ K_λ`, `A α ≼ A (α+1)`, `A (α+1) ∩ B α = A α`, `B (α+1) = F α ..`.
`Winning F`: for all `A B` with `IsPlay F A B`: for all `α < λ⁺`, `B (α+1) ∈ K_λ`, `B α ≼ B (α+1)`,
`NF(A α, B α, A (α+1), B (α+1))`; and there are unions `M₀, M₁` of `A, B` with `M₀ ≺⁺ M₁`.
*New definition.*
`IsPlay F γ A B` (length `γ`): `0 < γ →` the move-0 clause; the limit clause for `α < γ`; for `α + 1 < γ`:
`A (α+1) ∈ K_λ`, `A α ≺ A (α+1)` (strict), `A (α+1) ∩ B α = A α`, `B (α+1) = F α ..`.
`Winning F`: (1) for `α < λ⁺` and every `A B` with `IsPlay F (α+2) A B`: `B (α+1) ∈ K_λ`, `B α ≼ B (α+1)`,
`NF(A α, B α, A (α+1), B (α+1))`; (2) for every `A B` with `IsPlay F λ⁺ A B` and every union `M₀` of `A` with
`M₀ ∈ K_{λ⁺}`, there is a union `M₁` of `B` with `M₀ ≺⁺ M₁`.
*What in the paper's text this relies on.* Def 7.1.11: the moves, "player 1 has to choose `N_{1,α+1}` such that ..."
(legality), and the domain of a strategy, which already consists of partial plays ("`⟨N_{0,β} : β ≤ α+1⟩`, `⟨N_{1,β} : β ≤
α⟩` are increasing continuous ... "). Def 7.1.4: `≺⁺_{λ⁺}` is "a 2-place relation on `K_{λ⁺}`". Prop 7.1.12(a),(b) are
derived in the paper "by c", from plays whose `N_{0,α}` represent a given `M₀ ∈ K_{λ⁺}`, which strict moves can do.
The strictness of player 0 and the guard `⋃ N_{0,α} ∈ K_{λ⁺}` are not in the paper's text; they are the author's decision.

**C.erratum `α* ≠ 0` (author-confirmed: omitted in the paper).** `α*` is the length of a sequence and
was never meant to be `0`. The hypothesis `0 < α*` is approved everywhere in the paper where a statement
needs it. Each use is tagged `-- DEVIATION (author-confirmed: α* ≠ 0 omitted in the paper):`. Uses so
far: Prop 5.3.8 and Thm 5.5.1. In both, `M_{a,0} ≼ M_{b,0}` is not a hypothesis: it is read off from
the definition of `NF*` / `NF` at step `0`.

**Encoding clarification, Def 6.1.2 `NFhat` (author-confirmed; not an erratum).** `Mₙ = ⋃ N_{n,α}` in the
paper is the union of structures, so it is encoded by `IsUnionOf`.

**Encoding clarification, Def 7.1.4(a) `PlusWit` (author-confirmed; not an erratum).** Original text: "For `n=0,1`
`M_n = ⋃ {N_{n,α} : α < λ⁺}`". In the paper this is the union of structures, so it is encoded by `IsUnionOf`. Old encoding:
`Mₙ.carrier = ⋃ (N_{n,α}).carrier`, which does not determine the structure of `Mₙ`; with it, a permuted copy of `M₀` on the
same universe had the same witnesses, so Prop 7.1.10(a) and Thm 7.1.13 were false. Tagged `-- PROOF-STAGE CHANGE:`.

**C.erratum Prop 8.1.3(a) (author-confirmed, 2026-11-10; found in Stage 2).** Original text (l. 6766–6767): "If
$M_0 \in K^{sat}$ and $M_0 \preceq^{NF}_{\lambda^+} M_1$, then $M_0 \preceq^{\otimes}_{\lambda^+} M_1$." Corrected:
added the hypotheses `M₁ ∈ K^sat` and `M₀ ≠ M₁`. *Why.* Def 8.1.2 (l. 6755–6760) defines `≼^⊗` as the set of pairs with
"$M_0,M_1 \in K^{sat}$, $M_0 \prec M_1$" and the realization clause. Neither `M₁ ∈ K^sat` nor `M₀ ≠ M₁` follows from
`M₀ ≼^NF M₁` (for `M₁ = M₀` the hypotheses hold by reflexivity of `≼^NF` and the conclusion `M₀ ≺ M₀` fails). The paper's
proof (l. 6778–) proves only the realization clause ("We have to find an element $d \in M_0$ with $tp(d,N_1,M_1)=p$"),
here the AUX lemma `Frame.ot_real`. Tagged `-- DEVIATION (author-confirmed erratum):` on `prop_8_1_3_a` (was
`-- PROOF-STAGE CHANGE:`); original text in the docstring.

*Part (b) (author-confirmed, 2026-11-13).* Original text (l. 6767–6772): "If $\langle M_\epsilon:\epsilon \leq \delta
\rangle$ is a $\preceq^{NF}_{\lambda^+}$-increasing continuous sequence of models in $K^{sat}$ and for every
$\epsilon \in \delta,\ M_\epsilon \preceq^{NF}_{\lambda^+}M_{\delta+1}$, then $M_\delta \preceq^{\otimes}_{\lambda^+}
M_{\delta+1}$." Corrected: added `M_{δ+1} ∈ K^sat` and `M_δ ≠ M_{δ+1}`, the same omission as in (a). "In $K^{sat}$" covers
only `ε ≤ δ`; with `M_{δ+1} := M_δ` all hypotheses hold and `M_δ ≺ M_δ` fails. The only use (Thm 9.1.13, `a ⇒ b`)
satisfies both. Tagged `-- DEVIATION (author-confirmed erratum):` on `prop_8_1_3_b` (was `-- PROOF-STAGE CHANGE:`);
original text in the docstring. See also "Section 8: statements that mention `≼^⊗`" in the Progress section of
2026-11-10.

**C.erratum Def 2.6.5 (author-confirmed, 2026-11-16; reclassified from a proof gap).** `ERRATA.md` A.1.11 (B.9
withdrawn, item 4 of "To be confirmed by the author" resolved). Original text (l. 2507–2516): "Let $\frak{s}$ be a
semi-good $\lambda$-frame except local character. $\frak{s}$ is said to satisfy \emph{weak local character for
$\prec^*_\lambda$-increasing sequences} when: If $\alpha^*< \lambda^+$ and $\langle M_\alpha:\alpha \leq \alpha^*+1
\rangle$ is an $\prec^*_\lambda-$increasing continuous sequence of models, then for some element $a \in
M_{\alpha^*+1}-M_{\alpha^*}$ and ordinal $\alpha<\alpha^*$, $tp(a,M_{\alpha^*},M_{\alpha^*+1})$ does not fork over
$M_\alpha$." Corrected (author's statement): the definition should not require `≺*` for the last pair of the chain,
only `M_{α*} ≺ M_{α*+1}`; that is, `⟨M_α : α ≤ α*⟩` is `≺*_λ`-increasing continuous, `M_{α*} ≺ M_{α*+1}`, and
`M_{α*+1} ∈ K_λ` (kept from the original, where it follows from `≺*_λ` being a relation on `K_λ`, Def 2.6.6(1); this
wording is the agent's and is for the author to check). The text of the paper is wrong there.
*Consequence.* The paper's proof of Thm 2.6.8(1), Case 2 (l. 2607–2638), applies Def 2.6.5 (through Def 2.6.6(4))
with `α* = ω` to `⟨M_n : n ≤ ω⟩⌢⟨N_ω⟩` and shows only `M_ω ≼ N_ω`, `M_ω ≠ N_ω` for the last pair (l. 2633–2634).
With the corrected definition this is enough, and the proof is complete: the former gap (`ERRATA.md` B.9) is a
consequence of the erroneous definition and is closed by correcting it. Class A (erratum in the definition), not
class B (gap in the proof).
*Status of confirmation:* confirmed by the author from his own understanding, not checked against other sources.
"Confirmed by the author on the basis of his own understanding of what the definition should say. NOT checked against
other papers related to this one. In particular, the same definition appears in the author's formalization of the
(unpublished) joint paper with Shelah, where this point is essential; it must be checked there."
*Lean: not changed (documentation only, author's instruction).* `Frame.WLCFor` (Frames.lean) still encodes Def 2.6.5
as originally written (`IsIncreasing R M (Iic (αs + 1))`, so `≺*` also for the last pair), and `thm_2_6_8_1` is still
stated with `s.Ax3c lam` (local character) and `ℵ₀ ≤ λ` instead of `s.WeakLC lam` (row "Thm 2.6.8(1)" of "Changes to
review"). Bringing the Lean files into line with the erratum (changing `WLCFor`, restating `thm_2_6_8_1` with
`WeakLC`, and proving it) waits for the author's instruction.

## D. Typos fixed to evident intent (Q6)

Each item keeps the original text in its docstring, marked `[typo: …]`, and carries the tag
`-- DEVIATION (typo fixed to evident intent):`.

| item | written in the paper | fixed to |
|---|---|---|---|
| Prop 4.1.8 | "`f : M₁* → M₂*` is an isomorphism over `M ∪ {a}`" (impossible: `a ∉ M₁*`) | over `M` |
| Prop 5.3.9(2) | `NF*(M₁, N₁, M₂, N₃)` (base `M₁`) | `NF*(M₀, N₁, M₂, N₃)` |
| Prop 5.4.4 | `(f^a_{α*}, id, N^a_{2,α*}) E (f^a_{α*}, id, N^b_{2,α*})` | second triple uses `f^b_{α*}` |
| Prop 9.1.5 | `M̄² := ⟨M_{α,1} : α < λ^{+2}⟩` | `M̄² := ⟨M_{α,2}⟩`, with hypothesis (1) for both sequences |
| Thm 11.1.5(1) | `s⁺ = (K^sat, ≼^NF ↾ K^sat, S^{bs,+}, ⨿⁺)`, without `up` | `s⁺ = ((K^sat, ≼^NF ↾ K^sat)^up, …)`, as in Thm 11.1.1 (the def `splusNoUp` was removed) |

For "λ^{+2}" in Hypothesis 11.1.5(3) vs "λ⁺" in Conjecture 11.1.4, see the erratum C.3 (the
conjecture is corrected; 11.1.5(3) is unchanged).

---

## E. Agent choices

Each row has an `AGENT-CHOICE` tag in the Lean file.

| item | choice | alternative |
|---|---|---|---|
| Def 1.0.3, 2.1.1(3)(c),(g), Thm 2.6.8 | `δ` is a limit ordinal (paper's convention on `δ`) | any ordinal |
| Def 1.0.16 | "directed order" = nonempty directed preorder; `I ⊆ J` with the induced order | partial order; `I` an arbitrary directed order with an embedding into `J` |
| Def 1.0.19 | embedding = isomorphism onto a `≼`-submodel | a mere injection with `Im(f) ≼ N` |
| Def 1.0.20 (and 4, 5) | an amalgamation in a `K_λ` context has its amalgam in `K_λ` | amalgam in `K` |
| Def 1.0.22(2) | `E` = equivalence closure (`EqvGen`) | transitive closure only |
| Prop 1.0.23, 1.0.30, Thm 1.0.32, Rem 2.5.4 | add the ambient "`(K, ≼)` is an AEC" | no hypothesis on `(K, ≼)` |
| Prop 1.0.23(1) | the amalgam may be in `K` (no `LST ≤ λ` available) | amalgam in `K_λ` (needs `LST ≤ λ`) |
| Prop 1.0.23(3) | `E*_λ` = `E*` of `(K_λ, ≼ ↾ K_λ)` on `K³_λ` | `E*` of `K` on `K³_λ` (needs `LST ≤ λ`) |
| Fact 1.0.18 | add `K ≠ ∅` (false as written, see F) | as written |
| Def 1.0.29 | "if `‖M‖ = λ⁺`" is read for any `κ` with `‖M‖ = κ⁺` | only the fixed `λ` |
| Def 2.1.1(1)(c) | maximality inside `(K_λ, ≼ ↾ K_λ)` | maximality in `K` |
| Def 2.1.1(2)(b) | hypothesis `M ∈ K_λ` (domain of `S^bs`) | all `M` |
| Prop 2.1.2 | add `LST ≤ λ`, needed after erratum C.1 (besides the author-chosen `ax0a, ax1b, ax3a, ax3b`) | without `LST ≤ λ` |
| Prop 2.1.2 (Q3 B) | add `M₃* ∈ K_λ` (otherwise false by 3(a)) | `M₃*` arbitrary |
| Rem 2.1.4 | keep the other semi-good axioms (Core, symmetry, almost stability), since the argument goes through transitivity 2.5.6 | only local character + `S^bs = S^na` |
| Prop 2.2.3(5) | "`p ⊂ q`" = `q ↾ M = p` | set inclusion |
| Prop 2.2.6 | "(K, ≼)" in (1)–(3) read as `(K', ≼')` | `K` (where `≼` is undefined) |
| Prop 2.3.4 | items (1) and (2) for the same `M` | `M` in (2) arbitrary |
| Props 2.3.4, 2.3.10 | "(K_M, ≺_M)" read as `(K_M, ≼_M)` | strict `≺_M` (AEC axioms fail, conclusion false) |
| Def 2.4.3 / Rem 2.4.7 | for a component, "automorphism" = order-preserving bijection; `aE^M` = `a` plus its component | — (`E` undefined in 2.4) |
| Prop 2.5.2 | add "(K, ≼) is an AEC" | no hypothesis |
| Thm 2.5.8(1),(2) | `M_α ∈ K_λ` only for `α < λ⁺` | also `M_{λ⁺} ∈ K_λ` (contradicts the conclusion) |
| Thm 2.5.8(1)(b) | "every model `N` with `M_α ≺ N`" read as `N ∈ K_λ` (the proof uses only these) | `N ∈ K` arbitrary |
| Def 2.6.2 | the undefined `⨿^{≤λ}` read as `⨿^{≥λ}` | — |
| Rem 2.6.3 | assume only (0)(a), (0)(b), (1)(b), (3)(a), (3)(b) (original context: semi-good frame) | full semi-good frame |
| Def 2.6.5 | `α*` a limit ordinal (else unsatisfiable for `α* = 0`) | any `α* < λ⁺` |
| Def 2.6.6(4) | read as Def 2.6.5 (weak local character for `≺*`-sequences) | the local character axiom restricted to `≺*`-sequences |
| Prop 3.1.6 | AEC axioms spelled out for triples, with chains as in Def 3.1.5 | generic AEC axioms in the vocabulary of triples |
| Def 3.2.2 | `N_{α*} = M*`; the clause "`= ⋃{N_ε : ε<α}`" (free `α`) dropped | keep the clause with `α := α*` (forbids successor lengths) |
| Props 3.2.4, 3.2.5 | "decomposable" by an iso-closed `K^{3,*} ⊆ K^{3,bs}` (with the existence property in 3.2.4) | a fixed class |
| Prop 4.1.8 | add `(M, N, a) ∈ K^{3,bs}` | all triples |
| Prop 5.2.4 | `f₀ = id_{M₀}` | — (`f₀` not given) |
| Def 5.4.1(3) | "(g, id, M₅) amalgamation of M₃, M₄ over M₂" read along `f` (`g ⊇ f`, `M₄ ≼ M₅`) | over `M₂` literally (forces `M₂ ⊆ M₄`, making `⊗⁻` unsatisfiable) |
| Prop 5.5.3(a),(b) | "decomposable" = by `K^{3,uq}` | another class |
| Def 7.1.4(d) | "realizes the non-forking extension" = it exists and is realized; end segment `[γ, λ⁺)` | for all non-forking extensions |
| Def 7.1.11 | plays encoding; an illegal answer by player 1 is a loss; "player 2" read as player 1 | — |
| Cor 7.1.17(c) | "does not fork over `N₀`" in the sense of Def 2.6.2 | — |
| Def 10.1.1(2) | missing subject read as `(K^sat, ≼^NF ↾ K^sat)` | `(K_{λ⁺}, ≼^NF)` |
| Prop 10.1.4 | "a ∈ M₁ − M₀" read as `a₁ ∈ M₁ − M₀` | an extra free variable |
| Prop 10.1.13 | "q does not fork over N" via a representative and Def 2.6.2; "extension" = `q ↾ M₀ = p` in `(K^sat)^up` | — |
| Def 11.1.3 | the preconditions (λ regular uncountable, I normal) dropped from the defined property | as hypotheses of the definition |
| Cor 11.1.6 | "`⪯^k`" (`k` undefined) read as `≼` | — |
| Thms 1.0.2, 11.1.7 | the free `m` in (3) read as ∀m; "a model in `Kⁿ`" (undefined) read as "a model in `K`" | existence of `sⁿ` with a model in `Kⁿ` |
| Thm 1.0.2 | `μ_unif` is a parameter | — (not defined in the paper) |

---

## F. Statements false as written

| item | why false | chosen version |
|---|---|---|---|
| Fact 1.0.18(4) | if `K = ∅`, `LST(K^up) = sInf ∅ = 0 ≠ λ` | hypothesis `K ≠ ∅` added |
| Prop 2.2.6(3) | `I(μ, K') = μ` fails: for `μ = λ⁺` the models of `K'_{λ⁺}` are coded by functions from the `λ⁺` isomorphism types to multiplicities, giving `2^{λ⁺}` models. With `K` in place of `K'`, `I(μ, K) = 0` for `μ > λ` | kept as `numModels (boxKSys Kτ) μ = μ` (closest to intent); the statement is expected to be unprovable |
| Thm 5.3.7(c) (found in Stage 2) | See the erratum in section C. | **Resolved**: replaced by the corrected statement, proved. |
| Prop 3.2.5, Prop 5.3.8 (found in Stage 2) | See the erratum in section C. | **Resolved**: corrected and proved. |
| Cor 11.1.6, case `n = 0` (found in Stage 2, Section 11) | The conclusion asks for a *good* `λ`-frame `s⁰`. For `n = 0`, hypothesis (3) and the `WDmId` part of (4) are vacuous and only `2^λ < 2^{λ⁺}` remains, so nothing upgrades the semi-good `s` to a good frame. The paper's proof ("By induction on n, using Theorem 11.1.5", l. 8091–8093) has base `s⁰ = s`, which is only semi-good. No counterexample was constructed: the claim is that the case is not provable from the hypotheses, not that it is refuted. | `0 < n` added (`PROOF-STAGE CHANGE`); proved. See "Changes to review". |
| Thm 1.0.2 (found in Stage 2, Section 11) | `μ_unif` is defined only inside a `\begin{comment}` block (l. 7977–8037), so in the active text hypothesis (2) mentions an undefined function. With `μunif` as a free parameter, (2) says nothing (take `μunif` huge), and the conclusion does not follow. | hypothesis `hunif` added (the commented Prop `unifleq`, instantiated); proved from Thm 11.1.7. See "Changes to review". *Provenance of `hunif` (2026-11-16):* Prop `unifleq` is commented out in the tex source, so the published paper does not contain it; `hunif` is a hypothesis added by the formalization and stays an explicit hypothesis of `thm_1_0_2` (assumed, not proved). Status of confirmation: not confirmed. Source: personal communication from Prof. Saharon Shelah (the claim is easy, per Shelah). There is no written source we checked. Not verified by the formalization. Not independently checked by the author. **Open item: to be checked by the author at the end** (`ERRATA.md` C.8 and item 10 of "To be confirmed by the author"). *Update 2026-11-25:* the inequality is proved in Lean (AUX `muUnif_le`) for the definition of `μ_unif` in [Sh:88r] as written (AUX `muUnif`); `thm_1_0_2` keeps `hunif`; AUX `thm_1_0_2_muUnif` has no `hunif`. See the progress entry of 2026-11-25. *Resolved (author, 2026-11-26):* the `μ_unif` of the paper is the one of [Sh:88r] (`ERRATA.md` C.8, item 10); `thm_1_0_2` does not depend on this identification (it holds for any `μunif` satisfying (2) and `hunif`). |
| Prop 6.1.6(a) (found in Stage 2, tenth run) | Encoding problem, not an error of the paper. `IsRepresentation` (Def 1.0.29) records only `M.carrier = ⋃ (Ms α).carrier`, not that each `Ms α` is a submodel of `M`. So `R₁` may be a filtration of a different structure `M₁'` on the universe of `M₁`. If `M₀ ≼ M₁` and `M₀ ⋠ M₁'` (for example `M₁'` is a copy of `M₁` under a permutation of its universe), the right-hand side would give `M₀ ≼ M₁'` by Axiom c, so `→` fails. | **Resolved (2026-11-10, author's decision).** Applied the proposed fix: add `∀ α < M.card.ord, IsSubstr (Ms α) M` to `IsRepresentation` (in the paper the union is a union of structures; same clarification as for `NFhat`). `Frame.leNF_iff_club` already proves the equivalence for filtrations (`IsFilt`), and `prop_6_1_6_a` would follow at once. `IsRepresentation` is used nowhere else in the Lean files. |

Two statements were false in Stage 1 but became true or meaningful after the decisions:

* Prop 2.1.2 is false without `M₃* ∈ K_λ`; this was fixed by Q3 B.
* The `⊗⁻` clause (3) in Def 5.4.1 was unsatisfiable; this was fixed by the AGENT-CHOICE in Part E.

---

### Thm 9.1.13(c): continuity omitted (erratum, author-confirmed 2026-11-16; `ERRATA.md` A.1.12)

Original text (l. 7485–7490): "There is a sequence `⟨M_ε : ε ≤ λ⁺+1⟩` of models in `K^sat` such that for each `ε, ζ`
with `ε < ζ ≤ λ⁺+1`, we have `ε ≠ λ⁺ ⇔ M_ε ≺⁺ M_ζ ⇔ M_ε ≼^NF M_ζ`." Continuity is missing (the proof's "`c ⇒ a` is
clear" needs it; Prop 8.1.6 and Thm 9.1.7 have "increasing continuous").
Corrected (c) (class A.1, incomplete statement): "There is an *increasing continuous* sequence `⟨M_ε : ε ≤ λ⁺+1⟩` of
models in `K^sat` such that for each `ε < ζ ≤ λ⁺+1`, `ε ≠ λ⁺ ⇔ M_ε ≺⁺ M_ζ ⇔ M_ε ≼^NF M_ζ`". The rest of (c) is kept as
is; it is **not** weakened to successor pairs.
Status of confirmation: confirmed by the author, and cross-checked against [Sh:600, Claims 8.4–8.5], where continuity
appears explicitly. Caveat: Sh:600 works with `K^nice` and `≤*`, `<⁺` rather than `K^sat` and `≼^NF`; the
correspondence is not checked in detail. In Sh:600 the limit-ζ case of `<⁺` is a hypothesis (*), not derived.
(Sh:600: Claim 8.4, hypothesis (*), p. 125; Claim 8.5, (***), p. 126: increasing continuous in `K^nice_{λ⁺}`,
`M_i <⁺ M_j` for all `i < j ≤ λ⁺+1` except `(λ⁺, λ⁺+1)`, and `¬(M_{λ⁺} ≤* M_{λ⁺+1})`.)
*Still open (`ERRATA.md`, item 2 of "To be confirmed by the author", proposed B):* the proof of `b ⇒ c` (Prop 8.1.6)
gives `M_ε ≺⁺ M_ζ` only for `ζ = ε+1`; `≺⁺` is not obviously preserved upward under `≼^NF` (Prop 7.1.10(c) composes on
the other side). No proof of `M_ε ≺⁺ M_ζ` for limit `ζ` was found, nor a counterexample.

**How `thm_9_1_13` (c) is stated in Lean (checked 2026-11-16; no Lean change).** `Frames.lean`, l. 18346–18350:
```lean
      ∃ M : Ordinal.{u} → Model U L,
        IsIncCont s.S M (Iic ((Order.succ lam).ord + 1)) (s.Ksat lam) ∧
        (∀ α < (Order.succ lam).ord, s.ltPlus lam (M α) (M (α + 1))) ∧
        (∀ β < (Order.succ lam).ord, s.leNF lam (M β) (M ((Order.succ lam).ord + 1))) ∧
        ¬ s.leNF lam (M (Order.succ lam).ord) (M ((Order.succ lam).ord + 1))
```
* *Continuity:* included. `IsIncCont … (Iic (λ⁺ + 1)) (s.Ksat lam)` is "increasing continuous in `K^sat`" on
  `ε ≤ λ⁺+1` (tag `-- PROOF-STAGE CHANGE`, l. 18343–18345).
* *`M_ε ≺⁺ M_ζ` for limit ζ (and for any non-consecutive pair):* **neither proved, nor assumed, nor cited.** It is not
  part of the Lean statement: (c) asserts `≺⁺` (`ltPlus`) only for consecutive pairs `α, α+1` with `α < λ⁺`. The
  `≼^NF` part of the paper's equivalence is stated only towards `M_{λ⁺+1}` (for `β < λ⁺`), plus its failure at `λ⁺`.
  Inside the proof, `key` (l. 18359–18375) derives that `⟨M_α : α < λ⁺⟩` is `≼^NF`-increasing (for all pairs below
  `λ⁺`), via `prop_7_1_10_a` and `Frame.leNF_chain`, but this is not exported in the statement.
* *b ⇒ c* comes from `prop_8_1_6` (l. 16602–16610) through `Frame.c_of_b` (l. 18316–18327); `prop_8_1_6` gives exactly
  the successor `≺⁺` and `≼^NF M₂*`, as in the paper's Prop 8.1.6.
* *Consequence:* the Lean (c) is weaker than the corrected (c) of `ERRATA.md` A.1.12. Restating it to the corrected
  form would make `b ⇒ c` require `M_ε ≺⁺ M_ζ` for non-consecutive pairs, which the formalization does not prove
  (point 2). Not changed; waiting for the author's decision.

**Decision (author, 2026-11-25): gap B, `ERRATA.md` B.10; continuity of `≺⁺` not formalized now.**
* (c) as printed needs continuity: erratum A.1.12 (already recorded).
* `M_ε ≺⁺ M_ζ` for the other pairs (ε < λ⁺):
  * successor ζ ≤ λ⁺: follows from `prop_7_1_10_c` and the step `key` of `thm_9_1_13`. Not formalized in the
    statement.
  * ζ = λ⁺+1: closed by replacing the top model `M_{λ⁺+1}` with `M'`, where `M_{λ⁺+1} ≺⁺ M'`, as in [Sh:600]
    Claim 8.5 (pp. 126–127, checked against the PDF). The ingredients are `prop_7_1_12_a`, `prop_7_1_10_b/c` and
    `prop_6_1_6_c`. Not formalized.
  * limit ζ ≤ λ⁺: needs continuity of `≺⁺`. The paper has it only as the wish (***) before Def 7.1.4
    (l. 5938–5941), with no proof. [Sh:600] 7.7(3) states the analogue with proof "Similar". Whether
    continuity of `≺⁺` holds is open. An attempted proof reduces it to a base
    change for `NF` inside a given model (BC), which the paper does not have. The existence theorem for NF,
    l. 4615–4627, builds a new top model and does not give BC. Classified as a gap (B), not an erratum.
* The Lean statement of `thm_9_1_13` (c) is unchanged:
  * the sequence is increasing continuous in `K^sat`;
  * `≺⁺` holds between consecutive models;
  * `≼^NF` holds into the top model;
  * `≼^NF` fails at `(λ⁺, λ⁺+1)`.

  (a) ⇔ (b) ⇔ (c) is fully proved for this version. The `-- PROOF-STAGE CHANGE` tag stays.
* The case analysis and the attempted proof are in internal working notes, not published.

## G. Pending author verification

None at present. The item about Conjecture 11.1.4 (λ⁺ vs λ^{+2}) has been resolved; see C.3.

---

## Findings to review (not yet confirmed)

Found by the agent in an assessment of Sections 2.3–2.4 (2026-11-11; internal note, not published).
**Not reviewed by the author; not errata.** None of these statements is in the Lean files; all
three are listed in `UNPROVED_STATEMENTS.md`. Nothing in Lean was changed. They are also listed
in `ERRATA.md` under "To be confirmed by the author".

**R1. Prop 2.4.5: the proof of `PC_{ℵ₀}` does not define the class `K`.** Statement (l. 1808–1811):
"The AEC of transitive partial orders is an AEC which is $PC_{\aleph_0}$ and it has LST-number
$\aleph_0$." Proof (l. 1814–1820): $\tau^+ = \{<\} \cup \{f_n\}$, $\mathbb{T}$ says "`<` is a partial
order" and "`f_n` is a `τ`-automorphism", and "$K$ is the class of reductions to $\tau$ of
$\tau^+$-models of $\mathbb{T}$ which omit $p(x,y):=\{f_n(x) \neq y:n<\omega\}$".

*What does not follow.*
* Omitting `p` means that for all `x, y` some `f_n(x) = y`. So every model is countable
  (`= {f_n(x) : n}`), and the whole order has a transitive automorphism group.
* The class defined is the countable partial orders with transitive automorphism group. That is
  not `K`: `K` has uncountable models, and components need not be linear (e.g. `ℤ × {0,1}` with
  `(m,i) < (n,j) ⇔ m < n`).
* The relation `≼` ("defined similarly" in Def 2.3.2) is not treated.

*The statement itself looks true* with a different coding (unary `c_n` enumerating the
component, a 4-ary `A` giving automorphisms of each component, and one omitted type); sketch in
an internal note (not published), not checked in Lean. *Proposed classification:* gap in the proof
(the statement is right, the argument does not give it).

**R2. Prop 2.3.5: an unstated step (Scott sentences).** Statement (l. 1549–1555): under the
hypotheses of Prop 2.3.4, "there is a model $M \in K_{\aleph_0}$ such that
$(K_M)_{\aleph_1} \neq \emptyset$", where $K_M=\{N \in K:N \equiv_{L_{\infty,\omega}}M\}$ (Def 2.3.1,
l. 1438–1443). Proof (l. 1574–1576): by Thms 2.3.7, 2.3.8, "$K$ has a
$L_{\omega_1,\omega}$-small model of cardinality $\aleph_1$. Now it is enough to prove Proposition
2.3.9", which gives a countable $N \in K$, $N \preceq M'$, $N \preceq_{L_{\omega_1,\omega}} M'$
(l. 1580–1583).

*What does not follow.* The statement needs `M' ≡_{L_{∞,ω}} N`, i.e. `M' ∈ K_N`; the proof gives
only `N ≼_{L_{ω₁,ω}} M'`, hence `N ≡_{L_{ω₁,ω}} M'`. The missing step is Scott's theorem: the Scott
sentence of the countable `N` lies in `L_{ω₁,ω}`, so `M'` satisfies it, and every model of it is
`L_{∞,ω}`-equivalent to `N`. (Also implicit: `N` is infinite, hence in `K_{ℵ₀}`, because it is
`L_{ω₁,ω}`-equivalent to the uncountable `M'`.) *Proposed classification:* gap in the proof (an
omitted standard step).

**R3. Thm 2.3.8: the existence of a model of cardinality `ℵ₁` is not assumed.** Statement
(l. 1569–1571, cited as "a translation of Theorem 2.7 from [bls]", l. 1568): "If the class $K$ is
$PC_{\aleph_0}$ and every model of cardinality $\aleph_1$ is $L^*$-small for every countable
fragment $L^*$ of $L_{\omega_1,\omega}$ then $K$ has a $L_{\omega_1,\omega}$-small models $M'$ of
cardinality $\aleph_1$."

*What does not follow.* If `K` has no model of cardinality `ℵ₁`, the hypothesis holds vacuously
and the conclusion fails. Example: `τ⁺ = {c_n : n<ω}` (constants), `T = ∅`, omit
`{x ≠ c_n : n<ω}`; the reducts to the empty vocabulary are the nonempty countable sets, a
`PC_{ℵ₀}` class with no model of cardinality `ℵ₁`. In the paper's only use (proof of Prop 2.3.5,
l. 1575) `I(ℵ₁, K) > 0` supplies such a model, so the use is covered once `K_{ℵ₁} ≠ ∅` is added.
Whether [BLS] Thm 2.7 has this hypothesis was not checked (the source is not in the repository).
*Proposed classification:* statement incomplete as written (erratum in the translation of the
cited result).

**R4. The ambient type U: an encoding device and an example of the difficulty of checking
fidelity (author's observation).** *(Not one of the findings of the assessment above, and not about
a statement of Sections 2.3–2.4: an observation of the author about the encoding, added
2026-11-13. Also in `ERRATA.md`, part D, item D.1.)* *Author's decision (2026-11-13), after examining
the definition of `Model` (two fields only, `carrier : Set U` and `str : L.Structure carrier`):
this is not a mathematical fidelity problem; it is recorded as an example of the difficulty of
checking fidelity.*

*(a) What the encoding does.*
The paper does not mention an ambient set. In the formalization every model is a structure whose
universe is a subset of one fixed type `U`; the type carries no structure, and the structures of
two models are not required to agree on their intersection. It is used to make intersections,
differences and unions of universes literal and to provide room for placing copies of models (the
size hypothesis `Room U lam`). The theorems are stated for every `U` satisfying this size
hypothesis. This is not needed mathematically, and we found no mathematical weakening of the
theorems.

*(b) What went wrong with fidelity.*
The ambient set was introduced by the agent as an encoding decision, without a flag marking it as
an addition that goes beyond the paper, and without asking the author. Its first description, in
the documentation, said only that a model is a structure "whose universe is a subset of a fixed
ambient type `U`", "so that `M ⊆ N`, `M ∩ N`, `N - M` and unions of chains are literal" (NOTES.md,
B.1: "a subset of an ambient type `U`"); it did not say that `U` carries no structure, and it did
not speak of an ambient structure; the author, who wrote the paper, first suspected that the
encoding silently assumed amalgamation, and settling that required reading the definition of a
model and the lemmas that rename models. The question was settled only by inspecting the Lean
definition.

*(c) The lesson.*
The addition was not visible in the statements of the theorems, only in their parameters, and even
a statement such as 'every model is a substructure of U' would probably not have been recognised
as problematic by most model theorists.

*Observation of the author:*
Why the hypothetical assumption 'every model is a substructure of one fixed structure' would be
serious. It would give amalgamation of structures: if M₀ is a submodel of both M₁ and M₂, both are
embedded in the single structure and agree on M₀, so M₁ and M₂ are amalgamated over M₀; likewise
any two models embed jointly in one structure. The paper does not assume amalgamation in the
larger cardinalities and does not use it; working without such assumptions (amalgamation,
stability) is one of the goals Shelah set himself in the series of papers to which this paper
belongs. An assumption that supplies amalgamation of structures would therefore place the
formalized theorems in a narrower setting than the paper's, while leaving their statements
unchanged. It is hard to notice because it is amalgamation of structures, not amalgamation in the
class (K, ≼): the common structure need not belong to K and the embeddings need not preserve ≼, so
a reader who looks for the amalgamation property of K sees no violation. In the actual encoding
this assumption is NOT made (the type U carries no structure), and we found no weakening; the
point is that the difference between the two is subtle.

A formalization can thus contain an unflagged addition that a competent reader does not notice,
and that costs a disproportionate effort to evaluate even for the author of the paper. This is a
difficulty of checking fidelity, independent of whether the particular addition is harmless.

---

## H. Other notes (from Stage 1, still valid)

* **Def 1.0.3.** The axioms are as written: Axiom (c) gives only `M₀ ≼ ⋃`, and `LST` has no
  `≥ |τ| + ℵ₀` bound. In an AEC in λ, Axiom (d) is for all `δ` and Axiom (c) for `δ < λ⁺`.
* **Prop 2.1.2 (C.6 of Stage 1, updated).**
  * There is no standing assumption in the paper at that point: Section 2 has no `hypothesis`
    environment, and the first one is Hypothesis 3.0.1. The author confirms that the intended
    context is a semi-good frame (comment added in the file).
  * Hypotheses now: `ax0a` (AEC), `ax1b` (AP), `ax3a`, `ax3b` (author decision); `ax0b`
    (`LST ≤ λ`) and `M₃* ∈ K_λ` (agent choices, Part E).
* **Thm 2.5.8 (C.7 of Stage 1, updated).**
  * "Conditions 1 and 2" (`Cond12`) plus `ax0a` and `ax0b` (author decision Q4).
  * `M_α ∈ K_λ` only for `α < λ⁺`, and in (1)(b) `N ∈ K_λ` (agent choices).
  * After erratum C.1, "`p` is realized in `M_{λ⁺}`" is a genuine condition.
* **Def 11.1.2 (WDmId, Q5).** Kept as written: "for some F, for every c, for some η, … is not
  stationary". The author confirms that this is the negation of the weak diamond, which is the right
  definition of the ideal (my Stage 1 remark that it "differs from the usual definition" was wrong).
* **Def 2.4.3.** The "connectedness component" `{b : b<a ∨ a<b}` excludes `a` itself. Kept as
  written.
* **Prop 5.4.4, hypothesis (6).** It does not ask the `f^x_α` to be increasing. Kept as written.
* **Thm 1.0.2 vs Thm 11.1.7.** Thm 1.0.2 uses `μ_unif` in (2), Thm 11.1.7 uses `2^{…}`. Both are
  kept as written.
* **Section 2.3 (Q8).** It stays schematic via `ExtLogic`. In Stage 2, only what follows from the
  fields of `ExtLogic` will be proved.

## I. Author decisions log (Q1–Q8)

* Q1: erratum, `N₂ ∈ K` (C.1).
* Q2: erratum, universal version (C.2).
* Q3: only the axioms each proof uses; choose the provable reading of `K_λ`-vs-larger.
* Q4: add `ax0a`, `ax0b` to Thm 2.5.8.
* Q5: WDmId as written.
* Q6: typos fixed (D).
* Q7: cited results stay `theorem … sorry`, tagged CITED.
* Q8: 2.3 schematic.
* C.17 follow-up: erratum in Conjecture 11.1.4, `λ⁺` → `λ^{+2}` (C.3).

From now on, unclear points are resolved by the agent and tagged `AGENT-CHOICE` (Part E).

---

# Stage 2 (proofs)

Scope of the first run: Sections 1 and 2 only. Build the two modules with
`lake build NonForkingFrames.AEC NonForkingFrames.Frames`.
AUX lemmas (not in the paper) are at the end of `AEC.lean` (general) or just before their first
use in `Frames.lean`; their docstrings start with `AUX: not in paper`.

## Proof-stage changes

Each change is also tagged `-- PROOF-STAGE CHANGE:` in the Lean file.

| item | old | new | reason / proof step that exposed it |
|---|---|---|---|
| Def 1.0.3(1)(d) `AxSmooth` | `∀ N', IsUnionOf M (Iio δ) N' → S.le N' N` | `∀ N', IsUnionOf M (Iio δ) N' → N' ∈ S.K → S.le N' N` | Remark 1.0.4(1),(3) claim smoothness for an arbitrary class `(K, ⊆)` and for `(K', ≼ ↾ K')`. This fails when the union of the chain is not in the class. The paper's Axiom d presupposes the union is in `K` (Axiom c). In an AEC the union is in `K` anyway, so `IsAEC` is unchanged. |
| Prop 1.0.23(2) | symmetry for all `t, t'` | symmetry for `t = (M, N₀, a)` with `‖N₀‖ < #U` | The proof renames the amalgam `N₂` around `N₀` inside `U`. If `N₀` is as large as `U`, there is no room, and symmetry can fail in the encoding (models live in a fixed type `U`; the paper's universe of sets has unbounded room). |
| Def 2.1.1(3)(a) `Ax3a` | `⨿(M₀,M₁,a,M₃)` gives `Mₙ ∈ K_λ`, `a ∈ M₃ − M₁`, `tp(a,Mₙ,M₃) ∈ S^bs(Mₙ)` | additionally `M₀ ≼ M₁ ≼ M₃` | This is the presupposition of `tp(a, Mₙ, M₃)` being a type over `Mₙ`, and every use of monotonicity needs it (step: Prop 2.1.2). All concrete frames in the file satisfy it (`s⁺`, the finitely definable frame, the trivial frame after the next change). |
| Def 2.1.1(3)(b) `Ax3b` | no size condition on `M₃**` | `M₃** ∈ K_λ` | Without it 3(b) contradicts 3(a), which puts every ⨿-quadruple in `K_λ`, as soon as `K` has a model larger than `λ` above `M₃`; no good or semi-good frame could exist (step: Prop 2.1.2, monotonicity into the amalgam). |
| Def 2.2.2 `trivialFrame` | `⨿ = {(M₀,M₁,a,M₃) : Mᵢ ∈ K_λ, a ∈ M₃ − M₁}` | also `M₀ ≼ M₁ ≼ M₃` | Otherwise the trivial frame violates 3(a), and Prop 2.2.3 is false (step: Prop 2.2.3, axiom 3(a)). |
| Remark 2.6.7 | hypothesis `R M N → M ≼ N` | `R M N → M ≺ N` (as in Def 2.6.6(2)) | False as written: for `R` = equality on `K_λ`, a constant chain has no `a ∈ M_{α*+1} − M_{α*}` (step: density needs `M_{α*} ≺ M_{α*+1}`). |
| Prop 1.0.30 | no condition on `λ` | hypothesis `ℵ₀ ≤ λ` | False for finite `λ`: then `λ⁺` has no club (by `IsClubIn`), so every subset, e.g. `∅`, is stationary, and constant sequences are a counterexample (step: the club of closure points needs `λ⁺` infinite and regular). |
| Thm 3.2.3(2) | no hypothesis on `M` | hypothesis `M ∈ K_λ` | `S^bs(M)` is constrained by the axioms only for `M ∈ K_λ`; for another `M`, a frame may put `tp(a, M, N)` in `S^bs(M)`, and then no triple of `K^{3,*} ⊆ K^{3,bs}` has base `M`, so the statement is false. In the paper `S^bs(M)` is only defined for `M ∈ K_λ` (step: applying Ax 2(a) to `p`). |
| Prop 4.1.12(2) | no hypothesis on `M` | hypothesis `M ∈ K_λ` | Same reason as Thm 3.2.3(2). |
| Prop 5.2.2, item (2) | `N₃ ∈ K_λ`, `M₁ ∪ M₂ ⊆ N₃ ≼ M₃` | also `M₃ ∈ K_λ` | Without it, `⊗_R → (2)` is false: for `M₃ ∉ K_λ`, `R(M₀, M₁, M₂, M₃)` fails by (dom) while `R(M₀, M₁, M₂, N₃)` may hold. The converse direction still holds with the extra hypothesis (an LST hull of `M₃ ∪ N₃` inside `N*` replaces `N*`). |
| Prop 5.3.9(1) | no condition relating `N₁`, `N₀` | hypothesis `N₁ ≠ N₀ ∨ M₂ = N₂` | False otherwise: for `N₁ = N₀` every witness has length `0` (a step would put `d₀ ∈ N_{1,1} ⊆ N₁ = N₀`), which forces `M₂ = N₃`. The paper's witness replaces `N_{2,0}` by `M₂`, which needs `0 < α*`. |
| Prop 5.3.9(3) | no size condition on `M₃*` | hypothesis `M₃* ∈ K_λ` | `NF` is a relation on `K_λ` (Def 5.3.2), so the statement is false otherwise. |
| Prop 6.1.6(b),(e),(f) | no condition on `λ` | hypothesis `ℵ₀ ≤ λ` | False for finite `λ`. Example: `L` empty, `K` the sets of size 1 or 3, `≼` is `⊆`, `λ = 2`. Then `LST ≤ 2`, `K_2 = ∅`, so all axioms about `K_λ` hold vacuously, and a model of size 3 is `≼^NF`-maximal and has no `≼^NF` reflexivity witness (step: reflexivity needs a model of `K_λ` below `M`). As for Prop 1.0.30. Items (c),(d),(g) get `ℵ₀ ≤ λ` from their hypotheses. |

## Cited results used by proofs

| proof | cited results used |
|---|---|
| all proofs so far | none |
| Prop 3.1.8 | Prop 2.5.7 (used once, in the successor step of the construction `Frame.construction_318`). The proof text does not cite it, so the reference-based dependency map misses it. Checked with `#print axioms`: Prop 3.1.8 depends on `sorryAx` only through `prop_2_5_7`; every other lemma it uses is sorry-free. |
| Thm 3.3.5, Props 5.3.5, 5.3.6, Thm 5.3.7(a),(b) (`Frame.thm_5_3_7_a`, `Frame.thm_5_3_7_b`) | Prop 2.5.7, only through Prop 3.1.8 (`Frame.prop_3_1_8_strong`). Checked with `#print axioms`: Thm 3.2.3(1)–(3), Props 3.3.4, 4.1.12(1),(2), 5.2.2, 5.3.3 are sorry-free. |
| Thm 5.3.7 (all parts), Prop 5.3.9(2),(4) | Prop 2.5.7, only through Prop 3.1.8. Props 5.3.9(1),(3) are sorry-free. |
| Prop 5.4.6, Thm 5.4.7 | Prop 2.5.7, only through Prop 3.1.8 (`Frame.rectangle`, `Frame.nfstar_core`, `Frame.nf_lift`). Props 3.2.4, 3.2.5, 5.3.8, 5.4.4, 5.4.5 are sorry-free. |
| Prop 6.1.6(b),(c),(d),(e),(f),(g), `Frame.leNF_iff_club` | Prop 2.5.7, and nothing else (checked by listing the `sorry`-using declarations in the transitive dependencies of each theorem). `Frame.leNF_refl`, `Frame.leNF_iso` are sorry-free. |

Apart from Prop 2.5.7 (through Prop 3.1.8), no proof uses a CITED result. The content of the cited Prop 2.5.6 (transitivity) was
needed for Remark 2.1.4 and Thm 2.6.8(3). It is proved instead as the AUX lemma
`Frame.notFork_trans`, from the axioms in `Core` (existence, uniqueness, monotonicity). This
argument cannot discharge Prop 2.5.6 itself under the CITED policy, but it means the result is
not actually an assumption of these proofs.

## Progress

* **Batch 1** (infrastructure + Section 1, part):
  * AUX lemmas in `AEC.lean`: model equality from an identity isomorphism; images, inverses and
    composition of `IsoOn`; substructures (common supermodel, unions of chains); cardinalities;
    `Room` facts; renaming inside `U` (`exists_rename`, `IsAEC.rename`); embeddings (composition,
    restriction); amalgamation along an embedding; `E`/`tp`: base model preserved, algebraic
    elements fixed, restriction well defined (`res_tp`).
  * Proved: Remark 1.0.4(1),(2),(3); Prop 1.0.23(1),(2),(3).
  * `sorry` count in `Frames.lean`: 148 → 142 (AEC.lean has none).
* **Batch 2** (Section 2, invariance under types):
  * Definition changes: `Ax3a`, `Ax3b`, `trivialFrame` (see "Proof-stage changes").
  * AUX: LST number attained, `exists_small` (LST shrink), `aleph0_le_of_ssubset` (a proper
    ⨿-quadruple forces `λ` infinite), `ERel.K3_iff`, and in `Frames.lean` the invariant `NfWit`
    with `nfWit_step` / `nfWit_of_ERel` (⨿ depends only on the type).
  * Proved: Prop 2.1.2, Remark 2.6.3, Remark 2.6.7 (after the change above).
  * `sorry` count in `Frames.lean`: 142 → 139.
* **Batch 3** (Section 2, frame axioms):
  * AUX (in `Frames.lean`): `NotFork.facts`, `nf_mono`, `notFork_trans` (transitivity of
    non-forking from `Core`, i.e. the argument of the cited Prop 2.5.6, proved here without
    citing it). AUX (in `AEC.lean`): `exists_diff_of_lt`, `tp_eq_of_le`, `mem_Sna`,
    `exists_small_tp`.
  * Proved: Remark 2.1.4, Prop 2.2.3.
  * `sorry` count in `Frames.lean`: 139 → 137.
* **Batch 4** (Section 2.6 and Section 1):
  * AUX: `card_union_le`, `IsAEC.exists_hull` (LST hull of a small set); import
    `Mathlib.SetTheory.Cardinal.Regular` (regularity of `λ⁺`).
  * Proved: Thm 2.6.8(2) (monotonicity), Thm 2.6.8(3) (transitivity for larger models),
    Prop 1.0.30 (Fodor-type lemma; club of closure points, after the change above).
  * `sorry` count in `Frames.lean`: 137 → 134.

### Summary of the first run (Sections 1 and 2)

**Proved (14 of the 41 statements of Sections 1–2):**
* Section 1: Remark 1.0.4(1),(2),(3); Prop 1.0.23(1),(2),(3); Prop 1.0.30.
* Section 2: Prop 2.1.2; Remark 2.1.4; Prop 2.2.3; Remark 2.6.3; Remark 2.6.7; Thm 2.6.8(2),(3).

All of them compile with no `sorry` in their proofs. They depend only on AUX lemmas, which are all
proved; no CITED result is used.

**`sorry` count:**
* `AEC.lean`: 0.
* `Frames.lean`: 134 in total (148 at the start of Stage 2).
  * 27 in Sections 1–2; the Section 11 main theorems are listed under Sections 3–11.
  * 107 in Sections 3–11 (not started; out of scope for this run).

**Remaining in Sections 1–2 (27), by kind:**

| kind | items | status / obstacle |
|---|---|---|
| CITED (stay `sorry` by policy) | Fact 1.0.18, Prop 1.0.31, Thm 1.0.32(1),(2), Thm 2.3.7, Thm 2.3.8, Lemma 2.4.2, Prop 2.5.6, Prop 2.5.7 | — |
| not provable as formalized | Prop 2.3.4, 2.3.5, 2.3.9, 2.3.10; Prop 2.4.5 (its `PC_{ℵ₀}` conjunct) | They are statements about the uninterpreted fields of `ExtLogic` (Q8). No field has axioms, so nothing nontrivial follows. Stated as "prove only what follows from the fields": nothing does. Prop 2.4.5 could be proved except for the `PC` conjunct. |
| false as written | Prop 2.2.6 (item (3), see Part F) | Kept frozen as the closest-to-intent version; cannot be proved. The other items of 2.2.6 (box AEC, semi-good, tame, stable) are provable but long. |
| open, hard | Prop 1.0.17 | The direction `(≼₂)^up ↾ K₁^up ⊆ (≼₁)^up` needs replacing `K₂`-directed systems by `K₁`-systems. The paper says "Easy", but I see no short argument; it probably needs Fact 1.0.18 (cited) for both classes. |
| open, long constructions | Thm 2.5.8(1)–(4) | (1) is a transfinite construction of `(α_ε, N_ε, f_ε)` with amalgamations at successor steps, closed by Prop 1.0.30 (now proved). (3) is a bookkeeping construction of a chain realizing all basic types. (2) follows from (1); (4) from (3) plus Prop 1.0.31 (cited). Needs transfinite recursion with choices over `Ordinal` (`Ordinal.limitRecOn`), which is the main missing infrastructure. |
| open, long | Thm 2.6.8(1) density, (4) local character, (5) continuity | (5) needs a uniform base `N₀` (done as in 2.6.8(3)) and, when `cf(δ) ≤ λ`, a chain construction in `K_λ` to apply λ-continuity. (4) needs local character applied to a filtration. (1) needs weak local character with a `≺*`-chain construction. |
| open, renaming of large models | Prop 2.5.2, Remark 2.5.4 | Transporting `E`-chains along isomorphisms renames arbitrary (possibly huge) models inside `U`. The proofs need room outside the models, as in the Prop 1.0.23(2) change; a smallness hypothesis is likely required (a PROOF-STAGE CHANGE). |
| open, concrete example | Remark 2.4.7, Claim 2.4.8 | Need a development of transitive partial orders (amalgamation by disjoint components, a count of components up to isomorphism via the cited Lemma 2.4.2). Long but routine. |

**Main obstacles met:**
1. Several definitions needed repairs before anything could be proved: `AxSmooth`, Ax 3(a),
   Ax 3(b), `trivialFrame` (see "Proof-stage changes"). The most serious was 3(b), which as
   formalized contradicted 3(a) whenever `K` has models larger than `λ`.
2. Encoding of the universe of sets: models live in a fixed type `U`. Arguments that rename models
   (symmetry of `E*`, conjugacy) need room, which `Room U lam` gives only for models of size
   `< #U`.
3. Transfinite constructions (Thm 2.5.8, Thm 2.6.8(1),(4),(5)) need reusable recursion lemmas,
   which are not yet written.

**Time spent (rough estimates, not measured):**

| part | share of this run | rough time |
|---|---|---|
| general infrastructure (`AEC.lean` AUX: isomorphisms, substructures, renaming, types, LST hulls) | ~35% | ~1.5 h |
| Section 1 proofs (1.0.4, 1.0.23, 1.0.30) | ~25% | ~1 h |
| Section 2 proofs (2.1.2, 2.1.4, 2.2.3, 2.6.3, 2.6.7, 2.6.8(2),(3)), incl. definition repairs | ~30% | ~1.25 h |
| notes, bookkeeping | ~10% | ~0.5 h |

For planning: most of the infrastructure is reusable, so per-statement cost should go down for
Sections 3–6 (λ-level arguments like those above). Sections 7–10 and the open items above need a
transfinite-recursion toolkit (chains of length `λ⁺`, clubs, filtrations) first. I would budget
that toolkit like the infrastructure of this run.

### Remaining statements of Sections 1–2 (neither CITED nor schematic)

| item | needed by a main theorem? | decision |
|---|---|---|
| Thm 2.5.8(1)–(4) | yes, via Prop 7.1.10 (and Thm 7.1.18, 10.1.9, 11.1.1) | prove before Section 7 |
| Thm 2.6.8(1),(4),(5) | yes, via Claim 7.1.16, Thm 9.1.13, Props 10.1.9–10.1.13, Thm 11.1.1 | prove before Section 7 |
| Prop 1.0.17 | no | skipped |
| Prop 2.2.6 | no (and item (3) is false) | skipped |
| Remark 2.4.7, Claim 2.4.8 | no | skipped |
| Prop 2.5.2, Remark 2.5.4 | no | skipped |

## Dependency map of the main theorems

How the map was computed: for each numbered item, I extracted the `\ref`s in the item and its
proof (text up to the next numbered item), then took the transitive closure; the closure was not
expanded through CITED items. This over-approximates (forward references in discussion paragraphs
are included) but does not miss references.

* **Thm 1.0.1 (= Thm 11.1.1)** needs 52 statements:
  * Section 1: 1.0.30.
  * Section 2: 2.1.2, 2.5.8, 2.6.8.
  * Section 3: 3.1.6, 3.1.8, 3.1.9, 3.1.10, 3.2.3, 3.2.4, 3.3.4, 3.3.5.
  * Section 4: 4.1.12.
  * Section 5: 5.2.2, 5.3.4–5.3.9, 5.4.3–5.4.7, 5.4.9, 5.4.10, 5.5.1, 5.5.3, 5.5.4.
  * Section 6: 6.1.3, 6.1.6.
  * Section 7: 7.1.3, 7.1.6, 7.1.7, 7.1.10, 7.1.12, 7.1.13, 7.1.17, 7.1.18.
  * Section 8: 8.1.3–8.1.6.
  * Section 9: 9.1.4–9.1.7, 9.1.13.
  * Section 10: 10.1.8, 10.1.9, 10.1.11.

  It also needs the CITED results **Fact 1.0.18, Prop 1.0.31, Thm 1.0.32, Prop 2.5.6**.
* **Thm 11.1.7** needs the same set, plus 11.1.1, 11.1.5, 11.1.6, and Conjecture 11.1.4 (a
  hypothesis). The cited results are the same four.
* **Thm 1.0.2** is the same as 11.1.7, with `μ_unif` in hypothesis (2).

**Work order** (each line depends only on earlier lines):
1. Section 3: 3.1.6, 3.1.8 → 3.1.10 → 3.1.9; 3.2.3 → 3.2.4; 3.3.4 → 3.3.5.
2. Section 4: 4.1.12 (with the iso-closure of `K^{3,uq}`).
3. Section 5: 5.3.5, 5.3.6, 5.3.8, 5.3.7, 5.3.9, 5.3.4; 5.4.3–5.4.7, 5.4.9, 5.4.10; 5.5.3 → 5.5.1 → 5.5.4; 5.2.2.
4. Section 6: 6.1.3, 6.1.6.
5. Then 2.5.8 and 2.6.8(1),(4),(5), and Sections 7–11.

Most statements of Sections 3, 5, 6 are proved by transfinite constructions (chains of length
`≤ θ < λ⁺` or `λ⁺`, built by recursion with amalgamations at successor steps and unions at
limits). The first task of this run is therefore a recursion toolkit for such chains.

## Progress — second run (Sections 3–6)

* **Batch 5** (tools for Sections 3–6, first statements):
  * AUX `transfinite_construction` (`AEC.lean`): builds a sequence `c : Ordinal → X` satisfying
    a local invariant at every stage `α ≤ θ`, by well-founded recursion with choice. It will drive
    every chain construction (Props 3.1.8, 3.1.9, 3.1.10, Thm 3.2.3, Prop 3.3.4, the `NF`
    constructions of Section 5, the `λ⁺`-chains of Section 6).
  * AUX `tp_eq_small` (`Frames.lean`): equal types of `K³_λ`-triples are realized by one
    amalgam in `K_λ` (the `E`-chain through models of any size collapses to an `E*`-step of
    `(K_λ, ≼ ↾ K_λ)`, via Prop 1.0.23(3)). This is the "type equality → embedding" step used in
    all successor steps.
  * AUX `Frame.aleph0_le` (a frame with `K_λ ≠ ∅` has `λ` infinite).
  * Proved: Prop 4.1.3 (`E_{M₀}` is an equivalence relation), Remark 6.1.5.
  * `sorry` count in `Frames.lean`: 134 → 132 (`AEC.lean`: 0).

### Status at the end of the second run (stopped: blocked by scale)

**Proved so far: 16 statements in total.**
* Sections 1–2: 14.
* Sections 3–6: 2 (Prop 4.1.3, Remark 6.1.5).

**`sorry` count: 132**, all in `Frames.lean`:
* 9 CITED.
* 6 schematic or false-as-written (Props 2.3.4, 2.3.5, 2.3.9, 2.3.10, 2.4.5, 2.2.6).
* 6 not needed by the main theorems (Props 1.0.17, 2.5.2; Remarks 2.4.7, 2.5.4; Claim 2.4.8;
  …).
* The rest are in the dependency closure of the main theorems, or in Sections 3–11.

**Why I stopped:** almost every remaining statement of Sections 3–6 that the main theorems need
is a transfinite construction:
* 3.1.8, 3.1.9, 3.1.10: chains of length `≤ θ` / `λ⁺` / `λ^{+2}`;
* 3.2.3: decompositions;
* 3.3.4: reduced triples, built by an `ω`- or `λ`-chain;
* 5.3.7, 5.4.4, 5.4.6, 5.4.7, 5.5.1, 5.5.3: chains of `NF`-squares;
* 6.1.3, 6.1.6: `λ⁺`-chains with clubs.

Each needs:
* an invariant set up for `transfinite_construction`;
* a union step: the union of a chain of length `< λ⁺` of models of `K_λ` is in `K_λ`. This
  needs a cardinal bound `#⋃ ≤ λ`, with the index type in the ordinal universe — not yet written;
* a successor step: renaming plus amalgamation, or the frame axioms (existence, symmetry, 2.5.7);
* a limit step: AEC smoothness and the continuity axiom.

I estimate 150–400 lines of Lean per construction, about 25 constructions in the closure.

**Remaining in Sections 3–6:**
* Section 3: all 14 statements.
* Section 4: 4.1.7, 4.1.8, 4.1.10, 4.1.11(1),(2), 4.1.12(1),(2).
* Section 5: all 33.
* Section 6: 6.1.3(a)–(e), 6.1.6(a)–(g).

Only 4.1.12 and parts of Sections 3, 5 and 6 are in the main closure (see the dependency map).

**Time (rough estimates, not measured):**

| part | estimate |
|---|---|
| dependency map | ~0.3 h |
| `transfinite_construction` | ~0.3 h |
| `tp_eq_small` | ~0.5 h |
| Prop 4.1.3, Remark 6.1.5 | ~0.4 h |
| notes | ~0.2 h |
| **total for this run** | **~1.7 h** |

**Revised estimate for the rest:**

| block | estimate |
|---|---|
| Missing tools: union bound for chains `< λ⁺` in `K_λ`; image of a union under a union of maps; chain-of-embeddings recursion wrapper over `transfinite_construction` | ~2 h |
| Sections 3–6, main-closure statements only (~30), with the tools | ~12–20 h |
| Sections 3–6, the rest | ~8 h |
| Thm 2.5.8, Thm 2.6.8(1),(4),(5) | ~4–6 h |
| Sections 7–9 (`λ⁺`-chains with clubs, `≺⁺`, uniqueness of `≺⁺`-extensions, non-structure via `T(M)`: the hardest combinatorics) | ~20–30 h |
| Section 10 (`s⁺` is a good `λ⁺`-frame; types of `(K^sat)^up`, which also needs Fact 1.0.18 (cited)) | ~8–12 h |
| Section 11 (induction on `n` through `s⁺`; mostly glue, but frames over `(K^sat)^up` must satisfy the hypotheses again) | ~4–6 h |

These are wide intervals; the main risk is Sections 7–9.

**Possible ways to reduce the work** (for your decision):
* (a) Prove only the main-theorem closure.
* (b) Treat the two key construction lemmas, Prop 3.1.8 and Thm 5.3.7(a) (existence of `NF`),
  as intermediate milestones and check them before going on.
* (c) Accept the cited Prop 2.5.7 as an assumption, as the paper does.


## Progress — third run (checkpoint 1: Prop 3.1.8), blocked before starting the proof

**Obstruction (needs an author decision).** Decision (c) says to use the cited Prop 2.5.7 inside
the proof of Prop 3.1.8. The successor step of 3.1.8 needs exactly the two-sided independent
amalgamation of 2.5.7. But the hypotheses do not match:

* `prop_2_5_7` assumes `s.IsSemiGood lam` = `Core ∧ Ax3g ∧ Ax3e ∧ BasicStab λ⁺ ∧ Ax3c`. This is
  the paper's "s satisfies the axioms of a semi-good λ-frame".
* `prop_3_1_8` assumes `Hyp_3_0_1 s lam` = `Core ∧ Ax3g ∧ Ax3e`. This is the paper's
  Hypothesis 3.0.1: semi-good *except basic almost stability and local character*.

So the cited theorem cannot be applied in 3.1.8's context, unless one of the statements changes,
which decision (c) forbids. The paper itself applies 2.5.7 under Hypothesis 3.0.1, so implicitly
it treats 2.5.7 as valid without almost stability and local character.

I could not find a proof of the 2.5.7 conclusion from existence + symmetry alone. Symmetry only
gives *some* model `M₂ ∋ c` over which `b` is independent, not the image of the whole `M₁`.
Shelah's own argument ([Sh:h].II 2.16) is not in the paper.

Options:
1. Weaken the hypothesis of the CITED `prop_2_5_7` from `IsSemiGood` to `Hyp_3_0_1` (the axioms it
   is applied with in the paper). This makes the cited assumption slightly stronger, but matches
   the paper's use.
2. Keep 2.5.7 and strengthen `Hyp_3_0_1` for the Section 3 results in the main closure to
   `IsSemiGood`. The main theorems all assume a semi-good frame, so they would be unaffected, but
   the Section 3 statements change.
3. Prove the content of 2.5.7 under `Hyp_3_0_1` as an AUX lemma. I have no proof yet; the effort
   and the risk are unknown.

No Lean code changed in this run; the build is as at the end of the second run (132 `sorry`).

## Cited results used under weaker hypotheses than stated

| cited result | hypothesis in the paper's statement | hypothesis in the formalization | reason |
|---|---|---|---|
| Prop 2.5.7 ([Sh:h].II Claim 2.16) | "s satisfies the axioms of a semi-good λ-frame" (`IsSemiGood`) | `Core ∧ Ax3g ∧ Ax3e` (= Hypothesis 3.0.1: no basic almost stability, no local character) | The paper applies 2.5.7 under Hypothesis 3.0.1, in the proof of Prop 3.1.8 (the successor step of the construction). The formalization therefore assumes the stronger cited statement, exactly as the paper does; the author confirms it is true. Author decision, tagged `PROOF-STAGE CHANGE` and `CITED`. |

## Cited results widened by the author

* **Fact 1.0.18** ([Sh:h].II Lemma 1.23). The formal `fact_1_0_18` keeps the paper's four clauses. A companion CITED theorem `fact_1_0_18_up` adds, for an AEC `(K, ≼)` and models of `K^up` of any size: (i) a `≼`-directed union of models of `K` is a model of `K`, each member `≼` the union (`K^up ⊆ K`); (ii) `≼^up ⊆ ≼`. **The author confirmed (2026-11-09) that both clauses are part of the source.** Not proved (`sorry`). With the AUX lemmas `InUp.mono`, `LeUp.mono` (monotonicity of `^up` in the relation) it gives `Frame.up_sub`: `(K^sat, ≼^NF)^up ⊆ K` and `≼⁺ ⊆ ≼`, the paper's "`K⁺ ⊆ K`" (Section 2.1). Used in: Thm 11.1.1(4) (= Thm 1.0.1(4)), Cor 11.1.6, Thm 11.1.7, Thm 1.0.2, and for the transfer of the hypothesis `I(λ^{+(2+m)}, ·) < 2^{λ^{+(2+m)}}` from `K` to the frames `sⁿ` (in particular `I(λ^{+3}, ·) < 2^{λ^{+3}}` to `s⁺`).

## Statements outside the closure of the main theorems (decision (a))

These are kept as they are (statement unchanged), and are not worked on unless a proof turns out
to need them. They come from the reference-based dependency map, which can miss uses, as with
2.5.7.

* **Already proved** (some are used by AUX lemmas, e.g. 1.0.23(3) by `tp_eq_small`, 2.6.3 by
  Thm 2.6.8(3)): Remark 1.0.4(1)–(3), Prop 1.0.23(1)–(3), Remark 2.1.4, Prop 2.2.3, Remark 2.6.3,
  Remark 2.6.7, Prop 4.1.3, Remark 6.1.5.
* **Left as `sorry`:**
  * Section 1: Prop 1.0.17.
  * Section 2: Prop 2.2.6; Props 2.3.4, 2.3.5, 2.3.9, 2.3.10, 2.4.5 (schematic); Remark 2.4.7;
    Claim 2.4.8; Prop 2.5.2; Remark 2.5.4.
  * Section 3: Remark 3.1.4; Prop 3.1.7; Prop 3.2.5; Remark 3.3.3.
  * Section 4: Props 4.1.7, 4.1.8, 4.1.10, 4.1.11(1),(2).
  * Section 5: Props 5.2.4, 5.2.5(1)–(3), 5.3.3, 5.4.8.
  * Section 7: Prop 7.1.5.
  * Section 10: Props 10.1.4, 10.1.7(a),(b).
* **Probably needed after all:** Props 10.1.10, 10.1.12, 10.1.13. They are stated *inside* the
  proof of Thm 10.1.9, which is in the closure, so the map does not see that 10.1.9 uses them.
  They will be done with 10.1.9.

## Progress — third run, checkpoint 1: Prop 3.1.8 (stopped for checking)

* Prop 2.5.7 (CITED): hypothesis weakened to `Core ∧ Ax3g ∧ Ax3e` (= Hypothesis 3.0.1), author
  decision. Tagged `CITED` and `PROOF-STAGE CHANGE`; see "Cited results used under weaker
  hypotheses than stated".
* **New AUX lemmas, all sorry-free.** In `AEC.lean`:
  * `card_biUnion_le`: the union of `≤ λ` sets of size `≤ λ`, indexed by ordinals, has size `≤ λ`.
  * `IsUnionOf.unique`: the union model of a chain is unique.
  * `IsAEC.le_union`: every member of a chain is `≼` its union (Axiom c applied to a tail).
  * `IsAEC.emb_limit`: at a limit, a union of embeddings is an embedding (smoothness).
  * `IsAEC.image_chain`: images under increasing embeddings form an increasing continuous chain.

  In `Frames.lean`:
  * `Frame.notFork_self`: a basic type does not fork over its own domain.
  * `Frame.nf_of_notFork`: `NotFork` gives ⨿ with the given ambient model, via Prop 2.1.2.
  * `Frame.Inv318` and `Frame.inv318_loc`: the invariant of the construction, and its locality.
  * `Frame.construction_318`: the construction of the paper's proof, i.e. `(N*_α, f_α)` for
    `α ≤ θ`:
    * the `N*` chain is fixed;
    * `M` is moved along the embeddings `f_α`;
    * successor steps: renaming, then the cited Prop 2.5.7, then renaming;
    * limit steps: unions, smoothness, and the continuity axiom on the chain of images.
* **Proved: Prop 3.1.8** (statement unchanged). The proof:
  1. derives `θ.card ≤ λ` from the hypotheses (the `a_α` are pairwise distinct elements of `M_θ`);
  2. runs `construction_318`;
  3. renames `N*_θ` along `f_θ⁻¹`, so that each `M_α` sits literally inside `N_α`, as at the end
     of the paper's proof.

  It depends on `sorryAx` only through the CITED Prop 2.5.7.
* **Build:** both modules compile. `sorry` count in `Frames.lean`: 132 → 131. A full build of
  `Frames.lean` takes about 10 s; no declaration is slow (the earlier 10-minute timeout was not
  caused by elaboration).
* **Time** (rough estimate, not measured): about 2.5 h for this checkpoint. Reusable for later
  constructions: the limit-stage lemmas and the "construction with invariant, then rename back"
  pattern.
* **Next, after your check:** Thm 3.2.3, Prop 3.2.4, Props 3.3.4, 3.3.5, 3.1.10, 3.1.9,
  Prop 4.1.12, then Section 5 up to Thm 5.3.7(a) (checkpoint 2).

## Progress — fourth run, checkpoint 2: Thm 5.3.7(a) (stopped for checking)

Build: both modules compile (`Build completed successfully`). `sorry` count in `Frames.lean`:
131 → 120. A full build of `Frames.lean` takes about 10–15 s.

**Proved (paper statements):**
* Thm 3.2.3(1),(2),(3).
* Props 3.3.4, 4.1.12(1),(2), 5.2.2, 5.3.3, 5.3.5, 5.3.6.
* Thm 3.3.5.
* Thm 5.3.7(a),(b), as the AUX lemmas `Frame.thm_5_3_7_a` and `Frame.thm_5_3_7_b`. `thm_5_3_7` uses
  them, and keeps a `sorry` only for part (c) (see "F. Statements false as written").

Thm 3.3.5, Props 5.3.5, 5.3.6 and Thm 5.3.7(a),(b) depend on `sorry` only through Prop 3.1.8,
i.e. the cited Prop 2.5.7. All other results proved in this run are sorry-free.

**Statement changes** (see "Proof-stage changes"): hypothesis `M ∈ K_λ` added to Thm 3.2.3(2)
and Prop 4.1.12(2); `M₃ ∈ K_λ` added to item (2) of Prop 5.2.2. Prop 3.1.8 is unchanged: its
proof was moved to the AUX lemma `Frame.prop_3_1_8_strong`, which also concludes `N_α ∈ K_λ`.

**New AUX lemmas** (all in `Frames.lean`):
* `no_long_chain`: Prop 1.0.30 with `f_α = id`.
* `Frame.K3bs_K3`, `Frame.K3bs_iso`.
* `conj_transport`: transport of a `K^{3,*}`-triple along a conjugation (Thm 3.2.3(1)).
* `amalg_transport`, `Frame.uqCond_transport`, `Frame.K3uq_isoClosed`: `K^{3,uq}` is closed under
  isomorphisms. Needed to apply Thm 3.2.3 with `K^{3,*} = K^{3,uq}`; the paper says "easy" in
  Prop 4.1.11(1).
* `Frame.K3r_isoClosed`: reduced triples are closed under isomorphisms (part of Remark 3.3.3).
* `IsAEC.extend_union`, `Frame.bs_chain`, `Frame.bs_union`, `Frame.leBs_trans`: the parts of
  Prop 3.1.6 that are used, namely (b) transitivity and (c) unions of `≼_bs`-chains.
* `Frame.reduced_step`, `Frame.disj_chain`: the "first ordinal containing `x`" argument of
  Thm 3.3.5 and Prop 5.3.6.
* `Frame.notFork_iso`: non-forking is preserved by an isomorphism of the ambient model.
* `Frame.prop_3_1_8_strong`.
* `Frame.nfstar_core`: the core of Thm 5.3.7.
* `Frame.thm_5_3_7_a`, `Frame.thm_5_3_7_b`.

**Where the formal proofs needed more than the paper:**
* Thm 5.3.7(b): `NF*(N₀, N₁, N₂, N₃)` needs `N_{2,0} = N₂` exactly, while Prop 3.1.8 gives an
  isomorphic copy `f[N₂]`. The copy is moved back by an isomorphism fixing `N₁` pointwise. This
  needs `f[N₂] ∩ N₁ = N₀` (Prop 5.3.6) and `NF*` closed under isomorphisms (Prop 5.3.3).
* Thm 5.3.7(a): the paper applies (b) to `N₁* ≽ N₁`, which need not be disjoint from `N₂`. The
  same isomorphism argument handles it.
* The dependency map missed several uses (Props 5.3.3, 5.3.5, 5.3.6, and 3.1.6(b),(c)). These
  are now proved or covered by AUX lemmas.

**From the plan, not done in this run:**
* Prop 3.2.4: needs Prop 3.2.5 (concatenating decompositions of transfinite length, "Easy" in the
  paper). Prop 3.2.5 is false as written; see F. Its proof is a further transfinite construction
  with ordinal sums. Neither is needed for Thm 5.3.7.
* Prop 3.1.9: needs a filtration of models in `K_{λ⁺}` and a version of Prop 3.1.8 along a
  `λ⁺`-chain.
* Prop 3.1.10: a two-dimensional construction.
* Prop 5.3.4 (NF respects `E_{M₀}`, "Easy" in the paper): the direct argument needs `NF` to be
  upward monotone in `M₃`, which does not follow from the definition without a further
  construction.

None of these four is used by Thm 5.3.7(a),(b). None was attempted in this run; none is STUCK.

## Why Thm 5.3.7(c) is left as `sorry` (explanation, nothing changed)

**The failing step.** The paper's proof of (c) is "by the moreover in Thm 3.2.3(3)". That
"moreover" assumes `tp(a, M, N)` basic and produces a decomposition with `d₀ = a` of some
`M* ≽ N`. Statement (c) needs a first witness ending exactly at `N₁`, because Def 5.3.1(b) requires
`N_{1,α*} = N₁`. Nothing passes from a decomposition of `M* ≽ N₁` to one of `N₁`. The given
decomposition of `N₁` is of no help, since its first element is `d₀`, not `a`.

**Not an artefact of the formalization.** `NFStarWit` matches Def 5.3.1 clause by clause, and the
argument below uses only clauses (b), (e) and `K^{3,uq} ⊆ K^{3,bs}`.

**False as written, conditionally.** Suppose a witness has `d₀ = a` with `a ∈ N₁ − N₀`. Then
`α* > 0` (otherwise `N₀ = N₁`), so `(N₀, N_{1,1}, a) ∈ K^{3,uq} ⊆ K^{3,bs}`. Since
`N_{1,1} ≼ N₁`, this gives `tp(a, N₀, N₁) = tp(a, N₀, N_{1,1}) ∈ S^bs(N₀)`. So (c) implies that
every element of `N₁ − N₀` has a basic type over `N₀`, whenever `N₁` is decomposable over `N₀`
by `K^{3,uq}`. Hypothesis 5.1.1 does not visibly imply this (Ax 2(c) gives only density of basic
types), so (c) is false in any frame with a decomposable `N₁` containing a non-basic element.
**I have not built such a frame, so (c) is not formally refuted.** The entry in section F should
be read with this caveat.

**Adding "basic" is not enough for a proof.** One would still need a uniqueness triple
`(N₀, N', a)` with `N' ≼ N₁`, and `N₁` decomposable over `N'`. Thm 3.2.3(2) gives
`(N₀, N*, a) ∈ K^{3,uq}` only with `N*` and `N₁` below a common `N⁺`, not `N* ≼ N₁`. I do not
know whether this version is true.

**Proposed correction** (for the author's decision; not yet proved). Let `N₀ ≼ N₁, N₂` in `K_λ`,
`N₁ ∩ N₂ = N₀`, `a ∈ N₁ − N₀`, `tp(a, N₀, N₁)` basic. Then there are `N₁* ≽ N₁` and `N₃ ∈ K_λ`
such that `NF*(N₀, N₁*, N₂, N₃)` has a first witness with `d₀ = a`. No decomposability of `N₁` is
assumed. `N₁*` cannot be just any extension from Thm 3.2.3(3): by Prop 5.3.6 it must satisfy
`N₁* ∩ N₂ = N₀`. The renaming in `Frame.nfstar_core` provides this and fixes `N₁`, hence `a`.
The proof should follow that lemma, once its conclusion also exposes the witness. This version
is what the proof of (a) gives when `N₀ ≺ N₁`, with the first element added. A weaker alternative keeps `N₁` and assumes outright a decomposition of `N₁` with
`d₀ = a`; that is immediate from the proof of (b).

## Progress — fifth run (Thm 5.3.7(c) erratum, Prop 5.3.9); stopped

Build: both modules compile. `sorry` count in `Frames.lean`: 120 → 115.

* Thm 5.3.7(c) replaced by the corrected statement (section C) and **proved** (`Frame.thm_5_3_7_c`,
  following `Frame.nfstar_core`). The weaker alternative was not needed. `thm_5_3_7` is complete.
  The check of its uses is in section C: the only use of (c) is in Thm 5.4.10, and an extension
  suffices, so no AGENT-CHOICE was necessary.
* Prop 5.3.9(1)–(4) proved. Statement changes to (1) and (3) are in "Proof-stage changes". In (2),
  the paper's "by item 1" does not cover `N₁ = M₀`; there the first model is first enlarged with
  a decomposition and `Frame.nfstar_core`.
* New AUX lemmas: `Frame.nfstarWit_iso` (witness form of Prop 5.3.3), `Frame.exists_strict`,
  `Frame.notFork_mono`, `Frame.nfstarWit_snoc` (append one step; Prop 5.3.9(3) needs only this
  case of Prop 5.3.8), `Frame.thm_5_3_7_c`. `Frame.nfstar_core` now also exposes the witness.

**Why the run stops here.** No checkpoint after Thm 5.3.7(a) had been fixed. The rest of
Section 5 depends on constructions not yet done:
* Thm 5.4.7 needs Prop 3.2.4, hence Prop 3.2.5, and Prop 5.4.6, hence Prop 3.1.10.
* Thm 5.5.1 Case a needs Prop 5.3.8 (transfinite concatenation of witnesses).
* Props 3.2.5 and 5.3.8 need a transfinite concatenation of chains with ordinal sums, and both
  appear false as written in the same way: for `α* ≥ λ⁺` with strictly increasing chains the top
  model is not in `K_λ`, and for `α* = 0` the bottom model need not be in `K_λ`. The proposed fix
  for 3.2.5 (`α* < λ⁺`, bottom models in `K_λ`) has not been applied, and is not yet confirmed.
* Prop 5.4.3–5.4.5 were not attempted in this run. Section 6 was not started.

## Progress — sixth run, checkpoint: Thm 5.4.7 (stopped for checking)

Build: both modules compile. `sorry` count in `Frames.lean`: 115 → 108.

**Proved:** Props 3.2.4, 3.2.5, 5.3.8 (the last two corrected, section C), Prop 5.4.4 (statement
changes in "Proof-stage changes"), Prop 5.4.5, Prop 5.4.6, Thm 5.4.7.

**Not proved, from the requested order:**
* **Prop 3.1.10** (*superseded: proved in the seventh run, see below*; at this checkpoint still `sorry`). Its content for a first sequence with a top model in `K_λ` is
  the AUX lemma `Frame.rectangle`, which is what Prop 5.4.6 uses. Two problems with the statement
  as formalized, both for the author:
  1. Clause (7) has `db β` where the construction gives `f_{β+1}(db β)`: the element of
     `M_{0,β+1} = f_{β+1}[M_{b,β+1}]` is the image. With `db β` the clause fails whenever `f` is not
     the identity on it. The paper's clause (7) also writes `d_{b,β}` (so the Lean text is faithful
     to it). The paper's proof constructs conditions 1–6, 8, 9 and then says "without loss of
     generality, condition 7 is satisfied, too", without further argument.
  2. The case `θ^a = λ⁺` (no top model in `K_λ`) would need Prop 3.1.8 for a chain of length `λ⁺`.
     I have not shown this case to be false; it is simply not done.
* **Prop 5.4.3** (still `sorry`, marked STUCK):
  1. Part (1) as written: Def 5.4.2 is existential in `a`, so two amalgamations can be witnessed
     by different elements of `N₁`, whereas Def 4.1.5 gives uniqueness for one fixed `a`. I can
     neither prove nor refute it. Also Def 5.4.2 does not state `M₃ ∈ K_λ`, `Mₙ ≼ M₃`, which
     Def 5.4.1(1) requires, so as formalized clause (1) fails. Prop 5.4.5 does not need it: it uses
     `Frame.NFuqE` (with `a` explicit and these conditions included) and `Frame.otMinusE_NFuq`.
  2. Part (2): `⊗_R` does not make `R` closed under isomorphisms, and clauses 2–3 of `⊗⁻_R` speak
     about images, so the paper's one-line proof does not carry over for arbitrary `R`.
* Section 6 and Section 5.5 were not started; you set the stop at Thm 5.4.7.

**Where the formal proofs differ from the paper:**
* Prop 5.4.5 is proved through a fixed-element version of Prop 5.4.4 (`OtMinusE`, `transit_weak`), for
  the reason above.
* Thm 5.4.7, general case. The paper's "without loss of generality `M₂⁺ ∩ N^{x,-} = M₂`", followed by
  a citation of Thm 3.2.3.3, does not give `NF*(M₀, N₁ˣ, M₂⁺, Nˣ)` directly. In Lean: `M₂⁺` is renamed
  over `M₂` off `M₁` only; Prop 3.1.8 is applied to the second witness; the copy of `M₂⁺` is moved back
  by an isomorphism that fixes `N₁ˣ` but may move `N^{x,-}`. The model `Mˣ` then embeds into the
  result over `M₁ ∪ M₂`, which is all the conclusion needs (`Frame.nf_lift`, `Frame.nf_side`).
* Prop 5.4.6: the identity `f_β = id` of the paper's "without loss of generality" is obtained at the
  end from Prop 5.3.6 and `rename_back`.

**New AUX lemmas.** In `AEC.lean`: `exists_ordSum`, `ordSum_cover`, `IsAEC.concat_chain`, `ordSum_lt`
(transfinite concatenation). In `Frames.lean`: `IsAEC.chain_mem_Kc`, `ordSum_fun`,
`IsAEC.exists_union_nat`, `Frame.decomp_omega`, `OtMinusE`, `TransInv`, `transit_weak`, `Frame.NFuqE`,
`Frame.otMinusE_NFuq`, `Frame.RectInv`, `Frame.rectangle`, `Frame.NFStarWit.congr`, `rename_back`,
`IsAEC.joint_trans`, `decomp_iso`, `Frame.nfstar_comp`, `Frame.weak_uq_case_a`, `Frame.nf_lift`,
`Frame.nf_side`.

## Gaps in the paper's proofs

* Prop 10.1.13(1) and Prop 10.1.12, step (34): Thm 5.15(e) (`NF^` respects `s`) is applied to an element of `N₁` and a type over `M₀`; as stated (and formalized, `thm_6_1_3_e`) it covers an element of `M₀` and a type over `N₁`. The form used is proved as `Frame.nfhat_dual` (from long transitivity and Thm 5.4.10).
* Prop 10.1.12, step (28)–(29): the isomorphism `g : M₆ → M₄` of (28) is over `M₀ ∪ N₂`, but (29) needs `g(a₁) = a₁` with `a₁ ∈ N₁ ⊆ N₄`, not necessarily in `N₂`. Repaired by taking `g` over `M₀ ∪ N₄` (Thm 7.1.13(c) with `N^* = N₄`, using `NF^(N₀, N₄, M₀, M₆)` and `NF^(N₀, N₄, M₀, M₄)` from transitivity of `NF^`, `Frame.nfhat_trans`). Also (24): `M₂` is taken from Prop 7.1.12(b) (`M₀ ≺⁺ M₂`), which gives `M₂ ∈ K^sat` as the paper states; Thm 5.15(c) alone does not. "Without loss of generality `N₄ ∩ M₂ = N₂`" is done by renaming `M₂` over `M₀ ∪ N₂` (`Frame.nfhat_perm`, `Frame.ltPlus_iso`).
* Prop 10.1.4, `⇐`: the paper takes an amalgamation of `M₁, M₂` over `M₀` from `tp(a₁, M₀, M₁) = tp(a₂, M₀, M₂)`; `(K, ≼)` need not have amalgamation in `λ⁺`. Repaired by extending `M₁, M₂` by `≺⁺` and applying Thm 7.1.13(b) directly (only restrictions to `N ∈ K_λ` are used).

* Thm 9.1.7, case `δ ∈ S` (Claim (*)): the paper takes `M_{δ+1}` with `(M_δ,M_{δ+1}) ≅ (M*_{λ⁺},M*_{λ⁺+1})` in clause 4, and later extends the isomorphism `f_{λ⁺}` built from `Thm 7.1.13` to `M_{δ+1}`. The pair isomorphism of clause 4 need not extend `f_{λ⁺}`. Repaired: `M_{δ+1}` is chosen at step `δ` as the image of `M*_{λ⁺+1}` under an extension of `f_{λ⁺}` (`Frame.g97_step`). Also, the claim is stated for `β ≤ λ⁺` but used for all `β < λ^{+2}`.

* **Claim 5.5.2.** The paper substitutes the chains `M_b`, `N_b` into Prop 5.4.4, which needs equal first
  models, while Claim 5.5.2 only has `M_{b,0} ≼ N_{b,0}`. In Lean (`Frame.nf_claim`) the bottom of `N_b`
  is replaced by `M_{b,0}`; the first step is kept by monotonicity. The conclusion is read off by
  monotonicity (Prop 5.3.9(4)) and Prop 5.3.3, so Prop 5.3.4 is not used.
* **Prop 5.5.3 in Thm 5.5.1.** The paper's "without loss of generality `f_ε = id`" and the disjointness
  `M* ∩ M_{α*} = M₀` are avoided: Thm 5.5.1 uses the construction with embeddings `f_ε`
  (`IsAEC.chain_build`) directly. *(Not reviewed by the author: the author sees no substantial difference in the
  proof, 2026-11-13.)*

* **Prop 6.1.6(d).** The paper's clubs `E_{α,0}` relate only `α` and `α+1`, while the proof uses that
  `⟨M_{α,ε} : α⟩` is increasing for all pairs; and Case a uses `M_{δ,ε}` although `E_α` is defined only for
  `α < δ`. In Lean (`Frame.leNF_union_core`) the clubs are taken for all pairs `β < γ < θ`, and a representation of
  the union, with its own club at the top index, is added in Case a.

* **Prop 3.1.10, item (7).** The paper's proof constructs conditions 1–6, 8, 9 and then says only
  "without loss of generality, condition 7 is satisfied, too"; it gives no argument. Argument used:
  item (7) is obtained in the successor step of the induction on `β`. Column `β` is extended to
  column `β+1` by Prop 3.1.8 (through `Frame.prop_3_1_8_strong`), whose conclusion (5) is exactly
  item (7) for all `α`; Prop 3.1.8 rests in turn on the cited Prop 2.5.7, which amalgamates two
  extensions with basic types so that both do not fork. Item (6) comes from conclusion (4)
  of Prop 3.1.8 and transitivity. See `Frame.rectangle`, clause `c8`.
* **Prop 3.1.10, item (8) of the Lean statement (the identity case).** Under its hypothesis the
  rectangle is moved by one injection on the union of the top row: `f_β⁻¹` on the images and the
  identity on `⋃ M_{a,α}`. The hypothesis is what makes this injective. *(Not reviewed by the author: the author
  sees no substantial difference in the proof, 2026-11-13.)*

## Progress — seventh run, checkpoint: end of Section 5.4 (stopped for checking)

Build: both modules compile. `sorry` count in `Frames.lean`: 108 → 104. Prop 3.1.10, Prop 5.4.8,
Thm 5.4.9, Thm 5.4.10 are proved; each depends on `sorry` only through the cited Prop 2.5.7.

* No checkpoint after Thm 5.4.7 had been named; I took the end of 5.4, because Section 5.5 is the
  next large block and is a prerequisite of Section 6 (Thm 6.1.3 uses Thm 5.5.1 and Prop 5.5.3).
* Statement changes: Prop 3.1.10 (section C), `OtMinus` clause (3) (proof-stage table).
* `Frame.rectangle` now handles a second sequence of any length (given as `β < θ^b`).
* New AUX lemmas: `IsAEC.chain_card_le`, `Frame.exists_decomp_ext`, `Frame.nf_symm`.
* Thm 5.4.10 uses the corrected Thm 5.3.7(c), then Thm 5.4.7, as analysed in section C.
* Thm 5.4.9 and clause (3) of Prop 5.4.8 use `Frame.nf_lift` in place of the paper's direct
  appeal to Thm 5.3.7(b).

**Still open before Section 6:** Prop 5.4.3 (unchanged, STUCK), Prop 5.3.4, Claim 5.5.2, Thm 5.5.1,
Prop 5.5.3, Thm 5.5.4. Not started in this run.

## Progress — eighth run, checkpoint: Thm 5.5.1 (stopped for checking)

Build: both modules compile. `sorry` count in `Frames.lean`: 104 → 102. Thm 5.5.1 depends on `sorry`
only through the cited Prop 2.5.7; Prop 5.4.3 (corrected, section C) is sorry-free.

Author approvals recorded: Def 5.4.1(3) with `M₄ ∈ K_λ`; Prop 5.4.3 erratum.

* Thm 5.5.1 proved, following the paper's cases: Claim 5.5.2 (`Frame.nf_claim`), Case b
  (`Frame.nf_caseb`), `α* = 2` with decomposability (`Frame.nf_trans_dec`), two-step transitivity
  (`Frame.nf_trans2`), and the general case (`Frame.nf_long_core`). Case a is Prop 5.3.8.
  (The hypothesis `M_{a,0} ≼ M_{b,0}` of this run was removed in the ninth run; see section C.)
* The chains in the AUX lemmas are only `≼`-increasing, since the paper's Case c applies Case b to
  three-term chains that may repeat a model.
* New AUX: `IsoClosedQ`, `IsAEC.three_chain`, `ChainInv`, `IsAEC.chain_build`, `Frame.nfstar_nf`,
  `Frame.nfstar_zero`, `Frame.nf_claim`, `Frame.nf_caseb`, `Frame.nf_trans_dec`, `Frame.nf_step`,
  `Frame.nf_long_core`, `Frame.nf_trans2`.

**Not done (still `sorry`), per the instruction "only as far as the closure needs":** Prop 5.3.4 (no
longer used by Thm 5.5.1), Prop 5.5.3(a),(b), Thm 5.5.4. Claim 5.5.2 is not a separate Lean
statement. Prop 5.5.3 is used by Thm 6.1.3 and needs the renaming to `f_ε = id` on top of
`IsAEC.chain_build`. Section 6 is not started.

## Progress — ninth run, checkpoint: Thm 6.1.3 (stopped for checking)

Build: both modules compile. `sorry` count in `Frames.lean`: 102 → 95.

**Proved:** Prop 5.5.3(a),(b); Thm 6.1.3(a)–(e). Thm 5.5.1 restated (`α* > 0`, section C). All depend
on `sorry` only through the cited Prop 2.5.7 where they depend on it at all (checked per theorem).

* Prop 5.5.3 is unchanged as a statement: it has no `f_ε`, so nothing was added to its hypotheses. The
  paper's "without loss of generality `f_ε = id`" is carried out in `Frame.nf_ext_core`: the top model
  is renamed by `f_{α*}⁻¹`. Case (b) also needs `M* ∩ f_{α*}[M_{α*}] = M₀`, which comes from Prop 5.3.6
  along the chain.
* Thm 5.5.4 is not used by any other item in the dependency map, so it stays `sorry` (per the
  instruction). Prop 5.3.4 likewise.
* Thm 6.1.3(d) follows the paper's first proof (`⊗⁻_NF` and Prop 5.4.4), not the alternative via Section 7.
* `NFhat` is encoded with `IsUnionOf` (encoding clarification, section C).

**New AUX lemmas.** `ChainInvG`, `IsAEC.chain_build_gen`, `Frame.nf_ext_core`, `Frame.nf_long`,
`Frame.nf_interval`, `exists_club_enum`, `filt_club`, `IsAEC.exists_filtration`, `IsAEC.comp_chain`,
`IsUnionOf.comp`.

**Next, after your check:** Prop 6.1.6 and Claims 6.1.7–6.1.11, in dependency order.

## Progress — tenth run, checkpoint: end of Section 6 (stopped for checking)

Build: both modules compile. `sorry` count in `Frames.lean`: 95 → 89.

**Proved:** Prop 6.1.6(b),(c),(d),(e),(f),(g). All depend on `sorry` only through the cited Prop 2.5.7.

**Not proved: Prop 6.1.6(a).** It is false as encoded, because of `IsRepresentation`; see section F. The
statement is unchanged and is left as `sorry` with `-- STUCK`, waiting for the author. The mathematical content
is proved as `Frame.leNF_iff_club`, for filtrations, and it is what items (b)–(g) use. No later statement in
the Lean files uses `prop_6_1_6_a`.

**Proof-stage change:** hypothesis `ℵ₀ ≤ λ` in Prop 6.1.6(b),(e),(f) (see "Proof-stage changes").

* Claims 6.1.7–6.1.11 are not separate Lean statements (section A.2). They are steps of
  `Frame.leNF_union_core`: 6.1.7 is `chn` with the union `Nn`; 6.1.8 and 6.1.11 are `hNF`; 6.1.9 is `Bc`; 6.1.10 is `BU`.
* The paper's Cases a and b are one setup with `h = min(ε, θ)`; they split only at the end.
* The paper's "without loss of generality `cf δ = δ`" is carried out in `Frame.leNF_union`: a continuous
  cofinal `g : cf δ → δ` built from a fundamental sequence.

**New AUX lemmas.** `ClubL` (def), `ClubL.of_isClub`, `ClubL.isClub_inter`, `sup_bdd`, `ClubL.diag`, `ClubL.inter`,
`exists_club_enum'`, `IsFilt` (def), `IsFilt.sub`, `IsFilt.le`, `IsAEC.exists_filt`, `Frame.nfhat_of_club`,
`Frame.nfhat_of_club_filt`, `Frame.leNF_of_club`, `Frame.nfhat_filt`, `Frame.club_of_leNF`, `Frame.leNF_iff_club`,
`Frame.leNF_refl`, `Frame.leNF_trans`, `IsFilt.club_sub`, `Frame.leNF_mid`, `Frame.nfhat_le`, `Frame.leNF_noMax`,
`IsFilt.cover`, `Frame.leNF_lst`, `ClubL.univ`, `ClubL.gt`, `ClubL.limits`, `ClubL.bInter`, `card_bUnion_le`,
`IsFilt.limClub`, `Frame.nf_column`, `Frame.leNF_union_core`, `Frame.leNF_union`, `Frame.leNF_iso`.

**Next, after your check:** the decision on `IsRepresentation`; then Section 7.

## Progress — Section 7, first batch; stopped, waiting for the author

Applied (author decisions A, B, C): Def 7.1.4 (continuity only of `N₀, N₁`), Prop 7.1.7 (`N₀ ∈ K_λ`), Def 7.1.11 (game). See section C.

**Proved:** Prop 7.1.6, Prop 7.1.7 (Claims 7.1.8 and 7.1.9 are inside it).
**New AUX lemmas:** `Frame.nf_iso`, `Frame.nf_top`, `Frame.prop_7_1_7_side`, `Frame.prop_7_1_7_fin`.
Proof of 7.1.7 renames `M_{n,1}` over `M_{0,1} ∪ M_{n,0}` (the paper's `g_n` is only over `M_{n,0}`).

**Resolved (author-approved, see section C).** `Frame.PlusWit` recorded only `Mₙ.carrier = ⋃ N_{n,α}`, not that
each `N_{n,α}` is a submodel of `Mₙ` (same point as `NFhat` and `IsRepresentation`). A permuted copy of `M₀` on the same
universe has the same witnesses, so `M₀' ≺⁺ M₁` holds while `M₀' ≼ M₁` fails: Prop 7.1.10(a) and Thm 7.1.13 are false as
encoded. Proposed fix: replace the two carrier equations by `IsUnionOf A (Iio λ⁺) M₀` and `IsUnionOf B (Iio λ⁺) M₁`.

**Axiom check.** `prop_7_1_6` uses only the standard axioms. `prop_7_1_7` compiles with no `sorry` of its own, but `#print axioms` shows `sorryAx`, inherited from earlier lemmas it uses (for example `Frame.thm_5_3_7_a`, `Frame.nf_trans2`, `thm_5_4_7`, `prop_5_3_9_4`). The root of that dependency has not been traced.


## Standing policy on changes (author's decision, 2026-11-09)

The agent may change definitions and statements when a proof requires it, provided the central statements of each section get proved. The agent chooses the central statements of each section and states the choice at the beginning of the section's progress notes. The justification of a change is that the central statements were proved with it.
1. Frozen: Thm 1.0.1, Thm 1.0.2 (with Thm 11.1.7). Central statements may change only if no other way exists; such a change goes in "Changes to review".
2. Every change is tagged (`PROOF-STAGE CHANGE`, `AGENT-CHOICE`) and logged with old statement, new statement, reason.
3. A change that adds a hypothesis or alters the meaning of a notion goes in "Changes to review", with a one-line argument of faithfulness to the paper's text.
4. Do not stop to ask about a change under this policy. Stop only if a central statement cannot be proved, and report the obstruction.
5. At the end of the whole formalization: a single document "Fidelity review": (a) dependency tree of the two main theorems down to every definition; (b) for each definition, the original text next to its Lean statement, flagged if changed; (c) `#print axioms` of each main theorem.

## Section 7: central statements (agent's choice)

Prop 7.1.12(a) (existence of `≺⁺`-extensions), Thm 7.1.13 (uniqueness), Prop 7.1.10, Cor 7.1.17, Thm 7.1.18. These are what the later sections and the main theorems use.

## Changes to review

| Where | Old | New | Why faithful to the paper's text |
|---|---|---|---|
| Def 7.1.4 (`PlusWit`) | all three sequences continuous | `N^⊕` only increasing | author-confirmed erratum; continuity of `N^⊕` makes the definition unsatisfiable |
| Def 7.1.4(a) (`PlusWit`) | equality of universes | `IsUnionOf` | the paper's `M_n = ⋃ N_{n,α}` is a union of structures |
| Prop 7.1.7 | no `N₀ ∈ K_λ` | `hN₀ : N₀ ∈ K_λ` | `NF` is a relation on `K_λ`; every use has `N₀ ∈ K_λ` |
| Def 7.1.11 (`IsPlay`, `Winning`) | see section C | strict moves of player 0, partial plays, guard `⋃ N_{0,α} ∈ K_{λ⁺}` | author-approved; the paper's relation `≺⁺` lives on `K_{λ⁺}` |
| Prop 7.1.12(a) | no `ℵ₀ ≤ λ` | `hinf : ℵ₀ ≤ λ` | as in Prop 6.1.6(b),(e),(f): the witnesses live in `K_λ` and the paper's cardinals are infinite |
| Prop 9.1.4, 9.1.5, 9.1.6 | no `ℵ₀ ≤ λ` | `hinf : ℵ₀ ≤ λ` | as in Prop 6.1.6; `λ^{+2}` must be a limit ordinal |
| Def 9.1.3 (`HasT`), Prop 9.1.5 | `M.carrier = ⋃ (M_α).carrier` | `IsUnionOf` | the paper's unions are unions of structures (same clarification as Def 7.1.4(a)) |
| Prop 8.1.3(a) | — | — | **moved to section C** (author-confirmed erratum, 2026-11-10) |
| Prop 8.1.3(b) | — | — | **moved to section C** (author-confirmed erratum, 2026-11-13; tag now `DEVIATION (author-confirmed erratum)`) |
| Prop 8.1.5 | no `ℵ₀ ≤ λ` | `hinf : ℵ₀ ≤ λ` | as in Prop 6.1.6 |
| Thm 2.6.8(1) | hypothesis `s.WeakLC lam` | hypotheses `s.Ax3c lam` and `ℵ₀ ≤ λ` | the paper's proof applies local character to `⟨M_n⟩⌢⟨M_ω⟩⌢⟨N_ω⟩`, which for weak local character needs `M_ω ≺* N_ω`; the paper does not provide it. The results of Sections 7–11 use it under Hypothesis 6.1.1, where local character holds. *Author (2026-11-13): the hypothesis is weak local character exactly as written. The step: Def 2.6.6(4) refers to Def 2.6.5, which as written needs the whole chain `⟨M_α : α ≤ α*+1⟩` `≺*`-increasing, including `M_ω ≺* N_ω`; l. 2634 shows only `M_ω ≼ N_ω`. Open: whether Def 2.6.5 is meant to require `≺*` for the last pair (`ERRATA.md` B.9 and item 4)* **Resolved (author, 2026-11-16):** Def 2.6.5 should not require `≺*` for the last pair; erratum of the definition (section C, "C.erratum Def 2.6.5"; `ERRATA.md` A.1.11). The Lean statement has not been changed yet. |
| Thm 9.1.7 | no `ℵ₀ ≤ λ` | `hinf : ℵ₀ ≤ λ` | as in Prop 9.1.4–9.1.6 |
| Prop 8.1.6 | no `ℵ₀ ≤ λ` | `hinf : ℵ₀ ≤ λ` | as in Prop 8.1.5 |
| Thm 9.1.7 (hypothesis) | `M*_α ≺⁺ M*_β ≼^NF M*_{λ⁺+1}` for all `α < β < λ⁺` | only `M*_α ≺⁺ M*_{α+1}` and `M*_β ≼^NF M*_{λ⁺+1}` | weaker hypothesis, stronger theorem (standing decision: strongest version); the paper's proof uses only these; needed because Prop 8.1.6 supplies only successors |
| Thm 9.1.13 | no `ℵ₀ ≤ λ`; (c) as in the paper | `hinf : ℵ₀ ≤ λ`; (c) in the Lean file: increasing continuous in `K^sat` with `≺⁺` only between consecutive models (this is the current Lean statement, not a reading of the paper) | `hinf`: as in Prop 9.1.4–9.1.6. (c): the paper's missing continuity is an author-confirmed erratum (`ERRATA.md` A.1.12; corrected (c) adds only "increasing continuous" and keeps all pairs, source [Sh:600, Claims 8.4–8.5]). The Lean (c) is weaker than the corrected text; not changed, waiting for the author (section F). |
| Prop 10.1.8 | no `ℵ₀ ≤ λ` | `hinf : ℵ₀ ≤ λ` | as in Thm 7.1.18(b) |
| Prop 10.1.4 | `M₀ ≼^NF M₁`, `M₀ ≼^NF M₂` | also `M₀, M₁, M₂ ∈ K^sat`, `ℵ₀ ≤ λ` | Def 10.1.3 defines `tp⁺(a, M₀, M₁)` only for `M₀, M₁ ∈ K^sat`; outside `(K^sat)^up` the `E`-class is a singleton and `⇐` fails |
| Prop 10.1.7(a) | — | `ℵ₀ ≤ λ` | as in Prop 10.1.8 |
| Prop 10.1.7(b) | — | `M₂, M₂' ∈ K^sat`, `ℵ₀ ≤ λ` | Def 10.1.6(2) has `M₂ ∈ K^sat` (representatives of `tp⁺` in `K^sat`); with a representative outside `K^sat` the right side is false |
| Def 10.1.5 (`resPlus`, encoding) | union over all representatives in `(K^sat)^up` | union over representatives with `M₁ ∈ K^sat` | the paper's `p ↾ N := tp(a, N, M₁)` takes `tp⁺(a, M₀, M₁)` with `M₀, M₁ ∈ K^sat` (Def 10.1.3); representatives outside `K` would add singleton classes |
| Thm 10.1.9, Prop 10.1.10–10.1.13 | — | ~~`K_λ ≠ ∅`~~ **withdrawn (2026-11-10)** | not needed: `Hyp_10_1_2` contains `ConjProp`, whose first clause is categoricity in `λ` (`numModels s.S lam = 1`, Def 2.5.5 l. 2093: "$K_\lambda$ is categorical"), so `K_λ ≠ ∅` is derived (`ConjProp.kc_nonempty`). The statements are back to the paper's hypotheses |
| Thm 11.1.1, Thm 1.0.1 (frozen), Thm 11.1.5 | — | ~~`K_λ ≠ ∅`~~ **withdrawn (2026-11-10)** | the earlier claim "false without it (`K = ∅`)" was wrong: `K = ∅` gives `I(λ, K) = 0 ≠ 1`, so hypothesis (1) (conjugation, which includes categoricity) fails. `K_λ ≠ ∅` is derived from `ConjProp`. **Thm 1.0.1 is again exactly the frozen statement.** |
| Prop 3.1.9 | — | `K_λ ≠ ∅` | **implicit assumption of the paper.** Needed (`K = ∅` satisfies Hypothesis 3.0.1, which has no categoricity, and refutes (1) `K_{λ⁺} ≠ ∅`). The paper never states `K_λ ≠ ∅` (search below); the proof (l. 3124–3126) "we can choose an increasing continuous sequence of models in $K_\lambda$" assumes a first model. Moved to Section 10 (proof uses later lemmas) |
| Cor 11.1.6 | `n < ω` | `0 < n` | for `n = 0` the conclusion asks for a good `λ`-frame from the semi-good `s` with vacuous (3); the paper's induction yields good frames only from `s¹ = s⁺` on (section F). `K_λ ≠ ∅` is **not** added: derived from conjugation |
| Thm 11.1.7 | — | no change | `K_λ ≠ ∅` derived from conjugation; the planned addition was not needed. Proved for all `n` including `n = 0, 1`, directly from `Frame.tower_spec` (the paper: "By Corollary 11.1.6") |
| Thm 1.0.2 (frozen) | (2) `I(λ^{+(2+m)}, K) < μ_unif(λ^{+(2+m)}, 2^{λ^{+(1+m)}})`, `μ_unif` a free parameter | also `hunif : ∀ m, μunif (λ^{+(2+m)}) (2^{λ^{+(1+m)}}) ≤ 2^{λ^{+(2+m)}}` | **frozen statement changed, please check.** `μ_unif` is defined only in the commented block l. 7977–8037 (Def l. 8012–8021); the added hypothesis is the commented Prop `unifleq` (l. 8023–8025: "For every $\mu$, $\mu_{unif}(\mu^+,2^\mu) \leq 2^{\mu^+}$", proof "Easy.") at `μ = λ^{+(1+m)}`. With it, (2) implies (2) of Thm 11.1.7, which is how the paper's text reads (the active Thm 11.1.7 has `2^{λ^{+(2+m)}}` with the `μ_unif` version commented out, l. 8101–8103). `K_λ ≠ ∅` not added (derived) *Provenance of `hunif`: see section F, row Thm 1.0.2 (open item, to be checked by the author at the end).* |
| Thm 7.1.18(b) | no `ℵ₀ ≤ λ` | `hinf : ℵ₀ ≤ λ` | reflexivity of `≼^NF` needs a model in `K_λ`, as in Prop 6.1.6(f) |


## Progress — end of Section 7 (2026-11-09)

**Proved (no `sorry` of their own):** Prop 7.1.5, 7.1.6, 7.1.7 (with Claims 7.1.8, 7.1.9), 7.1.10(a)–(d), 7.1.12(a)–(c), Thm 7.1.13(a)–(c) (with Claims 7.1.14–7.1.16), Cor 7.1.17(a)–(c), Thm 7.1.18(a)–(c).

**Remaining in Section 7:** Thm 7.1.3 only. Its statement sits in Section 7, but the paper proves it from Sections 8–9 (label `9.6`, "moved from Section 9"), so it belongs to that later work.

**Central statements:** all those chosen for Section 7 are proved, modulo the dependencies below.

**`#print axioms`:** only `prop_7_1_5` and `prop_7_1_6` are free of `sorryAx`. All the others inherit `sorryAx`. Across the whole file, exactly three statements still `sorry` are used by proved declarations: Prop 2.5.7 (`prop_2_5_7`, through `Frame.construction_318`), Thm 2.5.8(2) (`thm_2_5_8_2`, for 7.1.10(b) and 7.1.18(a)) and Thm 2.6.8(1) (`thm_2_6_8_1`, for 7.1.13).

**`sorry` count in `Frames.lean`:** 70: 44 before Section 7, 1 in Section 7, 25 in Sections 8–11.

**Gaps in the paper's proofs, repaired.**
* Prop 7.1.12(c): as written `N^⊕_δ = N_{1,δ}` at limits. The strategy now first picks `N^⊕_α ≽ N_{1,α}` realizing the tasks, then `N_{1,α+1}` with `NF(N_{0,α}, N^⊕_α, N_{0,α+1}, N_{1,α+1})` (`Frame.plus_step`).
* Prop 7.1.12(a),(b): "by c" does not control `N_{1,α} ∩ M₀`. Proved by a direct run with `D = M₀` (`Frame.IsRun`).
* Thm 7.1.13: requirement 4 is not needed as stored; requirement 1 is what Prop 7.1.7(c) uses. `(*)_{n,ε}` is encoded by `StarUq`.
* Cor 7.1.17(c): the paper's note covers `N ≼ N₀` only; the proof goes through a common `N' ⊇ N ∪ N₀`.

**New AUX lemmas (Section 7):** `Frame.nf_iso`, `Frame.nf_top`, `Frame.nf_mid`, `Frame.prop_7_1_7_side`, `Frame.prop_7_1_7_fin`, `Frame.PlusWit.filt`, `.real`, `.le_next`, `.reindex`, `tp_emb`, `Frame.realize_many`, `Frame.plus_step`, `exists_pair_ord`, `Frame.exists_en`, `mem_self_succ`, `mem_succ_self`, `Frame.plusTask`, `Frame.plusTask_spec`, `Frame.exists_plusG`, `Frame.IsPlusG`, `Frame.IsRun` (with `.congr`, `.of_lim`, `.ext_lim`, `.ext_succ`), `Frame.RunInv`, `inc_add_one`, `cont_add_one`, `chain_lim`, `Frame.run_inv`, `Frame.run_step`, `Frame.run_wit`, `union_card_succ`, `Frame.gameD`, `IsUnionOf.congr'`, `IsAEC.ext_one`, `StarUq`, `Frame.uq_step₁`, `Frame.uq_step₂`, `Frame.uq_step`, `Frame.UqInv`, `Frame.uq_chain`, `Frame.weakLC_of_semiGood`, `IsAEC.uq_pull`, `iso_of_left_inv`, `Frame.uq_star`, `Frame.uq_core`, `IsFilt.agree`, `Frame.uq_common`, `Frame.uq_finish`, `enumOrd_club`, `enumOrd_club_lim`, `Saturated.iso`, `ERel.eq_of_not_K3`, `Frame.nf_amalg`, `exists_cof_seq`, `IsFilt.saturated`, `Frame.sat_union_b`.

**Time and cost.** About one hour by the container clock (11:05 to 12:06 UTC). The agent has no access to token usage, so no cost estimate is given here; the `/cost` command in the session shows it.

**Next, after your check:** Prop 2.5.7, Thm 2.5.8(2), Thm 2.6.8(1) (the three statements the proved results rest on), or Section 8.


## Progress — Thm 2.5.8(2) and Thm 2.6.8(1)

Both proved; `#print axioms` shows only the standard axioms for each. Both were moved in the file to just before Section 7, since their proofs use later lemmas. Direct dependency scan: the only `sorry` statement used by a proved declaration is now Prop 2.5.7 (cited), through `Frame.construction_318`.

* Thm 2.5.8(2): direct proof (without going through (1)), `Frame.emb_into`, and `IsAEC.star_gen`.
* Thm 2.6.8(1): statement changed, see "Changes to review". The proof also adds `N_n ∩ M ⊆ M_{n+1}` to the paper's construction, which is needed to get `c ∉ M` (gap in the paper's proof). New AUX: `card_iUnion_small`, `IsAEC.nat_chain`.


## Progress — Section 8, batch 1

**Central statements of Section 8 (agent's choice):** Prop 8.1.3, 8.1.4, 8.1.6 (used for Thm 9.1.13).

**Proved:** Prop 8.1.3(a),(b), 8.1.4, 8.1.5. Changes are listed in "Changes to review". Prop 8.1.4 uses the cited Prop 1.0.31 (saturation = homogeneity), direction saturated ⇒ homogeneous, as in the paper.

**Remaining in Section 8:** Prop 8.1.6.


## Progress — Section 9, batch 1

**Central statements of Section 9 (agent's choice):** Thm 9.1.7, Thm 9.1.13.

**Proved:** Prop 9.1.4, 9.1.5, 9.1.6. Prop 9.1.6 uses `|S^{λ^{+2}}_{λ⁺}| = 2^{λ^{+2}}`, which the paper states without proof; it is proved here by an Ulam matrix (`exists_disjoint_stat`, AUX), so no FACT hypothesis was needed. **Deferred:** Prop 8.1.6 (double-array construction), Thm 9.1.7, Thm 9.1.13.


## Progress — checkpoint after Prop 9.1.6 (2026-11-09)

**`sorry` count in `Frames.lean`:** 61: 42 before Section 7, 1 in Section 7 (Thm 7.1.3), 1 in Section 8 (Prop 8.1.6), 2 in Section 9 (Thm 9.1.7, 9.1.13), 15 in Sections 10–11 and the main theorems.

**Dependencies on `sorry` of proved declarations (full scan):** only `prop_2_5_7` (cited, through `Frame.construction_318`) and `prop_1_0_31` (cited, through `Frame.ot_step`, used only in Prop 8.1.4). So every proved result of Sections 1–7 rests on `sorry` only through Prop 2.5.7.

**Next:** Thm 9.1.7, Prop 8.1.6, Thm 9.1.13, then Sections 10–11.


## Progress — Thm 9.1.7 (2026-11-09)

**Proved:** Thm 9.1.7 (added `ℵ₀ ≤ λ`, see "Changes to review"; paper gap repaired, see "Gaps in the paper's proofs"). The base `M_0 = M*_0` avoids citing Thm 1.0.32, so no new dependency on a cited result. New AUX: `exists_perm_ext`, `permModel` (with `_iso`, `_eq`, `_symm_iso`, `_symm`, `_symm'`), `ERel.perm`, `Frame.PlusWit.perm`, `Frame.ltPlus_iso`, `IsoOn.union`, `Frame.leNF_of_union`, `Frame.leNF_chain`, `Frame.plus_iso_chain`, `Frame.G97` (with `.congr`), `Frame.g97_chain`, `Frame.g97_step`.

**Next:** Prop 8.1.6, Thm 9.1.13, then Sections 10–11.


## Progress — Prop 8.1.6, Thm 9.1.13, Thm 7.1.3 (2026-11-09)

**Proved:** Prop 8.1.6, Thm 9.1.13 (a ⇔ b ⇔ c; item (c) restated, see section F), Thm 7.1.3 (moved after Thm 9.1.13). Thm 9.1.7's hypothesis was weakened to the successor case. All of Sections 7–9 are now proved. `#print axioms` of these shows `sorryAx` only through the earlier dependencies listed at the last checkpoint.

**Prop 8.1.6, how it is proved.** The paper's strategy `F` for the game is not used: its outputs cannot be fed back through the array without renaming. Instead the double array is built directly: at stage `t ↦ t + 1` the odd and even steps of the paper are merged, a temporary column is built by `Frame.plus_step` (`Frame.col_build`), with `a'_ε ∩ T_t = a_ε` replacing the rule for player 0, and is moved into `M₁*` by Prop 8.1.4. The witnesses of `≺⁺` come from `Frame.wit_of_data`.

**Gaps in the paper's proof of Prop 8.1.6:** clause 5 needs "isomorphic over" the strategy's output; the proof above avoids it. Cell `(α+1, α+1)` is `N_{α+1,α}` in the paper; here it also receives the new element and `N_{α+1} ∩ M₁*` (the even step). `M_0` need not be in `K^sat` (the paper notes this): the sequence is reindexed by `1+ε`.

**New AUX:** `Frame.col_build`, `Ar816`, `Frame.task816`, `Frame.Ar` (with `.congr`), `Frame.ar_step`, `Frame.wit_of_data`, `Frame.b_of_nonsmooth`, `Frame.c_of_b`.

**`sorry` count in `Frames.lean`:** 57 `declaration uses` warnings at that point (see the next section).


## Progress — Section 10 prerequisites (2026-11-09)

**Central statements of Section 10 (agent's choice):** Thm 10.1.9. Prop 10.1.8 and the items proved inside the proof of Thm 10.1.9 (10.1.10–10.1.13) serve it.

**Proved:** Prop 10.1.8 (added `ℵ₀ ≤ λ`, as in Thm 7.1.18(b)); Thm 2.6.8(4) and (5) (moved before Section 9, since their proofs use `exists_cof_seq` and `IsAEC.union_Kc`). New AUX: `IsAEC.approx_chain`, `Frame.sbsGe_of_notForkGe`.

**Build:** both modules build; 54 `declaration uses 'sorry'` warnings.

**Remaining in Sections 10–11:** Prop 10.1.4, 10.1.7(a),(b), Thm 10.1.9 with 10.1.10–10.1.13, Thm 11.1.1, 11.1.5, Cor 11.1.6, Thm 11.1.7, Thm 1.0.1, 1.0.2.

**Route for Prop 10.1.4 (corrected; an earlier version of this paragraph was wrong).** I first wrote that the first direction of Prop 10.1.4 needs `M ≼^up N ⇒ M ≼ N` for models of `(K^sat)^up` of any size. It does not. The paper's proof amalgamates once inside `K^sat` (Thm 7.1.18(c) = 7.8.c) and then uses `≼^NF ⊆ ≼`. Formally the `E`-chain of `((K^sat)^up, (≼^NF)^up)` passes through models of any size (erratum in Def 1.0.22), but `tp_eq_small`, applied to `S := (K^sat)^up` at `λ⁺`, reduces it to one `E*`-step inside `(K^up)_{λ⁺}`. Fact 1.0.18 (1),(4) give the hypotheses (AEC, `LST ≤ λ⁺`); (2),(3) bring everything back to `K^sat` and `≼^NF`. No directed-union lemma is needed.


## Progress — Section 10 (2026-11-09)

**Central statement of Section 10:** Thm 10.1.9 — **proved.** Also proved: Prop 10.1.4, 10.1.7(a),(b), 10.1.8, 10.1.10–10.1.13. Prop 10.1.4 uses Fact 1.0.18 exactly as stated (all models involved are in `K^sat`), through `tp_eq_small`; no widening of the cited fact was needed. Changes: see "Changes to review" (Def 10.1.5 encoding, `K^sat` hypotheses in 10.1.4/10.1.7(b), `K_λ ≠ ∅` in 10.1.9–10.1.13). Gaps repaired: see "Gaps in the paper's proofs".

**New AUX (Section 10):** `Room.succ`, `Frame.up_facts`, `Frame.emb_up_iff`, `Frame.tp_of_tpPlus`, `Frame.mem_of_notForkGe`, `Frame.up_small`, `Frame.splus_Kc`, `Frame.splus_ax012`, `Frame.notForkGe_wit`, `Frame.notForkGe_perm`, `Frame.notForkGe_iso`, `Frame.sbsGt_iso`, `Frame.up_common`, `Frame.sbsPlus_of_nf`, `Frame.splus_ax23`, `Frame.splus_ax3g`, `chain_cover`, `Frame.nfhat_dual`, `Frame.ext_one`, `Frame.splus_ax3df`, `Frame.splus_stab`, `Frame.nfhat_of_club_at`, `Frame.nfhat_of_club_filt_at`, `Frame.nfhat_trans`, `Frame.nfhat_perm`, `Frame.nfhat_small_le`, `Frame.notForkGe_of_notFork`, `Frame.splus_ax3e`, `Frame.exists_Kc_succ`, `Frame.hyp10_facts`.

**Build:** both modules build; 46 `declaration uses 'sorry'` warnings.

**Next:** Section 11 (Thm 11.1.1 = 1.0.1, 11.1.5, Cor 11.1.6, Thm 11.1.7 = 1.0.2).

**Documentation (author's request, no change of meaning):** the module docstring of `AEC.lean` now states that the ambient type `U` is not in the paper and describes `∩`, `−`, `IsSubstr` and `IsUnionOf` precisely; a disclosure item was added to "Standing instructions".


## Progress — Section 11, first batch (2026-11-09)

**Proved:** Thm 11.1.1 (1), (2), (3) (`Frame.thm_11_1_1_123`); Thm 11.1.5 from Thm 11.1.1 and the conjecture. Thm 11.1.1(2) (conjugation for `s⁺`) uses the cited Thm 1.0.32(1),(2). New AUX: `Frame.exists_Kc_plus2`, `Frame.splus_conj`, `Frame.thm_11_1_1_123`.

**Build:** both modules build; 45 `declaration uses 'sorry'` warnings. In Sections 10–11 and the main theorems: Thm 11.1.1 and Thm 1.0.1 (item (4) only), Cor 11.1.6, Thm 11.1.7, Thm 1.0.2.

**Blocked, waiting for the author.** Thm 11.1.1(4) (a model of cardinality `λ^{+3}`), Cor 11.1.6, Thm 11.1.7 and Thm 1.0.2 all apply the construction again to `s⁺`, whose class is `(K^sat)^up`. They need:
1. `(K^sat)^up ⊆ K` and `≼^up ⊆ ≼` on it. The paper asserts this in Section 2.1 ("`K⁺ ⊆ K` and `≼⁺ ↾ K⁺` is included in `≼ ↾ K⁺`, so `K_{λ^{+3}} ≠ ∅`") without proof. It is the closure of an AEC under unions of `≼`-directed systems, which Fact 1.0.18 as stated does not give (it compares only models of `K`). For Cor 11.1.6 / Thm 11.1.7 it also gives `I(λ^{+3}, (K^sat)^up) ≤ I(λ^{+3}, K)`, which is how hypothesis (2) passes to `s⁺`.
2. Prop 3.1.9(2) for `s⁺` (a semi-good `λ⁺`-frame), still `sorry` (it needs a version of Prop 3.1.8 along a `λ⁺`-chain, see the second run).

Question for the author: should item 1 be stated as a CITED fact (and if so, with which exact source), proved as an AUX lemma (a directed-union argument in `(K, ≼)`), or handled otherwise?


## Progress — Section 11, second batch (2026-11-09; stopped by the usage limit)

**Done:** `fact_1_0_18_up` (CITED, widened by the author; see "Cited results widened by the author") with `InUp.mono`, `LeUp.mono`, `Frame.up_sub`. Prop 3.1.9 proved (with `K_λ ≠ ∅`), via `Frame.construction_318_long` (Prop 3.1.8's construction along a `λ⁺`-chain), `Frame.noMax_succ`, `Frame.exists_Kc_plus2_of_noMax`. **Thm 11.1.1 and Thm 1.0.1 fully proved** (item (4) applies Prop 3.1.9 to `s⁺` and `K⁺ ⊆ K`). The tower `Frame.tower` (`sⁿ`) and its induction `Frame.tower_spec` are proved (with `plusN_succ`, `plusN_two`, `plusN_le`, `Room.iter`, `numModels_mono`).

**Remaining (next steps, in order):**
1. Cor 11.1.6 from `Frame.tower_spec` and Prop 3.1.9 for `sⁿ`. As written it is not provable for `n = 0` (it asks for a good `λ`-frame, but `s⁰ = s` is only semi-good); plan: add `0 < n` (log in section F and "Changes to review"), and `K_λ ≠ ∅`.
2. Thm 11.1.7: `n = 0, 1` from `K_λ ≠ ∅` / `Frame.exists_Kc_succ`; `n + 2` from `Frame.tower_spec n` and Prop 3.1.9 for `sⁿ` plus `Frame.tower_spec`'s inclusion in `K`. Needs `K_λ ≠ ∅` (false without it).
3. Thm 1.0.2: `μ_unif` is defined only inside a `\begin{comment}` block (with "Prop unifleq: `μ_unif(μ⁺,2^μ) ≤ 2^{μ⁺}`"), so here it is a free parameter and the statement is not provable. Plan: add `μunif(λ^{+(2+m)}, 2^{λ^{+(1+m)}}) ≤ 2^{λ^{+(2+m)}}` (content of the commented proposition) and `K_λ ≠ ∅`, then derive from Thm 11.1.7. Frozen statement: to be logged in "Changes to review".


## Progress — Section 11 completed: Cor 11.1.6, Thm 11.1.7, Thm 1.0.2 (2026-11-10)

**State at the start of this run.** Both modules built (0 errors, 43 `declaration uses 'sorry'` warnings); the three remaining Section 11 statements (`cor_11_1_6`, `thm_11_1_7`, `thm_1_0_2`) were the only `sorry`s after line 20900. Everything listed under "Done" in the previous batch was present and compiled, so the previous batch was complete; only its next steps were left.

**Search of the paper for `K_λ ≠ ∅` (author's request).** Def 2.1.1 (l. 1145–1211) and Def 2.1.3 (l. 1232–1242) contain no nonemptiness clause. The Introduction (`\section*{Introduction}` l. 323–480, `\section{Introduction}` l. 487–545) and the abstract (l. 283–317) do not state it either. The nearest sentences are:
* l. 1081–1083 (Section 2.1, "The plan"): "It is easy to prove that $K_{\lambda^+} \neq \emptyset$ [How? We choose $M_\alpha$ by induction on $\alpha<\lambda^+$ such that $M_\alpha \prec M_{\alpha+1}$ …" (assumes a first model, does not assert one exists);
* l. 1102–1106: "In this way we obtain semi-good $\lambda^{+n}$-frame for each $n \in \omega$, assuming the existence of a semi-good $\lambda$-frame. In particular, we conclude that $K_{\lambda^{+n}}$ is not empty for each $n \in \omega$." (again presupposes `K_λ ≠ ∅`);
* l. 450–452 (Introduction): "We replace the stability assumption by the almost stability assumption, categoricity in $\lambda$ and the conjugation property."
* l. 2093 (Def 2.5.5, conjugation property): "$K_\lambda$ is categorical and if $M_1,M_2 \in K_\lambda$ …".

**Conclusion.** `K_λ ≠ ∅` is not stated as such, but it is *derivable* wherever the conjugation property is assumed: `ConjProp` encodes "`K_λ` is categorical" as `numModels s.S lam = 1`, which gives a model (new AUX `ConjProp.kc_nonempty`). By the standing rule "if a fact can be derived from a definition, derive it", it was not added to Cor 11.1.6, Thm 11.1.7, Thm 1.0.2, and the earlier additions to Thm 10.1.9, Prop 10.1.10–10.1.13, Thm 11.1.1, Thm 11.1.5 and the frozen Thm 1.0.1 were **removed** (derived instead). Only Prop 3.1.9 keeps `K_λ ≠ ∅`: it lives under Hypothesis 3.0.1 (l. 2791–2793), which has no categoricity; recorded there as an implicit assumption of the paper (see "Changes to review").

**Proved:**
* Cor 11.1.6 (with `0 < n`, see section F and "Changes to review"): `sⁿ := Frame.tower s λ n`; good, `Kⁿ ⊆ K`, `≤ⁿ ⊆ ≼`, conjugation from `Frame.tower_spec`; the model of cardinality `λ^{+(2+n)}` from Prop 3.1.9(2) for `sⁿ`.
* Thm 11.1.7, as stated (no added hypothesis), for every `n` (including `0, 1`), directly from `Frame.tower_spec`.
* Thm 1.0.2 (with `hunif`, see "Changes to review"): from Thm 11.1.7, since `I(…) < μunif(…) ≤ 2^{λ^{+(2+m)}}`. *(2026-11-16: proved from the hypothesis `hunif`, which is assumed, not proved; see section F.)*

**New AUX:** `ConjProp.kc_nonempty`.

**Build:** both modules build, 0 errors; 40 `declaration uses 'sorry'` warnings (was 43), none in Sections 10–11 or the main theorems. **Sections 10 and 11 are complete; all four main theorems (1.0.1, 1.0.2, 11.1.1, 11.1.7) are proved.**

**`#print axioms`:** `thm_1_0_1`, `thm_1_0_2`, `thm_11_1_7`, `cor_11_1_6` show `[propext, sorryAx, Classical.choice, Quot.sound]`; `ConjProp.kc_nonempty` only the standard three. Direct scan of the remaining `sorry` statements that are used by other declarations: exactly six, all CITED: `fact_1_0_18`, `fact_1_0_18_up` (widened by the author), `prop_1_0_31`, `thm_1_0_32_1`, `thm_1_0_32_2`, `prop_2_5_7`. So the main theorems rest on `sorry` only through cited results.

**Next:** the final "Fidelity review" document (Standing policy, item 5), after the author's check of the "Changes to review" rows for Cor 11.1.6 and Thm 1.0.2 and the withdrawn `K_λ ≠ ∅` rows. Prop 6.1.6(a) still waits for the decision on `IsRepresentation`.


## Progress — Prop 6.1.6(a) and the cited results as hypotheses (2026-11-10)

### Prop 6.1.6(a)
Author's decision applied: `IsRepresentation` (Def 1.0.29, `AEC.lean`) gets the clause `∀ α < ‖M‖, IsSubstr (Ms α) M`, tagged `-- PROOF-STAGE CHANGE:` (a clarification of the encoding: in the paper `M = ⋃ M_α` is a union of structures; not an erratum). The docstring keeps the original text. `prop_6_1_6_a` is proved from `Frame.leNF_iff_club` with the new AUX `IsRepresentation.isFilt` (a representation of `M ∈ K_{λ⁺}` is a filtration); `ℵ₀ ≤ λ` comes from `K_λ ≠ ∅` (`ConjProp.kc_nonempty`, since `Hyp_6_1_1` contains the conjugation property) and `Frame.aleph0_le`. The `-- STUCK` tag is removed. Section F's row on Prop 6.1.6(a) is resolved.

### Cited results: `structure CitedResults`
Each of the six cited results that some proof uses is now a `def … : Prop` with the same binders and conclusion as the former theorem, universally closed over `U`, `L` (`Fact_1_0_18`, `Fact_1_0_18_up`, `Prop_1_0_31`, `Thm_1_0_32_1`, `Thm_1_0_32_2`, `Prop_2_5_7`). Each keeps its docstring with the original text and its `-- CITED` / `-- PROOF-STAGE CHANGE` / `-- AGENT-CHOICE` comments. They are collected in `class CitedResults : Prop` (in `Frames.lean`, right after `Prop_2_5_7`), with one field per result (`fact_1_0_18`, `fact_1_0_18_up`, `prop_1_0_31`, `thm_1_0_32_1`, `thm_1_0_32_2`, `prop_2_5_7`). Each field's docstring gives the source:

| field | source |
|---|---|
| `fact_1_0_18` | [Sh:h].II Lemma 1.23 (paper l. 715: "Fact [Lemma 1.23 in \cite{shh}.II]"); `K ≠ ∅` added (section F) |
| `fact_1_0_18_up` | [Sh:h].II Lemma 1.23, clauses (i), (ii) confirmed by the author ("Cited results widened by the author") |
| `prop_1_0_31` | [Sh:h].II Lemma 1.14 (l. 919: "By Lemma 1.14 in \cite{shh}.II") |
| `thm_1_0_32_1`, `thm_1_0_32_2` | [Sh:h].II Lemma 1.14 (l. 981: "It is proved as Lemma 1.14 in \cite{shh}.II") |
| `prop_2_5_7` | [Sh:h].II Claim 2.16 (l. 2226: "By Claim 2.16 in \cite{shh}.II"); hypothesis weakened by the author's decision |

**The parameter.** Every theorem that uses a cited result, directly or through other theorems, takes the parameter `[C : CitedResults.{u}]`: 155 theorems (154 found by a scan of the compiled dependency graph, plus `prop_6_1_6_a`, whose new proof uses `Frame.leNF_iff_club`). The 8 direct call sites use the fields (`C.prop_2_5_7 …`, etc.). No definition depends on a cited result, so no definition changed. Apart from the extra parameter, all statements and docstrings are unchanged.

*Choice of binder (please check).* The parameter is instance-implicit (`[C : CitedResults]`), not explicit (`(C : CitedResults)`). The meaning is the same: an explicit hypothesis, visible in each signature and in `#print axioms`, assumed by every dependent theorem. The difference is only that Lean passes it on automatically, so none of the hundreds of call sites changed. With an explicit binder, every call (many written with dot notation, `hS.foo …`) would need `C` inserted by hand. `CitedResults` is a `class` (a `structure` that can be passed this way). If you prefer the explicit binder, it can be switched mechanically.

**Build (after both tasks):** both modules build, 0 errors; 33 `declaration uses 'sorry'` warnings, exactly the statements that no proof uses (all removed in the cleanup below).

### Cleanup: no `sorry` in the published files (author's decision, 2026-11-10)
* The 33 statements that still ended in `sorry` were all checked to be unused: a scan of the compiled dependency graph of both modules found no declaration using any of them. All 33 were removed from `Frames.lean`; they are listed, with the paper reference, the paper's wording (quoted with line numbers) and the reason, in `UNPROVED_STATEMENTS.md` (4 cited, 5 schematic, 20 outside the closure, 4 not attempted). The four cited ones (Thm 2.3.7, Thm 2.3.8, Lemma 2.4.2, Prop 2.5.6) leave a one-line `-- CITED, not used by any proof (removed): …` comment. Nothing remaining used a removed statement, so nothing had to be reported instead.
* The module docstring of `AEC.lean` no longer says "every proof is `sorry`".
* **Final build:** 0 errors, **0** `declaration uses 'sorry'` warnings. The 882 remaining warnings are all lint/style (293 long lines, 228 deprecations, `show`-tactic and unused-variable notes). A scan of all constants of the two modules finds no use of `sorryAx`.
* **`#print axioms` (final):**
  ```
  'SemiGoodFrames.thm_1_0_1' depends on axioms: [propext, Classical.choice, Quot.sound]
  'SemiGoodFrames.thm_1_0_2' depends on axioms: [propext, Classical.choice, Quot.sound]
  'SemiGoodFrames.thm_11_1_1' depends on axioms: [propext, Classical.choice, Quot.sound]
  'SemiGoodFrames.thm_11_1_7' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```
  (Also `cor_11_1_6`, `prop_6_1_6_a`: the same three.) The cited results enter only through the parameter `[C : CitedResults]` in each signature.
* Definitions that only removed statements used (e.g. `ExtLogic`, `Hyp23`, `KMSys`, `finDefFrame`) are still in the files; see the end of `UNPROVED_STATEMENTS.md`.

**Fidelity review:** `FIDELITY_REVIEW.md`, generated from the compiled dependency graph: (a) the tree of the 69 paper statements used by the proofs of Thm 1.0.1, 1.0.2, 11.1.1, 11.1.7 (AUX lemmas contracted) and the 145 definitions their statements depend on (110 in the main statements); (b) for each definition, the paper's LaTeX (by item number, with line numbers) next to the Lean source, with flags taken from the tags in the code; a summary table of the 11 items whose meaning differs from the paper; (c) `#print axioms`. Flags come from the code's tags, so an untagged change would show as "unchanged".

**Next:** the author's review of `FIDELITY_REVIEW.md` and of "Changes to review". *(Binder: the author chose `[C : CitedResults]`, 2026-11-10.)*


## Progress — erratum Prop 8.1.3(a); the `≼^⊗` statements of Section 8 (2026-11-10)

**Author's decisions applied.** (1) Binder: keep `[C : CitedResults]` (recorded in "Author's standing decisions").
(2) Prop 8.1.3(a): the omission of `M₁ ∈ K^sat` and `M₀ ≠ M₁` is an author-confirmed erratum. The tag on
`prop_8_1_3_a` is now `-- DEVIATION (author-confirmed erratum):`, the docstring keeps the original text, and the item
moved from "Changes to review" to section C ("C.erratum Prop 8.1.3(a)"). The statement and proof are unchanged.

**Repair.** At the start of this run, `Frames.lean` did not contain `prop_8_1_3_a`. Its declaration had been
replaced by four lines of plain text (the author's instructions for this run, pasted into the file), so the file
did not compile. The theorem was restored from the previous version (identical statement and proof), with the new
tag. Apart from that, the working tree differed from the last commit only by trailing whitespace (two lines).

### Section 8: statements that mention `≼^⊗` (Def 8.1.2, `Frame.leOt`)

Def 8.1.2 (l. 6755–6760): "$\preceq^{\otimes}_{\lambda^+}:=\{(M_0,M_1):M_0,M_1 \in K^{sat}$, $M_0 \prec M_1$ and
[realization clause]\}". The Lean definition `Frame.leOt` has all three clauses. Only a statement that *concludes*
`≼^⊗` can omit one of them. A statement that *assumes* `≼^⊗` gets all of them from the hypothesis.

| statement | role of `≼^⊗` | paper's wording | Lean | omission? |
|---|---|---|---|---|
| Prop 8.1.3(a) `prop_8_1_3_a` | conclusion | l. 6766–6767: "If $M_0 \in K^{sat}$ and $M_0 \preceq^{NF}_{\lambda^+} M_1$, then $M_0 \preceq^{\otimes}_{\lambda^+} M_1$." | added `hk₁ : M₁ ∈ K^sat`, `hne : M₀ ≠ M₁` | **yes**: author-confirmed erratum (section C) |
| Prop 8.1.3(b) `prop_8_1_3_b` | conclusion | l. 6767–6772: "If $\langle M_\epsilon:\epsilon \leq \delta \rangle$ is a $\preceq^{NF}_{\lambda^+}$-increasing continuous sequence of models in $K^{sat}$ and for every $\epsilon \in \delta,\ M_\epsilon \preceq^{NF}_{\lambda^+}M_{\delta+1}$, then $M_\delta \preceq^{\otimes}_{\lambda^+} M_{\delta+1}$." | added `hsat₁ : M_{δ+1} ∈ K^sat`, `hne : M_δ ≠ M_{δ+1}` (tag `-- PROOF-STAGE CHANGE:`, in place since Section 8, batch 1) | **yes, the same omission.** "in $K^{sat}$" covers only `ε ≤ δ`, not `M_{δ+1}`. Neither clause follows from the hypotheses: with `M_{δ+1} := M_δ` all hypotheses hold (`M_ε ≼^NF M_δ` by the chain), and the conclusion `M_δ ≺ M_δ` fails. The paper's proof shows only the realization clause. **Author-confirmed erratum (2026-11-13)**; tag now `DEVIATION (author-confirmed erratum)` (section C) |
| Prop 8.1.4 `prop_8_1_4` | hypothesis (1) | l. 6875–6876: "Suppose (1) $M_0 \preceq^{\otimes}_{\lambda^+}M_1$. …" | `h : s.leOt lam M₀ M₁` | no: nothing added |
| Prop 8.1.5 `prop_8_1_5` | — | l. 6991–6996 (LST for pairs) | — | does not mention `≼^⊗` |
| Prop 8.1.6 `prop_8_1_6` | hypothesis | l. 7021–7023: "If $M_1^* \preceq^{\otimes}_{\lambda^+} M_2^*$, then …" | `h : s.leOt lam M₁s M₂s` (plus `ℵ₀ ≤ λ`, unrelated, already in "Changes to review") | no |

*Outside Section 8 (for completeness).* Thm 9.1.13(b) (l. 7483–7485: "There are $M^*_1,M^*_2 \in K^{sat}$ such that
$M^*_1 \preceq^\otimes M^*_2$ but $M^*_1 \nprec^{NF} M^*_2$") is formalized with `Frame.leOt` as written; no omission. The
only use of Prop 8.1.3(b) in the paper is `a ⇒ b` of Thm 9.1.13 (l. 7495). In Lean it is used twice (in the AUX
`Frame.b_of_nonsmooth` and in the proof of `thm_9_1_13`), and both uses supply the two extra hypotheses: the upper model is in `K^sat` by construction, and
`M_δ ≠ M_{δ+1}` because `M_δ ⋠^NF M_{δ+1}` while `≼^NF` is reflexive on `K^sat`. Prop 8.1.3(a) has no use in the paper
or in Lean. It is outside the closure of the main theorems, but it is proved.

### Completion of this run (2026-11-11; the previous session was interrupted by a container crash)
* **Checked as already done:** item 1. `prop_8_1_3_a` is tagged `-- DEVIATION (author-confirmed erratum):`, keeps the original text in its docstring, and is in section C. The check of the other `≼^⊗` statements is in the table above: only Prop 8.1.3(b) has the same omission. It is still tagged `PROOF-STAGE CHANGE` until the author confirms it.
* **Item 2:** the module docstring of `AEC.lean` now opens the paragraph on `U` with the exact text: "The ambient type `U` does NOT appear in the paper. It is an encoding device of this formalization; it is not needed mathematically. The theorems quantify over every `U` satisfying `Room U lam`, so they do not depend on the choice of `U`." The reason (`M ∩ N`, `N − M`, unions of chains, no direct limits) follows in parentheses. Only a comment changed.
* **Item 3: `FIDELITY_REVIEW.md` regenerated** from a fresh dependency dump (1014 constants, no `sorryAx` user). The summary table now lists every flagged item, not only the definitions of the tree: the main theorems, all definitions (in the tree or not), and all paper statements (in the tree or not). The column *where* gives the case. It has **58 rows** (was 11), among them `prop_8_1_3_a` (deviation, outside the tree), `prop_8_1_3_b` (proof-stage change, in the tree) and `IsRepresentation` (proof-stage change, definition outside the tree). Sections (a), (b), (c) are unchanged except for line numbers.
* **Build:** both modules, 0 errors, **0** `declaration uses 'sorry'` warnings (948 lint/style warnings). **`#print axioms`** of `thm_1_0_1`, `thm_1_0_2`, `thm_11_1_1`, `thm_11_1_7`: unchanged, `[propext, Classical.choice, Quot.sound]` each (identical to `AXIOMS_CHECK.txt`).
* **Waiting for the author:** confirm Prop 8.1.3(b) as an erratum (see the table above and "Changes to review"). *(Resolved 2026-11-13: confirmed; section C.)*

## Progress — `ERRATA.md` for publication (2026-11-11)
`ERRATA.md` (audience: a reader of the paper; no Lean terminology) collects section C, section D and the
"Changes to review" rows. Part B also uses "Gaps in the paper's proofs". Each item has the place (item number, .tex lines), the
original text, the correction and a plain-mathematics reason. Parts: A errata (A.1 substance, A.2 misprints),
B gaps in proofs, C implicit assumptions, and "To be confirmed by the author" (Prop 8.1.3(b), Thm 9.1.13(c),
Prop 3.1.10 `θ^a < λ⁺`, Thm 2.6.8(1), Prop 5.4.3(2), Prop 5.5.3 use / Prop 3.1.10(8)). Not included: the
encoding clarifications (unions of structures in Def 6.1.2, 7.1.4(a), 9.1.3, Prop 9.1.5, Def 1.0.29;
Def 10.1.5 `resPlus`), the withdrawn `K_λ ≠ ∅` rows, and the "Proof-stage changes" table, which was not among the requested sources.

## Progress — assessment of the infinitary statements of Sections 2.3–2.4 (2026-11-11)
An internal assessment (not published) covers Props 2.3.4, 2.3.5, 2.3.9, 2.3.10, Thms 2.3.7, 2.3.8, Lemma 2.4.2, Prop 2.4.5 and
Claim 2.4.8. For each it gives the statement, whether it is proved or cited, the logic it uses, what Lean would need
to state it, and a difficulty class; then a summary table and a recommendation. Mathlib was checked: it has only
finitary first-order logic (`BoundedFormula.iInf` needs `[Finite β]`), and no infinitary logic, Scott sentences or PC
classes. The three findings are recorded in "Findings to review (not yet confirmed)" (R1–R3) and in `ERRATA.md`
("To be confirmed by the author", items 7–9). The coding sketch for R1 is in an internal note (not published). Important
for R3: Thm 2.3.8 as written must not become a field of `CitedResults` (the class would be unsatisfiable). No Lean file
was changed.

## Progress — author's answers to items 3–6 of "To be confirmed by the author" (2026-11-13)
Documentation only; no Lean file changed.
* **Item 3 (Prop 3.1.10).** Not an erratum. `θ^a < λ⁺` is reclassified as a restriction of the formalized statement:
  `ERRATA.md` C.9 (new), and the note at "C.deviation Prop 3.1.10" in section C here. The Lean tag
  `-- DEVIATION (author-confirmed):` on `prop_3_1_10` is now out of date; it was left unchanged.
* **Item 4 (Thm 2.6.8(1)).** The step is explained in `ERRATA.md` B.9: the proof applies Def 2.6.5 to a chain whose
  last pair is shown only to satisfy `M_ω ≼ N_ω`. Kept as a proposed gap (B), pending the author's reading of Def 2.6.5.
* **Item 5 (Prop 5.4.3(2)).** Resolved: an erratum of the paper (author-confirmed: closure under isomorphisms is
  the author's convention, not written in the paper). Recorded in section C ("C.erratum Def 5.4.2 and Prop 5.4.3")
  and in `ERRATA.md` A.1.7.
* **Item 6.** Kept as proposed, marked "not reviewed by the author", here (Gaps section) and in `ERRATA.md`.

## Progress — Prop 8.1.3(b) confirmed as an erratum (2026-11-13)
The author confirmed that part (b) has the same omission as (a). On `prop_8_1_3_b` the comment tag `-- PROOF-STAGE CHANGE:`
became `-- DEVIATION (author-confirmed erratum):` (text kept), and the docstring now quotes the original text, as for (a).
Comment text only; the statement and proof are unchanged. Recorded with (a) in section C and in `ERRATA.md` A.1.10; item 1
of "To be confirmed by the author" is resolved. `FIDELITY_REVIEW.md` regenerated.

## Progress — Def 2.6.5 erratum; confirmation-status field in `ERRATA.md` (2026-11-16)
Documentation only; no Lean file changed, no git command run.
* **Item 4 (Thm 2.6.8(1)) resolved by the author:** an erratum of Def 2.6.5 (class A), not a gap in the proof (class B).
  Recorded in section C ("C.erratum Def 2.6.5") and in `ERRATA.md` A.1.11. `ERRATA.md` B.9 is withdrawn (kept as a
  pointer to A.1.11); item 4 of "To be confirmed by the author" is marked "Resolved (author, 2026-11-16)". The row
  "Thm 2.6.8(1)" of "Changes to review" carries the resolution. The Lean files still follow the original Def 2.6.5,
  and `thm_2_6_8_1` still assumes local character (see the section C entry).
* **Field "Status of confirmation"** added to every entry of `ERRATA.md` parts A and C, with one of three values:
  "confirmed by the author and checked against sources", "confirmed by the author from his own understanding, not
  checked against other sources", "not confirmed". The notes nowhere say that an earlier confirmation was made from
  memory or by reasoning, so no old entry got the second value: every entry marked confirmed/approved reads "to be
  filled in by the author" and is listed in the table at the end of `ERRATA.md` (A.1.1–A.1.10, A.2.1–A.2.5, C.1, C.4,
  C.9). A.1.11: second value. C.2, C.3, C.5, C.6, C.7: not confirmed. C.8 (Thm 1.0.2, `μ_unif`): not confirmed; the
  author supplied the definition of `μ_unif` from [Sh:88r] (his screenshot), which shows that the definition itself is
  accurate; the hypothesis `hunif` (the commented-out Prop "unifleq") is still to be checked by the author. (Superseded in part by the next entry: provenance of `hunif`.) *(Correction 2026-11-25: the definition first used was the one of the tex comment block, not the one of [Sh:88r]; the statement that the screenshot showed it accurate was wrong. See the entry of 2026-11-25.)*
* `FIDELITY_REVIEW.md` was not regenerated.

## Progress — provenance of the hypothesis `hunif` of `thm_1_0_2` (2026-11-16)
Documentation only; no Lean file changed, no rebuild. The provenance note on `hunif` is recorded once in each file: `ERRATA.md` C.8 (item 10 of "To be confirmed by the author" points to it), section F here (row Thm 1.0.2;
the "Changes to review" row points to it), and `FIDELITY_REVIEW.md` (the note after the Lean statement of Thm 1.0.2;
the summary row points to it). The `FIDELITY_REVIEW.md` note is manual and must be carried over if the file is
regenerated.

## Progress — Thm 9.1.13(c): erratum A.1.12 (continuity) (2026-11-16)
Documentation only; no Lean file changed, no rebuild, no commit.
* `ERRATA.md` A.1.12 (new): Thm 9.1.13(c) is incomplete as written: "increasing continuous" is added to the sequence; the
  rest of (c) is unchanged (not weakened to successor pairs). Status of confirmation: confirmed by the author and
  cross-checked against [Sh:600, Claims 8.4–8.5], with the caveat on `K^nice`/`≤*`/`<⁺` vs `K^sat`/`≼^NF` and the
  limit-ζ case being a hypothesis in Sh:600.
* `ERRATA.md` item 2 of "To be confirmed by the author": resolved by A.1.12 (latest version only); the `≺⁺` for
  non-consecutive pairs (limit ζ) in `b ⇒ c` remains open (proposed B). B.5 now points to A.1.12.
* Section F here: update and the Lean check of `thm_9_1_13` (c) (continuity included; `≺⁺` at limit ζ neither proved,
  assumed nor cited: not in the statement). "Changes to review" row updated.
* `FIDELITY_REVIEW.md` not changed (its row only quotes the Lean tag).

## Progress — `μ_unif` from [Sh:88r]; `muUnif_le` proved (2026-11-25)
* **Definition.** AUX `muUnif` (`Frames.lean`) now follows [Sh:88r] as written (author's screenshot; section 1 of
  `MUUNIF_DEFINITION.md`, confirmed by the author 2026-11-25): `μ_unif(λ⁺, χ)` is the first `μ` with
  `⟨c_α : α < μ⟩`, `c_α : ^{λ⁺>}(λ⁺) → χ`, such that no `ρ ∈ ^{λ⁺}χ` has, for every `α`, an `η ∈ ^{λ⁺}(λ⁺)` with
  `{δ < λ : c_α(η ↾ δ) ≠ ρ(δ)}` stationary in `λ`. [Sh:88r] has `δ < λ`; the formalization follows it as written
  (stationary in `λ.ord`, via `IsStationaryIn`). Encoding: `muUnif κ χ` with `κ = λ⁺`; `λ` is existentially
  quantified with `succ λ = κ` (unique); for non-successor `κ` the value is the junk `0`.
* **Earlier error.** The first `muUnif` (and the approval of it) used the definition from the commented-out tex
  block (l. 8012–8021), not [Sh:88r]. That definition is kept only as a note (`MUUNIF_DEFINITION.md` §5);
  equivalence with [Sh:88r] not checked.
* **Inequality.** AUX `muUnif_le : ℵ₀ ≤ λ → muUnif (succ λ) (2^λ) ≤ 2^{succ λ}`, proved: for each `ρ` let
  `c_ρ(ν) := ρ(length ν)`; then the set in (b) is empty for the index `ρ`, hence not stationary in `λ` (`λ` infinite,
  so a limit ordinal); the family has size `(2^λ)^{λ⁺} = 2^{λ⁺}`. The claim that it is easy: personal communication
  from Prof. Saharon Shelah.
* **Theorem 1.0.2.** `thm_1_0_2` unchanged; it keeps `hunif`. AUX `thm_1_0_2_muUnif` (with `muUnif`, no `hunif`).
* **Discrepancy (not used by `hunif`).** The screenshot of [Sh:88r]: `μ_unif(λ⁺, 2^λ) = 2^λ` for `λ ≥ ℶ_ω`. The tex
  comment (l. 8030–8034): `μ_unif(μ⁺, 2^μ) = 2^{μ⁺}` for `μ ≥ ℶ_ω`. Only the upper bound is used.
* `ERRATA.md` C.8, item 10 and the closing table updated. `FIDELITY_REVIEW.md` not regenerated.
* Build: `lake build NonForkingFrames.Frames` succeeded (exit 0, Frames only); no `sorry`; `#print axioms` for `muUnif`, `muUnif_le`, `thm_1_0_2_muUnif`: `[propext, Classical.choice, Quot.sound]`.

## Progress — Thm 9.1.13(c): gap B.10 (2026-11-25)
Documentation only; no Lean file changed, no rebuild. `ERRATA.md`: new B.10; A.1.12 and item 2 of "To be confirmed by
the author" point to it. Section F here: decision note under "Thm 9.1.13(c)". `FIDELITY_REVIEW.md`: manual pointer to
B.10 in the summary row of Thm 9.1.13 (must be carried over if the file is regenerated).

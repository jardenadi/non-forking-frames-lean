# Method

This note explains how the formalization was made and how its fidelity to the paper was
checked. The paper is A. Jarden and S. Shelah, "Non-forking frames in abstract elementary
classes", Ann. Pure Appl. Logic 164 (2013), 135–191; the text formalized is arXiv:0901.0852v2.
The formalization was written by an LLM agent (Claude) working with the first author of the
paper. The author reviewed the main theorems and the definitions they depend on, and decided
every question of interpretation that was put to him.

## Two stages: statements first, then proofs

**Stage 1 (statements).**
* Every definition and every statement of the paper was written in Lean, with all proofs left
  as `sorry`. Each one has a docstring with its number in the compiled paper. Where the Lean
  wording departs from the paper, the docstring also quotes the original text.
* The author's own fidelity check covered the main theorems and the definitions they depend
  on (see [`FIDELITY_REVIEW.md`](FIDELITY_REVIEW.md)). The agent checked the other statements.
  Questions of interpretation were put to the author, who decided them.
* Where a statement is false or incomplete as written, it was not silently corrected. The
  problem was reported, and the author decided the correction (an erratum of the paper) or the
  reading. These decisions are in [`ERRATA.md`](ERRATA.md).

**Stage 2 (proofs).**
* The proofs mostly follow the paper's proofs; where a different route was taken, this is
  noted in the source. Auxiliary lemmas that are not in the paper have docstrings starting
  `AUX: not in paper`.
* From 2026-11-09 the change policy was widened (author's decision). Only the main theorems
  (Thm 1.0.1, 1.0.2, 11.1.1, 11.1.7) stayed frozen. Other statements and definitions could be
  changed when a proof needed it, for example to add a missing hypothesis.
* Each change is tagged in the source (see below) and listed in
  [`FIDELITY_REVIEW.md`](FIDELITY_REVIEW.md). The author reviewed the changes that affect the
  dependency tree of the main theorems.
* At the end, statements that were still unproved and that no proof uses were removed. They are
  listed, with the reason, in [`UNPROVED_STATEMENTS.md`](UNPROVED_STATEMENTS.md).
* The final files contain no `sorry`, no added axiom and no `native_decide`.

## Tags in the Lean source

Every place where the formalization departs from the literal text of the paper carries a
comment tag next to the declaration, with the reason.

* `PROOF-STAGE CHANGE`: a statement or definition was changed during Stage 2, typically
  by adding a hypothesis that the paper leaves implicit (for example `ℵ₀ ≤ λ`).
* `DEVIATION (author-confirmed erratum)` / `DEVIATION (typo fixed to evident intent)`: the
  paper's text is wrong, and the author confirmed the correction.
* `DEVIATION (encoding)` / `ENCODING`: a modelling device with no mathematical content (see
  "The ambient type `U`" below).
* `AGENT-CHOICE`: the paper is ambiguous or leaves something undefined, and the agent chose a
  reading. For example, `μ_unif` in Thm 1.0.2 is a parameter of `thm_1_0_2`.
* `CITED`: a result that the paper cites and does not prove (see `CitedResults` below).

The summary table of [`FIDELITY_REVIEW.md`](FIDELITY_REVIEW.md) lists every tagged definition and
statement with its tag lines. It is generated from the source and was checked against it.

## How fidelity was checked

1. [`FIDELITY_REVIEW.md`](FIDELITY_REVIEW.md) contains:
   * the dependency tree of the main theorems down to every definition, computed from the
     compiled terms rather than from the paper's references;
   * each definition next to the original text of the paper;
   * the tagged items.
2. `NonForkingFrames/MainStatements.lean` restates each main theorem in full as an `example`. It
   checks the restatement against the proved theorem with reducible transparency, so a
   restatement that differs from the real statement does not compile. It also prints the
   definitions the statements use.
3. `#print axioms` of the main theorems shows only `propext`, `Classical.choice` and `Quot.sound`
   ([`AXIOMS_CHECK.txt`](AXIOMS_CHECK.txt)). This rules out hidden `sorry`s and added axioms.

## Cited results: `CitedResults`

The paper uses results from other papers without proving them, mainly from [Sh:h].II. They are
not proved here and no axiom is added for them. Each one is stated as a `Prop`, and together they
are the fields of the class `CitedResults` (in `Frames.lean`):
* Fact 1.0.18 (and a form widened by the author);
* Prop 1.0.31;
* Thm 1.0.32(1),(2);
* Prop 2.5.7.

Every theorem that uses one of them, directly or indirectly, takes `[CitedResults]` as an
explicit hypothesis. Where a cited result is used in a slightly different form from the one the
paper quotes, the field's docstring says so.

## The ambient type `U`

Every model is a structure whose universe is a subset of one fixed type `U`. Theorems that
involve a cardinal `λ` take the hypothesis `Room U λ` (`#U` is a strong limit cardinal above
`λ`), so that every model the paper builds has copies inside `U`.

The agent introduced `U` and `Room U λ` without first asking the author, and the author found
them only during the fidelity check. This shows why a fidelity check by a human is needed: an
encoding choice made silently can change what the theorems say. If, for example, every model
were a substructure of one fixed structure, this would give amalgamation, which the paper does
not assume.

In the end `U` is only an encoding device. The type carries no structure, and two models need
not agree on their intersection. It only makes `M ⊆ N`, `M ∩ N`, `N - M` and unions of chains
literal, as in the paper. See [`ERRATA.md`](ERRATA.md), D.1.

## Main decisions (details in `ERRATA.md`)

* **Errata of substance** (A.1): among them
  * Def 1.0.22 (`E*`);
  * Conjecture 11.1.4 (the cardinal);
  * Def 2.6.5 (weak local character);
  * Def 7.1.4 and 7.1.11 (`≺⁺` and its game);
  * Prop 8.1.3;
  * Thm 9.1.13(c) (continuity).
* **Misprints** (A.2), with their evident readings.
* **Gaps in proofs** (B). The statement is right, but the argument does not give it as written;
  each entry says how the gap was closed. B.10 is the one gap left open: `≺⁺` for
  non-consecutive pairs in Thm 9.1.13(c). The Lean statement of (c) is restricted to what is
  proved.
* **Implicit assumptions made explicit** (C), for example `λ` infinite (C.3).
* **Thm 1.0.2 and `μ_unif`** (C.8). The paper's active text does not define `μ_unif`.
  `thm_1_0_2` takes it as a parameter, with the added hypothesis `hunif`. `thm_1_0_2_muUnif` uses
  the definition of [Sh:88r], which the author confirmed, and proves `hunif` for it (see
  [`MUUNIF_DEFINITION.md`](MUUNIF_DEFINITION.md)).
* **A restriction of a formalized statement** (C.9: Prop 3.1.10 with `θ^a < λ⁺`).
* **Scope.** Sections 2.3–2.4 are formalized only as definitions; nothing in the main theorems
  depends on them. Questions and open problems are not formalized.

Each entry of `ERRATA.md` records its status of confirmation by the author.

# Non-forking frames in abstract elementary classes: a Lean 4 formalization

A formalization of
A. Jarden and S. Shelah, "Non-forking frames in abstract elementary classes",
Ann. Pure Appl. Logic 164 (2013), no. 3, 135-191.

The text formalized is the arXiv source, arXiv:0901.0852v2 (listed on arXiv as
"Good Frames With A Weak Stability"; the source carries the published title).
Differences between the arXiv source and the printed version were not checked.

## Building

The project uses Lean `v4.34.1` (see `lean-toolchain`) and Mathlib `v4.34.1`, pinned to commit
`d13f23b723b8a846827a245b89c10fc7d3f11612` (see `lakefile.toml` and `lake-manifest.json`).
With [elan](https://github.com/leanprover/elan) installed:

```
lake exe cache get   # download the compiled Mathlib
lake build
```

The build has no errors and no `sorry`. The remaining warnings come from linters (style, long
lines, unused variables).

## Where to look

* `NonForkingFrames/MainStatements.lean`: **the main statements, written out in full.** Each main
  theorem (Thm 1.0.1, Thm 1.0.2, and Thm 1.0.2 with `μ_unif` as in [Sh:88r]) is restated as an
  `example` and checked against the proved theorem with reducible transparency. If a written
  statement differs from the proved one, the file does not compile. The definitions behind the
  statements are shown with `#print`, grouped by topic.
* `NonForkingFrames/AEC.lean`: the general infrastructure (models, AECs, embeddings, chains,
  amalgamation, Galois types, saturation). Its module comment explains the numbering and the
  encoding conventions.
* `NonForkingFrames/Frames.lean`: frames and every statement and proof of the paper, Sections
  1–11. Lean names follow the paper's numbering (one shared counter per subsection), for example
  `thm_7_1_13` or `prop_2_5_6`.
* `docs/`: the documentation (see below).

## What the formalization assumes beyond the paper

* **Cited results.** The results that the paper cites from other papers and does not prove are
  not proved here. They are the fields of the class `CitedResults` (in `Frames.lean`):
  * Fact 1.0.18 and a widened form of it;
  * Prop 1.0.31;
  * Thm 1.0.32(1),(2);
  * Prop 2.5.7.

  All are from [Sh:h].II. Every theorem that uses one of them, directly or indirectly, takes
  `[CitedResults]` as an explicit hypothesis, visible in its statement.
* **Added hypotheses and errata.** Where a statement of the paper is false or incomplete as
  written, the formalization states the corrected version. Each such change is tagged in the Lean
  source (`PROOF-STAGE CHANGE`, `DEVIATION`, `AGENT-CHOICE`). The list is in
  [`docs/ERRATA.md`](docs/ERRATA.md):
  * A: errata, i.e. statements false or incomplete as written;
  * B: gaps in proofs;
  * C: implicit assumptions made explicit;
  * D: remarks on the formalization.

  Several errata are hypotheses that the author regarded as obvious and did not write.
* **The ambient type `U`.** Every model is a structure whose universe is a subset of one fixed
  type `U`. `U` carries no structure, and the structures of two models need not agree on their
  intersection. This makes `M ⊆ N`, `M ∩ N`, `N - M` and unions of chains literal. Theorems that
  involve a cardinal `λ` take the encoding hypothesis `Room U λ`: `#U` is a strong limit above
  `λ`, so `U` has room for every model the paper constructs. This is an encoding device, not a
  hypothesis of the paper (see `docs/ERRATA.md`, D.1).

## Scope

* Sections 2.3–2.4 are not formalized beyond their definitions. These sections contain
  statements in infinitary logic and the example of transitive partial orders. Their
  definitions are in `Frames.lean`, with the external logic as an uninterpreted parameter
  `ExtLogic`. Their statements were removed (see `docs/UNPROVED_STATEMENTS.md`). Nothing in the
  main theorems depends on these sections.
* Statements that were not proved and that no proof uses were removed. They are listed with the
  reason in [`docs/UNPROVED_STATEMENTS.md`](docs/UNPROVED_STATEMENTS.md).
* Questions and open problems of the paper are not formalized.

## Axioms

`#print axioms` of the main theorems shows only `propext`, `Classical.choice` and `Quot.sound`
(see [`docs/AXIOMS_CHECK.txt`](docs/AXIOMS_CHECK.txt)). There is no `sorry`, no added axiom, and
no `native_decide`.

## Documentation (`docs/`)

* `ERRATA.md`: errata, gaps, implicit assumptions and remarks, each with its status of
  confirmation by the author.
* `FIDELITY_REVIEW.md`: the dependency tree of the main theorems; every definition next to the
  original text of the paper; the tagged items.
* `METHOD.md`: how the formalization was made and checked (the two stages, the tags, the
  fidelity checks, `CitedResults`, the ambient type `U`, the main decisions).
* `UNPROVED_STATEMENTS.md`: the statements removed from the Lean files.
* `MUUNIF_DEFINITION.md`: the definition of `μ_unif` used for Thm 1.0.2, from [Sh:88r].
* `AXIOMS_CHECK.txt`: the output of `#print axioms`.

Line numbers of the form "l. N" in the docs refer to the LaTeX source of arXiv:0901.0852v2
(available from arXiv); the source is not included here.

## License

Apache License 2.0; see `LICENSE`. Copyright 2026 Adi Jarden.

# Fidelity review: Jarden–Shelah, "Non-forking frames in AECs" (semi-good frames)

**Source.** This formalization follows the arXiv version of the paper: A. Jarden and S. Shelah, "Good Frames With A Weak Stability", arXiv:0901.0852v2. Published version: A. Jarden and S. Shelah, "Non-forking frames in abstract elementary classes", Ann. Pure Appl. Logic 164 (2013), no. 3, 135–191. The two versions may differ; the differences were not checked. *(Added manually 2026-11-26; carry over if the file is regenerated.)*

Generated 2026-11-13 from the compiled Lean files (`NonForkingFrames/AEC.lean`, `Frames.lean`) and the paper source (arXiv:0901.0852v2) (active text only; `\begin{comment}` blocks and `%` comments removed). Dependencies come from the compiled terms (`getUsedConstants`), not from the paper's references. Item numbers are the compiled paper's (one shared counter per subsection); line numbers refer to the `.tex` file.

Standing policy, item 5: (a) dependency tree of the main theorems down to every definition; (b) for each definition, the original text next to its Lean statement, flagged if changed; (c) `#print axioms` of each main theorem.

**Flags.** *changed in the proof stage*: a `-- PROOF-STAGE CHANGE:` comment (logged in NOTES.md, "Proof-stage changes" / "Changes to review"); *deviation*: an author-confirmed erratum or a typo fixed to evident intent (NOTES.md sections C, D); *encoding*: a modelling device with no mathematical content (ambient type `U`, `Room`, `ExtLogic`, …); *agent reading*: a reading chosen by the agent (NOTES.md section E); *cited*: a result the paper cites, assumed through `CitedResults`; *unchanged*: none of these tags.

## (c) `#print axioms` of the main theorems

```
'SemiGoodFrames.thm_1_0_1' depends on axioms: [propext, Classical.choice, Quot.sound]
'SemiGoodFrames.thm_1_0_2' depends on axioms: [propext, Classical.choice, Quot.sound]
'SemiGoodFrames.thm_11_1_1' depends on axioms: [propext, Classical.choice, Quot.sound]
'SemiGoodFrames.thm_11_1_7' depends on axioms: [propext, Classical.choice, Quot.sound]
```

No declaration of either module uses `sorryAx` (scan of all constants). The cited results enter only through the parameter `[C : CitedResults]` of each dependent theorem, visible in its signature.

## Summary: items whose meaning differs from the paper

Listed: every definition (in the tree or not) and every paper statement (theorem, proposition, corollary, claim, …) of either file that is tagged *changed in the proof stage* or *deviation*. The column *where* says whether the item is a main statement, enters the statements of the main theorems, is another item of the dependency tree (a), is a paper statement outside the tree (not used by the proofs of the main theorems), or is a definition outside the tree (used by no statement of the tree). *Encoding* and *agent reading* items are listed in (a.2) and shown in full in (b). Each change is also logged, with old / new / reason, in NOTES.md ("Proof-stage changes", "Changes to review", sections C, D, F).

| item | Lean | where | tag lines |
|---|---|---|---|
| Def 1.0.3 | `KSys.AxSmooth` (AEC.lean:235) | main statements | -- PROOF-STAGE CHANGE: added `N' ∈ S.K` (the union is in the class). Without it Remark |
| Def 1.0.22 | `typePool` (AEC.lean:374) | main statements | -- DEVIATION (author-confirmed erratum): the paper has `N₂ ∈ K_λ`; the author confirmed that |
| Def 1.0.29 | `IsRepresentation` (AEC.lean:440) | definition outside the tree | -- PROOF-STAGE CHANGE: added the last clause `∀ α < ‖M‖, M_α ⊆ M` (each `M_α` is a submodel of |
| Prop 1.0.23 | `prop_1_0_23_2` (Frames.lean:168) | paper statement outside the tree | -- PROOF-STAGE CHANGE: symmetry is stated for triples `t = (M, N₀, a)` with `‖N₀‖ < #U`. The |
| Prop 1.0.30 | `prop_1_0_30` (Frames.lean:340) | paper statement in the tree | -- PROOF-STAGE CHANGE: hypothesis `ℵ₀ ≤ λ` added. For finite `λ` the ordinal `λ⁺` has no club, so |
| Def 2.1.1 | `Frame.Ax3a` (Frames.lean:578) | main statements | -- PROOF-STAGE CHANGE: the presupposition `M₀ ≼ M₁ ≼ M₃` (needed for `tp(a, Mₙ, M₃)` to be a |
| Def 2.1.1 | `Frame.Ax3b` (Frames.lean:591) | main statements | -- PROOF-STAGE CHANGE: added `M₃** ∈ K_λ`. Without it 3(b) contradicts 3(a) (which puts every |
| Prop 2.1.2 | `prop_2_1_2` (Frames.lean:758) | paper statement in the tree | -- DEVIATION (author decision Q3): hypotheses (0)(a) AEC, (1)(b) AP, (3)(a), (3)(b). |
| Def 2.2.2 | `trivialFrame` (Frames.lean:928) | definition outside the tree | -- PROOF-STAGE CHANGE: the quadruples of the trivial ⨿ also satisfy `M₀ ≼ M₁ ≼ M₃` (the |
| Prop 2.5.7 | `Prop_2_5_7` (Frames.lean:1278) | main statements | -- PROOF-STAGE CHANGE (author decision): hypothesis weakened from `s.IsSemiGood lam` (original: |
| Def 2.6.1 | `Frame.nfGe` (Frames.lean:1336) | main statements | -- DEVIATION (author-confirmed erratum): clause (3) as written ("for each `N ∈ K_λ`, |
| Remark 2.6.7 | `rem_2_6_7` (Frames.lean:1430) | paper statement outside the tree | -- PROOF-STAGE CHANGE: hypothesis `R ⊆ ≼` strengthened to `R ⊆ ≺` (as in Def 2.6.6(2)). With |
| Thm 3.2.3 | `thm_3_2_3_2` (Frames.lean:2256) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `hM : M ∈ K_λ` (implicit in the paper, where `S^bs(M)` is only |
| Prop 3.2.5 | `prop_3_2_5` (Frames.lean:2622) | paper statement in the tree | -- DEVIATION (author-confirmed erratum): added `α* < λ⁺` and `M₀ ∈ K_λ`. As written, the statement |
| Prop 4.1.12 | `prop_4_1_12_2` (Frames.lean:3653) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `hM : M ∈ K_λ` (implicit in the paper, where `S^bs(M)` is only |
| Prop 5.2.2 | `prop_5_2_2` (Frames.lean:3746) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `M₃ ∈ K_λ` in item (2). Without it the direction `⊗_R → (2)` |
| Thm 5.3.7 | `thm_5_3_7` (Frames.lean:4236) | paper statement outside the tree | -- DEVIATION (author-confirmed erratum): part (c). The paper omits "`tp(a, N₀, N₁)` is basic" and |
| Prop 5.3.8 | `prop_5_3_8` (Frames.lean:4256) | paper statement in the tree | -- DEVIATION (author-confirmed erratum): added `α* < λ⁺` and `M_{a,0}, M_{b,0} ∈ K_λ`. As written,<br>-- DEVIATION (author-confirmed: α* ≠ 0 omitted in the paper): added `0 < α*`. |
| Prop 5.3.9 | `prop_5_3_9_1` (Frames.lean:4453) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `hne`. For `N₁ = N₀` a witness has length `0`, which forces |
| Prop 5.3.9 | `prop_5_3_9_2` (Frames.lean:4532) | paper statement in the tree | -- DEVIATION (typo fixed to evident intent): the paper's `NF*(M₁, N₁, M₂, N₃)` has base `M₁`; |
| Prop 5.3.9 | `prop_5_3_9_3` (Frames.lean:4577) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `M₃* ∈ K_λ`; `NF` is a relation on `K_λ` (Def 5.3.2), so the |
| Def 5.4.1 | `OtMinus` (Frames.lean:4675) | other statements of the tree | -- PROOF-STAGE CHANGE: added `M₄ ∈ K_λ` (`R ⊆ ⁴(K_λ)` in the paper); without it clause (3) is |
| Def 5.4.2 | `Frame.NFuqE` (Frames.lean:5079) | definition outside the tree | -- DEVIATION (author-confirmed erratum): the element `a` is explicit and the conditions of Def |
| Prop 5.4.3 | `prop_5_4_3` (Frames.lean:5217) | paper statement outside the tree | -- DEVIATION (author-confirmed erratum): (1) is for `NF^uq` with `a` explicit (`OtMinusE`, in which |
| Prop 5.4.4 | `prop_5_4_4` (Frames.lean:5392) | paper statement in the tree | -- DEVIATION (typo fixed to evident intent): the paper compares `(f^a_{α*}, id, N^a_{2,α*})` with<br>-- PROOF-STAGE CHANGE: `α ≤ α*` instead of `α < α*`, and the hypotheses `hf0`, `hfai`, `hfbi`. |
| Prop 3.1.10 | `prop_3_1_10` (Frames.lean:5937) | paper statement outside the tree | -- DEVIATION (author-confirmed): added `θ^a < λ⁺`. The paper has no bound on `θ^a`. The use in |
| Thm 5.5.1 | `thm_5_5_1` (Frames.lean:7975) | paper statement outside the tree | -- DEVIATION (author-confirmed: α* ≠ 0 omitted in the paper): added `0 < α*`. |
| Prop 6.1.6 | `prop_6_1_6_b` (Frames.lean:10475) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`. Reflexivity needs a model in `K_λ`; for finite `λ` it can |
| Prop 6.1.6 | `prop_6_1_6_e` (Frames.lean:10505) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`; false for finite `λ` (see NOTES.md, "Proof-stage changes"). |
| Prop 6.1.6 | `prop_6_1_6_f` (Frames.lean:10513) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, used by reflexivity (item (b)); see NOTES.md, |
| Thm 2.5.8 | `thm_2_5_8_2` (Frames.lean:10996) | paper statement in the tree | -- DEVIATION (author decision Q4): (0)(a) AEC and (0)(b) `LST ≤ λ` added (`h0`); the proof of |
| Thm 2.6.8 | `thm_2_6_8_1` (Frames.lean:11203) | paper statement in the tree | -- PROOF-STAGE CHANGE: hypothesis `s.WeakLC lam` replaced by local character `s.Ax3c lam`, and `ℵ₀ ≤ λ` added. |
| Def 7.1.4 | `Frame.PlusWit` (Frames.lean:11416) | other statements of the tree | -- PROOF-STAGE CHANGE: continuity is required only of `⟨N_{0,α}⟩` and `⟨N_{1,α}⟩`; `⟨N^⊕_{1,α}⟩` is<br>-- DEVIATION (author-confirmed erratum): the paper requires all three sequences to be increasing<br>-- PROOF-STAGE CHANGE: ENCODING (clarification, author-confirmed; not an erratum): clause (a) |
| Prop 7.1.7 | `prop_7_1_7` (Frames.lean:11755) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `N₀ ∈ K_λ` (`hN₀`, author-approved). The paper leaves it implicit; the |
| Def 7.1.11 | `Frame.IsPlay` (Frames.lean:11983) | definition outside the tree | -- PROOF-STAGE CHANGE (author-approved): plays may be partial (length `γ`), and player 0 must move |
| Def 7.1.11 | `Frame.Winning` (Frames.lean:12004) | definition outside the tree | -- PROOF-STAGE CHANGE (author-approved): (1) legality of player 1 is required at every stage of |
| Prop 7.1.12 | `prop_7_1_12_a` (Frames.lean:12730) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `hinf : ℵ₀ ≤ λ`. For finite `λ` with `K_λ = ∅` the statement fails, since |
| Thm 7.1.18 | `thm_7_1_18_b` (Frames.lean:14587) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, used by reflexivity (as in Prop 6.1.6(f)). |
| Prop 8.1.3 | `prop_8_1_3_a` (Frames.lean:14783) | paper statement outside the tree | -- DEVIATION (author-confirmed erratum): added `M₁ ∈ K^sat` and `M₀ ≠ M₁`. Def 8.1.2 requires both |
| Prop 8.1.3 | `prop_8_1_3_b` (Frames.lean:14796) | paper statement in the tree | -- DEVIATION (author-confirmed erratum): added `M_{δ+1} ∈ K^sat` and `M_δ ≠ M_{δ+1}`, as in (a). |
| Prop 8.1.5 | `prop_8_1_5` (Frames.lean:15482) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 6.1.6(b),(e),(f). |
| Prop 8.1.6 | `prop_8_1_6` (Frames.lean:16602) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 8.1.5. |
| Def 9.1.3 | `Frame.HasT` (Frames.lean:17442) | other statements of the tree | -- PROOF-STAGE CHANGE: ENCODING (clarification): union of structures, hence `IsUnionOf`. |
| Prop 9.1.4 | `prop_9_1_4` (Frames.lean:17453) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 6.1.6. |
| Prop 9.1.5 | `prop_9_1_5` (Frames.lean:17495) | paper statement in the tree | -- DEVIATION (typo fixed to evident intent): the paper defines `M̄² := ⟨M_{α,1} : α < λ^{+2}⟩`;<br>-- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 6.1.6.<br>-- PROOF-STAGE CHANGE: ENCODING (clarification): unions of structures, hence `IsUnionOf`. With equality of |
| Prop 9.1.6 | `prop_9_1_6` (Frames.lean:17702) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 6.1.6. |
| Thm 9.1.7 | `thm_9_1_7` (Frames.lean:18095) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 9.1.4–9.1.6 (`λ^{+2}` must be a limit ordinal).<br>-- PROOF-STAGE CHANGE: hypothesis weakened to its successor case (the paper has |
| Thm 9.1.13 | `thm_9_1_13` (Frames.lean:18336) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 9.1.4–9.1.6.<br>-- PROOF-STAGE CHANGE: item (c) restated; see NOTES.md, "Changes to review". The paper's text<br>*Note (2026-11-25, manual):* the pairs other than consecutive ones are the gap `ERRATA.md` B.10 (limit ζ needs continuity of `≺⁺`, not formalized; ζ = λ⁺+1 closable by replacing the top model, [Sh:600] 8.5). Lean (c) unchanged; (a) ⇔ (b) ⇔ (c) fully proved for it. |
| Def 10.1.5 | `Frame.resPlus` (Frames.lean:18463) | definition outside the tree | -- PROOF-STAGE CHANGE: ENCODING: the union runs over representatives with `M₁ ∈ K^sat` (Def 10.1.3 |
| Prop 10.1.8 | `prop_10_1_8` (Frames.lean:18492) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Thm 7.1.18(b). |
| Prop 10.1.4 | `prop_10_1_4` (Frames.lean:18542) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `M₀, M₁, M₂ ∈ K^sat`; Def 10.1.3 defines `tp⁺(a, M₀, M₁)` only for<br>-- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 10.1.8. |
| Prop 10.1.7 | `prop_10_1_7_a` (Frames.lean:18648) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `ℵ₀ ≤ λ`, as in Prop 10.1.8. |
| Prop 10.1.7 | `prop_10_1_7_b` (Frames.lean:18659) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `M₂, M₂' ∈ K^sat` (Def 10.1.6(2) has `M₂ ∈ K^sat`: the representing |
| Prop 3.1.9 | `prop_3_1_9` (Frames.lean:20702) | paper statement in the tree | -- PROOF-STAGE CHANGE: added `K_λ ≠ ∅`; false without it (`K = ∅` gives `K_{λ⁺} = ∅`). The paper's |
| Conjecture 11.1.4 | `Conjecture_11_1_4` (Frames.lean:20846) | main statements | -- DEVIATION (author-confirmed erratum): the paper has "WDmId(λ⁺) is not saturated in λ⁺"; the |
| Thm 11.1.5 | `thm_11_1_5` (Frames.lean:21189) | paper statement outside the tree | -- DEVIATION (typo fixed to evident intent): conclusion (1) names the frame |
| Cor 11.1.6 | `cor_11_1_6` (Frames.lean:21213) | paper statement outside the tree | -- PROOF-STAGE CHANGE: added `0 < n`. For `n = 0` the conclusion asks for a good `λ`-frame, |
| Thm 1.0.2 | `thm_1_0_2` (Frames.lean:21278) | main statement | -- PROOF-STAGE CHANGE: added `hunif`: `μ_unif(λ^{+(2+m)}, 2^{λ^{+(1+m)}}) ≤ 2^{λ^{+(2+m)}}` for<br>*Note (2026-11-16, manual):* provenance of `hunif`: see the note under Thm 1.0.2 below. |

## Main theorems: paper text and Lean statement

### Thm 1.0.1: `thm_1_0_1` (Frames.lean:21261) — flags: unchanged

Paper (l. 492–512):

```latex
\begin{theorem}
\label{11.0} Suppose:
\begin{enumerate}
\item $\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a semi-good
$\lambda$-frame with conjugation. \item $K^{3,uq}$ is dense with
respect to $\preceq_{bs}$. \item
$I(\lambda^{+2},K)<2^{\lambda^{+2}}$.
\end{enumerate}
Then
\begin{enumerate}
\item There is a good $\lambda^+$-frame
$\frak{s}^+=((K^{sat},\preceq^{NF}_{\lambda^+}\restriction
K^{sat})^{up},S^{bs,+},\dnf^+)$, such that $K^{sat} \subseteq
K_{\lambda^+}$ and the relation
$\preceq^{NF}_{\lambda^+}\restriction K^{sat}$ is included in the
relation $\preceq \restriction K^{sat}$. \item $\frak{s}^+$
satisfies the conjugation property. \item There is a model in $K$
of cardinality $\lambda^{+2}$. \item There is a model in $K$ of
cardinality $\lambda^{+3}$.
\end{enumerate}
\end{theorem}
```

Lean:

```lean
/-- Thm 1.0.1 (stated in Section 1; proved as Thm 11.1.1, same statement). -/
theorem thm_1_0_1 [C : CitedResults.{u}] (lam : Cardinal.{u}) (hU : Room U lam) (s : Frame U L)
    (h1 : s.IsSemiGood lam ∧ ConjProp s lam) (h2 : s.Dense lam (s.K3uq lam))
    (h3 : numModels s.S (plusN lam 2) < 2 ^ (plusN lam 2)) :
    ((s.splus lam).IsGood (Order.succ lam) ∧ s.Ksat lam ⊆ s.S.Kc (Order.succ lam) ∧
      ∀ M ∈ s.Ksat lam, ∀ N ∈ s.Ksat lam, s.leNF lam M N → s.S.le M N) ∧
    ConjProp (s.splus lam) (Order.succ lam) ∧
    (s.S.Kc (plusN lam 2)).Nonempty ∧ (s.S.Kc (plusN lam 3)).Nonempty := by
  -- `K_λ ≠ ∅` comes from categoricity in `λ`, part of the conjugation property (Def 2.5.5).
  exact Frame.thm_11_1_1_123 hU h1 h2 h3 h1.2.kc_nonempty
```

### Thm 1.0.2: `thm_1_0_2` (Frames.lean:21278) — flags: **changed in the proof stage**, agent reading

Paper (l. 519–531):

```latex
\begin{theorem} \label{11.2omega}
Suppose:
\begin{enumerate}
\item $\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a semi-good
$\lambda$-frame with conjugation. \item $m<\omega \Rightarrow
I(\lambda^{+(2+m)},K)<\mu_{unif}(\lambda^{+(2+m)},2^{\lambda^{+(1+m)}})$.
\item $2^{\lambda^{+m}}<2^{\lambda^{+m+1}}$ and for every
$m<\omega$, $WDmId(\lambda^{+1+m})$ is not saturated in
$\lambda^{+(2+m)}$. \item Conjecture \ref{the uniqueness triples conjecture}.
\end{enumerate}
Then there is a model in $K^n$ of cardinality $\lambda^{+n}$ for
every $n<\omega$.
\end{theorem}
```

Lean:

```lean
-- AGENT-CHOICE (reading): `μ_unif` is not defined in the paper; it is a parameter `μunif`. As in
-- Thm 11.1.7, the first `m` in (3) is read as "for every m", and "a model in Kⁿ" as "a model in
-- K" (`Kⁿ` is not defined in the statement).
/-- Thm 1.0.2: suppose (1) `s` is a semi-good `λ`-frame with conjugation,
(2) `I(λ^{+(2+m)}, K) < μ_unif(λ^{+(2+m)}, 2^{λ^{+(1+m)}})` for `m < ω`, (3) `2^{λ^{+m}} <
2^{λ^{+m+1}}` and `WDmId(λ^{+1+m})` is not saturated in `λ^{+(2+m)}` for every `m < ω`,
(4) Conjecture 11.1.4. Then there is a model of cardinality `λ^{+n}` for every `n < ω`. -/
theorem thm_1_0_2 [C : CitedResults.{u}] (lam : Cardinal.{u}) (hU : Room U lam) (s : Frame U L)
    (μunif : Cardinal.{u} → Cardinal.{u} → Cardinal.{u})
    (h1 : s.IsSemiGood lam ∧ ConjProp s lam)
    (h2 : ∀ m : ℕ, numModels s.S (plusN lam (2 + m)) < μunif (plusN lam (2 + m))
      (2 ^ (plusN lam (1 + m))))
    -- PROOF-STAGE CHANGE: added `hunif`: `μ_unif(λ^{+(2+m)}, 2^{λ^{+(1+m)}}) ≤ 2^{λ^{+(2+m)}}` for
    -- every `m`. `μ_unif` is defined only inside a `\begin{comment}` block of Section 11, together
    -- with Prop `unifleq`: "For every μ, μ_unif(μ⁺, 2^μ) ≤ 2^{μ⁺}" (proof: "Easy."). The hypothesis
    -- is that proposition at `μ = λ^{+(1+m)}`. Without it `μunif` is an arbitrary function and (2)
    -- says nothing; with it (2) implies hypothesis (2) of Thm 11.1.7.
    (hunif : ∀ m : ℕ, μunif (plusN lam (2 + m)) (2 ^ (plusN lam (1 + m))) ≤
      2 ^ (plusN lam (2 + m)))
    (h3 : (∀ m : ℕ, (2 : Cardinal.{u}) ^ (plusN lam m) < 2 ^ (plusN lam (m + 1))) ∧
      ∀ m : ℕ, NotSaturatedIn (WDmId (plusN lam (1 + m))) (plusN lam (1 + m)) (plusN lam (2 + m)))
    (h4 : Conjecture_11_1_4.{u}) :
    ∀ n : ℕ, (s.S.Kc (plusN lam n)).Nonempty :=
  thm_11_1_7 lam hU s h1 (fun m => (h2 m).trans_le (hunif m)) h3 h4
```

**Note on `hunif` (added manually 2026-11-16; not generated from the Lean files).**

* `hunif` is the proposition `unifleq` of the tex source ("For every $\mu$, $\mu_{unif}(\mu^+,2^\mu) \leq 2^{\mu^+}$", proof "Easy.", l. 8023–8025) at $\mu = \lambda^{+(1+m)}$. That proposition is commented out in the tex source (comment block l. 7977–8037), so the published paper does not contain it. `hunif` is a hypothesis added by the formalization.
* It is kept as an explicit hypothesis of `thm_1_0_2`. It is assumed, not proved.
* Status of confirmation: not confirmed. Source: personal communication from Prof. Saharon Shelah (the claim is easy, per Shelah). There is no written source we checked. Not verified by the formalization. Not independently checked by the author.
* **Open item: to be checked by the author at the end.** See `ERRATA.md` C.8 and item 10 of "To be confirmed by the author".

### Thm 11.1.1: `thm_11_1_1` (Frames.lean:21171) — flags: unchanged

Paper (l. 7877–7897):

```latex
\begin{theorem}\label{11.0 new}
Suppose:
\begin{enumerate}
\item $\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a semi-good
$\lambda$-frame with conjugation. \item $K^{3,uq}$ is dense with
respect to $\preceq_{bs}$. \item
$I(\lambda^{+2},K)<2^{\lambda^{+2}}$.
\end{enumerate}
Then
\begin{enumerate}
\item There is a good $\lambda^+$-frame
$\frak{s}^+=((K^{sat},\preceq^{NF}_{\lambda^+}\restriction
K^{sat})^{up},S^{bs,+},\dnf^+)$, such that $K^{sat} \subseteq
K_{\lambda^+}$ and the relation
$\preceq^{NF}_{\lambda^+}\restriction K^{sat}$ is included in the
relation $\preceq \restriction K^{sat}$. \item $\frak{s}^+$
satisfies the conjugation property. \item There is a model in $K$
of cardinality $\lambda^{+2}$. \item There is a model in $K$ of
cardinality $\lambda^{+3}$.
\end{enumerate}
\end{theorem}
```

Lean:

```lean
/-- Thm 11.1.1 (= Thm 1.0.1): suppose (1) `s` is a semi-good `λ`-frame with conjugation,
(2) `K^{3,uq}` is dense with respect to `≼_bs`, (3) `I(λ^{+2}, K) < 2^{λ^{+2}}`. Then
(1) `s⁺ = ((K^sat, ≼^NF ↾ K^sat)^up, S^{bs,+}, ⨿⁺)` is a good `λ⁺`-frame, `K^sat ⊆ K_{λ⁺}` and
`≼^NF ↾ K^sat ⊆ ≼ ↾ K^sat`; (2) `s⁺` satisfies the conjugation property; (3) there is a model in
`K` of cardinality `λ^{+2}`; (4) there is a model in `K` of cardinality `λ^{+3}`. -/
theorem thm_11_1_1 [C : CitedResults.{u}] (lam : Cardinal.{u}) (hU : Room U lam) (s : Frame U L)
    (h1 : s.IsSemiGood lam ∧ ConjProp s lam) (h2 : s.Dense lam (s.K3uq lam))
    (h3 : numModels s.S (plusN lam 2) < 2 ^ (plusN lam 2)) :
    ((s.splus lam).IsGood (Order.succ lam) ∧ s.Ksat lam ⊆ s.S.Kc (Order.succ lam) ∧
      ∀ M ∈ s.Ksat lam, ∀ N ∈ s.Ksat lam, s.leNF lam M N → s.S.le M N) ∧
    ConjProp (s.splus lam) (Order.succ lam) ∧
    (s.S.Kc (plusN lam 2)).Nonempty ∧ (s.S.Kc (plusN lam 3)).Nonempty := by
  -- `K_λ ≠ ∅` comes from categoricity in `λ`, part of the conjugation property (Def 2.5.5).
  exact Frame.thm_11_1_1_123 hU h1 h2 h3 h1.2.kc_nonempty
```

### Thm 11.1.7: `thm_11_1_7` (Frames.lean:21246) — flags: agent reading

Paper (l. 8096–8110):

```latex
\begin{theorem}
Suppose:
\begin{enumerate}
\item $\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a semi-good
$\lambda$-frame with conjugation. \item $m<\omega \Rightarrow
I(\lambda^{+(2+m)},K)<
2^{\lambda^{+(2+m)}}$.
\item $2^{\lambda^{+m}}<2^{\lambda^{+m+1}}$ and for every
$m<\omega$, $WDmId(\lambda^{+1+m})$ is not saturated in
$\lambda^{+(2+m)}$. \item Conjecture \ref{the uniqueness triples conjecture}.
\end{enumerate}
\emph{Then} there is a model in $K^n$ of cardinality
$\lambda^{+n}$ for every $n<\omega$.
\end{theorem}
```

Lean:

```lean
-- AGENT-CHOICE (reading): in (3) the first `m` is unquantified; read as "for every m". The
-- conclusion "a model in Kⁿ of cardinality λ^{+n}" uses `Kⁿ`, which is not defined in the
-- statement (it comes from Cor 11.1.6); read as "a model in K of cardinality λ^{+n}".
/-- Thm 11.1.7 (= Thm 1.0.2 with `I(…) < 2^{…}` in (2)): suppose (1) `s` is a semi-good
`λ`-frame with conjugation, (2) `I(λ^{+(2+m)}, K) < 2^{λ^{+(2+m)}}` for `m < ω`,
(3) `2^{λ^{+m}} < 2^{λ^{+m+1}}` and `WDmId(λ^{+1+m})` is not saturated in `λ^{+(2+m)}` for every
`m < ω`, (4) Conjecture 11.1.4. Then for every `n < ω` there is a model of cardinality
`λ^{+n}`. -/
theorem thm_11_1_7 [C : CitedResults.{u}] (lam : Cardinal.{u}) (hU : Room U lam) (s : Frame U L)
    (h1 : s.IsSemiGood lam ∧ ConjProp s lam)
    (h2 : ∀ m : ℕ, numModels s.S (plusN lam (2 + m)) < 2 ^ (plusN lam (2 + m)))
    (h3 : (∀ m : ℕ, (2 : Cardinal.{u}) ^ (plusN lam m) < 2 ^ (plusN lam (m + 1))) ∧
      ∀ m : ℕ, NotSaturatedIn (WDmId (plusN lam (1 + m))) (plusN lam (1 + m)) (plusN lam (2 + m)))
    (h4 : Conjecture_11_1_4.{u}) :
    ∀ n : ℕ, (s.S.Kc (plusN lam n)).Nonempty := by
  -- The paper: "By Corollary 11.1.6". Here directly from the tower `sⁿ` (`Frame.tower_spec`),
  -- which also covers `n = 0` (where Cor 11.1.6 needs `0 < n`).
  intro n
  obtain ⟨-, -, ⟨M, kM⟩, inK, -, -⟩ := Frame.tower_spec hU n h1 h1.2.kc_nonempty
    (fun m _ => h2 m) ⟨fun m _ => h3.1 m, fun m _ => h3.2 m⟩ h4 n le_rfl
  exact ⟨M, inK M kM.1, kM.2⟩
```

## (a) Dependency tree

### (a.1) Paper statements used by the proofs

Each node lists the paper statements its proof uses, directly or through AUX lemmas (AUX lemmas are contracted). A node already expanded is marked.

- `thm_1_0_1` Thm 1.0.1
  - `prop_1_0_23_3` Prop 1.0.23
  - `prop_2_1_2` Prop 2.1.2
  - `rem_2_6_3` Remark 2.6.3
  - `thm_2_6_8_2` Thm 2.6.8
  - `thm_3_2_3_3` Thm 3.2.3
    - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
    - `prop_1_0_30` Prop 1.0.30
  - `prop_3_2_4` Prop 3.2.4
    - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
    - `prop_3_2_5` Prop 3.2.5
  - `prop_4_1_12_1` Prop 4.1.12
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `thm_3_2_3_1` Thm 3.2.3
      - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
  - `prop_5_3_3` Prop 5.3.3
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
  - `prop_5_3_6` Prop 5.3.6
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `prop_5_3_5` Prop 5.3.5
      - `thm_3_3_5` Thm 3.3.5
        - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `prop_3_1_8` Prop 3.1.8
          - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `thm_3_2_3_1` Thm 3.2.3 *(dependencies listed above)*
        - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
        - `prop_3_3_4` Prop 3.3.4
          - `prop_1_0_30` Prop 1.0.30 *(dependencies listed above)*
          - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
  - `prop_5_3_8` Prop 5.3.8
  - `prop_5_3_9_2` Prop 5.3.9
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
    - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `prop_5_3_9_1` Prop 5.3.9
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
  - `prop_5_3_9_3` Prop 5.3.9
    - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
  - `prop_5_3_9_4` Prop 5.3.9
    - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
    - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
  - `prop_5_4_4` Prop 5.4.4
  - `prop_5_4_6` Prop 5.4.6
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `prop_5_4_5` Prop 5.4.5
      - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
  - `prop_5_4_8` Prop 5.4.8
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
    - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
    - `thm_5_4_7` Thm 5.4.7
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
      - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
      - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
  - `prop_7_1_10_a` Prop 7.1.10
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
    - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
    - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
  - `prop_7_1_10_b` Prop 7.1.10
    - `thm_2_5_8_2` Thm 2.5.8
      - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
      - `prop_1_0_30` Prop 1.0.30 *(dependencies listed above)*
  - `prop_7_1_12_a` Prop 7.1.12
    - `prop_7_1_12_b` Prop 7.1.12
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
      - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
      - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
      - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
      - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
  - `cor_7_1_17_c` Cor 7.1.17
    - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
    - `cor_7_1_17_b` Cor 7.1.17
      - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
      - `prop_7_1_10_c` Prop 7.1.10
        - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
        - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
        - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
        - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
        - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
        - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
        - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
        - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
      - `prop_7_1_12_a` Prop 7.1.12 *(dependencies listed above)*
      - `thm_7_1_13_b` Thm 7.1.13
        - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
        - `prop_1_0_30` Prop 1.0.30 *(dependencies listed above)*
        - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
        - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
        - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
        - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
        - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
        - `thm_2_6_8_1` Thm 2.6.8
          - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `prop_7_1_7` Prop 7.1.7
          - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
          - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
          - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
          - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
          - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
          - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
          - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
          - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
          - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
          - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
          - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
          - `thm_5_4_7` Thm 5.4.7 *(dependencies listed above)*
          - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
  - `thm_7_1_18_a` Thm 7.1.18
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
    - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
    - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
    - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
    - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
    - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
    - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
    - `thm_5_4_10` Thm 5.4.10
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `thm_5_4_7` Thm 5.4.7 *(dependencies listed above)*
    - `thm_2_5_8_2` Thm 2.5.8 *(dependencies listed above)*
  - `thm_7_1_3` Thm 7.1.3
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
    - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
    - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
    - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
    - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
    - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
    - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
    - `prop_8_1_3_b` Prop 8.1.3
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
      - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
      - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
      - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
      - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
      - `thm_6_1_3_e` Thm 6.1.3
        - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
        - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
        - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
        - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
        - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
        - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
        - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
        - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
        - `thm_5_4_10` Thm 5.4.10 *(dependencies listed above)*
    - `prop_8_1_6` Prop 8.1.6
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
      - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
      - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
      - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
      - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
      - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
      - `prop_7_1_10_b` Prop 7.1.10 *(dependencies listed above)*
      - `thm_7_1_18_a` Thm 7.1.18 *(dependencies listed above)*
      - `prop_8_1_4` Prop 8.1.4
        - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
        - `prop_1_0_30` Prop 1.0.30 *(dependencies listed above)*
        - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
        - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
        - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
        - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
        - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
        - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
        - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
        - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
      - `prop_8_1_5` Prop 8.1.5
    - `thm_9_1_7` Thm 9.1.7
      - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
      - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
      - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
      - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
      - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
      - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
      - `prop_7_1_10_b` Prop 7.1.10 *(dependencies listed above)*
      - `prop_7_1_10_c` Prop 7.1.10 *(dependencies listed above)*
      - `prop_7_1_10_d` Prop 7.1.10
        - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
        - `prop_7_1_10_c` Prop 7.1.10 *(dependencies listed above)*
      - `prop_7_1_12_a` Prop 7.1.12 *(dependencies listed above)*
      - `thm_7_1_13_a` Thm 7.1.13
        - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
        - `prop_1_0_30` Prop 1.0.30 *(dependencies listed above)*
        - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
        - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
        - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
        - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
        - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
        - `thm_2_6_8_1` Thm 2.6.8 *(dependencies listed above)*
        - `prop_7_1_7` Prop 7.1.7 *(dependencies listed above)*
      - `thm_7_1_18_a` Thm 7.1.18 *(dependencies listed above)*
      - `prop_9_1_4` Prop 9.1.4
        - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
        - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
        - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
        - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
        - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
        - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
        - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
        - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
        - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
      - `prop_9_1_6` Prop 9.1.6
        - `prop_9_1_5` Prop 9.1.5
          - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
          - `prop_9_1_4` Prop 9.1.4 *(dependencies listed above)*
  - `prop_10_1_8` Prop 10.1.8
    - `thm_7_1_18_a` Thm 7.1.18 *(dependencies listed above)*
    - `thm_7_1_18_b` Thm 7.1.18
      - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
      - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
      - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
      - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
      - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
      - `thm_7_1_18_a` Thm 7.1.18 *(dependencies listed above)*
    - `thm_7_1_18_c` Thm 7.1.18
      - `cor_7_1_17_a` Cor 7.1.17
        - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
        - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
        - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
        - `prop_7_1_10_b` Prop 7.1.10 *(dependencies listed above)*
        - `prop_7_1_10_c` Prop 7.1.10 *(dependencies listed above)*
        - `prop_7_1_12_a` Prop 7.1.12 *(dependencies listed above)*
        - `thm_7_1_13_a` Thm 7.1.13 *(dependencies listed above)*
  - `prop_10_1_4` Prop 10.1.4
    - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
    - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
    - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
    - `prop_7_1_10_b` Prop 7.1.10 *(dependencies listed above)*
    - `prop_7_1_10_c` Prop 7.1.10 *(dependencies listed above)*
    - `prop_7_1_12_a` Prop 7.1.12 *(dependencies listed above)*
    - `thm_7_1_13_b` Thm 7.1.13 *(dependencies listed above)*
    - `thm_7_1_18_c` Thm 7.1.18 *(dependencies listed above)*
    - `prop_10_1_8` Prop 10.1.8 *(dependencies listed above)*
  - `prop_3_1_9` Prop 3.1.9
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
  - `thm_10_1_9` Thm 10.1.9
    - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
    - `thm_2_6_8_2` Thm 2.6.8 *(dependencies listed above)*
    - `thm_2_6_8_3` Thm 2.6.8
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
    - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
    - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
    - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
    - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
    - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
    - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
    - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
    - `thm_5_4_10` Thm 5.4.10 *(dependencies listed above)*
    - `thm_6_1_3_a` Thm 6.1.3
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `thm_6_1_3_c` Thm 6.1.3
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
      - `prop_5_5_3_b` Prop 5.5.3
        - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
        - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
        - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
        - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
        - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
        - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
    - `thm_2_6_8_1` Thm 2.6.8 *(dependencies listed above)*
    - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
    - `prop_7_1_10_b` Prop 7.1.10 *(dependencies listed above)*
    - `prop_7_1_10_c` Prop 7.1.10 *(dependencies listed above)*
    - `prop_7_1_12_b` Prop 7.1.12 *(dependencies listed above)*
    - `prop_7_1_12_a` Prop 7.1.12 *(dependencies listed above)*
    - `thm_7_1_13_c` Thm 7.1.13
      - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
      - `prop_1_0_30` Prop 1.0.30 *(dependencies listed above)*
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
      - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
      - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
      - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
      - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
      - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
      - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
      - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
      - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
      - `thm_5_4_7` Thm 5.4.7 *(dependencies listed above)*
      - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
      - `thm_2_6_8_1` Thm 2.6.8 *(dependencies listed above)*
      - `prop_7_1_7` Prop 7.1.7 *(dependencies listed above)*
    - `cor_7_1_17_c` Cor 7.1.17 *(dependencies listed above)*
    - `thm_7_1_18_c` Thm 7.1.18 *(dependencies listed above)*
    - `thm_2_6_8_5` Thm 2.6.8
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
      - `thm_2_6_8_3` Thm 2.6.8 *(dependencies listed above)*
    - `thm_2_6_8_4` Thm 2.6.8
      - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
      - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
      - `thm_2_6_8_2` Thm 2.6.8 *(dependencies listed above)*
      - `thm_2_6_8_3` Thm 2.6.8 *(dependencies listed above)*
    - `prop_10_1_8` Prop 10.1.8 *(dependencies listed above)*
    - `prop_10_1_4` Prop 10.1.4 *(dependencies listed above)*
- `thm_1_0_2` Thm 1.0.2
  - `thm_11_1_7` Thm 11.1.7
    - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
    - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
    - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
    - `thm_2_6_8_2` Thm 2.6.8 *(dependencies listed above)*
    - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
    - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
    - `prop_4_1_12_1` Prop 4.1.12 *(dependencies listed above)*
    - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
    - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
    - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
    - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
    - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
    - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
    - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
    - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
    - `prop_7_1_10_b` Prop 7.1.10 *(dependencies listed above)*
    - `prop_7_1_12_a` Prop 7.1.12 *(dependencies listed above)*
    - `cor_7_1_17_c` Cor 7.1.17 *(dependencies listed above)*
    - `thm_7_1_18_a` Thm 7.1.18 *(dependencies listed above)*
    - `thm_7_1_3` Thm 7.1.3 *(dependencies listed above)*
    - `prop_10_1_8` Prop 10.1.8 *(dependencies listed above)*
    - `prop_10_1_4` Prop 10.1.4 *(dependencies listed above)*
    - `prop_3_1_9` Prop 3.1.9 *(dependencies listed above)*
    - `thm_10_1_9` Thm 10.1.9 *(dependencies listed above)*
- `thm_11_1_1` Thm 11.1.1
  - `prop_1_0_23_3` Prop 1.0.23 *(dependencies listed above)*
  - `prop_2_1_2` Prop 2.1.2 *(dependencies listed above)*
  - `rem_2_6_3` Remark 2.6.3 *(dependencies listed above)*
  - `thm_2_6_8_2` Thm 2.6.8 *(dependencies listed above)*
  - `thm_3_2_3_3` Thm 3.2.3 *(dependencies listed above)*
  - `prop_3_2_4` Prop 3.2.4 *(dependencies listed above)*
  - `prop_4_1_12_1` Prop 4.1.12 *(dependencies listed above)*
  - `prop_5_3_3` Prop 5.3.3 *(dependencies listed above)*
  - `prop_5_3_6` Prop 5.3.6 *(dependencies listed above)*
  - `prop_5_3_8` Prop 5.3.8 *(dependencies listed above)*
  - `prop_5_3_9_2` Prop 5.3.9 *(dependencies listed above)*
  - `prop_5_3_9_3` Prop 5.3.9 *(dependencies listed above)*
  - `prop_5_3_9_4` Prop 5.3.9 *(dependencies listed above)*
  - `prop_5_4_4` Prop 5.4.4 *(dependencies listed above)*
  - `prop_5_4_6` Prop 5.4.6 *(dependencies listed above)*
  - `prop_5_4_8` Prop 5.4.8 *(dependencies listed above)*
  - `prop_7_1_10_a` Prop 7.1.10 *(dependencies listed above)*
  - `prop_7_1_10_b` Prop 7.1.10 *(dependencies listed above)*
  - `prop_7_1_12_a` Prop 7.1.12 *(dependencies listed above)*
  - `cor_7_1_17_c` Cor 7.1.17 *(dependencies listed above)*
  - `thm_7_1_18_a` Thm 7.1.18 *(dependencies listed above)*
  - `thm_7_1_3` Thm 7.1.3 *(dependencies listed above)*
  - `prop_10_1_8` Prop 10.1.8 *(dependencies listed above)*
  - `prop_10_1_4` Prop 10.1.4 *(dependencies listed above)*
  - `prop_3_1_9` Prop 3.1.9 *(dependencies listed above)*
  - `thm_10_1_9` Thm 10.1.9 *(dependencies listed above)*
- `thm_11_1_7` Thm 11.1.7 *(dependencies listed above)*


69 paper statements in the tree (including the four main theorems).

### (a.2) Definitions

**110 definitions** enter the *statements* of the main theorems (closure of their types through definitions). Another **35** enter only the statements of the other paper statements in the tree. Each is listed in (b), in file order.

Definitions in the statements of the main theorems:

| Lean | paper | location | flags |
|---|---|---|---|
| `Model` | — | AEC.lean:75 | encoding |
| `Model.card` | — | AEC.lean:86 | encoding |
| `IsSubstr` | — | AEC.lean:91 | encoding |
| `IsoOn` | — | AEC.lean:96 | encoding |
| `Over` | Def 1.0.19 | AEC.lean:101 | unchanged |
| `KSys` | — | AEC.lean:106 | encoding |
| `KSys.Kc` | Def 1.0.13 | AEC.lean:117 | unchanged |
| `KSys.KGe` | Def 1.0.13 | AEC.lean:123 | unchanged |
| `KSys.KGt` | Def 1.0.13 | AEC.lean:126 | unchanged |
| `KSys.lt` | Def 1.0.14 | AEC.lean:129 | unchanged |
| `KSys.restrict` | — | AEC.lean:132 | encoding |
| `IsIncreasing` | — | AEC.lean:144 | unchanged |
| `IsContinuous` | — | AEC.lean:149 | unchanged |
| `IsUnionOf` | — | AEC.lean:154 | unchanged |
| `IsIncCont` | — | AEC.lean:158 | unchanged |
| `IsClubIn` | — | AEC.lean:174 | unchanged |
| `IsStationaryIn` | — | AEC.lean:179 | unchanged |
| `Room` | — | AEC.lean:192 | encoding |
| `plusN` | Def 11.0.1 | AEC.lean:196 | unchanged |
| `KSys.AxIso` | Def 1.0.3 | AEC.lean:210 | unchanged |
| `KSys.AxPO` | Def 1.0.3 | AEC.lean:215 | unchanged |
| `KSys.AxIncl` | Def 1.0.3 | AEC.lean:220 | unchanged |
| `KSys.AxUnion` | Def 1.0.3 | AEC.lean:227 | agent reading |
| `KSys.AxSmooth` | Def 1.0.3 | AEC.lean:235 | **changed in the proof stage** |
| `KSys.AxCoh` | Def 1.0.3 | AEC.lean:241 | unchanged |
| `KSys.HasLST` | Def 1.0.3 | AEC.lean:246 | unchanged |
| `KSys.AxLST` | Def 1.0.3 | AEC.lean:250 | unchanged |
| `KSys.LST` | Def 1.0.3 | AEC.lean:253 | unchanged |
| `IsAEC` | Def 1.0.3 | AEC.lean:258 | unchanged |
| `IsAECIn` | Def 1.0.3 | AEC.lean:276 | unchanged |
| `isoSetoid` | Def 1.0.15 | AEC.lean:286 | encoding |
| `numModels` | Def 1.0.15 | AEC.lean:292 | unchanged |
| `InUp` | Def 1.0.16 | AEC.lean:300 | agent reading |
| `LeUp` | Def 1.0.16 | AEC.lean:309 | unchanged |
| `KSys.up` | Def 1.0.16 | AEC.lean:321 | unchanged |
| `IsEmb` | Def 1.0.19 | AEC.lean:328 | agent reading |
| `IsAmalg` | Def 1.0.20 | AEC.lean:333 | unchanged |
| `IsAmalgIn` | Def 1.0.20 | AEC.lean:339 | agent reading |
| `AP` | Def 1.0.20 | AEC.lean:344 | unchanged |
| `JEP` | Def 1.0.20 | AEC.lean:349 | unchanged |
| `IsMaximal` | Def 1.0.20 | AEC.lean:354 | unchanged |
| `Tri` | — | AEC.lean:358 | encoding |
| `KSys.K3` | Def 1.0.21 | AEC.lean:361 | unchanged |
| `typePool` | Def 1.0.22 | AEC.lean:374 | **deviation (author-confirmed / typo)** |
| `EStar` | Def 1.0.22 | AEC.lean:379 | unchanged |
| `ERel` | Def 1.0.22 | AEC.lean:388 | agent reading |
| `tp` | Def 1.0.24 | AEC.lean:393 | unchanged |
| `SAll` | Def 1.0.24 | AEC.lean:397 | unchanged |
| `res` | Def 1.0.24 | AEC.lean:408 | encoding |
| `Realizes` | Def 1.0.25 | AEC.lean:414 | unchanged |
| `Full` | Def 1.0.25 | AEC.lean:418 | unchanged |
| `Saturated` | Def 1.0.25 | AEC.lean:423 | unchanged |
| `Homogeneous` | Def 1.0.28 | AEC.lean:428 | unchanged |
| `Fact_1_0_18` | Fact 1.0.18 | Frames.lean:87 | agent reading, cited (hypothesis via `CitedResults`) |
| `Fact_1_0_18_up` | Fact 1.0.18 | Frames.lean:104 | cited (hypothesis via `CitedResults`) |
| `Prop_1_0_31` | Prop 1.0.31 | Frames.lean:473 | cited (hypothesis via `CitedResults`) |
| `Thm_1_0_32_1` | Thm 1.0.32 | Frames.lean:485 | cited (hypothesis via `CitedResults`) |
| `Thm_1_0_32_2` | Thm 1.0.32 | Frames.lean:496 | cited (hypothesis via `CitedResults`) |
| `Frame` | Def 2.1.1 | Frames.lean:511 | unchanged |
| `Frame.NotFork` | Def 2.1.1 | Frames.lean:525 | unchanged |
| `Frame.IsNFExt` | Def 2.5.5 | Frames.lean:530 | unchanged |
| `Frame.Ax0a` | Def 2.1.1 | Frames.lean:534 | unchanged |
| `Frame.Ax0b` | Def 2.1.1 | Frames.lean:537 | unchanged |
| `Frame.Ax1a` | Def 2.1.1 | Frames.lean:540 | unchanged |
| `Frame.Ax1b` | Def 2.1.1 | Frames.lean:543 | unchanged |
| `Frame.Ax1c` | Def 2.1.1 | Frames.lean:548 | agent reading |
| `Frame.Ax2a` | Def 2.1.1 | Frames.lean:551 | unchanged |
| `Frame.Ax2b` | Def 2.1.1 | Frames.lean:559 | agent reading |
| `Frame.Ax2c` | Def 2.1.1 | Frames.lean:565 | unchanged |
| `Frame.BasicStab` | Def 2.1.1 | Frames.lean:571 | unchanged |
| `Frame.Ax3a` | Def 2.1.1 | Frames.lean:578 | **changed in the proof stage** |
| `Frame.Ax3b` | Def 2.1.1 | Frames.lean:591 | **changed in the proof stage** |
| `Frame.Ax3c` | Def 2.1.1 | Frames.lean:600 | unchanged |
| `Frame.Ax3d` | Def 2.1.1 | Frames.lean:607 | unchanged |
| `Frame.Ax3e` | Def 2.1.1 | Frames.lean:612 | unchanged |
| `Frame.Ax3f` | Def 2.1.1 | Frames.lean:620 | unchanged |
| `Frame.Ax3g` | Def 2.1.1 | Frames.lean:625 | unchanged |
| `Frame.Core` | Def 2.1.1 | Frames.lean:634 | encoding |
| `Frame.IsGood` | Def 2.1.1 | Frames.lean:649 | unchanged |
| `Frame.IsSemiGood` | Def 2.1.3 | Frames.lean:654 | unchanged |
| `Conjugate` | Def 2.5.1 | Frames.lean:1233 | unchanged |
| `ConjProp` | Def 2.5.5 | Frames.lean:1251 | unchanged |
| `Prop_2_5_7` | Prop 2.5.7 | Frames.lean:1278 | **changed in the proof stage**, cited (hypothesis via `CitedResults`) |
| `CitedResults` | — | Frames.lean:1294 | unchanged |
| `Frame.nfGe` | Def 2.6.1 | Frames.lean:1336 | **deviation (author-confirmed / typo)** |
| `Frame.NotForkGe` | Def 2.6.2 | Frames.lean:1346 | agent reading |
| `Frame.SbsGt` | Def 2.6.4 | Frames.lean:1352 | unchanged |
| `Frame.K3bs` | Def 3.1.1 | Frames.lean:1541 | unchanged |
| `Frame.leBs` | Def 3.1.1 | Frames.lean:1547 | unchanged |
| `Frame.Dense` | Def 3.2.1 | Frames.lean:2139 | unchanged |
| `Amalg` | — | Frames.lean:3437 | encoding |
| `AmalgEquiv` | Def 4.1.2 | Frames.lean:3442 | unchanged |
| `Frame.UqCond` | Def 4.1.5 | Frames.lean:3501 | unchanged |
| `Frame.K3uq` | Def 4.1.5 | Frames.lean:3508 | unchanged |
| `QRel` | — | Frames.lean:3680 | encoding |
| `Frame.NFStarWit` | Def 5.3.1 | Frames.lean:3827 | unchanged |
| `Frame.NFStar` | Def 5.3.1 | Frames.lean:3840 | unchanged |
| `Frame.NF` | Def 5.3.2 | Frames.lean:3846 | unchanged |
| `Frame.NFhat` | Def 6.1.2 | Frames.lean:8244 | encoding |
| `Frame.leNF` | Def 6.1.4 | Frames.lean:8258 | unchanged |
| `Frame.Ksat` | Def 7.1.2 | Frames.lean:11393 | unchanged |
| `Frame.satKSys` | — | Frames.lean:11396 | unchanged |
| `Frame.upKSys` | — | Frames.lean:18449 | unchanged |
| `Frame.tpPlus` | Def 10.1.3 | Frames.lean:18454 | unchanged |
| `Frame.SbsPlus` | Def 10.1.6 | Frames.lean:18468 | unchanged |
| `Frame.nfPlus` | Def 10.1.6 | Frames.lean:18477 | encoding |
| `Frame.splus` | Def 10.1.6 | Frames.lean:18482 | unchanged |
| `WDmId` | Def 11.1.2 | Frames.lean:20824 | encoding |
| `NotSaturatedIn` | Def 11.1.3 | Frames.lean:20835 | agent reading |
| `Conjecture_11_1_4` | Conjecture 11.1.4 | Frames.lean:20846 | **deviation (author-confirmed / typo)** |

Definitions used only by the other paper statements of the tree:

| Lean | paper | location | flags |
|---|---|---|---|
| `FunIncreasing` | — | AEC.lean:163 | unchanged |
| `FunContinuous` | — | AEC.lean:168 | unchanged |
| `ClubEq` | Def 9.1.3 | AEC.lean:184 | unchanged |
| `KSys.K3c` | Def 1.0.21 | AEC.lean:365 | unchanged |
| `Frame.IsSemiGoodExceptLC` | Def 2.6.5 | Frames.lean:661 | unchanged |
| `Frame.Cond12` | Thm 2.5.8 | Frames.lean:1317 | unchanged |
| `Frame.SbsGe` | Def 2.6.4 | Frames.lean:1356 | unchanged |
| `Hyp_3_0_1` | Hypothesis 3.0.1 | Frames.lean:1533 | unchanged |
| `IsoClosedTri` | Def 3.2.1 | Frames.lean:2134 | unchanged |
| `Frame.ExistProp` | Def 3.2.1 | Frames.lean:2144 | unchanged |
| `IsDecomp` | Def 3.2.2 | Frames.lean:2154 | agent reading |
| `Decomposable` | Def 3.2.2 | Frames.lean:2160 | unchanged |
| `Frame.K3r` | Def 3.3.2 | Frames.lean:2858 | unchanged |
| `Hyp_4_1_1` | Hypothesis 4.1.1 | Frames.lean:3434 | unchanged |
| `Hyp_5_1_1` | Hypothesis 5.1.1 | Frames.lean:3676 | unchanged |
| `OtDom` | Def 5.2.1 | Frames.lean:3688 | unchanged |
| `OtB` | Def 5.2.1 | Frames.lean:3698 | unchanged |
| `JointEmbOver` | Def 1.0.20 | Frames.lean:3712 | unchanged |
| `Respects` | Def 5.2.6 | Frames.lean:3815 | unchanged |
| `OtMinus` | Def 5.4.1 | Frames.lean:4675 | **changed in the proof stage**, agent reading |
| `Hyp_6_1_1` | Hypothesis 6.1.1 | Frames.lean:8234 | unchanged |
| `Frame.ltNF` | Def 1.0.14 | Frames.lean:8263 | unchanged |
| `Frame.nfKSys` | — | Frames.lean:8266 | unchanged |
| `Hyp_7_1_1` | Hypothesis 7.1.1 | Frames.lean:11386 | unchanged |
| `Frame.PlusWit` | Def 7.1.4 | Frames.lean:11416 | **changed in the proof stage**, **deviation (author-confirmed / typo)**, encoding, agent reading |
| `Frame.ltPlus` | Def 7.1.4 | Frames.lean:11433 | unchanged |
| `Hyp_8_1_1` | Hypothesis 8.1.1 | Frames.lean:14619 | unchanged |
| `Frame.leOt` | Def 8.1.2 | Frames.lean:14624 | unchanged |
| `Hyp_9_1_1` | Hypothesis 9.1.1 | Frames.lean:17426 | unchanged |
| `Frame.IncNFSucc` | Def 9.1.2 | Frames.lean:17430 | unchanged |
| `Frame.TSet` | Def 9.1.3 | Frames.lean:17436 | unchanged |
| `Frame.HasT` | Def 9.1.3 | Frames.lean:17442 | **changed in the proof stage**, encoding |
| `StatCof` | — | Frames.lean:17582 | unchanged |
| `Frame.Successful` | Def 10.1.1 | Frames.lean:18436 | agent reading |
| `Hyp_10_1_2` | Hypothesis 10.1.2 | Frames.lean:18441 | unchanged |

## (b) Each definition: original text and Lean statement

The paper text is the environment whose number is cited first in the docstring. For a docstring that cites a numbered item it does not formalize alone (e.g. a definition stated inside a proposition), check the docstring's own quotation. Definitions with no paper item are encoding devices or AUX notions; their docstrings explain them.

### `Model` — no paper item — encoding

Lean (AEC.lean:75):

```lean
/-- ENCODING. A model: an `L`-structure whose universe is a subset of the ambient type `U`. -/
structure Model (U : Type u) (L : Language.{u, u}) where
  /-- the universe of the model -/
  carrier : Set U
  /-- the interpretation of the vocabulary -/
  str : L.Structure carrier
```

### `Model.card` — no paper item — encoding

Lean (AEC.lean:86):

```lean
/-- ENCODING. `‖M‖`, the cardinality of the universe of `M`. -/
def Model.card (M : Model U L) : Cardinal.{u} := #M.carrier
```

### `IsSubstr` — no paper item — encoding

Lean (AEC.lean:91):

```lean
/-- ENCODING. `M ⊆ N` in the sense of the paper ("`⊆` denotes the relation of being submodel",
Introduction, Notations): `M`'s universe is included in `N`'s and the inclusion map is an
`L`-embedding. -/
def IsSubstr (M N : Model U L) : Prop :=
  ∃ h : M.carrier ⊆ N.carrier, ∃ e : M.carrier ↪[L] N.carrier, ∀ x, e x = Set.inclusion h x
```

### `IsoOn` — no paper item — encoding

Lean (AEC.lean:96):

```lean
/-- ENCODING. `f` restricted to the universe of `M` is an isomorphism of `M` onto `N`.
In particular `N = f[M]` (with the transported structure). -/
def IsoOn (f : U → U) (M N : Model U L) : Prop :=
  ∃ g : M.carrier ≃[L] N.carrier, ∀ x : M.carrier, (g x : U) = f x
```

### `Over` — Def 1.0.19 — unchanged

Paper, definition 1.0.19 (l. 724–735):

```latex
\begin{definition}
\label{1.2b} \mbox{}
\begin{enumerate}
\item Let $M,N$ be models in $K$, $f$ is an injection of $M$ to
$N$. We say that $f$ is a $\preceq$-\emph{embedding} and write
$f:M \to N$, or shortly $f$ is an \emph{embedding} (if $\preceq$
is clear from the context), when $f$ is an injection with domain
$M$ and $Im(f)\preceq N$. \item A function $f:B \to C$ is
\emph{over} $A$, if $A \subseteq B \bigcap C$ and $x \in A
\Rightarrow f(x)=x$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:101):

```lean
/-- Def 1.0.19(2): a function `f : M → N` is *over* `A` if `A ⊆ M ∩ N` and `f` is the identity
on `A`. -/
def Over (f : U → U) (M N : Model U L) (A : Set U) : Prop :=
  A ⊆ M.carrier ∩ N.carrier ∧ ∀ x ∈ A, f x = x
```

### `KSys` — no paper item — encoding

Lean (AEC.lean:106):

```lean
/-- ENCODING. A class of models `K` together with a 2-place relation `≼` on it. No axioms are
bundled: the axioms of an AEC are in `IsAEC`. -/
structure KSys (U : Type u) (L : Language.{u, u}) where
  /-- the class `K` -/
  K : Set (Model U L)
  /-- the relation `≼` -/
  le : Model U L → Model U L → Prop
```

### `KSys.Kc` — Def 1.0.13 — unchanged

Paper, definition 1.0.13 (l. 668–672):

```latex
\begin{definition}\label {1.2}
\mbox{} 
$K_\lambda=:\{M \in K:||M||=\lambda\},\ K_{<\lambda}=\{M\in
K:||M||<\lambda\}$, etc.
\end{definition}
```

Lean (AEC.lean:117):

```lean
/-- Def 1.0.13: `K_κ = {M ∈ K : ‖M‖ = κ}`. -/
def Kc (κ : Cardinal.{u}) : Set (Model U L) := {M | M ∈ S.K ∧ M.card = κ}
```

### `KSys.KGe` — Def 1.0.13 — unchanged

Paper, definition 1.0.13 (l. 668–672):

```latex
\begin{definition}\label {1.2}
\mbox{} 
$K_\lambda=:\{M \in K:||M||=\lambda\},\ K_{<\lambda}=\{M\in
K:||M||<\lambda\}$, etc.
\end{definition}
```

Lean (AEC.lean:123):

```lean
/-- Def 1.0.13 ("etc."): `K_{≥κ}`. -/
def KGe (κ : Cardinal.{u}) : Set (Model U L) := {M | M ∈ S.K ∧ κ ≤ M.card}
```

### `KSys.KGt` — Def 1.0.13 — unchanged

Paper, definition 1.0.13 (l. 668–672):

```latex
\begin{definition}\label {1.2}
\mbox{} 
$K_\lambda=:\{M \in K:||M||=\lambda\},\ K_{<\lambda}=\{M\in
K:||M||<\lambda\}$, etc.
\end{definition}
```

Lean (AEC.lean:126):

```lean
/-- Def 1.0.13 ("etc."): `K_{>κ}`. -/
def KGt (κ : Cardinal.{u}) : Set (Model U L) := {M | M ∈ S.K ∧ κ < M.card}
```

### `KSys.lt` — Def 1.0.14 — unchanged

Paper, definition 1.0.14 (l. 674–676):

```latex
\begin{definition}
We say $M\prec N$ when $M \preceq N$ and $M \neq N$.
\end{definition}
```

Lean (AEC.lean:129):

```lean
/-- Def 1.0.14: `M ≺ N` when `M ≼ N` and `M ≠ N`. -/
def lt (M N : Model U L) : Prop := S.le M N ∧ M ≠ N
```

### `KSys.restrict` — no paper item — encoding

Lean (AEC.lean:132):

```lean
/-- ENCODING of `(C, ≼ ↾ C)` for a subclass `C`. -/
def restrict (C : Set (Model U L)) : KSys U L :=
  ⟨C, fun M N => M ∈ C ∧ N ∈ C ∧ S.le M N⟩
```

### `IsIncreasing` — no paper item — unchanged

Lean (AEC.lean:144):

```lean
/-- `⟨M_α : α ∈ I⟩` is `R`-increasing: `α < β` in `I` implies `R M_α M_β`. -/
def IsIncreasing (R : Model U L → Model U L → Prop) (M : Ordinal.{u} → Model U L)
    (I : Set Ordinal.{u}) : Prop :=
  ∀ α ∈ I, ∀ β ∈ I, α < β → R (M α) (M β)
```

### `IsContinuous` — no paper item — unchanged

Lean (AEC.lean:149):

```lean
/-- `⟨M_α : α ∈ I⟩` is continuous: for limit `β ∈ I`, `M_β = ⋃_{α<β} M_α`. -/
def IsContinuous (M : Ordinal.{u} → Model U L) (I : Set Ordinal.{u}) : Prop :=
  ∀ β ∈ I, Order.IsSuccLimit β → (M β).carrier = ⋃ α ∈ Iio β, (M α).carrier
```

### `IsUnionOf` — no paper item — unchanged

Lean (AEC.lean:154):

```lean
/-- `N` is the union model `⋃ {M_α : α ∈ I}`: its universe is the union and every `M_α` is a
submodel (this determines the structure of `N`). -/
def IsUnionOf (M : Ordinal.{u} → Model U L) (I : Set Ordinal.{u}) (N : Model U L) : Prop :=
  N.carrier = ⋃ α ∈ I, (M α).carrier ∧ ∀ α ∈ I, IsSubstr (M α) N
```

### `IsIncCont` — no paper item — unchanged

Lean (AEC.lean:158):

```lean
/-- `⟨M_α : α ∈ I⟩` is a `≼`-increasing continuous sequence of models in `C`. -/
def IsIncCont (S : KSys U L) (M : Ordinal.{u} → Model U L) (I : Set Ordinal.{u})
    (C : Set (Model U L)) : Prop :=
  IsIncreasing S.le M I ∧ IsContinuous M I ∧ ∀ α ∈ I, M α ∈ C
```

### `FunIncreasing` *(not in the main statements)* — no paper item — unchanged

Lean (AEC.lean:163):

```lean
/-- A sequence of functions `⟨f_α : α ∈ I⟩` (`f_α` with domain `M_α`) is increasing. -/
def FunIncreasing (f : Ordinal.{u} → U → U) (M : Ordinal.{u} → Model U L)
    (I : Set Ordinal.{u}) : Prop :=
  ∀ α ∈ I, ∀ β ∈ I, α < β → ∀ x ∈ (M α).carrier, f β x = f α x
```

### `FunContinuous` *(not in the main statements)* — no paper item — unchanged

Lean (AEC.lean:168):

```lean
/-- A sequence of functions `⟨f_α : α ∈ I⟩` is continuous: at limit `β`, `f_β = ⋃_{α<β} f_α`. -/
def FunContinuous (f : Ordinal.{u} → U → U) (M : Ordinal.{u} → Model U L)
    (I : Set Ordinal.{u}) : Prop :=
  ∀ β ∈ I, Order.IsSuccLimit β → ∀ x ∈ (M β).carrier,
    ∃ α < β, x ∈ (M α).carrier ∧ f β x = f α x
```

### `IsClubIn` — no paper item — unchanged

Lean (AEC.lean:174):

```lean
/-- Standard (not defined in the paper): `C` is a club of the ordinal `κ`. -/
def IsClubIn (κ : Ordinal.{u}) (C : Set Ordinal.{u}) : Prop :=
  C ⊆ Iio κ ∧ (∀ α < κ, ∃ β ∈ C, α < β) ∧
    ∀ γ < κ, Order.IsSuccLimit γ → (∀ α < γ, ∃ β ∈ C, α < β ∧ β < γ) → γ ∈ C
```

### `IsStationaryIn` — no paper item — unchanged

Lean (AEC.lean:179):

```lean
/-- Standard (not defined in the paper): `T` is a stationary subset of the ordinal `κ`. -/
def IsStationaryIn (κ : Ordinal.{u}) (T : Set Ordinal.{u}) : Prop :=
  T ⊆ Iio κ ∧ ∀ C, IsClubIn κ C → (T ∩ C).Nonempty
```

### `ClubEq` *(not in the main statements)* — Def 9.1.3 — unchanged

Paper, definition 9.1.3 (l. 7200–7210):

```latex
\begin{definition} \label{9.2}
Let $\alpha \leq \lambda^{+2}$ and let $\bar{M}=\langle
M_\alpha:\alpha<\lambda^{+2} \rangle$ be an
$\preceq^{NF}_{\lambda^+}$-increasing in the successor ordinals
and continuous sequence with union $M$. Define
$T(\bar{M})=:\{\delta \in \lambda^{+2}:\exists \alpha \in
(\delta,\lambda^{+2})$ $M_\delta \npreceq^{NF} M_\alpha\}$. Define
$T(M)=:T(\bar{M})/D_{\lambda^{+2}}$ where $D_{\lambda^{+2}}$ is
the club filter on $\lambda^{+2}$. (By Proposition~ \ref{is well
defined}, $T(M)$ does not depend on the representation $\bar{M}$).
\end{definition}
```

Lean (AEC.lean:184):

```lean
/-- Standard: `X / D_κ = Y / D_κ` where `D_κ` is the club filter on `κ` (Def 9.1.3), i.e. `X`
and `Y` agree on a club. -/
def ClubEq (κ : Ordinal.{u}) (X Y : Set Ordinal.{u}) : Prop :=
  ∃ C, IsClubIn κ C ∧ X ∩ C = Y ∩ C
```

### `Room` — no paper item — encoding

Lean (AEC.lean:192):

```lean
-- DEVIATION (added hypothesis, encoding): every theorem that involves a cardinal `lam` takes
-- `hU : Room U lam`. It is not a hypothesis of the paper (see NOTES.md, B.1).
/-- ENCODING hypothesis on the ambient type: `#U` is a strong limit cardinal above `lam`, so
every model the paper constructs (of cardinality `λ^{+n}`, or `2^{λ^{+n}}` many models) has
isomorphic copies inside `U`. Not a hypothesis of the paper. -/
def Room (U : Type u) (lam : Cardinal.{u}) : Prop := IsStrongLimit #U ∧ lam < #U
```

### `plusN` — Def 11.0.1 — unchanged

Paper, definition 11.0.1 (l. 7871–7873):

```latex
\begin{definition}
Let $\lambda$ be a cardinal and let $n$ be a natural number. We define $\lambda^{+n}$ as the $n$-th cardinal after $\lambda$: $\lambda^{+0}=\lambda$ and $\lambda^{+(n+1)}$ is the successor cardinal of $\lambda^{+n}$.
\end{definition}
```

Lean (AEC.lean:196):

```lean
/-- Def 11.0.1: `λ^{+n}`, the `n`-th cardinal after `λ` (`λ^{+0} = λ`). Placed here because
it is used throughout. -/
def plusN (lam : Cardinal.{u}) (n : ℕ) : Cardinal.{u} := Order.succ^[n] lam
```

### `KSys.AxIso` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:210):

```lean
/-- Def 1.0.3(1)(a): `K, ≼` are closed under isomorphisms: "if `M₁ ∈ K`, `M₀ ≼ M₁` and
`f : M₁ → N₁` is an isomorphism, then `N₁ ∈ K` and `f[M₀] ≼ f[M₁] = N₁`". -/
def AxIso : Prop :=
  ∀ (M₀ M₁ N₁ : Model U L) (f : U → U), M₁ ∈ S.K → S.le M₀ M₁ → IsoOn f M₁ N₁ →
    N₁ ∈ S.K ∧ ∃ M₀' : Model U L, IsoOn f M₀ M₀' ∧ S.le M₀' N₁
```

### `KSys.AxPO` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:215):

```lean
/-- Def 1.0.3(1)(b), first half: `≼` is a partial order on `K`. -/
def AxPO : Prop :=
  (∀ M N, S.le M N → M ∈ S.K ∧ N ∈ S.K) ∧ (∀ M ∈ S.K, S.le M M) ∧
    (∀ M N, S.le M N → S.le N M → M = N) ∧ (∀ M N P, S.le M N → S.le N P → S.le M P)
```

### `KSys.AxIncl` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:220):

```lean
/-- Def 1.0.3(1)(b), second half: `≼` is included in the (sub)model inclusion relation. -/
def AxIncl : Prop := ∀ M N, S.le M N → IsSubstr M N
```

### `KSys.AxUnion` — Def 1.0.3 — agent reading

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:227):

```lean
-- AGENT-CHOICE (reading): `δ` ranges over limit ordinals, by the paper's convention on the letter `δ`
-- (Introduction, Notations); the same reading is used in Axiom d, Def 2.1.1(3)(c),(g), Thm 2.6.8.
/-- Def 1.0.3(1)(c) for chains of length `δ`: if `⟨M_α : α < δ⟩` is `≼`-increasing continuous,
then `M₀ ≼ ⋃ {M_α : α < δ} ∈ K`. (`δ` is a limit ordinal by the paper's convention on the
letter `δ`, Introduction, Notations.) -/
def AxUnion (δ : Ordinal.{u}) : Prop :=
  ∀ M : Ordinal.{u} → Model U L, IsIncreasing S.le M (Iio δ) → IsContinuous M (Iio δ) →
    ∃ N, IsUnionOf M (Iio δ) N ∧ N ∈ S.K ∧ S.le (M 0) N
```

### `KSys.AxSmooth` — Def 1.0.3 — **changed in the proof stage**

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:235):

```lean
/-- Def 1.0.3(1)(d), smoothness, for chains of length `δ`. -/
-- PROOF-STAGE CHANGE: added `N' ∈ S.K` (the union is in the class). Without it Remark
-- 1.0.4(1),(3) are false (step: smoothness for `(K, ⊆)` when the union is not in `K`); in an
-- AEC the union is in `K` by Axiom c, so `IsAEC` is unchanged.
def AxSmooth (δ : Ordinal.{u}) : Prop :=
  ∀ (M : Ordinal.{u} → Model U L) (N : Model U L), IsIncreasing S.le M (Iio δ) →
    IsContinuous M (Iio δ) → (∀ α < δ, S.le (M α) N) →
      ∀ N', IsUnionOf M (Iio δ) N' → N' ∈ S.K → S.le N' N
```

### `KSys.AxCoh` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:241):

```lean
/-- Def 1.0.3(1)(e): if `M₀ ⊆ M₁ ⊆ M₂`, `M₀ ≼ M₂` and `M₁ ≼ M₂`, then `M₀ ≼ M₁`. -/
def AxCoh : Prop :=
  ∀ M₀ M₁ M₂, IsSubstr M₀ M₁ → IsSubstr M₁ M₂ → S.le M₀ M₂ → S.le M₁ M₂ → S.le M₀ M₁
```

### `KSys.HasLST` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:246):

```lean
/-- Def 1.0.3(1)(f), the property defining the Löwenheim–Skolem–Tarski number: for every
`N ∈ K` and `A ⊆ N` there is `M ∈ K` with `A ⊆ M ≼ N` and `‖M‖ ≤ κ + |A|`. -/
def HasLST (κ : Cardinal.{u}) : Prop :=
  ∀ N ∈ S.K, ∀ A ⊆ N.carrier, ∃ M ∈ S.K, A ⊆ M.carrier ∧ S.le M N ∧ M.card ≤ κ + #A
```

### `KSys.AxLST` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:250):

```lean
/-- Def 1.0.3(1)(f): there is a Löwenheim–Skolem–Tarski number. -/
def AxLST : Prop := ∃ κ, S.HasLST κ
```

### `KSys.LST` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:253):

```lean
/-- Def 1.0.3(1)(f): `LST(K, ≼)`, the first cardinal with the property `HasLST`. -/
def LST : Cardinal.{u} := sInf {κ | S.HasLST κ}
```

### `IsAEC` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:258):

```lean
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
```

### `IsAECIn` — Def 1.0.3 — unchanged

Paper, definition 1.0.3 (l. 547–581):

```latex
\begin{definition}[Abstract Elementary Classes]\label{1.1}
\mbox{} 
\begin{enumerate}
\item  Let $K$ be any class of models for a fixed vocabulary and
let $\preceq$ be a 2-place relation on $K$. The pair $(K,\preceq)$
is an \emph{AEC} if the following axioms are satisfied:
\begin{enumerate}
\item  $K,\preceq$ are closed under isomorphisms. In other words,
if $M_1 \in K$, $M_0 \preceq M_1$ and $f:M_1 \rightarrow N_1$ is
an isomorphism, then $N_1 \in K$ and $f[M_0]\preceq f[M_1]=N_1$.
\item $\preceq$ is a partial order on $K$ and it is included in
the inclusion relation. \item If $\langle
M_\alpha:\alpha<\delta\rangle$ is a $\preceq$-increasing
continuous sequence, then $$M_0 \preceq \bigcup
\{M_\alpha:\alpha<\delta\} \in K.$$ \item Smoothness: If $\langle
M_\alpha:\alpha<\delta \rangle$ is a $\preceq$-increasing
continuous sequence, and for every $\alpha<\delta,\
M_\alpha\preceq N$, then
$$\bigcup \{M_\alpha:\alpha<\delta\} \preceq N.$$
\item If $M_0 \subseteq M_1 \subseteq M_2$ and $M_0 \preceq M_2
\wedge M_1 \preceq M_2$, then $M_0 \preceq M_1$. \item  There is a
Lowenheim Skolem Tarski number, $LST(K,\preceq)$, which is the
first cardinal $\lambda$, such that for every model $N \in K$ and
a subset $A$ of it, there is a model $M \in K$ such that $A
\subseteq M \preceq N$ and the cardinality of $M$ is $\leq
\lambda+|A|$.
\end{enumerate}
\item  $(K,\preceq)$ is an \emph{AEC in $\lambda$} if: The
cardinality of every model in $K$ is $\lambda$, and it satisfies
Axioms  a,b,d,e, and for sequences $\langle
M_\alpha:\alpha<\delta \rangle$ with $\delta<\lambda^+$ it satisfies Axiom c too.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:276):

```lean
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
```

### `isoSetoid` — Def 1.0.15 — encoding

Paper, definition 1.0.15 (l. 678–682):

```latex
\begin{definition}
Let $K$ be a class of models which is closed under isomorphisms
and let $\lambda$ be a cardinal. \emph{$I(\lambda,K)$} is the
number of models in $K_\lambda$ up to isomorphism.
\end{definition}
```

Lean (AEC.lean:286):

```lean
/-- ENCODING for Def 1.0.15: isomorphism of models of `K_κ`. -/
def isoSetoid (S : KSys U L) (κ : Cardinal.{u}) : Setoid {M // M ∈ S.Kc κ} where
  r M N := Nonempty (M.1.carrier ≃[L] N.1.carrier)
  iseqv := ⟨fun _ => ⟨Language.Equiv.refl L _⟩, fun ⟨f⟩ => ⟨f.symm⟩,
    fun ⟨f⟩ ⟨g⟩ => ⟨g.comp f⟩⟩
```

### `numModels` — Def 1.0.15 — unchanged

Paper, definition 1.0.15 (l. 678–682):

```latex
\begin{definition}
Let $K$ be a class of models which is closed under isomorphisms
and let $\lambda$ be a cardinal. \emph{$I(\lambda,K)$} is the
number of models in $K_\lambda$ up to isomorphism.
\end{definition}
```

Lean (AEC.lean:292):

```lean
/-- Def 1.0.15: `I(κ, K)`, the number of models in `K_κ` up to isomorphism. -/
def numModels (S : KSys U L) (κ : Cardinal.{u}) : Cardinal.{u} :=
  #(Quotient (isoSetoid S κ))
```

### `InUp` — Def 1.0.16 — agent reading

Paper, definition 1.0.16 (l. 685–698):

```latex
\begin{definition} \label{up}
$(K,\preceq)^{up}:=(K^{up},\preceq^{up})$ where we define:
\begin{enumerate}
\item $K^{up}$ is the class of models with the vocabulary of $K$,
such that there are a directed order $I$, and a set of models
$\{M_s:s \in I\}$ such that: $M=\bigcup \{M_s:s \in I \}$ and $s
\leq_I t \Rightarrow M_s \preceq M_t$. \item For $M,N \in K^{up},\
M \preceq^{up}N$ iff there are directed orders $I,J$ and sets of
models $\{M_s:s \in I \},\ \{N_t:t \in J \}$, respectively, such
that: $M=\bigcup \{M_s:s \in I \},\ N=\bigcup \{N_t:t \in J \},\ I
\subseteq J,\ s \leq_J t \Rightarrow N_s \preceq N_t,\ s \leq_I t
\Rightarrow M_s \preceq M_t \preceq N_t$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:300):

```lean
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
```

### `LeUp` — Def 1.0.16 — unchanged

Paper, definition 1.0.16 (l. 685–698):

```latex
\begin{definition} \label{up}
$(K,\preceq)^{up}:=(K^{up},\preceq^{up})$ where we define:
\begin{enumerate}
\item $K^{up}$ is the class of models with the vocabulary of $K$,
such that there are a directed order $I$, and a set of models
$\{M_s:s \in I\}$ such that: $M=\bigcup \{M_s:s \in I \}$ and $s
\leq_I t \Rightarrow M_s \preceq M_t$. \item For $M,N \in K^{up},\
M \preceq^{up}N$ iff there are directed orders $I,J$ and sets of
models $\{M_s:s \in I \},\ \{N_t:t \in J \}$, respectively, such
that: $M=\bigcup \{M_s:s \in I \},\ N=\bigcup \{N_t:t \in J \},\ I
\subseteq J,\ s \leq_J t \Rightarrow N_s \preceq N_t,\ s \leq_I t
\Rightarrow M_s \preceq M_t \preceq N_t$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:309):

```lean
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
```

### `KSys.up` — Def 1.0.16 — unchanged

Paper, definition 1.0.16 (l. 685–698):

```latex
\begin{definition} \label{up}
$(K,\preceq)^{up}:=(K^{up},\preceq^{up})$ where we define:
\begin{enumerate}
\item $K^{up}$ is the class of models with the vocabulary of $K$,
such that there are a directed order $I$, and a set of models
$\{M_s:s \in I\}$ such that: $M=\bigcup \{M_s:s \in I \}$ and $s
\leq_I t \Rightarrow M_s \preceq M_t$. \item For $M,N \in K^{up},\
M \preceq^{up}N$ iff there are directed orders $I,J$ and sets of
models $\{M_s:s \in I \},\ \{N_t:t \in J \}$, respectively, such
that: $M=\bigcup \{M_s:s \in I \},\ N=\bigcup \{N_t:t \in J \},\ I
\subseteq J,\ s \leq_J t \Rightarrow N_s \preceq N_t,\ s \leq_I t
\Rightarrow M_s \preceq M_t \preceq N_t$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:321):

```lean
/-- Def 1.0.16: `(K, ≼)^up := (K^up, ≼^up)`. -/
def KSys.up (S : KSys U L) : KSys U L := ⟨{M | InUp S M}, LeUp S⟩
```

### `IsEmb` — Def 1.0.19 — agent reading

Paper, definition 1.0.19 (l. 724–735):

```latex
\begin{definition}
\label{1.2b} \mbox{}
\begin{enumerate}
\item Let $M,N$ be models in $K$, $f$ is an injection of $M$ to
$N$. We say that $f$ is a $\preceq$-\emph{embedding} and write
$f:M \to N$, or shortly $f$ is an \emph{embedding} (if $\preceq$
is clear from the context), when $f$ is an injection with domain
$M$ and $Im(f)\preceq N$. \item A function $f:B \to C$ is
\emph{over} $A$, if $A \subseteq B \bigcap C$ and $x \in A
\Rightarrow f(x)=x$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:328):

```lean
-- AGENT-CHOICE (reading): "injection with Im(f) ≼ N" is read as "isomorphism of M onto a model
-- Im(f) ≼ N" (an embedding must preserve the structure).
/-- Def 1.0.19(1): `f : M → N` is a `≼`-embedding: `M, N ∈ K`, `f` is injective on `M` and
`Im(f) ≼ N`. ENCODING/READING: `f` is required to be an isomorphism of `M` onto the model
`Im(f) ≼ N` (see NOTES.md, B.4). -/
def IsEmb (S : KSys U L) (f : U → U) (M N : Model U L) : Prop :=
  M ∈ S.K ∧ N ∈ S.K ∧ ∃ M' : Model U L, S.le M' N ∧ IsoOn f M M'
```

### `IsAmalg` — Def 1.0.20 — unchanged

Paper, definition 1.0.20 (l. 737–762):

```latex
\begin{definition}
\label{1.4} \mbox{}
\begin{enumerate} \item We say that $(K_\lambda,\preceq \restriction K_\lambda)$
satisfies \emph{the amalgamation property} when: For every
$M_0,M_1\allowbreak ,M_2$ in $K_\lambda$, such that $n<3
\Rightarrow M_0 \preceq M_n$, there are $f_1,f_2,M_3$ such that:
$f_n:M_n \to M_3$ is an embedding over $M_0$, i.e., the diagram
below commutes. In such a case, we say that $(f_1,f_2,M_3)$ is an
amalgamation of $M_1$ and $M_2$ over $M_0$ or that $M_3$ is an
amalgam of $M_1,M_2$ over $M_0$.
\[ \xymatrix{\ar @{} [dr]
M_1
\ar[r]^{f_1}  &M_3 \\
M_0 \ar[u]^{\id} \ar[r]_{\id} & M_2 \ar[u]_{f_2} }
\] \item
We say that $K_\lambda$ satisfies \emph{the joint embedding
property} when: If $M_1,M_2 \in K_\lambda$, then there are
$f_1,f_2,M_3$ such that for $n=1,2$ $f_n:M_n \to M_3$ is an
embedding and $M_3 \in K_\lambda$.
\item $M \in K$ is $\preceq$-\emph{maximal} if there is no $N \in
K$ with $M\prec N$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:333):

```lean
/-- Def 1.0.20(1): `(f₁, f₂, M₃)` is an amalgamation of `M₁` and `M₂` over `M₀`:
`fₙ : Mₙ → M₃` is an embedding over `M₀` (`n = 1, 2`). -/
def IsAmalg (S : KSys U L) (f₁ f₂ : U → U) (M₃ M₀ M₁ M₂ : Model U L) : Prop :=
  IsEmb S f₁ M₁ M₃ ∧ IsEmb S f₂ M₂ M₃ ∧ Over f₁ M₁ M₃ M₀.carrier ∧ Over f₂ M₂ M₃ M₀.carrier
```

### `IsAmalgIn` — Def 1.0.20 — agent reading

Paper, definition 1.0.20 (l. 737–762):

```latex
\begin{definition}
\label{1.4} \mbox{}
\begin{enumerate} \item We say that $(K_\lambda,\preceq \restriction K_\lambda)$
satisfies \emph{the amalgamation property} when: For every
$M_0,M_1\allowbreak ,M_2$ in $K_\lambda$, such that $n<3
\Rightarrow M_0 \preceq M_n$, there are $f_1,f_2,M_3$ such that:
$f_n:M_n \to M_3$ is an embedding over $M_0$, i.e., the diagram
below commutes. In such a case, we say that $(f_1,f_2,M_3)$ is an
amalgamation of $M_1$ and $M_2$ over $M_0$ or that $M_3$ is an
amalgam of $M_1,M_2$ over $M_0$.
\[ \xymatrix{\ar @{} [dr]
M_1
\ar[r]^{f_1}  &M_3 \\
M_0 \ar[u]^{\id} \ar[r]_{\id} & M_2 \ar[u]_{f_2} }
\] \item
We say that $K_\lambda$ satisfies \emph{the joint embedding
property} when: If $M_1,M_2 \in K_\lambda$, then there are
$f_1,f_2,M_3$ such that for $n=1,2$ $f_n:M_n \to M_3$ is an
embedding and $M_3 \in K_\lambda$.
\item $M \in K$ is $\preceq$-\emph{maximal} if there is no $N \in
K$ with $M\prec N$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:339):

```lean
-- AGENT-CHOICE (reading): an "amalgamation" in a `K_λ` context has its amalgam in `K_λ`
-- (Def 1.0.20 is stated for `(K_λ, ≼ ↾ K_λ)`); used in Sections 1, 4, 5.
/-- Def 1.0.20(1) inside `(K_λ, ≼ ↾ K_λ)`: an amalgamation whose amalgam `M₃` is in `K_λ`. -/
def IsAmalgIn (S : KSys U L) (lam : Cardinal.{u}) (f₁ f₂ : U → U) (M₃ M₀ M₁ M₂ : Model U L) :
    Prop :=
  IsAmalg S f₁ f₂ M₃ M₀ M₁ M₂ ∧ M₃ ∈ S.Kc lam
```

### `AP` — Def 1.0.20 — unchanged

Paper, definition 1.0.20 (l. 737–762):

```latex
\begin{definition}
\label{1.4} \mbox{}
\begin{enumerate} \item We say that $(K_\lambda,\preceq \restriction K_\lambda)$
satisfies \emph{the amalgamation property} when: For every
$M_0,M_1\allowbreak ,M_2$ in $K_\lambda$, such that $n<3
\Rightarrow M_0 \preceq M_n$, there are $f_1,f_2,M_3$ such that:
$f_n:M_n \to M_3$ is an embedding over $M_0$, i.e., the diagram
below commutes. In such a case, we say that $(f_1,f_2,M_3)$ is an
amalgamation of $M_1$ and $M_2$ over $M_0$ or that $M_3$ is an
amalgam of $M_1,M_2$ over $M_0$.
\[ \xymatrix{\ar @{} [dr]
M_1
\ar[r]^{f_1}  &M_3 \\
M_0 \ar[u]^{\id} \ar[r]_{\id} & M_2 \ar[u]_{f_2} }
\] \item
We say that $K_\lambda$ satisfies \emph{the joint embedding
property} when: If $M_1,M_2 \in K_\lambda$, then there are
$f_1,f_2,M_3$ such that for $n=1,2$ $f_n:M_n \to M_3$ is an
embedding and $M_3 \in K_\lambda$.
\item $M \in K$ is $\preceq$-\emph{maximal} if there is no $N \in
K$ with $M\prec N$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:344):

```lean
/-- Def 1.0.20(1): `(K_λ, ≼ ↾ K_λ)` satisfies the amalgamation property. -/
def AP (S : KSys U L) (lam : Cardinal.{u}) : Prop :=
  ∀ M₀ ∈ S.Kc lam, ∀ M₁ ∈ S.Kc lam, ∀ M₂ ∈ S.Kc lam, S.le M₀ M₁ → S.le M₀ M₂ →
    ∃ (f₁ f₂ : U → U) (M₃ : Model U L), IsAmalgIn S lam f₁ f₂ M₃ M₀ M₁ M₂
```

### `JEP` — Def 1.0.20 — unchanged

Paper, definition 1.0.20 (l. 737–762):

```latex
\begin{definition}
\label{1.4} \mbox{}
\begin{enumerate} \item We say that $(K_\lambda,\preceq \restriction K_\lambda)$
satisfies \emph{the amalgamation property} when: For every
$M_0,M_1\allowbreak ,M_2$ in $K_\lambda$, such that $n<3
\Rightarrow M_0 \preceq M_n$, there are $f_1,f_2,M_3$ such that:
$f_n:M_n \to M_3$ is an embedding over $M_0$, i.e., the diagram
below commutes. In such a case, we say that $(f_1,f_2,M_3)$ is an
amalgamation of $M_1$ and $M_2$ over $M_0$ or that $M_3$ is an
amalgam of $M_1,M_2$ over $M_0$.
\[ \xymatrix{\ar @{} [dr]
M_1
\ar[r]^{f_1}  &M_3 \\
M_0 \ar[u]^{\id} \ar[r]_{\id} & M_2 \ar[u]_{f_2} }
\] \item
We say that $K_\lambda$ satisfies \emph{the joint embedding
property} when: If $M_1,M_2 \in K_\lambda$, then there are
$f_1,f_2,M_3$ such that for $n=1,2$ $f_n:M_n \to M_3$ is an
embedding and $M_3 \in K_\lambda$.
\item $M \in K$ is $\preceq$-\emph{maximal} if there is no $N \in
K$ with $M\prec N$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:349):

```lean
/-- Def 1.0.20(2): `K_λ` satisfies the joint embedding property. -/
def JEP (S : KSys U L) (lam : Cardinal.{u}) : Prop :=
  ∀ M₁ ∈ S.Kc lam, ∀ M₂ ∈ S.Kc lam, ∃ (f₁ f₂ : U → U) (M₃ : Model U L),
    M₃ ∈ S.Kc lam ∧ IsEmb S f₁ M₁ M₃ ∧ IsEmb S f₂ M₂ M₃
```

### `IsMaximal` — Def 1.0.20 — unchanged

Paper, definition 1.0.20 (l. 737–762):

```latex
\begin{definition}
\label{1.4} \mbox{}
\begin{enumerate} \item We say that $(K_\lambda,\preceq \restriction K_\lambda)$
satisfies \emph{the amalgamation property} when: For every
$M_0,M_1\allowbreak ,M_2$ in $K_\lambda$, such that $n<3
\Rightarrow M_0 \preceq M_n$, there are $f_1,f_2,M_3$ such that:
$f_n:M_n \to M_3$ is an embedding over $M_0$, i.e., the diagram
below commutes. In such a case, we say that $(f_1,f_2,M_3)$ is an
amalgamation of $M_1$ and $M_2$ over $M_0$ or that $M_3$ is an
amalgam of $M_1,M_2$ over $M_0$.
\[ \xymatrix{\ar @{} [dr]
M_1
\ar[r]^{f_1}  &M_3 \\
M_0 \ar[u]^{\id} \ar[r]_{\id} & M_2 \ar[u]_{f_2} }
\] \item
We say that $K_\lambda$ satisfies \emph{the joint embedding
property} when: If $M_1,M_2 \in K_\lambda$, then there are
$f_1,f_2,M_3$ such that for $n=1,2$ $f_n:M_n \to M_3$ is an
embedding and $M_3 \in K_\lambda$.
\item $M \in K$ is $\preceq$-\emph{maximal} if there is no $N \in
K$ with $M\prec N$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:354):

```lean
/-- Def 1.0.20(3): `M ∈ K` is `≼`-maximal: there is no `N ∈ K` with `M ≺ N`. -/
def IsMaximal (S : KSys U L) (M : Model U L) : Prop :=
  M ∈ S.K ∧ ¬ ∃ N ∈ S.K, S.lt M N
```

### `Tri` — no paper item — encoding

Lean (AEC.lean:358):

```lean
/-- ENCODING. Triples `(M, N, a)`. -/
abbrev Tri (U : Type u) (L : Language.{u, u}) := Model U L × Model U L × U
```

### `KSys.K3` — Def 1.0.21 — unchanged

Paper, definition 1.0.21 (l. 769–777):

```latex
\begin{definition}\label{K^3}
\mbox{}
\begin{enumerate}
\item $K^3_{K,\preceq}=:\{(M,N,a):M,N \in K,\ M \preceq N,\ a \in
N\}$. When the class $(K,\preceq)$ is clear from the context we
omit it and write $K^3$. \item $K^3_\lambda:=\{(M,N,a):M,N \in
K_\lambda,\ M \preceq N,\ a \in N\}$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:361):

```lean
/-- Def 1.0.21(1): `K³ = {(M, N, a) : M, N ∈ K, M ≼ N, a ∈ N}`. -/
def KSys.K3 (S : KSys U L) : Set (Tri U L) :=
  {t | t.1 ∈ S.K ∧ t.2.1 ∈ S.K ∧ S.le t.1 t.2.1 ∧ t.2.2 ∈ t.2.1.carrier}
```

### `KSys.K3c` *(not in the main statements)* — Def 1.0.21 — unchanged

Paper, definition 1.0.21 (l. 769–777):

```latex
\begin{definition}\label{K^3}
\mbox{}
\begin{enumerate}
\item $K^3_{K,\preceq}=:\{(M,N,a):M,N \in K,\ M \preceq N,\ a \in
N\}$. When the class $(K,\preceq)$ is clear from the context we
omit it and write $K^3$. \item $K^3_\lambda:=\{(M,N,a):M,N \in
K_\lambda,\ M \preceq N,\ a \in N\}$.
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:365):

```lean
/-- Def 1.0.21(2): `K³_λ = {(M, N, a) : M, N ∈ K_λ, M ≼ N, a ∈ N}`. -/
def KSys.K3c (S : KSys U L) (lam : Cardinal.{u}) : Set (Tri U L) :=
  {t | t.1 ∈ S.Kc lam ∧ t.2.1 ∈ S.Kc lam ∧ S.le t.1 t.2.1 ∧ t.2.2 ∈ t.2.1.carrier}
```

### `typePool` — Def 1.0.22 — **deviation (author-confirmed / typo)**

Paper, definition 1.0.22 (l. 782–795):

```latex
\begin{definition}
\label{1.3} \mbox{}
\begin{enumerate}
\item $E^*_{K,\preceq}$ is the following relation on
$K^3_{K,\preceq}$: $(M_0,N_0,a_0)E^* \allowbreak (M_1,N_1,a_1)$
iff $M_1=M_0$ and for some $N_2 \in K_\lambda$ with $N_1 \preceq
N_2$ there is an embedding $f:N_0 \to N_2$ over $M_0$ with
$f(a_0)=a_1$. \item $E_{K,\preceq}$ is the closure of
$E^*_{K,\preceq}$ under transitivity, i.e., the closure to an
equivalence relation.
\end{enumerate}
When $(K,\preceq)$ is clear from the context we omit it writing
$E^*,E$.
\end{definition}
```

Lean (AEC.lean:374):

```lean
-- DEVIATION (author-confirmed erratum): the paper has `N₂ ∈ K_λ`; the author confirmed that
-- `N₂` ranges over all of `K`. For triples in `K³_λ` nothing changes when `LST ≤ λ`.
/-- Def 1.0.22: the class from which the model `N₂` in the definition of `E*` is taken.
Original text: "for some `N₂ ∈ K_λ` with `N₁ ≼ N₂` there is an embedding `f : N₀ → N₂` over
`M₀` with `f(a₀) = a₁`". Erratum (confirmed by the author): `N₂ ∈ K`. The cardinal argument is
kept for uniformity but is no longer used. -/
def typePool (S : KSys U L) (_lam : Cardinal.{u}) : Set (Model U L) := S.K
```

### `EStar` — Def 1.0.22 — unchanged

Paper, definition 1.0.22 (l. 782–795):

```latex
\begin{definition}
\label{1.3} \mbox{}
\begin{enumerate}
\item $E^*_{K,\preceq}$ is the following relation on
$K^3_{K,\preceq}$: $(M_0,N_0,a_0)E^* \allowbreak (M_1,N_1,a_1)$
iff $M_1=M_0$ and for some $N_2 \in K_\lambda$ with $N_1 \preceq
N_2$ there is an embedding $f:N_0 \to N_2$ over $M_0$ with
$f(a_0)=a_1$. \item $E_{K,\preceq}$ is the closure of
$E^*_{K,\preceq}$ under transitivity, i.e., the closure to an
equivalence relation.
\end{enumerate}
When $(K,\preceq)$ is clear from the context we omit it writing
$E^*,E$.
\end{definition}
```

Lean (AEC.lean:379):

```lean
/-- Def 1.0.22(1): `(M₀, N₀, a₀) E* (M₁, N₁, a₁)` iff (both are in `K³`,) `M₁ = M₀` and for some
`N₂ ∈ K_λ` [erratum: `N₂ ∈ K`, see `typePool`] with `N₁ ≼ N₂` there is an embedding
`f : N₀ → N₂` over `M₀` with `f(a₀) = a₁`. -/
def EStar (S : KSys U L) (lam : Cardinal.{u}) (t t' : Tri U L) : Prop :=
  t ∈ S.K3 ∧ t' ∈ S.K3 ∧ t'.1 = t.1 ∧
    ∃ N₂ ∈ typePool S lam, S.le t'.2.1 N₂ ∧
      ∃ f : U → U, IsEmb S f t.2.1 N₂ ∧ Over f t.2.1 N₂ t.1.carrier ∧ f t.2.2 = t'.2.2
```

### `ERel` — Def 1.0.22 — agent reading

Paper, definition 1.0.22 (l. 782–795):

```latex
\begin{definition}
\label{1.3} \mbox{}
\begin{enumerate}
\item $E^*_{K,\preceq}$ is the following relation on
$K^3_{K,\preceq}$: $(M_0,N_0,a_0)E^* \allowbreak (M_1,N_1,a_1)$
iff $M_1=M_0$ and for some $N_2 \in K_\lambda$ with $N_1 \preceq
N_2$ there is an embedding $f:N_0 \to N_2$ over $M_0$ with
$f(a_0)=a_1$. \item $E_{K,\preceq}$ is the closure of
$E^*_{K,\preceq}$ under transitivity, i.e., the closure to an
equivalence relation.
\end{enumerate}
When $(K,\preceq)$ is clear from the context we omit it writing
$E^*,E$.
\end{definition}
```

Lean (AEC.lean:388):

```lean
-- AGENT-CHOICE (reading): "closure of E* under transitivity, i.e., the closure to an equivalence
-- relation" is formalized as the equivalence closure `Relation.EqvGen`.
/-- Def 1.0.22(2): `E`, "the closure of `E*` under transitivity, i.e., the closure to an
equivalence relation". -/
def ERel (S : KSys U L) (lam : Cardinal.{u}) : Tri U L → Tri U L → Prop :=
  Relation.EqvGen (EStar S lam)
```

### `tp` — Def 1.0.24 — unchanged

Paper, definition 1.0.24 (l. 813–827):

```latex
\begin{definition} \label{definition of a
type} \mbox{}
\begin{enumerate}
\item For every $(M,N,a) \in K^3$ let $tp_{K,\preceq}(a,M,N)$, the
\emph{Galois-type} of $a$ in $N$ over $M$, be the equivalence
class of $(M,N,a)$ under $E_{K,\preceq}$.  When the class
$(K,\preceq)$ is clear from the context we omit it, writing
$tp(a,M,N)$ (in other texts, it is called `$ga-tp(a/M,N)$'). \item
For every $M \in K$, $S(M):=\{tp(a,M,N):(M,N,a) \in K^3\}$ and
$S^{na}(M):=\{tp(a,M,N):(M,N,a) \in K^3$ and $a \in N-M\}$. A
Galois-type in $S^{na}(M)$ is called non-algebraic Galois-type.
\item If $p=tp(a,M_1,N)$ and $M_0 \preceq M_1$, then we define
$p\restriction M_0=tp(a,M_0,N)$,
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:393):

```lean
/-- Def 1.0.24(1): `tp(a, M, N)`, the Galois-type of `a` in `N` over `M`: the equivalence class
of `(M, N, a)` under `E`. -/
def tp (S : KSys U L) (lam : Cardinal.{u}) (a : U) (M N : Model U L) : Set (Tri U L) :=
  {t | ERel S lam (M, N, a) t}
```

### `SAll` — Def 1.0.24 — unchanged

Paper, definition 1.0.24 (l. 813–827):

```latex
\begin{definition} \label{definition of a
type} \mbox{}
\begin{enumerate}
\item For every $(M,N,a) \in K^3$ let $tp_{K,\preceq}(a,M,N)$, the
\emph{Galois-type} of $a$ in $N$ over $M$, be the equivalence
class of $(M,N,a)$ under $E_{K,\preceq}$.  When the class
$(K,\preceq)$ is clear from the context we omit it, writing
$tp(a,M,N)$ (in other texts, it is called `$ga-tp(a/M,N)$'). \item
For every $M \in K$, $S(M):=\{tp(a,M,N):(M,N,a) \in K^3\}$ and
$S^{na}(M):=\{tp(a,M,N):(M,N,a) \in K^3$ and $a \in N-M\}$. A
Galois-type in $S^{na}(M)$ is called non-algebraic Galois-type.
\item If $p=tp(a,M_1,N)$ and $M_0 \preceq M_1$, then we define
$p\restriction M_0=tp(a,M_0,N)$,
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:397):

```lean
/-- Def 1.0.24(2): `S(M) = {tp(a, M, N) : (M, N, a) ∈ K³}`. -/
def SAll (S : KSys U L) (lam : Cardinal.{u}) (M : Model U L) : Set (Set (Tri U L)) :=
  {p | ∃ (N : Model U L) (a : U), (M, N, a) ∈ S.K3 ∧ p = tp S lam a M N}
```

### `res` — Def 1.0.24 — encoding

Paper, definition 1.0.24 (l. 813–827):

```latex
\begin{definition} \label{definition of a
type} \mbox{}
\begin{enumerate}
\item For every $(M,N,a) \in K^3$ let $tp_{K,\preceq}(a,M,N)$, the
\emph{Galois-type} of $a$ in $N$ over $M$, be the equivalence
class of $(M,N,a)$ under $E_{K,\preceq}$.  When the class
$(K,\preceq)$ is clear from the context we omit it, writing
$tp(a,M,N)$ (in other texts, it is called `$ga-tp(a/M,N)$'). \item
For every $M \in K$, $S(M):=\{tp(a,M,N):(M,N,a) \in K^3\}$ and
$S^{na}(M):=\{tp(a,M,N):(M,N,a) \in K^3$ and $a \in N-M\}$. A
Galois-type in $S^{na}(M)$ is called non-algebraic Galois-type.
\item If $p=tp(a,M_1,N)$ and $M_0 \preceq M_1$, then we define
$p\restriction M_0=tp(a,M_0,N)$,
\end{enumerate}
\end{definition}
```

Lean (AEC.lean:408):

```lean
-- DEVIATION (encoding): `p ↾ M₀` is the union over all representatives of `p` (no choice).
/-- Def 1.0.24(3): for `p = tp(a, M₁, N)` and `M₀ ≼ M₁`, `p ↾ M₀ = tp(a, M₀, N)`.
ENCODING: the union of `tp(a, M₀, N)` over all representatives `(M₁, N, a)` of `p` (equal to
`tp(a, M₀, N)` whenever the paper's definition is independent of the representative). -/
def res (S : KSys U L) (lam : Cardinal.{u}) (p : Set (Tri U L)) (M₀ : Model U L) :
    Set (Tri U L) :=
  {t | ∃ (M₁ N : Model U L) (a : U), (M₁, N, a) ∈ p ∧ t ∈ tp S lam a M₀ N}
```

### `Realizes` — Def 1.0.25 — unchanged

Paper, definition 1.0.25 (l. 829–835):

```latex
\begin{definition} \label{1.9}
Let $M,N \in K$, $N \preceq M$. $M$ is said to be \emph{full} over
$N$ when $M$ realizes $S(N)$. $M$ is said to be \emph{saturated}
in $\lambda^+$ over $\lambda$, when $M \in K_{\lambda^+}$ and for
every model $N \in K_\lambda$ with $N \preceq M$, $M$ is full over
$N$.
\end{definition}
```

Lean (AEC.lean:414):

```lean
/-- `M` realizes the type `p` over `N` (used in Def 1.0.25): `p = tp(a, N, M)` for some
`a ∈ M`. -/
def Realizes (S : KSys U L) (lam : Cardinal.{u}) (M N : Model U L) (p : Set (Tri U L)) : Prop :=
  ∃ a ∈ M.carrier, tp S lam a N M = p
```

### `Full` — Def 1.0.25 — unchanged

Paper, definition 1.0.25 (l. 829–835):

```latex
\begin{definition} \label{1.9}
Let $M,N \in K$, $N \preceq M$. $M$ is said to be \emph{full} over
$N$ when $M$ realizes $S(N)$. $M$ is said to be \emph{saturated}
in $\lambda^+$ over $\lambda$, when $M \in K_{\lambda^+}$ and for
every model $N \in K_\lambda$ with $N \preceq M$, $M$ is full over
$N$.
\end{definition}
```

Lean (AEC.lean:418):

```lean
/-- Def 1.0.25: for `N ≼ M`, `M` is full over `N` when `M` realizes `S(N)`. -/
def Full (S : KSys U L) (lam : Cardinal.{u}) (M N : Model U L) : Prop :=
  S.le N M ∧ ∀ p ∈ SAll S lam N, Realizes S lam M N p
```

### `Saturated` — Def 1.0.25 — unchanged

Paper, definition 1.0.25 (l. 829–835):

```latex
\begin{definition} \label{1.9}
Let $M,N \in K$, $N \preceq M$. $M$ is said to be \emph{full} over
$N$ when $M$ realizes $S(N)$. $M$ is said to be \emph{saturated}
in $\lambda^+$ over $\lambda$, when $M \in K_{\lambda^+}$ and for
every model $N \in K_\lambda$ with $N \preceq M$, $M$ is full over
$N$.
\end{definition}
```

Lean (AEC.lean:423):

```lean
/-- Def 1.0.25: `M` is saturated in `λ⁺` over `λ`: `M ∈ K_{λ⁺}` and `M` is full over every
`N ∈ K_λ` with `N ≼ M`. -/
def Saturated (S : KSys U L) (lam : Cardinal.{u}) (M : Model U L) : Prop :=
  M ∈ S.Kc (Order.succ lam) ∧ ∀ N ∈ S.Kc lam, S.le N M → Full S lam M N
```

### `Homogeneous` — Def 1.0.28 — unchanged

Paper, definition 1.0.28 (l. 868–873):

```latex
\begin{definition} \label{1.10}
Let $M$ be a model in $K_{\lambda^+}$. $M$ is said to be
\emph{homogenous} in $\lambda^+$ over $\lambda$ if for every
$N_1,N_2 \in K_\lambda$ with $N_1 \preceq M \wedge N_1 \preceq
N_2$, there is a $\preceq$-embedding $f:N_2 \to M$ over $N_1$.
\end{definition}
```

Lean (AEC.lean:428):

```lean
/-- Def 1.0.28: `M ∈ K_{λ⁺}` is homogenous in `λ⁺` over `λ`: for all `N₁, N₂ ∈ K_λ` with
`N₁ ≼ M` and `N₁ ≼ N₂` there is a `≼`-embedding `f : N₂ → M` over `N₁`. -/
def Homogeneous (S : KSys U L) (lam : Cardinal.{u}) (M : Model U L) : Prop :=
  M ∈ S.Kc (Order.succ lam) ∧ ∀ N₁ ∈ S.Kc lam, ∀ N₂ ∈ S.Kc lam, S.le N₁ M → S.le N₁ N₂ →
    ∃ f : U → U, IsEmb S f N₂ M ∧ Over f N₂ M N₁.carrier
```

### `Fact_1_0_18` — Fact 1.0.18 — agent reading, cited (hypothesis via `CitedResults`)

Paper, fact 1.0.18 (l. 715–722):

```latex
\begin{fact}[Lemma 1.23 in \cite{shh}.II] \label{1.14}
Let $(K,\preceq)$ be an AEC in $\lambda$. Then
\begin{enumerate}
\item $(K,\preceq)^{up}$ is an AEC. \item $(K^{up})_\lambda=K$.
\item $\preceq^{up} \restriction K$ is $\preceq$. \item
$LST(K,\preceq)^{up}=\lambda$.
\end{enumerate}
\end{fact}
```

Lean (Frames.lean:87):

```lean
/-- Fact 1.0.18 ([Sh:h].II Lemma 1.23, cited, not proved in the paper): "Let `(K, ≼)` be an AEC
in `λ`. Then (1) `(K, ≼)^up` is an AEC. (2) `(K^up)_λ = K`. (3) `≼^up ↾ K` is `≼`.
(4) `LST(K, ≼)^up = λ`." -/
-- CITED: [Sh:h].II Lemma 1.23.
-- AGENT-CHOICE (statement false as written): if `K = ∅` then `LST(K^up) = 0 ≠ λ`; we add
-- `K ≠ ∅` (`hne`).
-- CITED: stated as a `Prop`, assumed through the field `CitedResults.fact_1_0_18`.
def Fact_1_0_18 : Prop :=
  ∀ {U : Type u} {L : Language.{u, u}}
    (lam : Cardinal.{u}) (hU : Room U lam) (S : KSys U L) (hS : IsAECIn S lam)
    (hne : S.K.Nonempty),
    IsAEC S.up ∧ S.up.Kc lam = S.K ∧ (∀ M ∈ S.K, ∀ N ∈ S.K, (S.up.le M N ↔ S.le M N)) ∧
      S.up.LST = lam
```

### `Fact_1_0_18_up` — Fact 1.0.18 — cited (hypothesis via `CitedResults`)

Paper, fact 1.0.18 (l. 715–722):

```latex
\begin{fact}[Lemma 1.23 in \cite{shh}.II] \label{1.14}
Let $(K,\preceq)$ be an AEC in $\lambda$. Then
\begin{enumerate}
\item $(K,\preceq)^{up}$ is an AEC. \item $(K^{up})_\lambda=K$.
\item $\preceq^{up} \restriction K$ is $\preceq$. \item
$LST(K,\preceq)^{up}=\lambda$.
\end{enumerate}
\end{fact}
```

Lean (Frames.lean:104):

```lean
/-- Fact 1.0.18, clauses widened by the author ([Sh:h].II Lemma 1.23, cited, not proved in the
paper). Original text of Fact 1.0.18: "Let `(K, ≼)` be an AEC in `λ`. Then (1) `(K, ≼)^up` is an
AEC. (2) `(K^up)_λ = K`. (3) `≼^up ↾ K` is `≼`. (4) `LST(K, ≼)^up = λ`." Clauses added (confirmed
by the author to be part of the source): for an AEC `(K, ≼)`, (i) a `≼`-directed union of models of
`K` is a model of `K`, each member `≼` the union (so `K^up ⊆ K`); (ii) `≼^up ⊆ ≼` (the extended
relation agrees with the original one), for models of `K^up` of any size. Used in the paper's
Section 2.1 ("`K⁺ ⊆ K`") and in Cor 11.1.6, Thm 11.1.7, Thm 1.0.2. -/
-- CITED: [Sh:h].II Lemma 1.23 (clauses (i), (ii) confirmed by the author; see NOTES.md, "Cited
-- results widened by the author").
-- CITED: stated as a `Prop`, assumed through the field `CitedResults.fact_1_0_18_up`.
def Fact_1_0_18_up : Prop :=
  ∀ {U : Type u} {L : Language.{u, u}}
    (S : KSys U L) (hS : IsAEC S),
    (∀ M, InUp S M → M ∈ S.K ∧ ∀ (I : Type u) (r : I → I → Prop) (Ms : I → Model U L),
      IsPreorder I r → Nonempty I → (∀ s t, ∃ w, r s w ∧ r t w) →
      M.carrier = (⋃ s, (Ms s).carrier) → (∀ s, IsSubstr (Ms s) M) →
      (∀ s t, r s t → S.le (Ms s) (Ms t)) → ∀ s, S.le (Ms s) M) ∧
    (∀ M N, LeUp S M N → S.le M N)
```

### `Prop_1_0_31` — Prop 1.0.31 — cited (hypothesis via `CitedResults`)

Paper, proposition 1.0.31 (l. 920–926):

```latex
\begin{proposition} [saturativity = model homogeneity]\label{1.12}
Let $(K,\preceq)$ be an AEC such that $K_\lambda$ satisfies the
amalgamation property, and \linebreak $LST(K,\preceq) \leq
\lambda$. Let $M$ be a model in $K_{\lambda^+}$. Then $M$ is
saturated in $\lambda^+$ over $\lambda$ iff $M$ is a homogenous
model in $\lambda^+$ over $\lambda$.
\end{proposition}
```

Lean (Frames.lean:473):

```lean
/-- Prop 1.0.31 (saturativity = model homogeneity; by [Sh:h].II Lemma 1.14): "Let `(K, ≼)` be an
AEC such that `K_λ` satisfies the amalgamation property, and `LST(K, ≼) ≤ λ`. Let
`M ∈ K_{λ⁺}`. Then `M` is saturated in `λ⁺` over `λ` iff `M` is homogenous in `λ⁺` over
`λ`." -/
-- CITED: proved in the paper only by reference to the literature.
-- CITED: stated as a `Prop`, assumed through the field `CitedResults.prop_1_0_31`.
def Prop_1_0_31 : Prop :=
  ∀ {U : Type u} {L : Language.{u, u}}
    (lam : Cardinal.{u}) (hU : Room U lam) (S : KSys U L) (hS : IsAEC S)
    (hAP : AP S lam) (hLST : S.LST ≤ lam) (M : Model U L) (hM : M ∈ S.Kc (Order.succ lam)),
    Saturated S lam M ↔ Homogeneous S lam M
```

### `Thm_1_0_32_1` — Thm 1.0.32 — cited (hypothesis via `CitedResults`)

Paper, theorem 1.0.32 (l. 983–994):

```latex
\begin{theorem}[the uniqueness of the saturated model]\label{1.13}
Suppose $(K_\lambda,\preceq \restriction K_\lambda)$ satisfies the
amalgamation property and $LST(K,\preceq) \leq \lambda$.
\begin{enumerate}
\item Suppose $N \in K_\lambda$ and for $n=1,2$, $N \preceq M_n$,
and $M_n$ is saturated in $\lambda^+$ over $\lambda$. Then $M_1,\
M_2$ are isomorphic over $N$. \item If $M_1,\ M_2$ are saturated
in $\lambda^+$ over $\lambda$ and $(K_\lambda,\preceq \restriction
K_\lambda)$ satisfies the joint embedding property, then $M_1,\
M_2$ are isomorphic.
\end{enumerate}
\end{theorem}
```

Lean (Frames.lean:485):

```lean
/-- Thm 1.0.32(1) (uniqueness of the saturated model; [Sh:h].II Lemma 1.14): "Suppose
`(K_λ, ≼ ↾ K_λ)` satisfies the amalgamation property and `LST(K, ≼) ≤ λ`. Suppose `N ∈ K_λ`
and for `n = 1, 2`, `N ≼ Mₙ`, and `Mₙ` is saturated in `λ⁺` over `λ`. Then `M₁, M₂` are
isomorphic over `N`." -/
-- CITED: proved in the paper only by reference to the literature.
-- CITED: stated as a `Prop`, assumed through the field `CitedResults.thm_1_0_32_1`.
def Thm_1_0_32_1 : Prop :=
  ∀ {U : Type u} {L : Language.{u, u}}
    (lam : Cardinal.{u}) (hU : Room U lam) (S : KSys U L) (hS : IsAEC S)
    (hAP : AP S lam) (hLST : S.LST ≤ lam) (N M₁ M₂ : Model U L) (hN : N ∈ S.Kc lam)
    (h₁ : S.le N M₁) (h₂ : S.le N M₂) (hs₁ : Saturated S lam M₁) (hs₂ : Saturated S lam M₂),
    ∃ f : U → U, IsoOn f M₁ M₂ ∧ Over f M₁ M₂ N.carrier
```

### `Thm_1_0_32_2` — Thm 1.0.32 — cited (hypothesis via `CitedResults`)

Paper, theorem 1.0.32 (l. 983–994):

```latex
\begin{theorem}[the uniqueness of the saturated model]\label{1.13}
Suppose $(K_\lambda,\preceq \restriction K_\lambda)$ satisfies the
amalgamation property and $LST(K,\preceq) \leq \lambda$.
\begin{enumerate}
\item Suppose $N \in K_\lambda$ and for $n=1,2$, $N \preceq M_n$,
and $M_n$ is saturated in $\lambda^+$ over $\lambda$. Then $M_1,\
M_2$ are isomorphic over $N$. \item If $M_1,\ M_2$ are saturated
in $\lambda^+$ over $\lambda$ and $(K_\lambda,\preceq \restriction
K_\lambda)$ satisfies the joint embedding property, then $M_1,\
M_2$ are isomorphic.
\end{enumerate}
\end{theorem}
```

Lean (Frames.lean:496):

```lean
/-- Thm 1.0.32(2): "If `M₁, M₂` are saturated in `λ⁺` over `λ` and `(K_λ, ≼ ↾ K_λ)` satisfies
the joint embedding property, then `M₁, M₂` are isomorphic" (same standing hypotheses as (1)). -/
-- CITED: proved in the paper only by reference to the literature.
-- CITED: stated as a `Prop`, assumed through the field `CitedResults.thm_1_0_32_2`.
def Thm_1_0_32_2 : Prop :=
  ∀ {U : Type u} {L : Language.{u, u}}
    (lam : Cardinal.{u}) (hU : Room U lam) (S : KSys U L) (hS : IsAEC S)
    (hAP : AP S lam) (hLST : S.LST ≤ lam) (M₁ M₂ : Model U L) (hs₁ : Saturated S lam M₁)
    (hs₂ : Saturated S lam M₂) (hJEP : JEP S lam),
    ∃ f : U → U, IsoOn f M₁ M₂
```

### `Frame` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:511):

```lean
/-- Def 2.1.1 / 2.1.3: the data of a frame `s = (K, ≼, S^bs, ⨿)`. `Sbs M` is `S^bs(M)` (a set of
Galois types); `nf M₀ M₁ a M₃` is `⨿(M₀, M₁, a, M₃)`. -/
structure Frame (U : Type u) (L : Language.{u, u}) where
  /-- the pair `(K, ≼)` -/
  S : KSys U L
  /-- `S^bs` -/
  Sbs : Model U L → Set (Set (Tri U L))
  /-- `⨿` -/
  nf : Model U L → Model U L → U → Model U L → Prop
```

### `Frame.NotFork` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:525):

```lean
/-- Def 2.1.1(3)(b), interpretation: "`p ∈ S^bs(N)` does not fork over `M`" means "for some
`a, N⁺` we have `p = tp(a, N, N⁺)` and `⨿(M, N, a, N⁺)`". -/
def NotFork (M N : Model U L) (p : Set (Tri U L)) : Prop :=
  ∃ (a : U) (N' : Model U L), p = tp s.S lam a N N' ∧ s.nf M N a N'
```

### `Frame.IsNFExt` — Def 2.5.5 — unchanged

Paper, definition 2.5.5 (l. 2090–2097):

```latex
\begin{definition} \label{2.4}
Let $\frak{s}$ be a semi-good $\lambda$-frame. We say that
$\frak{s}$ \emph{satisfies the conjugation property} when:
$K_\lambda$ is categorical and if $M_1,M_2 \in K_\lambda$, $M_1
\preceq M_2$ and $p_2 \in S^{bs}(M_2)$ is the non-forking
extension of $p_1 \in S^{bs}(M_1)$, then the types $p_1,p_2$ are
conjugate.
\end{definition}
```

Lean (Frames.lean:530):

```lean
/-- `p₂` is the non-forking extension of `p₁` (used in Def 2.5.5, 7.1.4): `p₂` does not fork
over `M₁` and `p₂ ↾ M₁ = p₁`. -/
def IsNFExt (M₁ M₂ : Model U L) (p₂ p₁ : Set (Tri U L)) : Prop :=
  s.NotFork lam M₁ M₂ p₂ ∧ res s.S lam p₂ M₁ = p₁
```

### `Frame.Ax0a` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:534):

```lean
/-- Def 2.1.1(0)(a): `(K, ≼)` is an AEC. -/
def Ax0a : Prop := IsAEC s.S
```

### `Frame.Ax0b` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:537):

```lean
/-- Def 2.1.1(0)(b): `LST(K, ≼) ≤ λ`. -/
def Ax0b : Prop := s.S.LST ≤ lam
```

### `Frame.Ax1a` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:540):

```lean
/-- Def 2.1.1(1)(a): `(K_λ, ≼ ↾ K_λ)` satisfies the joint embedding property. -/
def Ax1a : Prop := JEP s.S lam
```

### `Frame.Ax1b` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:543):

```lean
/-- Def 2.1.1(1)(b): `(K_λ, ≼ ↾ K_λ)` satisfies the amalgamation property. -/
def Ax1b : Prop := AP s.S lam
```

### `Frame.Ax1c` — Def 2.1.1 — agent reading

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:548):

```lean
-- AGENT-CHOICE (reading): "no ≼-maximal model in K_λ" is maximality inside `(K_λ, ≼ ↾ K_λ)`.
/-- Def 2.1.1(1)(c): there is no `≼`-maximal model in `K_λ` (maximality inside
`(K_λ, ≼ ↾ K_λ)`, see NOTES.md). -/
def Ax1c : Prop := ∀ M ∈ s.S.Kc lam, ¬ IsMaximal (s.S.restrict (s.S.Kc lam)) M
```

### `Frame.Ax2a` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:551):

```lean
/-- Def 2.1.1(2)(a): `S^bs(M) ⊆ S^na(M) = {tp(a, M, N) : M ≺ N ∈ K_λ, a ∈ N - M}`. -/
def Ax2a : Prop :=
  ∀ M ∈ s.S.Kc lam, s.Sbs M ⊆
    {p | ∃ (N : Model U L) (a : U), s.S.lt M N ∧ N ∈ s.S.Kc lam ∧
      a ∈ N.carrier \ M.carrier ∧ p = tp s.S lam a M N}
```

### `Frame.Ax2b` — Def 2.1.1 — agent reading

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:559):

```lean
-- AGENT-CHOICE (added hypothesis): `M ∈ K_λ`, since `S^bs` is a function with domain `K_λ`; the
-- image `f[M]` is any `M'` with `IsoOn f M M'` (it is unique).
/-- Def 2.1.1(2)(b): `S^bs` respects isomorphisms. -/
def Ax2b : Prop :=
  ∀ (M N N' M' : Model U L) (a : U) (f : U → U), M ∈ s.S.Kc lam →
    tp s.S lam a M N ∈ s.Sbs M → IsoOn f N N' → IsoOn f M M' →
      tp s.S lam (f a) M' N' ∈ s.Sbs M'
```

### `Frame.Ax2c` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:565):

```lean
/-- Def 2.1.1(2)(c): density of the basic types. -/
def Ax2c : Prop :=
  ∀ M ∈ s.S.Kc lam, ∀ N ∈ s.S.Kc lam, s.S.lt M N →
    ∃ a ∈ N.carrier \ M.carrier, tp s.S lam a M N ∈ s.Sbs M
```

### `Frame.BasicStab` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:571):

```lean
/-- Def 2.1.1(2)(d) with bound `μ`: `|S^bs(M)| ≤ μ` for `M ∈ K_λ`. Basic stability is
`μ = λ`; basic almost stability (Def 2.1.3) is `μ = λ⁺`. -/
def BasicStab (μ : Cardinal.{u}) : Prop := ∀ M ∈ s.S.Kc lam, #(s.Sbs M) ≤ μ
```

### `Frame.Ax3a` — Def 2.1.1 — **changed in the proof stage**

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:578):

```lean
-- PROOF-STAGE CHANGE: the presupposition `M₀ ≼ M₁ ≼ M₃` (needed for `tp(a, Mₙ, M₃)` to be a
-- type over `Mₙ`, and used in every application of monotonicity) is made explicit (step: Prop
-- 2.1.2, applying 3(b) needs `M₀ ≼ M₁` and `M₁ ≼ M₃`).
/-- Def 2.1.1(3)(a): `⨿` is a set of quadruples `(M₀, M₁, a, M₃)` with `M₀, M₁, M₃ ∈ K_λ`,
`a ∈ M₃ - M₁`, `tp(a, Mₙ, M₃) ∈ S^bs(Mₙ)` (`n = 0, 1`), and it respects isomorphisms. -/
def Ax3a : Prop :=
  (∀ M₀ M₁ a M₃, s.nf M₀ M₁ a M₃ →
    M₀ ∈ s.S.Kc lam ∧ M₁ ∈ s.S.Kc lam ∧ M₃ ∈ s.S.Kc lam ∧ a ∈ M₃.carrier \ M₁.carrier ∧
      s.S.le M₀ M₁ ∧ s.S.le M₁ M₃ ∧
      tp s.S lam a M₀ M₃ ∈ s.Sbs M₀ ∧ tp s.S lam a M₁ M₃ ∈ s.Sbs M₁) ∧
  (∀ (M₀ M₁ M₃ M₀' M₁' M₃' : Model U L) (a : U) (f : U → U), s.nf M₀ M₁ a M₃ →
    IsoOn f M₃ M₃' → IsoOn f M₀ M₀' → IsoOn f M₁ M₁' → s.nf M₀' M₁' (f a) M₃')
```

### `Frame.Ax3b` — Def 2.1.1 — **changed in the proof stage**

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:591):

```lean
/-- Def 2.1.1(3)(b), monotonicity: if `M₀ ≼ M₀* ≼ M₁* ≼ M₁ ≼ M₃ ≼ M₃*` and
`M₁* ∪ {a} ⊆ M₃** ≼ M₃*`, then `⨿(M₀, M₁, a, M₃) → ⨿(M₀*, M₁*, a, M₃**)`. -/
-- PROOF-STAGE CHANGE: added `M₃** ∈ K_λ`. Without it 3(b) contradicts 3(a) (which puts every
-- ⨿-quadruple in `K_λ`) as soon as `K` has a model larger than `λ` above `M₃`, so no frame
-- could satisfy both (step: Prop 2.1.2, monotonicity into the amalgam).
def Ax3b : Prop :=
  ∀ (M₀ M₀s M₁s M₁ M₃ M₃s M₃ss : Model U L) (a : U),
    s.S.le M₀ M₀s → s.S.le M₀s M₁s → s.S.le M₁s M₁ → s.S.le M₁ M₃ → s.S.le M₃ M₃s →
    M₁s.carrier ∪ {a} ⊆ M₃ss.carrier → s.S.le M₃ss M₃s → M₃ss ∈ s.S.Kc lam →
    s.nf M₀ M₁ a M₃ → s.nf M₀s M₁s a M₃ss
```

### `Frame.Ax3c` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:600):

```lean
/-- Def 2.1.1(3)(c), local character: for every limit `δ < λ⁺`, if `⟨M_α : α ≤ δ+1⟩` is an
increasing continuous sequence in `K_λ` and `tp(a, M_δ, M_{δ+1}) ∈ S^bs(M_δ)`, then for some
`α < δ`, `tp(a, M_δ, M_{δ+1})` does not fork over `M_α`. -/
def Ax3c : Prop :=
  ∀ δ : Ordinal.{u}, Order.IsSuccLimit δ → δ < (Order.succ lam).ord →
    ∀ M : Ordinal.{u} → Model U L, IsIncCont s.S M (Iic (δ + 1)) (s.S.Kc lam) →
      ∀ a : U, tp s.S lam a (M δ) (M (δ + 1)) ∈ s.Sbs (M δ) →
        ∃ α < δ, s.NotFork lam (M α) (M δ) (tp s.S lam a (M δ) (M (δ + 1)))
```

### `Frame.Ax3d` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:607):

```lean
/-- Def 2.1.1(3)(d), uniqueness of the non-forking extension. -/
def Ax3d : Prop :=
  ∀ M ∈ s.S.Kc lam, ∀ N ∈ s.S.Kc lam, s.S.le M N → ∀ p ∈ s.Sbs N, ∀ q ∈ s.Sbs N,
    s.NotFork lam M N p → s.NotFork lam M N q → res s.S lam p M = res s.S lam q M → p = q
```

### `Frame.Ax3e` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:612):

```lean
/-- Def 2.1.1(3)(e), symmetry. -/
def Ax3e : Prop :=
  ∀ M₀ ∈ s.S.Kc lam, ∀ M₁ ∈ s.S.Kc lam, ∀ M₃ ∈ s.S.Kc lam, ∀ a₁ a₂ : U,
    s.S.le M₀ M₁ → s.S.le M₁ M₃ → a₁ ∈ M₁.carrier → tp s.S lam a₁ M₀ M₃ ∈ s.Sbs M₀ →
    s.NotFork lam M₀ M₁ (tp s.S lam a₂ M₁ M₃) →
      ∃ M₂ ∈ s.S.Kc lam, ∃ M₃s ∈ s.S.Kc lam, a₂ ∈ M₂.carrier ∧ s.S.le M₀ M₂ ∧
        s.S.le M₂ M₃s ∧ s.S.le M₃ M₃s ∧ s.NotFork lam M₀ M₂ (tp s.S lam a₁ M₂ M₃s)
```

### `Frame.Ax3f` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:620):

```lean
/-- Def 2.1.1(3)(f), existence of a non-forking extension. -/
def Ax3f : Prop :=
  ∀ M ∈ s.S.Kc lam, ∀ N ∈ s.S.Kc lam, ∀ p ∈ s.Sbs M, s.S.lt M N →
    ∃ q ∈ s.Sbs N, s.NotFork lam M N q ∧ res s.S lam q M = p
```

### `Frame.Ax3g` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:625):

```lean
/-- Def 2.1.1(3)(g), continuity (`δ` limit by the convention on the letter `δ`). -/
def Ax3g : Prop :=
  ∀ δ : Ordinal.{u}, Order.IsSuccLimit δ → δ < (Order.succ lam).ord →
    ∀ M : Ordinal.{u} → Model U L, IsIncCont s.S M (Iic δ) (s.S.Kc lam) →
      ∀ p ∈ SAll s.S lam (M δ),
        (∀ α < δ, s.NotFork lam (M 0) (M α) (res s.S lam p (M α))) →
          p ∈ s.Sbs (M δ) ∧ s.NotFork lam (M 0) (M δ) p
```

### `Frame.Core` — Def 2.1.1 — encoding

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:634):

```lean
/-- ENCODING. The axioms of Def 2.1.1 shared by all variants of frames in the paper: all of them
except (2)(d) basic stability, (3)(c) local character, (3)(e) symmetry, (3)(g) continuity. -/
structure Core : Prop where
  ax0a : s.Ax0a
  ax0b : s.Ax0b lam
  ax1a : s.Ax1a lam
  ax1b : s.Ax1b lam
  ax1c : s.Ax1c lam
  ax2a : s.Ax2a lam
  ax2b : s.Ax2b lam
  ax2c : s.Ax2c lam
  ax3a : s.Ax3a lam
  ax3b : s.Ax3b lam
  ax3d : s.Ax3d lam
  ax3f : s.Ax3f lam
```

### `Frame.IsGood` — Def 2.1.1 — unchanged

Paper, definition 2.1.1 (l. 1145–1211):

```latex
\begin{definition} \label{2.1a} \label{definition good frame}
\label{definition of a good frame}
$\frak{s}=(K,\preceq,S^{bs},\dnf)$ is a \emph{good $\lambda$-frame} if:\\
(0)
\begin{enumerate}[(a)]
\item $(K,\preceq)$ is an AEC. \item $LST(K,\preceq) \leq
\lambda$.
\end{enumerate}
(1)
\begin{enumerate}[(a)]
\item $(K_\lambda, \preceq \restriction K_\lambda)$ 
satisfies the joint
embedding property. \item $(K_\lambda, \preceq \restriction K_\lambda)$ satisfies the amalgamation property. \item There is no $\preceq$-maximal model in $K_\lambda$.\\
\end{enumerate}
(2) $S^{bs}$ is a function with domain $K_\lambda$, which
satisfies the following axioms:
\begin{enumerate}[(a)]
\item $S^{bs}(M) \subseteq S^{na}(M)=\{tp(a,M,N):M\prec N \in
K_\lambda,\ a\in N-M\}$. \item It respects isomorphisms: If
$tp(a,M,N) \in S^{bs}(M)$ and $f:N \to N'$ is an isomorphism, then
$tp(f(a),f[M],N') \in S^{bs}(f[M])$. \item Density of the basic
types: If $M,N \in K_\lambda$ and $M \prec N$, then there is $a
\in N-M$ such that $tp(a,M,N) \in S^{bs}(M)$. \item Basic
stability: For every $M \in K_\lambda$, the cardinality of
$S^{bs}(M)$ is $\leq \lambda$.
\end{enumerate}
(3) the relation $\dnf$ satisfies the following axioms:
\begin{enumerate}[(a)]
\item $\dnf$ is a set of quadruples $(M_0,M_1,a,M_3)$ where
$M_0,M_1,M_3 \in K_\lambda$, $a \in M_3-M_1$ and for $n=0,1$
$tp(a,M_n,M_3) \in S^{bs}(M_n)$ and it respects isomorphisms: If
$\dnf(M_0,M_1,a,M_3)$ and $f:M_3 \to M_3'$ is an isomorphism, then
$\dnf(f[M_0],f[M_1],f(a),M_3')$. \item Monotonicity: If $M_0
\preceq M^*_0 \preceq M^*_1 \preceq M_1 \preceq M_3 \preceq
M_3^*,\ M^*_1\bigcup \{a\} \subseteq M^{**}_3 \preceq M^*_3$, then
$\dnf(M_0,M_1,a,M_3) \Rightarrow \dnf(M^*_0,M^*_1,a,M^{**}_3)$.
From now on, `$p \in S^{bs}(N)$ does not fork over $M$' will be
interpreted as `for some $a,N^+$ we have $p=tp(a,N,N^+)$ and
$\dnf(M,N,a,N^+)$'. See Proposition ~\ref{dnf not as a sign}.
\item Local character: For every limit ordinal $\delta<\lambda^+$
if $\langle M_\alpha:\alpha \leq \delta+1 \rangle$ is an increasing
continuous sequence of models in $K_\lambda$, and
$tp(a,M_\delta,M_{\delta+1}) \in S^{bs}(M_\delta)$, then there is
$\alpha<\delta$ such that $tp(a,M_\delta,\allowbreak
M_{\delta+1})$ does not fork over $M_\alpha$. \item Uniqueness of
… (truncated; see the .tex)
```

Lean (Frames.lean:649):

```lean
/-- Def 2.1.1: `s` is a good `λ`-frame. -/
def IsGood : Prop :=
  s.Core lam ∧ s.Ax3g lam ∧ s.Ax3e lam ∧ s.BasicStab lam lam ∧ s.Ax3c lam
```

### `Frame.IsSemiGood` — Def 2.1.3 — unchanged

Paper, definition 2.1.3 (l. 1232–1242):

```latex
\begin{definition} \label{2.1b}
$\frak{s}=(K^\frak{s},\preceq^\frak{s},S^{bs,\frak{s}},\dnf^\frak{s})=(K,\preceq,S^{bs},\dnf)$
is a \emph{semi}-good $\lambda$-frame, if $\frak{s}$ satisfies the
axioms of a good $\lambda$-frame except that instead of assuming
basic stability, we assume that $\frak{s}$ satisfies \emph{basic almost
stability}, namely, for every $M \in K_\lambda$ $S^{bs}(M)$
is of cardinality at most $\lambda^+$.
$\frak{s}$ is said to be a \emph{semi-good frame} if it is a
semi-good $\lambda$-frame for some $\lambda$.
\end{definition}
```

Lean (Frames.lean:654):

```lean
/-- Def 2.1.3: `s` is a semi-good `λ`-frame: the axioms of a good `λ`-frame with basic
stability replaced by basic almost stability `|S^bs(M)| ≤ λ⁺`. -/
def IsSemiGood : Prop :=
  s.Core lam ∧ s.Ax3g lam ∧ s.Ax3e lam ∧ s.BasicStab lam (Order.succ lam) ∧ s.Ax3c lam
```

### `Frame.IsSemiGoodExceptLC` *(not in the main statements)* — Def 2.6.5 — unchanged

Paper, definition 2.6.5 (l. 2507–2516):

```latex
\begin{definition}\label{weak local character for <^* sequences}
Let $\frak{s}$ be a semi-good $\lambda$-frame except local
character. $\frak{s}$ is said to satisfy \emph{weak local
character for $\prec^*_\lambda$-increasing sequences} when: If $
\alpha^*< \lambda^+$ and $\langle M_\alpha:\alpha \leq \alpha^*+1
\rangle$ is an $\prec^*_\lambda-$increasing continuous sequence of
models, then for some element $a \in M_{\alpha^*+1}-M_{\alpha^*}$
and ordinal $\alpha<\alpha^*$, $tp(a,M_{\alpha^*},M_{\alpha^*+1})$
does not fork over $M_\alpha$.
\end{definition}
```

Lean (Frames.lean:661):

```lean
/-- "Semi-good `λ`-frame, except local character" (Def 2.6.5, 2.6.6, Thm 2.6.8). -/
def IsSemiGoodExceptLC : Prop :=
  s.Core lam ∧ s.Ax3g lam ∧ s.Ax3e lam ∧ s.BasicStab lam (Order.succ lam)
```

### `Conjugate` — Def 2.5.1 — unchanged

Paper, definition 2.5.1 (l. 1962–1971):

```latex
\begin{definition}\label{2.2}
Let $p_0 \in S(M_0), p_1 \in S(M_1)$. We say that $p_0,p_1$ are
\emph{conjugate} if for some $a_0,M_0^+,a_1,M_1^+,f$, the
following hold:
\begin{enumerate}
\item For $n=0,1$, $tp(a_n,M_n,M_n^+)=p_n$. \item $f:M_0^+ \to
M_1^+$ is an isomorphism. \item $f \restriction M_0:M_0 \to M_1$
is an isomorphism. \item $f(a_0)=a_1$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:1233):

```lean
/-- Def 2.5.1: `p₀ ∈ S(M₀)`, `p₁ ∈ S(M₁)` are conjugate: for some `a₀, M₀⁺, a₁, M₁⁺, f`,
`tp(aₙ, Mₙ, Mₙ⁺) = pₙ`, `f : M₀⁺ → M₁⁺` is an isomorphism, `f ↾ M₀ : M₀ → M₁` is an
isomorphism and `f(a₀) = a₁`. -/
def Conjugate (S : KSys U L) (lam : Cardinal.{u}) (M₀ : Model U L) (p₀ : Set (Tri U L))
    (M₁ : Model U L) (p₁ : Set (Tri U L)) : Prop :=
  ∃ (a₀ : U) (M₀p : Model U L) (a₁ : U) (M₁p : Model U L) (f : U → U),
    tp S lam a₀ M₀ M₀p = p₀ ∧ tp S lam a₁ M₁ M₁p = p₁ ∧ IsoOn f M₀p M₁p ∧ IsoOn f M₀ M₁ ∧
      f a₀ = a₁
```

### `ConjProp` — Def 2.5.5 — unchanged

Paper, definition 2.5.5 (l. 2090–2097):

```latex
\begin{definition} \label{2.4}
Let $\frak{s}$ be a semi-good $\lambda$-frame. We say that
$\frak{s}$ \emph{satisfies the conjugation property} when:
$K_\lambda$ is categorical and if $M_1,M_2 \in K_\lambda$, $M_1
\preceq M_2$ and $p_2 \in S^{bs}(M_2)$ is the non-forking
extension of $p_1 \in S^{bs}(M_1)$, then the types $p_1,p_2$ are
conjugate.
\end{definition}
```

Lean (Frames.lean:1251):

```lean
/-- Def 2.5.5: the semi-good `λ`-frame `s` satisfies the conjugation property: `K_λ` is
categorical and whenever `M₁ ≼ M₂` in `K_λ` and `p₂ ∈ S^bs(M₂)` is the non-forking extension of
`p₁ ∈ S^bs(M₁)`, the types `p₁, p₂` are conjugate. -/
def ConjProp (s : Frame U L) (lam : Cardinal.{u}) : Prop :=
  numModels s.S lam = 1 ∧
    ∀ M₁ ∈ s.S.Kc lam, ∀ M₂ ∈ s.S.Kc lam, s.S.le M₁ M₂ → ∀ p₁ ∈ s.Sbs M₁, ∀ p₂ ∈ s.Sbs M₂,
      s.IsNFExt lam M₁ M₂ p₂ p₁ → Conjugate s.S lam M₁ p₁ M₂ p₂
```

### `Prop_2_5_7` — Prop 2.5.7 — **changed in the proof stage**, cited (hypothesis via `CitedResults`)

Paper, proposition 2.5.7 (l. 2207–2218):

```latex
\begin{proposition} \label{axiom i is redundant}
Suppose
\begin{enumerate}
\item $\frak{s}$ satisfies the axioms of a semi-good
$\lambda$-frame. \item $n<3 \Rightarrow M_0 \preceq M_n$. \item
For $n=1,2$, $a_n \in M_n-M_0\ and \ tp(a_n,M_0,M_n) \allowbreak
\in S^{bs}(M_0)$.
\end{enumerate}
Then there is an amalgamation $(f_1,f_2,M_3)$ of $M_1,M_2$ over
$M_0$ such that for $n=1,2$ $tp(f_n(a_n),f_{3-n}[M_{3-n}],M_3)$
does not fork over $M_0$.
 \end{proposition}
```

Lean (Frames.lean:1278):

```lean
/-- Prop 2.5.7 (by [Sh:h].II Claim 2.16, cited): if `s` satisfies the axioms of a semi-good
`λ`-frame, `M₀ ≼ Mₙ` (`n < 3`), and for `n = 1, 2`, `aₙ ∈ Mₙ - M₀` with
`tp(aₙ, M₀, Mₙ) ∈ S^bs(M₀)`, then there is an amalgamation `(f₁, f₂, M₃)` of `M₁, M₂` over `M₀`
such that `tp(fₙ(aₙ), f_{3-n}[M_{3-n}], M₃)` does not fork over `M₀` (`n = 1, 2`). -/
-- CITED: proved in the paper only by reference to the literature.
-- PROOF-STAGE CHANGE (author decision): hypothesis weakened from `s.IsSemiGood lam` (original:
-- "s satisfies the axioms of a semi-good λ-frame") to `Core ∧ Ax3g ∧ Ax3e` (= `Hyp_3_0_1`,
-- defined in Section 3): the paper applies 2.5.7 under Hypothesis 3.0.1 in the proof of Prop
-- 3.1.8. The cited assumption is thus the stronger statement, as in the paper.
-- CITED: stated as a `Prop`, assumed through the field `CitedResults.prop_2_5_7`.
def Prop_2_5_7 : Prop :=
  ∀ {U : Type u} {L : Language.{u, u}}
    (lam : Cardinal.{u}) (hU : Room U lam) (s : Frame U L)
    (hs : s.Core lam ∧ s.Ax3g lam ∧ s.Ax3e lam)
    (M₀ M₁ M₂ : Model U L) (h₀ : M₀ ∈ s.S.Kc lam) (h₁ : M₁ ∈ s.S.Kc lam)
    (h₂ : M₂ ∈ s.S.Kc lam) (h01 : s.S.le M₀ M₁) (h02 : s.S.le M₀ M₂) (a₁ a₂ : U)
    (ha₁ : a₁ ∈ M₁.carrier \ M₀.carrier) (ha₂ : a₂ ∈ M₂.carrier \ M₀.carrier)
    (hb₁ : tp s.S lam a₁ M₀ M₁ ∈ s.Sbs M₀) (hb₂ : tp s.S lam a₂ M₀ M₂ ∈ s.Sbs M₀),
    ∃ (f₁ f₂ : U → U) (M₃ M₁' M₂' : Model U L), IsAmalgIn s.S lam f₁ f₂ M₃ M₀ M₁ M₂ ∧
      IsoOn f₁ M₁ M₁' ∧ IsoOn f₂ M₂ M₂' ∧
      s.NotFork lam M₀ M₂' (tp s.S lam (f₁ a₁) M₂' M₃) ∧
      s.NotFork lam M₀ M₁' (tp s.S lam (f₂ a₂) M₁' M₃)
```

### `CitedResults` — no paper item — unchanged

Lean (Frames.lean:1294):

```lean
/-- The results that the paper cites from the literature and does not prove, collected as one
hypothesis (one field per cited result; none is proved here). Every theorem that uses one of them,
directly or through other theorems, takes the parameter `[C : CitedResults]`. -/
class CitedResults : Prop where
  /-- Fact 1.0.18 (`Fact_1_0_18`). Source: [Sh:h].II Lemma 1.23 (paper: "Fact [Lemma 1.23 in
  [Sh:h].II]"), with the hypothesis `K ≠ ∅` added (section F of NOTES.md). -/
  fact_1_0_18 : Fact_1_0_18.{u}
  /-- Fact 1.0.18 with the clauses widened by the author (`Fact_1_0_18_up`). Source: [Sh:h].II
  Lemma 1.23; clauses (i), (ii) confirmed by the author to be part of the source (NOTES.md, "Cited
  results widened by the author"). -/
  fact_1_0_18_up : Fact_1_0_18_up.{u}
  /-- Prop 1.0.31, saturativity = model homogeneity (`Prop_1_0_31`). Source: [Sh:h].II Lemma 1.14
  (paper: "By Lemma 1.14 in [Sh:h].II"). -/
  prop_1_0_31 : Prop_1_0_31.{u}
  /-- Thm 1.0.32(1), uniqueness of the saturated model over `N` (`Thm_1_0_32_1`). Source:
  [Sh:h].II Lemma 1.14 (paper: "It is proved as Lemma 1.14 in [Sh:h].II"). -/
  thm_1_0_32_1 : Thm_1_0_32_1.{u}
  /-- Thm 1.0.32(2), uniqueness of the saturated model under JEP (`Thm_1_0_32_2`). Source:
  [Sh:h].II Lemma 1.14 (same citation as (1)). -/
  thm_1_0_32_2 : Thm_1_0_32_2.{u}
  /-- Prop 2.5.7, amalgamation with non-forking on both sides (`Prop_2_5_7`). Source: [Sh:h].II
  Claim 2.16 (paper: "By Claim 2.16 in [Sh:h].II"), with the hypothesis weakened as decided by
  the author (NOTES.md, "Cited results used under weaker hypotheses than stated"). -/
  prop_2_5_7 : Prop_2_5_7.{u}
```

### `Frame.Cond12` *(not in the main statements)* — Thm 2.5.8 — unchanged

Paper, theorem 2.5.8 (l. 2262–2291):

```latex
\begin{theorem} \label{4.0}
Suppose $\frak{s}$ satisfies conditions 1 and 2 of a semi-good
$\lambda$-frame (so actually the relation $\dnf$ is irrelevant).
\begin{enumerate}
 \item Suppose:
\begin{enumerate}
\item $\langle  M_\alpha:\alpha \leq \lambda^+ \rangle$ is an
increasing continuous sequence of models in $K_\lambda$. \item
There is a stationary set $S \subseteq \lambda^+$ such that for
every $\alpha \in S$ and every model $N$, with $M_\alpha \prec N$,
there is a type $p \in S^{bs}(M_\alpha)$ which is realized in
$M_{\lambda^+}$ and in $N$.
\end{enumerate}
Then $M_{\lambda^+}$ is full over $M_0$ and is saturated in
$\lambda^+$ over $\lambda$. \item Suppose:
\begin{enumerate}
   \item $\langle  M_\alpha:\alpha \leq \lambda^+ \rangle$ is an increasing continuous
sequence of models in $K_\lambda$.
   \item For every $\alpha \in \lambda^+$ and every $p \in
S^{bs}(M_\alpha)$, there is $\beta \in (\alpha,\lambda^+)$ such
that $p$ is realized in $M_\beta$.
\end{enumerate}
Then $M_{\lambda^+}$ is full over $M_0$ and $M_{\lambda^+}$ is
saturated in $\lambda^+$ over $\lambda$. \item There is a model in
$K_{\lambda^+}$ which is saturated in $\lambda^+$ over $\lambda$.
\item $M \in K_\lambda \Rightarrow |S(M)| \leq \lambda^+$ (we know
that $|S^{bs}(M)| \leq \lambda^+$, but the point is that $|S(M)| \leq
\lambda^+$).
\end{enumerate}
\end{theorem}
```

Lean (Frames.lean:1317):

```lean
/-- "`s` satisfies conditions 1 and 2 of a semi-good `λ`-frame" (Thm 2.5.8). -/
def Frame.Cond12 (s : Frame U L) (lam : Cardinal.{u}) : Prop :=
  s.Ax1a lam ∧ s.Ax1b lam ∧ s.Ax1c lam ∧ s.Ax2a lam ∧ s.Ax2b lam ∧ s.Ax2c lam ∧
    s.BasicStab lam (Order.succ lam)
```

### `Frame.nfGe` — Def 2.6.1 — **deviation (author-confirmed / typo)**

Paper, definition 2.6.1 (l. 2435–2445):

```latex
\begin{definition}\label{preparation for forking for big models}
\label{2.9} $\dnf^{\geq \lambda}$ is the class of quadruples
$(M_0,a,M_1,M_2)$ such that:
\begin{enumerate}
\item $\lambda \leq ||M_i||$ for each $i<3$.\item $M_0 \preceq M_1
\preceq M_2$ and $a \in M_2-M_1$. \item For some model $N_0 \in
K_\lambda$ with $N_0 \preceq M_0$ for each model $N \in
K_\lambda$, $N_0 \bigcup \{a\} \subseteq N \preceq M_1 \Rightarrow
\dnf(N_0,a,N,M_2)$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:1336):

```lean
-- DEVIATION (author-confirmed erratum): clause (3) as written ("for each `N ∈ K_λ`,
-- `N₀ ∪ {a} ⊆ N ≼ M₁ → ⨿(N₀, a, N, M₂)`") is vacuous since `a ∉ M₁`. Repaired (universal
-- version): for every `N ∈ K_λ` with `N₀ ⊆ N ≼ M₁` and every `N' ∈ K_λ` with
-- `N ∪ {a} ⊆ N' ≼ M₂`, `⨿(N₀, N, a, N')` (argument order of Def 2.1.1).
/-- Def 2.6.1: `⨿^{≥λ}(M₀, a, M₁, M₂)` iff (1) `λ ≤ ‖Mᵢ‖`, (2) `M₀ ≼ M₁ ≼ M₂`, `a ∈ M₂ - M₁`,
(3) original text: "for some model `N₀ ∈ K_λ` with `N₀ ≼ M₀` for each model `N ∈ K_λ`,
`N₀ ∪ {a} ⊆ N ≼ M₁ ⇒ ⨿(N₀, a, N, M₂)`". Erratum (confirmed by the author): for some
`N₀ ∈ K_λ`, `N₀ ≼ M₀`, for every `N ∈ K_λ` with `N₀ ⊆ N ≼ M₁` and every `N' ∈ K_λ` with
`N ∪ {a} ⊆ N' ≼ M₂`, `⨿(N₀, N, a, N')`. -/
def nfGe (M₀ : Model U L) (a : U) (M₁ M₂ : Model U L) : Prop :=
  lam ≤ M₀.card ∧ lam ≤ M₁.card ∧ lam ≤ M₂.card ∧ s.S.le M₀ M₁ ∧ s.S.le M₁ M₂ ∧
    a ∈ M₂.carrier \ M₁.carrier ∧
    ∃ N₀ ∈ s.S.Kc lam, s.S.le N₀ M₀ ∧
      ∀ N ∈ s.S.Kc lam, N₀.carrier ⊆ N.carrier → s.S.le N M₁ →
        ∀ N' ∈ s.S.Kc lam, N.carrier ∪ {a} ⊆ N'.carrier → s.S.le N' M₂ → s.nf N₀ N a N'
```

### `Frame.NotForkGe` — Def 2.6.2 — agent reading

Paper, definition 2.6.2 (l. 2447–2452):

```latex
\begin{definition}\label{forking for big models}
Let $M_0,M_1$ be models in $K_{\geq \lambda}$ with $M_0 \preceq
M_1$ and $p \in S(M_1)$. We say that $p$ does not fork over $M_0$,
when for some triple $(M_1,M_2,a) \in p$ we have $\dnf^{\leq
\lambda}(M_0,a,M_1,M_2)$.
\end{definition}
```

Lean (Frames.lean:1346):

```lean
-- AGENT-CHOICE (reading): the undefined symbol `⨿^{≤λ}` is read as `⨿^{≥λ}` (Def 2.6.1).
/-- Def 2.6.2: for `M₀ ≼ M₁` in `K_{≥λ}` and `p ∈ S(M₁)`, `p` does not fork over `M₀` when for
some triple `(M₁, M₂, a) ∈ p`, `⨿^{≤λ}(M₀, a, M₁, M₂)` (read as `⨿^{≥λ}`, NOTES.md). -/
def NotForkGe (M₀ M₁ : Model U L) (p : Set (Tri U L)) : Prop :=
  M₀ ∈ s.S.KGe lam ∧ M₁ ∈ s.S.KGe lam ∧ s.S.le M₀ M₁ ∧ p ∈ SAll s.S lam M₁ ∧
    ∃ (M₂ : Model U L) (a : U), (M₁, M₂, a) ∈ p ∧ s.nfGe lam M₀ a M₁ M₂
```

### `Frame.SbsGt` — Def 2.6.4 — unchanged

Paper, definition 2.6.4 (l. 2459–2467):

```latex
\begin{definition}\label{basic for big models}
Let $M \in K_{>\lambda},\ p \in S(M)$. $p$ is said to be
\emph{basic} when there is $N \in K_\lambda$ such that $N \preceq
M$ and $p$ does not fork over $N$. For every $M \in K_{>\lambda},\
S^{bs}_{> \lambda}(M)$ is the set of basic types over $M$.
Sometimes we write $S^{bs}_{\geq \lambda}(M)$, meaning $S^{bs}(M)$
or $S^{bs}_{> \lambda}(M)$ (the unique difference is the
cardinality of $M$).
\end{definition}
```

Lean (Frames.lean:1352):

```lean
/-- Def 2.6.4: for `M ∈ K_{>λ}`, `S^bs_{>λ}(M)`: types `p ∈ S(M)` that do not fork over some
`N ∈ K_λ` with `N ≼ M`. -/
def SbsGt (M : Model U L) : Set (Set (Tri U L)) :=
  {p | M ∈ s.S.KGt lam ∧ p ∈ SAll s.S lam M ∧ ∃ N ∈ s.S.Kc lam, s.S.le N M ∧ s.NotForkGe lam N M p}
```

### `Frame.SbsGe` *(not in the main statements)* — Def 2.6.4 — unchanged

Paper, definition 2.6.4 (l. 2459–2467):

```latex
\begin{definition}\label{basic for big models}
Let $M \in K_{>\lambda},\ p \in S(M)$. $p$ is said to be
\emph{basic} when there is $N \in K_\lambda$ such that $N \preceq
M$ and $p$ does not fork over $N$. For every $M \in K_{>\lambda},\
S^{bs}_{> \lambda}(M)$ is the set of basic types over $M$.
Sometimes we write $S^{bs}_{\geq \lambda}(M)$, meaning $S^{bs}(M)$
or $S^{bs}_{> \lambda}(M)$ (the unique difference is the
cardinality of $M$).
\end{definition}
```

Lean (Frames.lean:1356):

```lean
/-- Def 2.6.4: `S^bs_{≥λ}(M)`: `S^bs(M)` if `‖M‖ = λ`, `S^bs_{>λ}(M)` if `‖M‖ > λ`. -/
def SbsGe (M : Model U L) : Set (Set (Tri U L)) :=
  {p | (M.card = lam ∧ p ∈ s.Sbs M) ∨ (lam < M.card ∧ p ∈ s.SbsGt lam M)}
```

### `Hyp_3_0_1` *(not in the main statements)* — Hypothesis 3.0.1 — unchanged

Paper, hypothesis 3.0.1 (l. 2791–2794):

```latex
\begin{hypothesis} \label{3.0}
$\frak{s}$ is a semi-good $\lambda$-frame, except basic almost
stability and local character.
\end{hypothesis}
```

Lean (Frames.lean:1533):

```lean
/-- Hypothesis 3.0.1: `s` is a semi-good `λ`-frame, except basic almost stability and local
character. -/
def Hyp_3_0_1 (s : Frame U L) (lam : Cardinal.{u}) : Prop :=
  s.Core lam ∧ s.Ax3g lam ∧ s.Ax3e lam
```

### `Frame.K3bs` — Def 3.1.1 — unchanged

Paper, definition 3.1.1 (l. 2862–2870):

```latex
\begin{definition} \label{3.1}  \mbox{} \begin{enumerate}
\item $K^{3,bs}=:\{(M,N,a):M,N \in K_\lambda,\ a \in N-M$ and
$tp(a,M,N) \in S^{bs}(M)\}$. \item $\preceq_{bs}$ is the relation
on $K^{3,bs}$ defined by: $(M,N,a) \preceq_{bs} (M^*,N^*,a^*)$ iff
$M\preceq M^*,\ N\preceq N^*,\ a^*=a$
 and $tp(a,M^*,N^*)$ does not fork over $M$. In particular,
 $tp(a,M^*,N^*)$ extends $tp(a,M,N)$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:1541):

```lean
/-- Def 3.1.1(1): `K^{3,bs} = {(M, N, a) : M, N ∈ K_λ, a ∈ N - M, tp(a, M, N) ∈ S^bs(M)}`. -/
def K3bs : Set (Tri U L) :=
  {t | t.1 ∈ s.S.Kc lam ∧ t.2.1 ∈ s.S.Kc lam ∧ t.2.2 ∈ t.2.1.carrier \ t.1.carrier ∧
    tp s.S lam t.2.2 t.1 t.2.1 ∈ s.Sbs t.1}
```

### `Frame.leBs` — Def 3.1.1 — unchanged

Paper, definition 3.1.1 (l. 2862–2870):

```latex
\begin{definition} \label{3.1}  \mbox{} \begin{enumerate}
\item $K^{3,bs}=:\{(M,N,a):M,N \in K_\lambda,\ a \in N-M$ and
$tp(a,M,N) \in S^{bs}(M)\}$. \item $\preceq_{bs}$ is the relation
on $K^{3,bs}$ defined by: $(M,N,a) \preceq_{bs} (M^*,N^*,a^*)$ iff
$M\preceq M^*,\ N\preceq N^*,\ a^*=a$
 and $tp(a,M^*,N^*)$ does not fork over $M$. In particular,
 $tp(a,M^*,N^*)$ extends $tp(a,M,N)$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:1547):

```lean
/-- Def 3.1.1(2): `(M, N, a) ≼_bs (M*, N*, a*)` iff `M ≼ M*`, `N ≼ N*`, `a* = a` and
`tp(a, M*, N*)` does not fork over `M` (a relation on `K^{3,bs}`). -/
def leBs (t t' : Tri U L) : Prop :=
  t ∈ s.K3bs lam ∧ t' ∈ s.K3bs lam ∧ s.S.le t.1 t'.1 ∧ s.S.le t.2.1 t'.2.1 ∧ t'.2.2 = t.2.2 ∧
    s.NotFork lam t.1 t'.1 (tp s.S lam t.2.2 t'.1 t'.2.1)
```

### `IsoClosedTri` *(not in the main statements)* — Def 3.2.1 — unchanged

Paper, definition 3.2.1 (l. 3251–3266):

```latex
\begin{definition} \label{3.5}
Let $K^{3,*} \subseteq K^{3,bs}$, such that $K^{3,*}$ is closed
under isomorphisms (i.e., if $(M,N,a) \in K^{3,*}$ and $f:N \to
N^*$ is an isomorphism, then $(f[M],f[N],f(a)) \allowbreak \in
K^{3,*}$).
\begin{enumerate}
\item $K^{3,*}$ is \emph{dense with respect to $\preceq_{bs}$} if
for every $(M,N,a) \in K^{3,bs}$, there is $(M^*,N^*,a^*) \in
K^{3,*}$ such that $(M,N,a) \preceq_{bs}(M^*,N^*,a^*)$. \item
$K^{3,*}$ \emph{satisfies the existence property} if for every
$(M,N,a) \in K^{3,bs}$, there are $N^*,a^*$ such that
$tp(a^*,M,N^*)=tp(a,M,N)$ and $(M,N^*,\allowbreak a^*) \in
K^{3,*}$. In other words, if $p \in S^{bs}(M)$ then $p \bigcap
K^{3,*} \neq \emptyset$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:2134):

```lean
/-- Def 3.2.1 (precondition): `K^{3,*}` is closed under isomorphisms. -/
def IsoClosedTri (T : Set (Tri U L)) : Prop :=
  ∀ t ∈ T, ∀ (f : U → U) (M' N' : Model U L), IsoOn f t.2.1 N' → IsoOn f t.1 M' →
    (M', N', f t.2.2) ∈ T
```

### `Frame.Dense` — Def 3.2.1 — unchanged

Paper, definition 3.2.1 (l. 3251–3266):

```latex
\begin{definition} \label{3.5}
Let $K^{3,*} \subseteq K^{3,bs}$, such that $K^{3,*}$ is closed
under isomorphisms (i.e., if $(M,N,a) \in K^{3,*}$ and $f:N \to
N^*$ is an isomorphism, then $(f[M],f[N],f(a)) \allowbreak \in
K^{3,*}$).
\begin{enumerate}
\item $K^{3,*}$ is \emph{dense with respect to $\preceq_{bs}$} if
for every $(M,N,a) \in K^{3,bs}$, there is $(M^*,N^*,a^*) \in
K^{3,*}$ such that $(M,N,a) \preceq_{bs}(M^*,N^*,a^*)$. \item
$K^{3,*}$ \emph{satisfies the existence property} if for every
$(M,N,a) \in K^{3,bs}$, there are $N^*,a^*$ such that
$tp(a^*,M,N^*)=tp(a,M,N)$ and $(M,N^*,\allowbreak a^*) \in
K^{3,*}$. In other words, if $p \in S^{bs}(M)$ then $p \bigcap
K^{3,*} \neq \emptyset$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:2139):

```lean
/-- Def 3.2.1(1): `K^{3,*}` is dense with respect to `≼_bs`. -/
def Frame.Dense (s : Frame U L) (lam : Cardinal.{u}) (T : Set (Tri U L)) : Prop :=
  ∀ t ∈ s.K3bs lam, ∃ t' ∈ T, s.leBs lam t t'
```

### `Frame.ExistProp` *(not in the main statements)* — Def 3.2.1 — unchanged

Paper, definition 3.2.1 (l. 3251–3266):

```latex
\begin{definition} \label{3.5}
Let $K^{3,*} \subseteq K^{3,bs}$, such that $K^{3,*}$ is closed
under isomorphisms (i.e., if $(M,N,a) \in K^{3,*}$ and $f:N \to
N^*$ is an isomorphism, then $(f[M],f[N],f(a)) \allowbreak \in
K^{3,*}$).
\begin{enumerate}
\item $K^{3,*}$ is \emph{dense with respect to $\preceq_{bs}$} if
for every $(M,N,a) \in K^{3,bs}$, there is $(M^*,N^*,a^*) \in
K^{3,*}$ such that $(M,N,a) \preceq_{bs}(M^*,N^*,a^*)$. \item
$K^{3,*}$ \emph{satisfies the existence property} if for every
$(M,N,a) \in K^{3,bs}$, there are $N^*,a^*$ such that
$tp(a^*,M,N^*)=tp(a,M,N)$ and $(M,N^*,\allowbreak a^*) \in
K^{3,*}$. In other words, if $p \in S^{bs}(M)$ then $p \bigcap
K^{3,*} \neq \emptyset$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:2144):

```lean
/-- Def 3.2.1(2): `K^{3,*}` satisfies the existence property: for every `(M, N, a) ∈ K^{3,bs}`
there are `N*, a*` with `tp(a*, M, N*) = tp(a, M, N)` and `(M, N*, a*) ∈ K^{3,*}`. -/
def Frame.ExistProp (s : Frame U L) (lam : Cardinal.{u}) (T : Set (Tri U L)) : Prop :=
  ∀ t ∈ s.K3bs lam, ∃ (N' : Model U L) (a' : U),
    tp s.S lam a' t.1 N' = tp s.S lam t.2.2 t.1 t.2.1 ∧ (t.1, N', a') ∈ T
```

### `IsDecomp` *(not in the main statements)* — Def 3.2.2 — agent reading

Paper, definition 3.2.2 (l. 3268–3286):

```latex
\begin{definition} \label{3.6}
Let $K^{3,*} \subseteq K^{3,bs}$, $K^{3,*}$ be closed under
isomorphisms. Let $M^* \in K_\lambda$. We say that $M^*$ is
\emph{decomposable by $K^{3,*}$} over $M$, if there is a sequence
$ \langle d_\epsilon,N_\epsilon:\epsilon<\alpha^* \rangle^\frown
\langle N_{\alpha^*} \rangle$ with $N_{\alpha^*}=\bigcup
\{N_\epsilon:\epsilon<\alpha\}$ such that:
\begin{enumerate}
\item $\alpha^*<\lambda^+$ and for each $\epsilon<\alpha^*$
$N_\epsilon \in K_\lambda$. \item $ \langle N_\epsilon:\epsilon
\preceq \alpha^* \rangle$ is increasing and continuous. \item
$N_0=M$. \item $(N_\epsilon,N_{\epsilon+1},d_\epsilon) \in
K^{3,*}$.
\end{enumerate}
In such a case, we say that the sequence $ \langle
d_\epsilon,N_\epsilon:\epsilon<\alpha^* \rangle ^\frown \langle
N_{\alpha^*} \rangle$ is a decomposition of $M^*$ over $M$ by
$K^{3,*}$.
\end{definition}
```

Lean (Frames.lean:2154):

```lean
-- AGENT-CHOICE (reading): the paper's condition "N_{α*} = ⋃{N_ε : ε < α}" has a free `α` and the
-- decomposed model `M*` is never mentioned; we read it as `N_{α*} = M*` (and `ε ⪯ α*` as
-- `ε ≤ α*`). See NOTES.md.
/-- Def 3.2.2: `⟨d_ε, N_ε : ε < α*⟩⌢⟨N_{α*}⟩` is a decomposition of `M*` over `M` by `K^{3,*}`:
(1) `α* < λ⁺`, `N_ε ∈ K_λ` (`ε < α*`), (2) `⟨N_ε : ε ≤ α*⟩` increasing continuous,
(3) `N₀ = M`, (4) `(N_ε, N_{ε+1}, d_ε) ∈ K^{3,*}`. -/
def IsDecomp (S : KSys U L) (lam : Cardinal.{u}) (T : Set (Tri U L)) (M Ms : Model U L)
    (αs : Ordinal.{u}) (N : Ordinal.{u} → Model U L) (d : Ordinal.{u} → U) : Prop :=
  αs < (Order.succ lam).ord ∧ (∀ ε < αs, N ε ∈ S.Kc lam) ∧ IsIncreasing S.le N (Iic αs) ∧
    IsContinuous N (Iic αs) ∧ N 0 = M ∧ (∀ ε < αs, (N ε, N (ε + 1), d ε) ∈ T) ∧ N αs = Ms
```

### `Decomposable` *(not in the main statements)* — Def 3.2.2 — unchanged

Paper, definition 3.2.2 (l. 3268–3286):

```latex
\begin{definition} \label{3.6}
Let $K^{3,*} \subseteq K^{3,bs}$, $K^{3,*}$ be closed under
isomorphisms. Let $M^* \in K_\lambda$. We say that $M^*$ is
\emph{decomposable by $K^{3,*}$} over $M$, if there is a sequence
$ \langle d_\epsilon,N_\epsilon:\epsilon<\alpha^* \rangle^\frown
\langle N_{\alpha^*} \rangle$ with $N_{\alpha^*}=\bigcup
\{N_\epsilon:\epsilon<\alpha\}$ such that:
\begin{enumerate}
\item $\alpha^*<\lambda^+$ and for each $\epsilon<\alpha^*$
$N_\epsilon \in K_\lambda$. \item $ \langle N_\epsilon:\epsilon
\preceq \alpha^* \rangle$ is increasing and continuous. \item
$N_0=M$. \item $(N_\epsilon,N_{\epsilon+1},d_\epsilon) \in
K^{3,*}$.
\end{enumerate}
In such a case, we say that the sequence $ \langle
d_\epsilon,N_\epsilon:\epsilon<\alpha^* \rangle ^\frown \langle
N_{\alpha^*} \rangle$ is a decomposition of $M^*$ over $M$ by
$K^{3,*}$.
\end{definition}
```

Lean (Frames.lean:2160):

```lean
/-- Def 3.2.2: `M*` is decomposable by `K^{3,*}` over `M`. -/
def Decomposable (S : KSys U L) (lam : Cardinal.{u}) (T : Set (Tri U L)) (M Ms : Model U L) :
    Prop :=
  Ms ∈ S.Kc lam ∧ ∃ αs N d, IsDecomp S lam T M Ms αs N d
```

### `Frame.K3r` *(not in the main statements)* — Def 3.3.2 — unchanged

Paper, definition 3.3.2 (l. 3417–3422):

```latex
\begin{definition} \label{3.11}
The triple $(M,N,a) \in K^{3,bs}_\lambda$ is \emph{reduced} if
$(M,N,a) \preceq_{bs} (M^*,N^*,a) \Rightarrow M^* \bigcap N = M$.
We define $$K^{3,r}:=\{(M,N,a) \in K^{3,bs}:(M,N,a) \text{ is
reduced}\}.$$
\end{definition}
```

Lean (Frames.lean:2858):

```lean
/-- Def 3.3.2: `(M, N, a) ∈ K^{3,bs}_λ` is reduced if `(M, N, a) ≼_bs (M*, N*, a)` implies
`M* ∩ N = M`; `K^{3,r}` is the class of reduced triples. -/
def Frame.K3r (s : Frame U L) (lam : Cardinal.{u}) : Set (Tri U L) :=
  {t | t ∈ s.K3bs lam ∧ ∀ Ms Ns : Model U L, s.leBs lam t (Ms, Ns, t.2.2) →
    Ms.carrier ∩ t.2.1.carrier = t.1.carrier}
```

### `Hyp_4_1_1` *(not in the main statements)* — Hypothesis 4.1.1 — unchanged

Paper, hypothesis 4.1.1 (l. 3532–3534):

```latex
\begin{hypothesis}
$\frak{s}$ is a semi-good $\lambda$-frame.
\end{hypothesis}
```

Lean (Frames.lean:3434):

```lean
/-- Hypothesis 4.1.1: `s` is a semi-good `λ`-frame. -/
def Hyp_4_1_1 (s : Frame U L) (lam : Cardinal.{u}) : Prop := s.IsSemiGood lam
```

### `Amalg` — no paper item — encoding

Lean (Frames.lean:3437):

```lean
/-- ENCODING: an amalgamation `(f₁, f₂, M₃)`. -/
abbrev Amalg (U : Type u) (L : Language.{u, u}) := (U → U) × (U → U) × Model U L
```

### `AmalgEquiv` — Def 4.1.2 — unchanged

Paper, definition 4.1.2 (l. 3536–3555):

```latex
\begin{definition}\label{equivalent amalgamations}\label{equivalent
amalgamations definition} Suppose
\begin{enumerate} \item
$M_0,M_1,M_2 \in K_\lambda$, $M_0 \preceq M_1 \wedge M_0 \preceq
M_2$. \item For $x=a,b$, $(f_1^x,f_2^x,M_3^x)$ is an amalgamation
of $M_1,M_2$ over $M_0$.
\end{enumerate}
$(f_1^a,f_2^a,M_3^a),(f_1^b,f_2^b,M_3^b)$ are said to be
\emph{equivalent} over $M_0$ if there are $f^a,f^b,M_3^{ab}$ such
that $f^a:M_3^a \to M_3^{ab}$, $f^b:M_3^b \to M_3^{ab}$, $f^b
\circ f^b_1=f^a \circ f^a_1$ and $f^b \circ f^b_2=f^a \circ
f^a_2$, namely, the following diagram commutes:
\begin{displaymath}
\xymatrix{&M_3^b \ar[r]^{f^b} & M_3^{ab}\\
M_1 \ar[ru]^{f_1^b} \ar[rr]^{f_1^a} && M_3^a \ar[u]_{f^a}\\
M_0 \ar[u]^{id} \ar[r]_{id} & M_2 \ar[ru]_{f_2^a} \ar[uu]^{f_2^b}}
\end{displaymath}
We denote the relation `to be equivalent over $M_0$' between
amalgamations over $M_0$, by $E_{M_0}$.
\end{definition}
```

Lean (Frames.lean:3442):

```lean
/-- Def 4.1.2: for `M₀ ≼ M₁, M₂` in `K_λ` and amalgamations `A = (f₁ᵃ, f₂ᵃ, M₃ᵃ)`,
`B = (f₁ᵇ, f₂ᵇ, M₃ᵇ)` of `M₁, M₂` over `M₀`, `A E_{M₀} B` iff there are `fᵃ, fᵇ, M₃^{ab}` with
`fᵃ : M₃ᵃ → M₃^{ab}`, `fᵇ : M₃ᵇ → M₃^{ab}`, `fᵇ ∘ f₁ᵇ = fᵃ ∘ f₁ᵃ`, `fᵇ ∘ f₂ᵇ = fᵃ ∘ f₂ᵃ`. -/
def AmalgEquiv (S : KSys U L) (lam : Cardinal.{u}) (M₀ M₁ M₂ : Model U L) (A B : Amalg U L) :
    Prop :=
  M₀ ∈ S.Kc lam ∧ M₁ ∈ S.Kc lam ∧ M₂ ∈ S.Kc lam ∧ S.le M₀ M₁ ∧ S.le M₀ M₂ ∧
    IsAmalgIn S lam A.1 A.2.1 A.2.2 M₀ M₁ M₂ ∧ IsAmalgIn S lam B.1 B.2.1 B.2.2 M₀ M₁ M₂ ∧
    ∃ (fa fb : U → U) (Mab : Model U L), IsEmb S fa A.2.2 Mab ∧ IsEmb S fb B.2.2 Mab ∧
      (∀ x ∈ M₁.carrier, fb (B.1 x) = fa (A.1 x)) ∧ ∀ x ∈ M₂.carrier, fb (B.2.1 x) = fa (A.2.1 x)
```

### `Frame.UqCond` — Def 4.1.5 — unchanged

Paper, definition 4.1.5 (l. 3635–3641):

```latex
\begin{definition} \label{4.1}\label{definition of uniqueness triples} $K^{3,uq}=K^{3,uq}_\frak{s}$ is the class of
triples $(M,N,a) \in K^{3,bs}$ such that if $M \preceq M_1 \in
K_\lambda$, then up to $E_{M}$ there is a unique amalgamation
$(f_1,f_2,N_1)$ of $N$ and $M_1$ over $M$ such that
$tp(f_1(a),f_2[M_1],N_1)$ does not fork over $M$. A
\emph{uniqueness triple} is a triple in $K^{3,uq}$.
\end{definition}
```

Lean (Frames.lean:3501):

```lean
/-- The condition in Def 4.1.5 on an amalgamation `(f₁, f₂, N₁)` of `N` and `M₁` over `M`:
`tp(f₁(a), f₂[M₁], N₁)` does not fork over `M`. -/
def Frame.UqCond (s : Frame U L) (lam : Cardinal.{u}) (M M₁ : Model U L) (a : U)
    (A : Amalg U L) : Prop :=
  ∃ M₁' : Model U L, IsoOn A.2.1 M₁ M₁' ∧ s.NotFork lam M M₁' (tp s.S lam (A.1 a) M₁' A.2.2)
```

### `Frame.K3uq` — Def 4.1.5 — unchanged

Paper, definition 4.1.5 (l. 3635–3641):

```latex
\begin{definition} \label{4.1}\label{definition of uniqueness triples} $K^{3,uq}=K^{3,uq}_\frak{s}$ is the class of
triples $(M,N,a) \in K^{3,bs}$ such that if $M \preceq M_1 \in
K_\lambda$, then up to $E_{M}$ there is a unique amalgamation
$(f_1,f_2,N_1)$ of $N$ and $M_1$ over $M$ such that
$tp(f_1(a),f_2[M_1],N_1)$ does not fork over $M$. A
\emph{uniqueness triple} is a triple in $K^{3,uq}$.
\end{definition}
```

Lean (Frames.lean:3508):

```lean
/-- Def 4.1.5: `K^{3,uq}`: triples `(M, N, a) ∈ K^{3,bs}` such that for every `M₁ ∈ K_λ` with
`M ≼ M₁`, up to `E_M` there is a unique amalgamation `(f₁, f₂, N₁)` of `N` and `M₁` over `M`
such that `tp(f₁(a), f₂[M₁], N₁)` does not fork over `M`. -/
def Frame.K3uq (s : Frame U L) (lam : Cardinal.{u}) : Set (Tri U L) :=
  {t | t ∈ s.K3bs lam ∧ ∀ M₁ ∈ s.S.Kc lam, s.S.le t.1 M₁ →
    (∃ A : Amalg U L, IsAmalgIn s.S lam A.1 A.2.1 A.2.2 t.1 t.2.1 M₁ ∧
      s.UqCond lam t.1 M₁ t.2.2 A) ∧
    ∀ A B : Amalg U L, IsAmalgIn s.S lam A.1 A.2.1 A.2.2 t.1 t.2.1 M₁ →
      s.UqCond lam t.1 M₁ t.2.2 A → IsAmalgIn s.S lam B.1 B.2.1 B.2.2 t.1 t.2.1 M₁ →
      s.UqCond lam t.1 M₁ t.2.2 B → AmalgEquiv s.S lam t.1 t.2.1 M₁ A B}
```

### `Hyp_5_1_1` *(not in the main statements)* — Hypothesis 5.1.1 — unchanged

Paper, hypothesis 5.1.1 (l. 4286–4302):

```latex
\begin{hypothesis} \label{5.0}
\mbox{}
\begin{enumerate}
\item $\frak{s}$ is a  semi-good $\lambda$-frame. \item $\frak{s}$
satisfies the conjugation property. \item $K^{3,uq}$ satisfies the
existence property.
\end{enumerate}
\end{hypothesis}
```

Lean (Frames.lean:3676):

```lean
/-- Hypothesis 5.1.1: (1) `s` is a semi-good `λ`-frame, (2) with the conjugation property,
(3) `K^{3,uq}` satisfies the existence property. -/
def Hyp_5_1_1 (s : Frame U L) (lam : Cardinal.{u}) : Prop :=
  s.IsSemiGood lam ∧ ConjProp s lam ∧ s.ExistProp lam (s.K3uq lam)
```

### `QRel` — no paper item — encoding

Lean (Frames.lean:3680):

```lean
/-- ENCODING: a 4-place relation on models. -/
abbrev QRel (U : Type u) (L : Language.{u, u}) :=
  Model U L → Model U L → Model U L → Model U L → Prop
```

### `OtDom` *(not in the main statements)* — Def 5.2.1 — unchanged

Paper, definition 5.2.1 (l. 4344–4370):

```latex
\begin{definition} \label{5.1}
Let $R \subseteq \ ^4(K_\lambda)$ be a relation. We say
$\bigotimes_{R}$ when the following axioms are satisfied (where
$M_0,M_1,M_2,M_3,N_0,N_1,N_2,N_3,M_{a,i},M_{b,i}$ are models of
cardinality $\lambda$):
\begin{enumerate}[(a)]
\item If $R(M_0,M_1,M_2,M_3)$, then $n\in \{1,2\}\Rightarrow
M_0\preceq M_n\preceq M_3 \ and \ M_1 \cap M_2=M_0$.  \item
Monotonicity: If $R(M_0,M_1,M_2,M_3) \ and \ N_0=M_0, n<3
\Rightarrow N_n\preceq M_n\wedge N_0\preceq N_n\preceq N_3,
(\exists N^{*})[M_3\preceq N^{*}\wedge N_3\preceq N^{*}]$, then
$R(N_0 \allowbreak ,N_1,N_2,N_3)$. [Proposition \ref{monotonicity
explanation} clarifies this axiom] \item Existence: For every
$N_0,N_1,N_2 \in K_\lambda$ if $l\in \{1,2\}\Rightarrow N_0
\preceq N_l$ and $N_1\bigcap N_2=N_0$, then there is $N_3$ such
that $R(N_0,N_1,N_2,N_3).$ \item Weak uniqueness: Suppose for
$x=a,b$ $R(N_0,N_1,N_2,N^{x}_3)$. Then there is a joint embedding
of $N^a_3,N^b_3$ over $N_1 \bigcup N_2$. In other words, if
$R(N_0,N_1,\allowbreak N_2,N_3)$ then $N_1 \bigcup N_2$ is an amalgamation
base. \item Symmetry: $R(N_0,N_1,N_2,N_3) \Leftrightarrow
R(N_0,N_2,N_1,N_3)$. \item Long transitivity: For $x=a,b$ let
$\langle M_{x,i}:i\leq \alpha^* \rangle$ an increasing continuous
sequence of models in $K_\lambda$. Suppose $i<\alpha^* \Rightarrow
R(M_{a,i},M_{a,i+1},M_{b,i},\allowbreak M_{b,i+1})$. Then
$R(M_{a,0},M_{a,\alpha^{*}},M_{b,0},M_{b,\alpha^{*}})$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:3688):

```lean
/-- Def 5.2.1 (precondition): `R ⊆ ⁴(K_λ)`. -/
def OtDom : Prop :=
  ∀ M₀ M₁ M₂ M₃, R M₀ M₁ M₂ M₃ → M₀ ∈ S.Kc lam ∧ M₁ ∈ S.Kc lam ∧ M₂ ∈ S.Kc lam ∧ M₃ ∈ S.Kc lam
```

### `OtB` *(not in the main statements)* — Def 5.2.1 — unchanged

Paper, definition 5.2.1 (l. 4344–4370):

```latex
\begin{definition} \label{5.1}
Let $R \subseteq \ ^4(K_\lambda)$ be a relation. We say
$\bigotimes_{R}$ when the following axioms are satisfied (where
$M_0,M_1,M_2,M_3,N_0,N_1,N_2,N_3,M_{a,i},M_{b,i}$ are models of
cardinality $\lambda$):
\begin{enumerate}[(a)]
\item If $R(M_0,M_1,M_2,M_3)$, then $n\in \{1,2\}\Rightarrow
M_0\preceq M_n\preceq M_3 \ and \ M_1 \cap M_2=M_0$.  \item
Monotonicity: If $R(M_0,M_1,M_2,M_3) \ and \ N_0=M_0, n<3
\Rightarrow N_n\preceq M_n\wedge N_0\preceq N_n\preceq N_3,
(\exists N^{*})[M_3\preceq N^{*}\wedge N_3\preceq N^{*}]$, then
$R(N_0 \allowbreak ,N_1,N_2,N_3)$. [Proposition \ref{monotonicity
explanation} clarifies this axiom] \item Existence: For every
$N_0,N_1,N_2 \in K_\lambda$ if $l\in \{1,2\}\Rightarrow N_0
\preceq N_l$ and $N_1\bigcap N_2=N_0$, then there is $N_3$ such
that $R(N_0,N_1,N_2,N_3).$ \item Weak uniqueness: Suppose for
$x=a,b$ $R(N_0,N_1,N_2,N^{x}_3)$. Then there is a joint embedding
of $N^a_3,N^b_3$ over $N_1 \bigcup N_2$. In other words, if
$R(N_0,N_1,\allowbreak N_2,N_3)$ then $N_1 \bigcup N_2$ is an amalgamation
base. \item Symmetry: $R(N_0,N_1,N_2,N_3) \Leftrightarrow
R(N_0,N_2,N_1,N_3)$. \item Long transitivity: For $x=a,b$ let
$\langle M_{x,i}:i\leq \alpha^* \rangle$ an increasing continuous
sequence of models in $K_\lambda$. Suppose $i<\alpha^* \Rightarrow
R(M_{a,i},M_{a,i+1},M_{b,i},\allowbreak M_{b,i+1})$. Then
$R(M_{a,0},M_{a,\alpha^{*}},M_{b,0},M_{b,\alpha^{*}})$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:3698):

```lean
/-- Def 5.2.1(b), monotonicity: if `R(M₀, M₁, M₂, M₃)`, `N₀ = M₀`, `Nₙ ≼ Mₙ ∧ N₀ ≼ Nₙ ≼ N₃`
(`n < 3`) and `M₃, N₃ ≼ N*` for some `N*`, then `R(N₀, N₁, N₂, N₃)` (all models in `K_λ`). -/
def OtB : Prop :=
  ∀ M₀ ∈ S.Kc lam, ∀ M₁ ∈ S.Kc lam, ∀ M₂ ∈ S.Kc lam, ∀ M₃ ∈ S.Kc lam,
  ∀ N₀ ∈ S.Kc lam, ∀ N₁ ∈ S.Kc lam, ∀ N₂ ∈ S.Kc lam, ∀ N₃ ∈ S.Kc lam,
    R M₀ M₁ M₂ M₃ → N₀ = M₀ →
    (S.le N₀ M₀ ∧ S.le N₀ N₀ ∧ S.le N₀ N₃) → (S.le N₁ M₁ ∧ S.le N₀ N₁ ∧ S.le N₁ N₃) →
    (S.le N₂ M₂ ∧ S.le N₀ N₂ ∧ S.le N₂ N₃) → (∃ Ns, S.le M₃ Ns ∧ S.le N₃ Ns) →
      R N₀ N₁ N₂ N₃
```

### `JointEmbOver` *(not in the main statements)* — Def 1.0.20 — unchanged

Paper, definition 1.0.20 (l. 737–762):

```latex
\begin{definition}
\label{1.4} \mbox{}
\begin{enumerate} \item We say that $(K_\lambda,\preceq \restriction K_\lambda)$
satisfies \emph{the amalgamation property} when: For every
$M_0,M_1\allowbreak ,M_2$ in $K_\lambda$, such that $n<3
\Rightarrow M_0 \preceq M_n$, there are $f_1,f_2,M_3$ such that:
$f_n:M_n \to M_3$ is an embedding over $M_0$, i.e., the diagram
below commutes. In such a case, we say that $(f_1,f_2,M_3)$ is an
amalgamation of $M_1$ and $M_2$ over $M_0$ or that $M_3$ is an
amalgam of $M_1,M_2$ over $M_0$.
\[ \xymatrix{\ar @{} [dr]
M_1
\ar[r]^{f_1}  &M_3 \\
M_0 \ar[u]^{\id} \ar[r]_{\id} & M_2 \ar[u]_{f_2} }
\] \item
We say that $K_\lambda$ satisfies \emph{the joint embedding
property} when: If $M_1,M_2 \in K_\lambda$, then there are
$f_1,f_2,M_3$ such that for $n=1,2$ $f_n:M_n \to M_3$ is an
embedding and $M_3 \in K_\lambda$.
\item $M \in K$ is $\preceq$-\emph{maximal} if there is no $N \in
K$ with $M\prec N$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:3712):

```lean
/-- A joint embedding of `M, M'` over `A`, into a model of `K_λ` (Def 1.0.20(2)). -/
def JointEmbOver (M M' : Model U L) (A : Set U) : Prop :=
  ∃ (N : Model U L) (f g : U → U), N ∈ S.Kc lam ∧ IsEmb S f M N ∧ IsEmb S g M' N ∧
    Over f M N A ∧ Over g M' N A
```

### `Respects` *(not in the main statements)* — Def 5.2.6 — unchanged

Paper, definition 5.2.6 (l. 4491–4495):

```latex
\begin{definition}\label{respect}
Suppose $\bigotimes_{R}$. $R$ is said to \emph{respect the frame}
$\frak{s}$ when: if $R(M_0,M_1,M_2,M_3)$ and $tp(a,M_0,M_1) \in
S^{bs}(M_0)$, then $tp(a,M_2,M_3)$ does not fork over $M_0$.
\end{definition}
```

Lean (Frames.lean:3815):

```lean
/-- Def 5.2.6: `R` respects the frame `s`: if `R(M₀, M₁, M₂, M₃)` and `tp(a, M₀, M₁)` is basic,
then `tp(a, M₂, M₃)` does not fork over `M₀`. -/
def Respects (s : Frame U L) (lam : Cardinal.{u}) (R : QRel U L) : Prop :=
  ∀ M₀ M₁ M₂ M₃ a, R M₀ M₁ M₂ M₃ → tp s.S lam a M₀ M₁ ∈ s.Sbs M₀ →
    s.NotFork lam M₀ M₂ (tp s.S lam a M₂ M₃)
```

### `Frame.NFStarWit` — Def 5.3.1 — unchanged

Paper, definition 5.3.1 (l. 4510–4540):

```latex
\begin{definition} \label{5.2}
Define a relation $NF^{*}=NF^{*}_\lambda$ on $^4(K_\lambda)$ by:
$NF^{*}(N_0, \allowbreak N_1,N_2 ,N_3)$ if there is
$\alpha^{*}<\lambda^+$ and for l=1,2 there are an increasing
continuous sequence $\langle  N_{l,i}:i\leq \alpha^{*} \rangle$
and a sequence $\langle d_i:i<\alpha^{*} \rangle$ such that:
\begin{displaymath}
\xymatrix{
N_2=N_{2,0} \ar[rr]^{id} &&N_{2,i} \ar[r]^{id} & N_{2,i+1} \ar[rr]^{id} && N_{2,\alpha^*}=N_3\\
N_0=N_{1,0} \ar[rr]^{id} \ar[u]^{id} &&N_{1,i} \ar[r]^{id}
\ar[u]^{id} & N_{1,i+1} \ar[u]^{id} \ar[rr]^{id} &&
N_{1,\alpha^*}=N_1 \ar[u]^{id} &&
 }
\end{displaymath}
\begin{enumerate}[(a)]
\item $n<3\Rightarrow N_0\preceq N_n \preceq N_3$. \item
$N_{1,0}=N_0, N_{1,\alpha^{*}}=N_1,
N_{2,0}=N_2,N_{2,\alpha^{*}}=N_3$. \item $i\leq \alpha^{*}
\Rightarrow N_{1,i} \preceq N_{2,i}$. \item $d_i \in
N_{1,i+1}-N_{1,i}$. 
\item $(N_{1,i},N_{1,i+1},d_i)\in K^{3,uq}$. \item
$tp(d_i,N_{2,i},N_{2,i+1})$ does not fork over $N_{1,i}$.
\end{enumerate}
In this case, $\langle N_{1,i}, d_i:i<\alpha^{*} \rangle ^\frown
\langle N_{1,\alpha^{*}} \rangle$ is said to be the first witness
for $NF^*(N_0,N_1,N_2,N_3)$, $d_i$ is said to be the $i$-th
element in the first witness for $NF^{*}$ and $\langle
N_{2,i}:i\leq \alpha^{*} \rangle$ is said to be the second witness
for $NF^*(N_0,N_1,N_2,N_3)$.
\end{definition}
```

Lean (Frames.lean:3827):

```lean
/-- Def 5.3.1: `⟨N_{1,i}, d_i : i < α*⟩⌢⟨N_{1,α*}⟩` (first witness) and `⟨N_{2,i} : i ≤ α*⟩`
(second witness) witness `NF*(N₀, N₁, N₂, N₃)`: `α* < λ⁺`, both sequences increasing continuous,
(a) `N₀ ≼ Nₙ ≼ N₃` (`n < 3`), (b) `N_{1,0} = N₀`, `N_{1,α*} = N₁`, `N_{2,0} = N₂`,
`N_{2,α*} = N₃`, (c) `N_{1,i} ≼ N_{2,i}`, (d) `dᵢ ∈ N_{1,i+1} - N_{1,i}`,
(e) `(N_{1,i}, N_{1,i+1}, dᵢ) ∈ K^{3,uq}`, (f) `tp(dᵢ, N_{2,i}, N_{2,i+1})` does not fork over
`N_{1,i}`. -/
def Frame.NFStarWit (s : Frame U L) (lam : Cardinal.{u}) (N₀ N₁ N₂ N₃ : Model U L)
    (αs : Ordinal.{u}) (A B : Ordinal.{u} → Model U L) (d : Ordinal.{u} → U) : Prop :=
  αs < (Order.succ lam).ord ∧
  IsIncreasing s.S.le A (Iic αs) ∧ IsContinuous A (Iic αs) ∧
  IsIncreasing s.S.le B (Iic αs) ∧ IsContinuous B (Iic αs) ∧
  (s.S.le N₀ N₀ ∧ s.S.le N₀ N₃) ∧ (s.S.le N₀ N₁ ∧ s.S.le N₁ N₃) ∧ (s.S.le N₀ N₂ ∧ s.S.le N₂ N₃) ∧
  A 0 = N₀ ∧ A αs = N₁ ∧ B 0 = N₂ ∧ B αs = N₃ ∧
  (∀ i ≤ αs, s.S.le (A i) (B i)) ∧
  (∀ i < αs, d i ∈ (A (i + 1)).carrier \ (A i).carrier) ∧
  (∀ i < αs, (A i, A (i + 1), d i) ∈ s.K3uq lam) ∧
  ∀ i < αs, s.NotFork lam (A i) (B i) (tp s.S lam (d i) (B i) (B (i + 1)))
```

### `Frame.NFStar` — Def 5.3.1 — unchanged

Paper, definition 5.3.1 (l. 4510–4540):

```latex
\begin{definition} \label{5.2}
Define a relation $NF^{*}=NF^{*}_\lambda$ on $^4(K_\lambda)$ by:
$NF^{*}(N_0, \allowbreak N_1,N_2 ,N_3)$ if there is
$\alpha^{*}<\lambda^+$ and for l=1,2 there are an increasing
continuous sequence $\langle  N_{l,i}:i\leq \alpha^{*} \rangle$
and a sequence $\langle d_i:i<\alpha^{*} \rangle$ such that:
\begin{displaymath}
\xymatrix{
N_2=N_{2,0} \ar[rr]^{id} &&N_{2,i} \ar[r]^{id} & N_{2,i+1} \ar[rr]^{id} && N_{2,\alpha^*}=N_3\\
N_0=N_{1,0} \ar[rr]^{id} \ar[u]^{id} &&N_{1,i} \ar[r]^{id}
\ar[u]^{id} & N_{1,i+1} \ar[u]^{id} \ar[rr]^{id} &&
N_{1,\alpha^*}=N_1 \ar[u]^{id} &&
 }
\end{displaymath}
\begin{enumerate}[(a)]
\item $n<3\Rightarrow N_0\preceq N_n \preceq N_3$. \item
$N_{1,0}=N_0, N_{1,\alpha^{*}}=N_1,
N_{2,0}=N_2,N_{2,\alpha^{*}}=N_3$. \item $i\leq \alpha^{*}
\Rightarrow N_{1,i} \preceq N_{2,i}$. \item $d_i \in
N_{1,i+1}-N_{1,i}$. 
\item $(N_{1,i},N_{1,i+1},d_i)\in K^{3,uq}$. \item
$tp(d_i,N_{2,i},N_{2,i+1})$ does not fork over $N_{1,i}$.
\end{enumerate}
In this case, $\langle N_{1,i}, d_i:i<\alpha^{*} \rangle ^\frown
\langle N_{1,\alpha^{*}} \rangle$ is said to be the first witness
for $NF^*(N_0,N_1,N_2,N_3)$, $d_i$ is said to be the $i$-th
element in the first witness for $NF^{*}$ and $\langle
N_{2,i}:i\leq \alpha^{*} \rangle$ is said to be the second witness
for $NF^*(N_0,N_1,N_2,N_3)$.
\end{definition}
```

Lean (Frames.lean:3840):

```lean
/-- Def 5.3.1: the relation `NF* = NF*_λ` on `⁴(K_λ)`. -/
def Frame.NFStar (s : Frame U L) (lam : Cardinal.{u}) : QRel U L := fun N₀ N₁ N₂ N₃ =>
  N₀ ∈ s.S.Kc lam ∧ N₁ ∈ s.S.Kc lam ∧ N₂ ∈ s.S.Kc lam ∧ N₃ ∈ s.S.Kc lam ∧
    ∃ αs A B d, s.NFStarWit lam N₀ N₁ N₂ N₃ αs A B d
```

### `Frame.NF` — Def 5.3.2 — unchanged

Paper, definition 5.3.2 (l. 4542–4548):

```latex
\begin{definition} \label{5.3}\label{definition of NF}
$NF=NF_\lambda$ is the class of quadruples $(M_0,M_1,M_2,M_3)$ of models in $K_\lambda$
such that $M_0 \preceq M_1 \preceq M_3$, $M_0 \preceq M_2 \preceq
M_3$ and there are models $N_0,N_1,N_2,\allowbreak N_3$ such that:
$N_0=M_0, l<4\Rightarrow M_l\preceq N_l$
 and $NF^*(N_0,N_1,N_2,N_3)$.
\end{definition}
```

Lean (Frames.lean:3846):

```lean
/-- Def 5.3.2: `NF = NF_λ`: quadruples of models in `K_λ` with `M₀ ≼ M₁ ≼ M₃`, `M₀ ≼ M₂ ≼ M₃`
and `N₀ = M₀`, `M_l ≼ N_l` (`l < 4`), `NF*(N₀, N₁, N₂, N₃)` for some `N₀, …, N₃`. -/
def Frame.NF (s : Frame U L) (lam : Cardinal.{u}) : QRel U L := fun M₀ M₁ M₂ M₃ =>
  M₀ ∈ s.S.Kc lam ∧ M₁ ∈ s.S.Kc lam ∧ M₂ ∈ s.S.Kc lam ∧ M₃ ∈ s.S.Kc lam ∧
    s.S.le M₀ M₁ ∧ s.S.le M₁ M₃ ∧ s.S.le M₀ M₂ ∧ s.S.le M₂ M₃ ∧
    ∃ N₀ N₁ N₂ N₃, N₀ = M₀ ∧ s.S.le M₀ N₀ ∧ s.S.le M₁ N₁ ∧ s.S.le M₂ N₂ ∧ s.S.le M₃ N₃ ∧
      s.NFStar lam N₀ N₁ N₂ N₃
```

### `OtMinus` *(not in the main statements)* — Def 5.4.1 — **changed in the proof stage**, agent reading

Paper, definition 5.4.1 (l. 4865–4884):

```latex
\begin{definition} \label{5.1-}
Let $R \subseteq\ ^4(K_\lambda)$ be a relation. We say
$\bigotimes^-_{R}$ when:
\begin{enumerate}
\item If $R(M_0,M_1,M_2,M_3) \ then \ n\in \{1,2\}\Rightarrow
M_0\preceq M_n\preceq M_3$. \item Weak Uniqueness: Suppose for
$x=a,b$ $(f^x_1,f^x_2,N^x_3)$ is an amalgamation of $N_1$ and
$N_2$ over $N_0$ and $R(N_0,f^x_1[N_1],f^x_2[N_2],N^{x}_3)$. Then
$(f^a_1,f^a_2,N^a_3)E_{N_0}(f^b_1,f^b_2,N^b_3)$. \item If
$R(M_0,M_1,M_2,M_3)$ and $f:M_2 \to M_4$ is an embedding, then
there is an amalgamation $(g,id_{M_4},M_5)$ of $M_3,M_4$ over
$M_2$ such that $R(f[M_0],\allowbreak g[M_1],M_4,M_5)$.
\begin{displaymath}
\xymatrix{M_1 \ar[r]^{id} & M_3 \ar[r]^{g} & M_5\\
M_0 \ar[u]^{id} \ar[r]^{id} & M_2 \ar[u]^{id} \ar[r]^{f} & M_4
\ar[u]^{id}}
\end{displaymath}
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:4675):

```lean
/-- Def 5.4.1: `⊗⁻_R` for `R ⊆ ⁴(K_λ)`: (1) `R(M₀, M₁, M₂, M₃) → M₀ ≼ Mₙ ≼ M₃` (`n = 1, 2`);
(2) weak uniqueness: amalgamations `(f₁ˣ, f₂ˣ, N₃ˣ)` of `N₁, N₂` over `N₀` with
`R(N₀, f₁ˣ[N₁], f₂ˣ[N₂], N₃ˣ)` are `E_{N₀}`-equivalent; (3) if `R(M₀, M₁, M₂, M₃)` and
`f : M₂ → M₄` is an embedding, there is an amalgamation `(g, id_{M₄}, M₅)` of `M₃, M₄` over
`M₂` with `R(f[M₀], g[M₁], M₄, M₅)`. -/
def OtMinus (S : KSys U L) (lam : Cardinal.{u}) (R : QRel U L) : Prop :=
  OtDom S lam R ∧
  (∀ M₀ M₁ M₂ M₃, R M₀ M₁ M₂ M₃ → S.le M₀ M₁ ∧ S.le M₁ M₃ ∧ S.le M₀ M₂ ∧ S.le M₂ M₃) ∧
  (∀ (N₀ N₁ N₂ : Model U L) (A B : Amalg U L),
    IsAmalgIn S lam A.1 A.2.1 A.2.2 N₀ N₁ N₂ → IsAmalgIn S lam B.1 B.2.1 B.2.2 N₀ N₁ N₂ →
    (∃ P Q, IsoOn A.1 N₁ P ∧ IsoOn A.2.1 N₂ Q ∧ R N₀ P Q A.2.2) →
    (∃ P Q, IsoOn B.1 N₁ P ∧ IsoOn B.2.1 N₂ Q ∧ R N₀ P Q B.2.2) →
      AmalgEquiv S lam N₀ N₁ N₂ A B) ∧
  ∀ (M₀ M₁ M₂ M₃ M₄ : Model U L) (f : U → U), R M₀ M₁ M₂ M₃ → IsEmb S f M₂ M₄ →
    -- PROOF-STAGE CHANGE: added `M₄ ∈ K_λ` (`R ⊆ ⁴(K_λ)` in the paper); without it clause (3) is
    -- false for every nonempty `R`, since `M₄ ≼ M₅ ∈ K_λ` fails for `M₄` larger than `λ`.
    M₄ ∈ S.Kc lam →
    -- AGENT-CHOICE: "(g, id_{M₄}, M₅) is an amalgamation of M₃, M₄ over M₂" is read along `f`
    -- (`g ⊇ f`, `M₄ ≼ M₅`); read over `M₂` literally it would force `M₂ ⊆ M₄`.
    ∃ (g : U → U) (M₅ P Q : Model U L), M₅ ∈ S.Kc lam ∧ IsEmb S g M₃ M₅ ∧
      (∀ x ∈ M₂.carrier, g x = f x) ∧ S.le M₄ M₅ ∧
      IsoOn f M₀ P ∧ IsoOn g M₁ Q ∧ R P Q M₄ M₅
```

### `Hyp_6_1_1` *(not in the main statements)* — Hypothesis 6.1.1 — unchanged

Paper, hypothesis 6.1.1 (l. 5516–5519):

```latex
\begin{hypothesis}
$\frak{s}$ is a  semi-good $\lambda$-frame with conjugation and
$K^{3,uq}$ satisfies the existence property.
\end{hypothesis}
```

Lean (Frames.lean:8234):

```lean
/-- Hypothesis 6.1.1: `s` is a semi-good `λ`-frame with conjugation and `K^{3,uq}` satisfies the
existence property. (The same hypothesis is repeated as 7.1.1, 8.1.1, 9.1.1.) -/
def Hyp_6_1_1 (s : Frame U L) (lam : Cardinal.{u}) : Prop :=
  s.IsSemiGood lam ∧ ConjProp s lam ∧ s.ExistProp lam (s.K3uq lam)
```

### `Frame.NFhat` — Def 6.1.2 — encoding

Paper, definition 6.1.2 (l. 5522–5532):

```latex
\begin{definition}\label{5.14} Define a 4-place relation $\widehat{NF}$ on $K$ by $\widehat{NF}(N_0,N_1,M_0,\allowbreak M_1)$ iff the following hold:
\begin{enumerate}
\item $n<2 \Rightarrow N_n \in K_\lambda,\ M_n \in K_{\lambda^+}$.
\item There is a pair of increasing continuous sequences $\langle
N_{0,\alpha}:\alpha<\lambda^+ \rangle,\ \langle
N_{1,\alpha}:\alpha<\lambda^+ \rangle$ such that for every
$\alpha,\ NF(N_{0,\alpha},N_{1,\alpha},N_{0,\alpha+1},\allowbreak
N_{1,\alpha+1})$ and for $n<2$, $N_{0,n}=N_n,\
M_n=\bigcup\{N_{n,\alpha}:\alpha<\lambda^+\}$.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:8244):

```lean
/-- Def 6.1.2: `NF^(N₀, N₁, M₀, M₁)` iff (1) `Nₙ ∈ K_λ`, `Mₙ ∈ K_{λ⁺}`; (2) there are increasing
continuous `⟨N_{0,α} : α < λ⁺⟩`, `⟨N_{1,α} : α < λ⁺⟩` with
`NF(N_{0,α}, N_{1,α}, N_{0,α+1}, N_{1,α+1})`, `N_{n,0} = Nₙ`, `Mₙ = ⋃_α N_{n,α}`. -/
def NFhat (N₀ N₁ M₀ M₁ : Model U L) : Prop :=
  N₀ ∈ s.S.Kc lam ∧ N₁ ∈ s.S.Kc lam ∧ M₀ ∈ s.S.Kc (Order.succ lam) ∧
    M₁ ∈ s.S.Kc (Order.succ lam) ∧
    ∃ A B : Ordinal.{u} → Model U L,
      IsIncreasing s.S.le A (Iio (Order.succ lam).ord) ∧ IsContinuous A (Iio (Order.succ lam).ord) ∧
      IsIncreasing s.S.le B (Iio (Order.succ lam).ord) ∧ IsContinuous B (Iio (Order.succ lam).ord) ∧
      (∀ α < (Order.succ lam).ord, s.NF lam (A α) (B α) (A (α + 1)) (B (α + 1))) ∧
      A 0 = N₀ ∧ B 0 = N₁ ∧
      -- ENCODING (clarification, author-confirmed): `Mₙ = ⋃ N_{n,α}` in the paper is the union of
      -- structures, hence `IsUnionOf`.
      IsUnionOf A (Iio (Order.succ lam).ord) M₀ ∧ IsUnionOf B (Iio (Order.succ lam).ord) M₁
```

### `Frame.leNF` — Def 6.1.4 — unchanged

Paper, definition 6.1.4 (l. 5636–5640):

```latex
\begin{definition} \label{6.1}\label{6.4 in april}
Suppose $M_0,M_1 \in K_{\lambda^+}$, $M_0 \preceq M_1$. Then $M_0
\preceq^{NF}_{\lambda^+} M_1$ when: there are $N_0,N_1 \in
K_\lambda$ such that $\widehat{NF}(N_0,N_1,\allowbreak M_0,M_1)$.
\end{definition}
```

Lean (Frames.lean:8258):

```lean
/-- Def 6.1.4: for `M₀ ≼ M₁` in `K_{λ⁺}`, `M₀ ≼^NF_{λ⁺} M₁` iff `NF^(N₀, N₁, M₀, M₁)` for some
`N₀, N₁ ∈ K_λ`. -/
def leNF (M₀ M₁ : Model U L) : Prop :=
  M₀ ∈ s.S.Kc (Order.succ lam) ∧ M₁ ∈ s.S.Kc (Order.succ lam) ∧ s.S.le M₀ M₁ ∧
    ∃ N₀ ∈ s.S.Kc lam, ∃ N₁ ∈ s.S.Kc lam, s.NFhat lam N₀ N₁ M₀ M₁
```

### `Frame.ltNF` *(not in the main statements)* — Def 1.0.14 — unchanged

Paper, definition 1.0.14 (l. 674–676):

```latex
\begin{definition}
We say $M\prec N$ when $M \preceq N$ and $M \neq N$.
\end{definition}
```

Lean (Frames.lean:8263):

```lean
/-- `M₀ ≺^NF_{λ⁺} M₁`: `M₀ ≼^NF_{λ⁺} M₁` and `M₀ ≠ M₁` (Def 1.0.14 applied to `≼^NF`). -/
def ltNF (M₀ M₁ : Model U L) : Prop := s.leNF lam M₀ M₁ ∧ M₀ ≠ M₁
```

### `Frame.nfKSys` *(not in the main statements)* — no paper item — unchanged

Lean (Frames.lean:8266):

```lean
/-- `(K_{λ⁺}, ≼^NF_{λ⁺})`. -/
def nfKSys : KSys U L := ⟨s.S.Kc (Order.succ lam), s.leNF lam⟩
```

### `Hyp_7_1_1` *(not in the main statements)* — Hypothesis 7.1.1 — unchanged

Paper, hypothesis 7.1.1 (l. 5908–5911):

```latex
\begin{hypothesis}
$\frak{s}$ is a semi-good $\lambda$-frame with conjugation and
$K^{3,uq}$ satisfies the existence property.
\end{hypothesis}
```

Lean (Frames.lean:11386):

```lean
/-- Hypothesis 7.1.1 (= Hypothesis 6.1.1). -/
def Hyp_7_1_1 (s : Frame U L) (lam : Cardinal.{u}) : Prop := Hyp_6_1_1 s lam
```

### `Frame.Ksat` — Def 7.1.2 — unchanged

Paper, definition 7.1.2 (l. 5913–5916):

```latex
\begin{definition} \label{7.1}
$K^{sat}$ is the class of saturated models in $\lambda^+$ over
$\lambda$.
\end{definition}
```

Lean (Frames.lean:11393):

```lean
/-- Def 7.1.2: `K^sat`, the class of saturated models in `λ⁺` over `λ`. -/
def Ksat : Set (Model U L) := {M | Saturated s.S lam M}
```

### `Frame.satKSys` — no paper item — unchanged

Lean (Frames.lean:11396):

```lean
/-- `(K^sat, ≼^NF_{λ⁺} ↾ K^sat)`. -/
def satKSys : KSys U L :=
  ⟨s.Ksat lam, fun M N => M ∈ s.Ksat lam ∧ N ∈ s.Ksat lam ∧ s.leNF lam M N⟩
```

### `Frame.PlusWit` *(not in the main statements)* — Def 7.1.4 — **changed in the proof stage**, **deviation (author-confirmed / typo)**, encoding, agent reading

Paper, definition 7.1.4 (l. 5963–5989):

```latex
\begin{definition} \label{7.3}
$\prec^+_{\lambda^+}$ is a 2-place relation on $K_{\lambda^+}$.
For $M_0,M_1 \in K_{\lambda^+}$, $M_0\prec^+_{\lambda^+}M_1$ if
there are increasing continuous sequences of models in
$K_\lambda$, $\langle N_{0,\alpha}:\alpha<\lambda^+ \rangle$,
$\langle N_{1,\alpha}:\alpha<\lambda^+ \rangle$, $\langle
N^{\oplus}_{1,\alpha}:\alpha<\lambda^+ \rangle$, and there is a
club $E$ of $\lambda^+$ such that:
\begin{enumerate}[(a)]
\item For $n=0,1$ $M_n=\bigcup \{N_{n,\alpha}:\alpha<\lambda^+\}$.
\item $\alpha \in E \Rightarrow N_{0,\alpha} \preceq N_{1,\alpha}
\preceq N^{\oplus}_{1,\alpha}$. \item If $\alpha<\beta$ and they
are in $E$, then
$NF(N_{0,\alpha},N^{\oplus}_{1,\alpha},N_{0,\beta},N_{1,\beta})$.
 \item For every $\alpha \in E$,
and every $p \in S^{bs}(N_{1,\alpha})$, there is an end-segment
$S$ of $\lambda^+$ such that for every $\beta \in S \bigcap E$ the
model $N^{\oplus}_{1,\beta}$ realizes the non-forking extension of
$p$ to $N_{1,\beta}$.
\end{enumerate}
In such a case $\langle N_{0,\alpha}:\alpha<\lambda^+ \rangle$,
$\langle N_{1,\alpha}:\alpha<\lambda^+ \rangle$, $\langle
N_{1,\alpha}^{\oplus}:\alpha<\lambda^+ \rangle$, $E$ are said to
be witnesses for $M_0 \prec^+_{\lambda^+} M_1$. Note that the
$N_{1,\alpha}$ and the $N_{1,\alpha}^{\bigoplus}$ are an
alternating chain that both union to $M_1$.
\end{definition}
```

Lean (Frames.lean:11416):

```lean
-- AGENT-CHOICE (reading): in (d), "realizes the non-forking extension of p" = the non-forking
-- extension exists and is realized; the end segment `S` is `[γ, λ⁺)`.
-- PROOF-STAGE CHANGE: continuity is required only of `⟨N_{0,α}⟩` and `⟨N_{1,α}⟩`; `⟨N^⊕_{1,α}⟩` is
-- only increasing in `K_λ`.
-- DEVIATION (author-confirmed erratum): the paper requires all three sequences to be increasing
-- continuous. Then the definition is unsatisfiable: at a limit point `δ ∈ E` of `E`, clauses (b),
-- (c) and continuity give `N_{1,δ} = N^⊕_{1,δ}`, contradicting (d). See NOTES.md, section C.
/-- Def 7.1.4: witnesses `⟨N_{0,α}⟩, ⟨N_{1,α}⟩` (`α < λ⁺`, increasing continuous in `K_λ`),
`⟨N^⊕_{1,α}⟩` (`α < λ⁺`, increasing in `K_λ`) and a club `E` for `M₀ ≺⁺_{λ⁺} M₁`:
(a) `Mₙ = ⋃ N_{n,α}`, (b) `α ∈ E → N_{0,α} ≼ N_{1,α} ≼ N^⊕_{1,α}`, (c) `α < β` in `E` →
`NF(N_{0,α}, N^⊕_{1,α}, N_{0,β}, N_{1,β})`, (d) for `α ∈ E` and `p ∈ S^bs(N_{1,α})` there is an
end segment `S` of `λ⁺` such that for `β ∈ S ∩ E`, `N^⊕_{1,β}` realizes the non-forking extension
of `p` to `N_{1,β}`.

Original text of the paper: "there are increasing continuous sequences of models in `K_λ`,
`⟨N_{0,α} : α < λ⁺⟩`, `⟨N_{1,α} : α < λ⁺⟩`, `⟨N^⊕_{1,α} : α < λ⁺⟩`, and there is a club `E` of
`λ⁺` such that ...". -/
def PlusWit (M₀ M₁ : Model U L) (A B C : Ordinal.{u} → Model U L) (E : Set Ordinal.{u}) :
    Prop :=
  IsIncCont s.S A (Iio (Order.succ lam).ord) (s.S.Kc lam) ∧
  IsIncCont s.S B (Iio (Order.succ lam).ord) (s.S.Kc lam) ∧
  IsIncreasing s.S.le C (Iio (Order.succ lam).ord) ∧ (∀ α ∈ Iio (Order.succ lam).ord, C α ∈ s.S.Kc lam) ∧
  IsClubIn (Order.succ lam).ord E ∧
  -- PROOF-STAGE CHANGE: ENCODING (clarification, author-confirmed; not an erratum): clause (a)
  -- `Mₙ = ⋃ N_{n,α}` of the paper is the union of structures, hence `IsUnionOf` (it was the equality
  -- of universes `Mₙ.carrier = ⋃ (N_{n,α}).carrier`, which does not determine the structure of `Mₙ`).
  IsUnionOf A (Iio (Order.succ lam).ord) M₀ ∧
  IsUnionOf B (Iio (Order.succ lam).ord) M₁ ∧
  (∀ α ∈ E, s.S.le (A α) (B α) ∧ s.S.le (B α) (C α)) ∧
  (∀ α ∈ E, ∀ β ∈ E, α < β → s.NF lam (A α) (C α) (A β) (B β)) ∧
  ∀ α ∈ E, ∀ p ∈ s.Sbs (B α), ∃ γ < (Order.succ lam).ord, ∀ β ∈ E, γ ≤ β →
    ∃ q ∈ s.Sbs (B β), s.IsNFExt lam (B α) (B β) q p ∧ Realizes s.S lam (C β) (B β) q
```

### `Frame.ltPlus` *(not in the main statements)* — Def 7.1.4 — unchanged

Paper, definition 7.1.4 (l. 5963–5989):

```latex
\begin{definition} \label{7.3}
$\prec^+_{\lambda^+}$ is a 2-place relation on $K_{\lambda^+}$.
For $M_0,M_1 \in K_{\lambda^+}$, $M_0\prec^+_{\lambda^+}M_1$ if
there are increasing continuous sequences of models in
$K_\lambda$, $\langle N_{0,\alpha}:\alpha<\lambda^+ \rangle$,
$\langle N_{1,\alpha}:\alpha<\lambda^+ \rangle$, $\langle
N^{\oplus}_{1,\alpha}:\alpha<\lambda^+ \rangle$, and there is a
club $E$ of $\lambda^+$ such that:
\begin{enumerate}[(a)]
\item For $n=0,1$ $M_n=\bigcup \{N_{n,\alpha}:\alpha<\lambda^+\}$.
\item $\alpha \in E \Rightarrow N_{0,\alpha} \preceq N_{1,\alpha}
\preceq N^{\oplus}_{1,\alpha}$. \item If $\alpha<\beta$ and they
are in $E$, then
$NF(N_{0,\alpha},N^{\oplus}_{1,\alpha},N_{0,\beta},N_{1,\beta})$.
 \item For every $\alpha \in E$,
and every $p \in S^{bs}(N_{1,\alpha})$, there is an end-segment
$S$ of $\lambda^+$ such that for every $\beta \in S \bigcap E$ the
model $N^{\oplus}_{1,\beta}$ realizes the non-forking extension of
$p$ to $N_{1,\beta}$.
\end{enumerate}
In such a case $\langle N_{0,\alpha}:\alpha<\lambda^+ \rangle$,
$\langle N_{1,\alpha}:\alpha<\lambda^+ \rangle$, $\langle
N_{1,\alpha}^{\oplus}:\alpha<\lambda^+ \rangle$, $E$ are said to
be witnesses for $M_0 \prec^+_{\lambda^+} M_1$. Note that the
$N_{1,\alpha}$ and the $N_{1,\alpha}^{\bigoplus}$ are an
alternating chain that both union to $M_1$.
\end{definition}
```

Lean (Frames.lean:11433):

```lean
/-- Def 7.1.4: `M₀ ≺⁺_{λ⁺} M₁` (a relation on `K_{λ⁺}`). -/
def ltPlus (M₀ M₁ : Model U L) : Prop :=
  M₀ ∈ s.S.Kc (Order.succ lam) ∧ M₁ ∈ s.S.Kc (Order.succ lam) ∧ ∃ A B C E, s.PlusWit lam M₀ M₁ A B C E
```

### `Hyp_8_1_1` *(not in the main statements)* — Hypothesis 8.1.1 — unchanged

Paper, hypothesis 8.1.1 (l. 6750–6753):

```latex
\begin{hypothesis}
$\frak{s}$ is a  semi-good $\lambda$-frame with conjugation and
$K^{3,uq}$ satisfies the existence property.
\end{hypothesis}
```

Lean (Frames.lean:14619):

```lean
/-- Hypothesis 8.1.1 (= Hypothesis 6.1.1). -/
def Hyp_8_1_1 (s : Frame U L) (lam : Cardinal.{u}) : Prop := Hyp_6_1_1 s lam
```

### `Frame.leOt` *(not in the main statements)* — Def 8.1.2 — unchanged

Paper, definition 8.1.2 (l. 6755–6761):

```latex
\begin{definition} \label{8.1}
$\preceq^{\otimes}_{\lambda^+}:=\{(M_0,M_1):M_0,M_1 \in K^{sat}$,
$M_0 \prec M_1$ and for every $N_0,N_1 \in K_\lambda$, if $N_0
\preceq M_0$, $N_0 \preceq N_1 \preceq M_1$ and $p \in
S^{bs}(N_1)$ does not fork over $N_0$, then for some element $d
\in M_0$ $tp(d,N_1,M_1)=p$\}.
\end{definition}
```

Lean (Frames.lean:14624):

```lean
/-- Def 8.1.2: `M₀ ≼^⊗_{λ⁺} M₁` iff `M₀, M₁ ∈ K^sat`, `M₀ ≺ M₁` and for all `N₀, N₁ ∈ K_λ` with
`N₀ ≼ M₀`, `N₀ ≼ N₁ ≼ M₁`, every `p ∈ S^bs(N₁)` not forking over `N₀` is `tp(d, N₁, M₁)` for some
`d ∈ M₀`. -/
def Frame.leOt (s : Frame U L) (lam : Cardinal.{u}) (M₀ M₁ : Model U L) : Prop :=
  M₀ ∈ s.Ksat lam ∧ M₁ ∈ s.Ksat lam ∧ s.S.lt M₀ M₁ ∧
    ∀ N₀ ∈ s.S.Kc lam, ∀ N₁ ∈ s.S.Kc lam, s.S.le N₀ M₀ → s.S.le N₀ N₁ → s.S.le N₁ M₁ →
      ∀ p ∈ s.Sbs N₁, s.NotFork lam N₀ N₁ p → ∃ d ∈ M₀.carrier, tp s.S lam d N₁ M₁ = p
```

### `Hyp_9_1_1` *(not in the main statements)* — Hypothesis 9.1.1 — unchanged

Paper, hypothesis 9.1.1 (l. 7187–7190):

```latex
\begin{hypothesis}
$\frak{s}$ is a  semi-good $\lambda$-frame with conjugation and
$K^{3,uq}$ satisfies the existence property.
\end{hypothesis}
```

Lean (Frames.lean:17426):

```lean
/-- Hypothesis 9.1.1 (= Hypothesis 6.1.1). -/
def Hyp_9_1_1 (s : Frame U L) (lam : Cardinal.{u}) : Prop := Hyp_6_1_1 s lam
```

### `Frame.IncNFSucc` *(not in the main statements)* — Def 9.1.2 — unchanged

Paper, definition 9.1.2 (l. 7192–7198):

```latex
\begin{definition} \label{9.1}
Let $\bar{M}=\langle  M_\alpha:\alpha<\alpha^* \rangle$ be an
increasing sequence of models in $K_{\lambda^+}$. We say that
$\bar{M}$ is \emph{$\preceq^{NF}_{\lambda^+}$-increasing in the
successor ordinals} if $\beta<\gamma<\alpha^* \Rightarrow
M_{\beta+1} \preceq^{NF}_{\lambda^+} M_{\gamma+1}$.
\end{definition}
```

Lean (Frames.lean:17430):

```lean
/-- Def 9.1.2: an increasing sequence `⟨M_α : α < α*⟩` in `K_{λ⁺}` is `≼^NF`-increasing in the
successor ordinals: `β < γ < α* → M_{β+1} ≼^NF M_{γ+1}`. -/
def Frame.IncNFSucc (s : Frame U L) (lam : Cardinal.{u}) (M : Ordinal.{u} → Model U L)
    (αs : Ordinal.{u}) : Prop :=
  IsIncreasing s.S.le M (Iio αs) ∧ (∀ α < αs, M α ∈ s.S.Kc (Order.succ lam)) ∧
    ∀ β γ, β < γ → γ < αs → s.leNF lam (M (β + 1)) (M (γ + 1))
```

### `Frame.TSet` *(not in the main statements)* — Def 9.1.3 — unchanged

Paper, definition 9.1.3 (l. 7200–7210):

```latex
\begin{definition} \label{9.2}
Let $\alpha \leq \lambda^{+2}$ and let $\bar{M}=\langle
M_\alpha:\alpha<\lambda^{+2} \rangle$ be an
$\preceq^{NF}_{\lambda^+}$-increasing in the successor ordinals
and continuous sequence with union $M$. Define
$T(\bar{M})=:\{\delta \in \lambda^{+2}:\exists \alpha \in
(\delta,\lambda^{+2})$ $M_\delta \npreceq^{NF} M_\alpha\}$. Define
$T(M)=:T(\bar{M})/D_{\lambda^{+2}}$ where $D_{\lambda^{+2}}$ is
the club filter on $\lambda^{+2}$. (By Proposition~ \ref{is well
defined}, $T(M)$ does not depend on the representation $\bar{M}$).
\end{definition}
```

Lean (Frames.lean:17436):

```lean
/-- Def 9.1.3: `T(M̄) = {δ < λ^{+2} : ∃ α ∈ (δ, λ^{+2}), M_δ ⋠^NF M_α}`. -/
def Frame.TSet (s : Frame U L) (lam : Cardinal.{u}) (M : Ordinal.{u} → Model U L) :
    Set Ordinal.{u} :=
  {δ | δ < (plusN lam 2).ord ∧ ∃ α, δ < α ∧ α < (plusN lam 2).ord ∧ ¬ s.leNF lam (M δ) (M α)}
```

### `Frame.HasT` *(not in the main statements)* — Def 9.1.3 — **changed in the proof stage**, encoding

Paper, definition 9.1.3 (l. 7200–7210):

```latex
\begin{definition} \label{9.2}
Let $\alpha \leq \lambda^{+2}$ and let $\bar{M}=\langle
M_\alpha:\alpha<\lambda^{+2} \rangle$ be an
$\preceq^{NF}_{\lambda^+}$-increasing in the successor ordinals
and continuous sequence with union $M$. Define
$T(\bar{M})=:\{\delta \in \lambda^{+2}:\exists \alpha \in
(\delta,\lambda^{+2})$ $M_\delta \npreceq^{NF} M_\alpha\}$. Define
$T(M)=:T(\bar{M})/D_{\lambda^{+2}}$ where $D_{\lambda^{+2}}$ is
the club filter on $\lambda^{+2}$. (By Proposition~ \ref{is well
defined}, $T(M)$ does not depend on the representation $\bar{M}$).
\end{definition}
```

Lean (Frames.lean:17442):

```lean
/-- Def 9.1.3: `T(M) = T(M̄)/D_{λ^{+2}}` equals `X/D_{λ^{+2}}`, for some representation `M̄` of `M`
that is `≼^NF`-increasing in the successor ordinals and continuous with union `M`. -/
def Frame.HasT (s : Frame U L) (lam : Cardinal.{u}) (M : Model U L) (X : Set Ordinal.{u}) :
    Prop :=
  ∃ Ms : Ordinal.{u} → Model U L, s.IncNFSucc lam Ms (plusN lam 2).ord ∧
    IsContinuous Ms (Iio (plusN lam 2).ord) ∧
    -- PROOF-STAGE CHANGE: ENCODING (clarification): union of structures, hence `IsUnionOf`.
    IsUnionOf Ms (Iio (plusN lam 2).ord) M ∧
    ClubEq (plusN lam 2).ord (s.TSet lam Ms) X
```

### `StatCof` *(not in the main statements)* — no paper item — unchanged

Lean (Frames.lean:17582):

```lean
/-- `S^{λ^{+2}}_{λ⁺}`: stationary subsets of `λ^{+2}` all of whose elements have cofinality `λ⁺`. -/
def StatCof (lam : Cardinal.{u}) (X : Set Ordinal.{u}) : Prop :=
  IsStationaryIn (plusN lam 2).ord X ∧ ∀ α ∈ X, α.cof = Order.succ lam
```

### `Frame.Successful` *(not in the main statements)* — Def 10.1.1 — agent reading

Paper, definition 10.1.1 (l. 7532–7540):

```latex
\begin{definition} \label{10.1}
Let $\frak{s}$ be a semi-good $\lambda$-frame. We say that
$\frak{s}$ is \emph{successful} when:
\begin{enumerate}
\item $K^{3,uq}$ satisfies the existence property. \item
satisfies smoothness.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:18436):

```lean
-- AGENT-CHOICE (reading): item 2 of Def 10.1.1 reads "satisfies smoothness" with no subject; we
-- read it as "`(K^sat, ≼^NF_{λ⁺} ↾ K^sat)` satisfies smoothness" (cf. Thm 7.1.3, 7.1.18(b)).
/-- Def 10.1.1: the semi-good `λ`-frame `s` is successful: (1) `K^{3,uq}` satisfies the existence
property, (2) `(K^sat, ≼^NF ↾ K^sat)` satisfies smoothness. -/
def Frame.Successful (s : Frame U L) (lam : Cardinal.{u}) : Prop :=
  s.ExistProp lam (s.K3uq lam) ∧
    ∀ δ : Ordinal.{u}, Order.IsSuccLimit δ → (s.satKSys lam).AxSmooth δ
```

### `Hyp_10_1_2` *(not in the main statements)* — Hypothesis 10.1.2 — unchanged

Paper, hypothesis 10.1.2 (l. 7542–7545):

```latex
\begin{hypothesis} \label{10.2}
$\frak{s}$ is a successful semi-good $\lambda$-frame with
conjugation.
\end{hypothesis}
```

Lean (Frames.lean:18441):

```lean
/-- Hypothesis 10.1.2: `s` is a successful semi-good `λ`-frame with conjugation. -/
def Hyp_10_1_2 (s : Frame U L) (lam : Cardinal.{u}) : Prop :=
  s.IsSemiGood lam ∧ s.Successful lam ∧ ConjProp s lam
```

### `Frame.upKSys` — no paper item — unchanged

Lean (Frames.lean:18449):

```lean
/-- `((K^sat)^up, (≼^NF ↾ K^sat)^up)`. -/
def upKSys : KSys U L := (s.satKSys lam).up
```

### `Frame.tpPlus` — Def 10.1.3 — unchanged

Paper, definition 10.1.3 (l. 7555–7559):

```latex
\begin{definition}
For $M_0,M_1 \in K^{sat}$ and $a \in M_1-M_0$, we define
$$tp^+(a,M_0,M_1):=tp_{((K^{sat})^{up},(\preceq^{NF}_{\lambda^+} \restriction
K^{sat})^{up})}(a,M_0,M_1).$$
\end{definition}
```

Lean (Frames.lean:18454):

```lean
-- (After the erratum in Def 1.0.22 the pool is the whole class `(K^sat)^up`; the cardinal
-- argument `λ⁺` of `tp` is irrelevant.)
/-- Def 10.1.3: `tp⁺(a, M₀, M₁) := tp_{((K^sat)^up, (≼^NF ↾ K^sat)^up)}(a, M₀, M₁)`. -/
def tpPlus (a : U) (M₀ M₁ : Model U L) : Set (Tri U L) :=
  tp (s.upKSys lam) (Order.succ lam) a M₀ M₁
```

### `Frame.SbsPlus` — Def 10.1.6 — unchanged

Paper, definition 10.1.6 (l. 7598–7612):

```latex
\begin{definition} \label{10.3}
$\frak{s}^+:=((K^{sat})^{up},(\preceq^{NF}_{\lambda^+}
\restriction K^{sat})^{up}, \frak{s}^{bs,+},\dnf^+)$, where:
\begin{enumerate}
 \item
For each $M \in K^{sat}$, we define
$S^{bs,+}(M):=\{tp^+(a,M,N):\{M,N\} \subseteq K^{sat},\ M
\preceq^{NF}_{\lambda^+} N,\ tp(a,M,N) \in S^{bs}_{
>\lambda}\}$ \item $\dnf^+$ is defined by: $tp^+(a,M_1,M_2)$ does not fork over $M_0$
if $\{M_0,M_1,M_2\} \allowbreak \subseteq K^{sat},\ M_0
\preceq^{NF}_{\lambda^+} M_1 \preceq^{NF}_{\lambda^+} M_2$ and
$tp(a,M_1,M_2)$ does not fork over $M_0$ in the sense of
Definition \ref{forking for big models}.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:18468):

```lean
/-- Def 10.1.6(1): `S^{bs,+}(M) = {tp⁺(a, M, N) : M, N ∈ K^sat, M ≼^NF N, tp(a, M, N) ∈ S^bs_{>λ}}`
(for `M ∈ K^sat`). -/
def SbsPlus (M : Model U L) : Set (Set (Tri U L)) :=
  {p | M ∈ s.Ksat lam ∧ ∃ (N : Model U L) (a : U), N ∈ s.Ksat lam ∧ s.leNF lam M N ∧
    tp s.S lam a M N ∈ s.SbsGt lam M ∧ p = s.tpPlus lam a M N}
```

### `Frame.nfPlus` — Def 10.1.6 — encoding

Paper, definition 10.1.6 (l. 7598–7612):

```latex
\begin{definition} \label{10.3}
$\frak{s}^+:=((K^{sat})^{up},(\preceq^{NF}_{\lambda^+}
\restriction K^{sat})^{up}, \frak{s}^{bs,+},\dnf^+)$, where:
\begin{enumerate}
 \item
For each $M \in K^{sat}$, we define
$S^{bs,+}(M):=\{tp^+(a,M,N):\{M,N\} \subseteq K^{sat},\ M
\preceq^{NF}_{\lambda^+} N,\ tp(a,M,N) \in S^{bs}_{
>\lambda}\}$ \item $\dnf^+$ is defined by: $tp^+(a,M_1,M_2)$ does not fork over $M_0$
if $\{M_0,M_1,M_2\} \allowbreak \subseteq K^{sat},\ M_0
\preceq^{NF}_{\lambda^+} M_1 \preceq^{NF}_{\lambda^+} M_2$ and
$tp(a,M_1,M_2)$ does not fork over $M_0$ in the sense of
Definition \ref{forking for big models}.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:18477):

```lean
-- DEVIATION (encoding): Def 10.1.6(2) defines "tp⁺(a, M₁, M₂) does not fork over M₀"; as a
-- frame needs a relation on quadruples, we set `⨿⁺(M₀, M₁, a, M₂)` to hold exactly when the
-- defining condition holds for the triple `(M₁, M₂, a)`.
/-- Def 10.1.6(2): `⨿⁺(M₀, M₁, a, M₂)` iff `M₀, M₁, M₂ ∈ K^sat`, `M₀ ≼^NF M₁ ≼^NF M₂` and
`tp(a, M₁, M₂)` does not fork over `M₀` in the sense of Def 2.6.2. -/
def nfPlus (M₀ M₁ : Model U L) (a : U) (M₂ : Model U L) : Prop :=
  M₀ ∈ s.Ksat lam ∧ M₁ ∈ s.Ksat lam ∧ M₂ ∈ s.Ksat lam ∧ s.leNF lam M₀ M₁ ∧ s.leNF lam M₁ M₂ ∧
    s.NotForkGe lam M₀ M₁ (tp s.S lam a M₁ M₂)
```

### `Frame.splus` — Def 10.1.6 — unchanged

Paper, definition 10.1.6 (l. 7598–7612):

```latex
\begin{definition} \label{10.3}
$\frak{s}^+:=((K^{sat})^{up},(\preceq^{NF}_{\lambda^+}
\restriction K^{sat})^{up}, \frak{s}^{bs,+},\dnf^+)$, where:
\begin{enumerate}
 \item
For each $M \in K^{sat}$, we define
$S^{bs,+}(M):=\{tp^+(a,M,N):\{M,N\} \subseteq K^{sat},\ M
\preceq^{NF}_{\lambda^+} N,\ tp(a,M,N) \in S^{bs}_{
>\lambda}\}$ \item $\dnf^+$ is defined by: $tp^+(a,M_1,M_2)$ does not fork over $M_0$
if $\{M_0,M_1,M_2\} \allowbreak \subseteq K^{sat},\ M_0
\preceq^{NF}_{\lambda^+} M_1 \preceq^{NF}_{\lambda^+} M_2$ and
$tp(a,M_1,M_2)$ does not fork over $M_0$ in the sense of
Definition \ref{forking for big models}.
\end{enumerate}
\end{definition}
```

Lean (Frames.lean:18482):

```lean
/-- Def 10.1.6: `s⁺ := ((K^sat)^up, (≼^NF ↾ K^sat)^up, S^{bs,+}, ⨿⁺)`. -/
def splus : Frame U L where
  S := s.upKSys lam
  Sbs := s.SbsPlus lam
  nf := s.nfPlus lam
```

### `WDmId` — Def 11.1.2 — encoding

Paper, definition 11.1.2 (l. 7952–7958):

```latex
\begin{definition}
Let $\lambda$ be an infinite cardinal. We define
$WDmId(\lambda):=\{A \subseteq \lambda:$ for some
$F:^{<\lambda}\lambda \to 2$ for every $c:A \to 2$ for some
$\eta:\lambda \to \lambda$ the set $\{\delta \in A:F(\eta
\restriction \delta)=c(\delta)\}$ is not stationery\}.
\end{definition}
```

Lean (Frames.lean:20824):

```lean
-- DEVIATION (encoding): `^{<λ}λ` is encoded by pairs `(δ, η ↾ δ)` with `η ↾ δ` truncated to `0`
-- outside `δ`, so `F` cannot see `η` beyond `δ`. The quantifier order "for some F for every c
-- for some η" is kept as written (author decision Q5: it is the negation of the weak diamond,
-- which is the right definition of the ideal).
/-- Def 11.1.2: `WDmId(λ) = {A ⊆ λ : for some F : ^{<λ}λ → 2, for every c : A → 2, for some
η : λ → λ, the set {δ ∈ A : F(η ↾ δ) = c(δ)} is not stationary}`. -/
def WDmId (kap : Cardinal.{u}) : Set (Set Ordinal.{u}) :=
  {A | A ⊆ Iio kap.ord ∧ ∃ F : Ordinal.{u} → (Ordinal.{u} → Ordinal.{u}) → Bool,
    ∀ c : Ordinal.{u} → Bool, ∃ η : Ordinal.{u} → Ordinal.{u}, (∀ x < kap.ord, η x < kap.ord) ∧
      ¬ IsStationaryIn kap.ord
        {δ | δ ∈ A ∧ F δ (fun x => if x < δ then η x else 0) = c δ}}
```

### `NotSaturatedIn` — Def 11.1.3 — agent reading

Paper, definition 11.1.3 (l. 7960–7967):

```latex
\begin{definition}
Let $\mu$ be a cardinal, $\lambda$ be a regular uncountable
cardinal and $\mathbb{I}$ a normal ideal on $\lambda$.
$\mathbb{I}$ is said to be \emph{not saturated} in $\mu$ when:
There is a sequence $\langle A_i:i<\mu \rangle$ such that $A_i
\subseteq \lambda$, $A_i \notin \mathbb{I}$ for $i<\mu$ and $A_i
\bigcap A_j \in \mathbb{I}$ for $i \neq j \in \mu$.
\end{definition}
```

Lean (Frames.lean:20835):

```lean
-- AGENT-CHOICE: the preconditions "λ regular uncountable, I normal" are not part of the defined
-- property and are dropped.
/-- Def 11.1.3: the ideal `I` on `λ` is not saturated in `μ`: there are `A_i ⊆ λ` (`i < μ`) with
`A_i ∉ I` and `A_i ∩ A_j ∈ I` for `i ≠ j`. (The preconditions "`λ` regular uncountable, `I`
normal" are not part of the defined property.) -/
def NotSaturatedIn (I : Set (Set Ordinal.{u})) (kap μ : Cardinal.{u}) : Prop :=
  ∃ A : Ordinal.{u} → Set Ordinal.{u}, (∀ i < μ.ord, A i ⊆ Iio kap.ord ∧ A i ∉ I) ∧
    ∀ i j, i < μ.ord → j < μ.ord → i ≠ j → A i ∩ A j ∈ I
```

### `Conjecture_11_1_4` — Conjecture 11.1.4 — **deviation (author-confirmed / typo)**

Paper, conjecture 11.1.4 (l. 7970–7975):

```latex
\begin{conjecture}\label{the uniqueness triples conjecture}
Let $\frak{s}$ be a semi-good $\lambda$-frame. Assume that
$2^\lambda<2^{\lambda^+}<2^{\lambda^{+2}}$ and $WDmId(\lambda^+)$
is not saturated in $\lambda^+$. If $K^{3,uq}_\frak{s}$ is not
dense with respect to $\preceq_{bs}$, then $I(\lambda^{+2},K)=2^{\lambda^{+2}}$.
\end{conjecture}
```

Lean (Frames.lean:20846):

```lean
-- DEVIATION (author-confirmed erratum): the paper has "WDmId(λ⁺) is not saturated in λ⁺"; the
-- author confirmed it should read "not saturated in λ^{+2}" (pattern WDmId(λ^{+1+m}) not
-- saturated in λ^{+(2+m)} of Thm 11.1.5(3), Thm 11.1.7).
/-- Conjecture 11.1.4 (the uniqueness triples conjecture), as a proposition (not proved; used
as a hypothesis of Thms 1.0.2, 11.1.5, 11.1.7 and Cor 11.1.6): for a semi-good `λ`-frame `s`, if
`2^λ < 2^{λ⁺} < 2^{λ^{+2}}`, `WDmId(λ⁺)` is not saturated in `λ⁺` [erratum: in `λ^{+2}`], and
`K^{3,uq}_s` is not dense with respect to `≼_bs`, then `I(λ^{+2}, K) = 2^{λ^{+2}}`. -/
def Conjecture_11_1_4 : Prop :=
  ∀ (U' : Type u) (L' : Language.{u, u}) (s : Frame U' L') (lam : Cardinal.{u}),
    Room U' lam → s.IsSemiGood lam → (2 : Cardinal.{u}) ^ lam < 2 ^ (Order.succ lam) →
    (2 : Cardinal.{u}) ^ (Order.succ lam) < 2 ^ (plusN lam 2) →
    NotSaturatedIn (WDmId (Order.succ lam)) (Order.succ lam) (plusN lam 2) →
    ¬ s.Dense lam (s.K3uq lam) → numModels s.S (plusN lam 2) = 2 ^ (plusN lam 2)
```

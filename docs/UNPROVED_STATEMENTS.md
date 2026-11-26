# Statements removed from the Lean files (unproved and not used by any proof)

Author's decision (2026-11-10): the published Lean files contain no `sorry` and no unproved code.
Every statement that still ended in `sorry` and that no proved declaration used, directly or
indirectly, was removed from `NonForkingFrames/Frames.lean`. Before the removal, a
scan of the compiled dependency graph (all constants of the two modules) checked that none of them
was used by any other declaration. For the cited ones, a one-line `-- CITED, not used by any proof
(removed): …` comment marks the place in the Lean file. The others left no trace there.

Line numbers refer to the LaTeX source of arXiv:0901.0852v2. Quotations are the
paper's LaTeX source of the statement (active text only). Item numbers are those of the compiled
paper (one shared counter per subsection).

Reasons:
* **cited**: proved in the paper only by reference to the literature;
* **schematic**: depends on an external logic (`L_{ω₁,ω}`, fragments, `PC_{ℵ₀}`) that was
  encoded as a parameter `ExtLogic`, so the statement could not be proved;
* **outside the closure**: not in the dependency closure of the main theorems (Thm 1.0.1, 1.0.2,
  11.1.1, 11.1.7), so it was never worked on;
* **not attempted**: in the reference-based dependency map, but the actual proofs did not need it.

33 statements were removed: 4 cited, 5 schematic, 20 outside the closure, 4 not attempted.

## Section 1

| Lean name (removed) | paper | statement | reason |
|---|---|---|---|
| `prop_1_0_17` | Prop 1.0.17 (l. 700–709; proof "Easy.") | "If (1) $(K_1,\preceq_1),(K_2,\preceq_2)$ are AEC's in $\lambda$. (2) $K_1 \subseteq K_2$. (3) $\preceq_2 \restriction K_1$ is $\preceq_1$. Then $K_1^{up} \subseteq K_2^{up}$ and $(\preceq_2)^{up} \restriction K_1^{up}$ is $(\preceq_1)^{up}$." | outside the closure |

## Section 2

| Lean name (removed) | paper | statement | reason |
|---|---|---|---|
| `prop_2_2_6` | Prop 2.2.6, label `the box frame proposition` (l. 1349–1364) | "Let $\tau$ be a relational vocabulary and let $\lambda$ be a cardinal. Let $K$ be a class of $\lambda^+$ (up to isomorphism) $\tau$-models each of cardinality exactly $\lambda$. Let $E$ be a binary predicate not in $\tau$. Then $(K',\preceq')$ is an AEC and the trivial frame of it is a semi-good $\lambda$-frame which is not a good-frame. Moreover, $(K,\preceq)$ satisfies …: (1) $\lambda$-tame … (2) stable in all cardinalities greater than $\lambda$. (3) $I(\mu,K)=\mu$ for each $\mu$ with $\mu>\lambda$." | outside the closure (item (3) is false as written; NOTES.md section F) |
| `prop_2_3_4` | Prop 2.3.4, label `the main example` (l. 1501–1514) | "Let $(K,\preceq)$ be an AEC with a countable vocabulary, $LST(K,\preceq)=\aleph_0$, $(K,\preceq)$ is $PC_{\aleph_0}$, $0<I(\aleph_1,K)<2^{\aleph_1}$ and $2^{\aleph_0}<2^{\aleph_1}$. Then: (1) There is a model $M$ in $K_{\aleph_0}$ such that $(K_M)_{\aleph_1} \neq \emptyset$, (2) the finitely definable $\aleph_0$-frame of $(K_M,\prec_M)$ is a semi-good $\aleph_0$-frame." | schematic |
| `prop_2_3_5` | Prop 2.3.5, label `the main example 1` (l. 1549–1555) | Under the hypotheses of Prop 2.3.4: "there is a model $M \in K_{\aleph_0}$ such that $(K_M)_{\aleph_1} \neq \emptyset$." | schematic |
| `thm_2_3_7` | Thm 2.3.7 [Keisler], label `bls 2.4` (l. 1564–1566); source: [Ke], [BLS] Thm 2.4, [Baldwin] Thm 5.2.5 (l. 1562) | "If a $PC_\delta$ over $L_{\omega_1,\omega}$ class $K$ has an uncountable model but less than $2^{\omega_1}$ models of power $\aleph_1$ then for any countable fragment $L^*$ of $L_{\omega_1,\omega}$ every member $M$ of $K$ is $L^*$-small." | cited (also schematic) |
| `thm_2_3_8` | Thm 2.3.8, label `bls 2.7` (l. 1569–1571); source: "a translation of Theorem 2.7 from [BLS]" (l. 1567) | "If the class $K$ is $PC_{\aleph_0}$ and every model of cardinality $\aleph_1$ is $L^*$-small for every countable fragment $L^*$ of $L_{\omega_1,\omega}$ then $K$ has a $L_{\omega_1,\omega}$-small models $M'$ of cardinality $\aleph_1$." | cited (also schematic) |
| `prop_2_3_9` | Prop 2.3.9, label `lst for Lomega1,omega and aec` (l. 1579–1584) | "Let $(K,\preceq)$ be an AEC with $LST(K,\preceq)=\aleph_0$ and let $M$ be a $L_{\omega_1,\omega}$-small model of $K$ of cardinality $\aleph_1$. Then we can find a countable submodel $N$ of $M$ such that: (1) $N \in K$. (2) $N \preceq M$. (3) $N \preceq_{L_{\omega_1,\omega}} M$." | schematic |
| `prop_2_3_10` | Prop 2.3.10, label `the main example 2` (l. 1592–1599) | Under the hypotheses of Prop 2.3.4: "Let $M$ be a model in $K_{\aleph_0}$ with $(K_M)_{\aleph_1} \neq \emptyset$. Then the finitely definable $\aleph_0$-frame of $(K_M,\prec_M)$ is a semi-good $\aleph_0$-frame." | schematic |
| `lem_2_4_2` | Lemma 2.4.2, label `lemma 1` (l. 1641–1644); source: "implied by Corollary 8.6(2) on page 123 in [Rosenstein]" (l. 1636–1637) | "Let $K$ be the class of transitive linear orders. Then $I(\aleph_0,K)=\aleph_1$." | cited |
| `prop_2_4_5` | Prop 2.4.5 (l. 1808–1811) | "The AEC of transitive partial orders is an AEC which is $PC_{\aleph_0}$ and it has LST-number $\aleph_0$." | schematic |
| `rem_2_4_7` | Remark 2.4.7, label `tof remark` (l. 1831–1836), inside Example 2.4.6 | "Let $M_0,M_1,M_2 \in K_\lambda$, $M_0 \preceq M_1,M_2$ and let $a_1 \in M_1-M_0$ and $a_2 \in M_2-M_0$. Then $ga-tp(a_1,M_0,M_1)=ga-tp(a_2,M_0,M_2)$ if and only if there is an isomorphism $f:a_1E^{M_1} \to a_2E^{M_2}$ with $f(a_1)=a_2$." | outside the closure |
| `claim_2_4_8` | Claim 2.4.8 (l. 1838–1842), inside Example 2.4.6 | "$(K,\preceq,S^{bs},\dnf)$ is a semi-good $\aleph_0$-frame." | outside the closure |
| `prop_2_5_2` | Prop 2.5.2, label `2.3` (l. 1973–1976) | "Assume that $p_0,p_1$ are conjugate and the types $p_1,p_2$ are conjugate. Then the types $p_0,p_2$ are conjugate." | outside the closure |
| `rem_2_5_4` | Remark 2.5.4 (l. 2062–2065) | "The definition of $f(p)$ in Definition [f(p)] does not depend on the representative $(M,N,a) \in p$." | outside the closure |
| `prop_2_5_6` | Prop 2.5.6, the transitivity proposition, labels `2.7`, `s is transitive`, `transitivity` (l. 2182–2191); source: "By Claim 2.18 in [Sh:h].II" (l. 2181) | "Suppose $\frak{s}$ is a semi-good $\lambda$-frame. Then: If $M_0 \preceq M_1 \preceq M_2,\ p \in S^{bs}(M_2)$ does not fork over $M_1$ and $p\restriction M_1$ does not fork over $M_0$, then $p$ does not fork over $M_0$." | cited |
| `thm_2_5_8_1` | Thm 2.5.8(1), label `4.0` (l. 2262–2291) | Under "conditions 1 and 2 of a semi-good $\lambda$-frame": if $\langle M_\alpha:\alpha \leq \lambda^+ \rangle$ is increasing continuous in $K_\lambda$ and there is a stationary $S \subseteq \lambda^+$ such that for every $\alpha \in S$ and every $N$ with $M_\alpha \prec N$ some $p \in S^{bs}(M_\alpha)$ is realized in $M_{\lambda^+}$ and in $N$, "Then $M_{\lambda^+}$ is full over $M_0$ and is saturated in $\lambda^+$ over $\lambda$." | not attempted (Thm 2.5.8(2) was proved directly) |
| `thm_2_5_8_3` | Thm 2.5.8(3), label `4.0` (l. 2262–2291) | "There is a model in $K_{\lambda^+}$ which is saturated in $\lambda^+$ over $\lambda$." | not attempted (the proofs construct saturated models directly) |
| `thm_2_5_8_4` | Thm 2.5.8(4), label `4.0` (l. 2262–2291) | "$M \in K_\lambda \Rightarrow |S(M)| \leq \lambda^+$" | not attempted |

## Section 3

| Lean name (removed) | paper | statement | reason |
|---|---|---|---|
| `rem_3_1_4` | Remark 3.1.4 (l. 2905–2908) | "$(K^{3,bs},\preceq_{bs}^{disjoint})$ is an AEC in $\lambda$ (for the vocabulary of triples)." | outside the closure |
| `prop_3_1_6` | Prop 3.1.6, label `3.2` (l. 2929–2933) | "$(K^{3,bs},\preceq_{bs})$ satisfies the axioms of AEC in $\lambda$ except one: the relation $\preceq_{bs}$ should not be included in the submodel relation." | not attempted (the construction of Prop 3.1.8 was done without it) |
| `prop_3_1_7` | Prop 3.1.7 (l. 2989–2991) | "$K^{3,bs}$ has no $\preceq_{bs}$-maximal model." | outside the closure |
| `rem_3_3_3` | Remark 3.3.3, label `reduced is AEC` (l. 3424–3426) | "$(K^{3,r},\subseteq)$ is an AEC in $\lambda$." | outside the closure |

## Section 4

| Lean name (removed) | paper | statement | reason |
|---|---|---|---|
| `prop_4_1_7` | Prop 4.1.7, label `uniqueness implies domination` (l. 3662–3665) | "If $(M,N,a)$ is a uniqueness triple, then $a$ dominates $N$ over $M$." | outside the closure |
| `prop_4_1_8` | Prop 4.1.8 (l. 3673–3680) | "$(M,N,a) \in K^{3,uq}$ iff the following holds: If for $n=1,2$ $(M,N,a) \preceq_{bs} (M^*_n,N^*_n,a)$ and $f:M^*_1 \to M^*_2$ is an isomorphism over $M \bigcup \{a\}$, then for some $f_1,f_2,N^*$ … $f_n:N^*_n \to N^*$ is an embedding over $N$, and $f_1\restriction M^*_1=f_2\restriction M^*_2 \circ f$." (typo "over $M \cup \{a\}$" fixed to "over $M$", NOTES.md section D) | outside the closure |
| `prop_4_1_10` | Prop 4.1.10, label `the importance of proposition 4.2(2)` (l. 3846–3848) | "If for every $M,N \in K_\lambda$ with $M \preceq N$ and for every $a \in N-M$, the type $tp(a,M,N)$ is basic then every uniqueness triple is reduced." | outside the closure |
| `prop_4_1_11_1` | Prop 4.1.11(1), label `4.2` (l. 3855–3863) | "If $p_0,p_1$ are conjugate types and in $p_0$ there is a uniqueness triple, then also in $p_1$ there is such a triple." | outside the closure |
| `prop_4_1_11_2` | Prop 4.1.11(2), label `4.2` (l. 3855–3863) | "If $\frak{s}$ satisfies the conjugation property, then every uniqueness triple is reduced." | outside the closure |

## Section 5

| Lean name (removed) | paper | statement | reason |
|---|---|---|---|
| `prop_5_2_4` | Prop 5.2.4, label `remark about uniqueness` (l. 4415–4426) | "Suppose (1) $\bigotimes_{R}$. (2) $R(M_0,M_1,M_2,M_3)$ and $R(M_0,M_1^*,M_2^*,M_3^*)$. (3) For $n=1,2$ there is an isomorphism $f_n:M_n \to M_n^*$ over $M_0$. Then there are $M,f$ such that: (1) For $n<3$ $f\restriction M_n=f_n$. (2) $M_3^* \preceq M$. (3) $f[M_3] \preceq M$." | outside the closure |
| `prop_5_2_5_1` | Prop 5.2.5(1), label `explanation to definition 5.1` (l. 4445–4465) | For $R$ satisfying clauses a, c, d of Def 5.2.1 and $D$ the set of triples $M_0 \preceq M_1, M_2$ in $K_\lambda$: "There is a function $G$ with domain $D$ which assigns to each triple $(M_0,M_1,M_2)$ an amalgamation $(f_1,f_2,M_3)$ of $M_1,M_2$ over $M_0$, such that $R(M_0,f_1[M_1],f_2[M_2],M_3)$." | outside the closure |
| `prop_5_2_5_2` | Prop 5.2.5(2) (l. 4445–4465) | "If $G_1,G_2$ are two functions as in item 1 (with respect to $R$), then for every $(M_0,M_1,M_2) \in D$, $G_1((M_0,M_1,M_2))E_{M_0}G_2((M_0,M_1,M_2))$." | outside the closure |
| `prop_5_2_5_3` | Prop 5.2.5(3) (l. 4445–4465) | "If $G$ is a function with domain $D$ which assigns to each triple $(M_0,M_1,M_2)$ a disjoint amalgamation, then the relation $R:=\{(M_0,M_1,M_2,M_3):M_1 \bigcap M_2=M_0,\ G((M_0,M_1,M_2))E_{M_0}(id_{M_1},id_{M_2},M_3)\}$ satisfies clauses a,c,d of Definition [5.1]." | outside the closure |
| `prop_5_3_4` | Prop 5.3.4, label `NF respects E` (l. 4558–4564) | "Suppose for $x=a,b$ $(f_{x,1},f_{x,2},M_{x,3})$ is an amalgamation of $M_1,M_2$ over $M_0$. If $(f_{a,1},f_{a,2},M_{a,3})E_{M_0}(f_{b,1},f_{b,2},M_{b,3})$, then $NF(M_0,f_{a,1}[M_1],f_{a,2}[M_2],M_{a,3}) \Leftrightarrow NF(M_0,f_{b,1}[M_1],f_{b,2}[M_2],M_{b,3})$" | outside the closure |
| `thm_5_5_4` | Thm 5.5.4, label `5.13` (l. 5462–5465) | "$NF=NF_\lambda$ is the unique relation which satisfies $\bigotimes_{NF}$ and respects $\frak{s}$." | outside the closure |

## Definitions kept although no remaining statement uses them

The removal deleted statements only. Definitions that served only the removed statements stayed in
the Lean files, because they are definitions, not unproved code: for example `ExtLogic`, `Hyp23`,
`IsSmall`, `KMSys`, `finDefFrame` (Section 2.3) and the orders of Section 2.4. They can be removed
too if the author wishes.

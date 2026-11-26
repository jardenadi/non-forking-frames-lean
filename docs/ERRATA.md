# Errata and remarks: Jarden–Shelah, "Non-forking frames in abstract elementary classes"

These notes list the corrections found while checking every definition and proof of the paper in
full detail (a complete machine-checked formalization). Item numbers are those of the compiled
paper: one counter shared by all theorem-like environments in each subsection, so that, e.g.,
Definition 1.0.22 is the 22nd item of Section 1, which has no subsections. Line numbers refer to
the LaTeX source of arXiv:0901.0852v2. Only the active text is considered: material inside
`\begin{comment} … \end{comment}` and after `%` is ignored.

**Source.** This formalization follows the arXiv version of the paper: A. Jarden and S. Shelah,
"Good Frames With A Weak Stability", arXiv:0901.0852v2. Published version: A. Jarden and
S. Shelah, "Non-forking frames in abstract elementary classes", Ann. Pure Appl. Logic 164 (2013),
no. 3, 135–191. The two versions may differ; the differences were not checked.

Quotations keep the paper's notation. ⨿ denotes the paper's non-forking relation (the macro
`\dnf`), and $\mathfrak{s}$ is a frame.

The notes have four parts:

* **A. Errata.** The statement is false or incomplete as written. A.1 lists errors of substance and
  A.2 misprints whose intended reading is evident.
* **B. Gaps in proofs.** The statement is right (in the form given), but the argument in the paper
  does not give it as written. Each item also describes how the gap was closed.
* **C. Implicit assumptions made explicit.** Hypotheses that the paper takes for granted but
  does not state, and without which the statement fails. The last item, C.9, is different: a
  restriction of the formalized statement that the paper does not need.
* **D. Remarks on the formalization (not errata of the paper).** Remarks on the formalization
  itself, not on the paper. D.1 records an encoding device that is not in the paper (the ambient
  set $U$) as an example of the difficulty of checking fidelity; it is not a mathematical
  fidelity problem.

Several errata below are hypotheses that the author regarded as obvious and did not write.

Items marked *confirmed by the author* or *approved by the author* have been checked by the
author. Unmarked items are findings of the formalization, recorded in the working notes for the
author's review. Items whose status or wording is still open are collected at the end, under
**To be confirmed by the author**.

**Status of confirmation.** Every entry of parts A and C has a field *Status of confirmation*
(introduced 2026-11-16, at the author's request) with exactly one of three values:

* *confirmed by the author and checked against sources*;
* *confirmed by the author from his own understanding, not checked against other sources*;
* *not confirmed*.

For entries recorded before 2026-11-16 the value was not guessed. An entry marked *confirmed* or
*approved by the author* gets the second value only if the working notes say that the confirmation
was made from memory or by reasoning; otherwise the field reads *to be filled in by the author*,
and the entry is listed in the table at the end of this file.

---

## A. Errata

### A.1 Errors of substance

#### A.1.1 Definition 1.0.22(1): the relation $E^*$ (*confirmed by the author*)

* **Place.** Definition 1.0.22(1), l. 785–789.
* **Original.** "$E^*_{K,\preceq}$ is the following relation on $K^3_{K,\preceq}$:
  $(M_0,N_0,a_0)E^*(M_1,N_1,a_1)$ iff $M_1=M_0$ and for some $N_2 \in K_\lambda$ with
  $N_1 \preceq N_2$ there is an embedding $f:N_0 \to N_2$ over $M_0$ with $f(a_0)=a_1$."
* **Should read.** "… for some $N_2 \in K$ with $N_1 \preceq N_2$ …"
* **Reason.** $E^*$ is a relation on all triples of $K^3$, whose models may be of any
  cardinality. If $\|N_0\| > \lambda$, then no $N_2 \in K_\lambda$ extends $N_0$, so
  $(M_0,N_0,a_0)$ is not $E^*$-related even to itself. Then $E^*$ is not reflexive, contrary to
  Proposition 1.0.23(2). With $N_2 \in K$ nothing changes for triples in $K^3_\lambda$ when
  $LST \le \lambda$.
* **Status of confirmation.** To be filled in by the author.

#### A.1.2 Definition 2.6.1, clause (3): non-forking for big models (*confirmed by the author*)

* **Place.** Definition 2.6.1(3), l. 2440–2443.
* **Original.** "For some model $N_0 \in K_\lambda$ with $N_0 \preceq M_0$ for each model
  $N \in K_\lambda$, $N_0 \bigcup \{a\} \subseteq N \preceq M_1 \Rightarrow ⨿(N_0,a,N,M_2)$."
* **Should read.** For some $N_0 \in K_\lambda$ with $N_0 \preceq M_0$: for every
  $N \in K_\lambda$ with $N_0 \subseteq N \preceq M_1$ and every $N' \in K_\lambda$ with
  $N \cup \{a\} \subseteq N' \preceq M_2$, we have $⨿(N_0, N, a, N')$. The arguments of ⨿ are in
  the order of Definition 2.1.1.
* **Reason.** By clause (2), $a \in M_2 - M_1$. So no $N \preceq M_1$ contains $a$, the premise
  "$N_0 \cup \{a\} \subseteq N \preceq M_1$" never holds, and clause (3) is true of every
  quadruple. As written, the definition puts no restriction on non-forking at all. The corrected
  clause places $a$ in a model $N'$ between $N$ and $M_2$, where it can be.
* **Status of confirmation.** To be filled in by the author.

#### A.1.3 Conjecture 11.1.4: the cardinal in the saturation hypothesis (*confirmed by the author*)

* **Place.** Conjecture 11.1.4, l. 7972–7973.
* **Original.** "… and $WDmId(\lambda^+)$ is not saturated in $\lambda^+$."
* **Should read.** "… and $WDmId(\lambda^+)$ is not saturated in $\lambda^{+2}$."
* **Reason.** Everywhere else the paper uses this hypothesis in the form "$WDmId(\mu)$ is not
  saturated in $\mu^+$". Examples are Theorem 11.1.5(3), which applies the conjecture with
  "$WDmId(\lambda^+)$ is not saturated in $\lambda^{+2}$", and Corollary 11.1.6 and
  Theorem 11.1.7, with "$WDmId(\lambda^{+1+m})$ is not saturated in $\lambda^{+(2+m)}$". The
  author checked the source: $\lambda^+$ in the conjecture is a slip for $\lambda^{+2}$.
* **Status of confirmation.** To be filled in by the author. (The notes say that the author
  "checked the source", without naming it; the value is left to the author.)

#### A.1.4 Theorem 5.3.7(c): the existence theorem for $NF$ (*confirmed by the author*)

* **Place.** Theorem 5.3.7(c), l. 4621–4625.
* **Original.** "If $N_1$ is decomposable over $N_0$ by $K^{3,uq}$ and $a \in N_1-N_0$, then for
  some $N_3 \in K_\lambda$, $NF^{*}(N_0,N_1,N_2,N_3)$. Moreover, we can choose $a$ as the first
  element in the first witness for $NF^{*}$."
* **Should read.** (Under the standing hypotheses of the theorem: $N_0 \preceq N_n$ for $n=1,2$
  and $N_1 \cap N_2 = N_0$.) If $a \in N_1 - N_0$ and $tp(a,N_0,N_1)$ is basic, then there are
  $N_3 \in K_\lambda$ and $N_1^* \in K_\lambda$ with $N_1 \preceq N_1^*$ such that
  $NF^*(N_0,N_1^*,N_2,N_3)$ and $a$ is the first element in the first witness.
* **Reason.** The first element $d_0$ of a first witness satisfies
  $(N_{1,0},N_{1,1},d_0) \in K^{3,uq}$ (Definition 5.3.1(e)), so its type over $N_0$ is basic.
  Hence $a$ can come first only if $tp(a,N_0,N_1)$ is basic, and decomposability of $N_1$ does
  not give this for an arbitrary $a \in N_1 - N_0$. The paper's proof (through
  Theorem 3.2.3(3)) produces a decomposition beginning with $a$ only of some extension $N_1^*$ of
  $N_1$, not of $N_1$ itself. The only application, in the proof of Theorem 5.4.10, needs no more:
  $NF^*(N_0,N_1^*,N_2,N_3)$ with $N_1 \preceq N_1^*$ gives $NF(N_0,N_1,N_2,N_3)$ by
  Definition 5.3.2.
* **Status of confirmation.** To be filled in by the author.

#### A.1.5 Proposition 3.2.5: transitivity of decomposable extensions (*confirmed by the author*)

* **Place.** Proposition 3.2.5, l. 3394–3397.
* **Original.** "Let $\langle M_\epsilon:\epsilon \leq \alpha^* \rangle$ be an increasing
  continuous sequence of models, such that for every $\epsilon<\alpha^*,\ M_{\epsilon+1}$ is
  decomposable over $M_\epsilon$. Then $M_{\alpha^*}$ is decomposable over $M_0$."
* **Should read.** Add the hypotheses $\alpha^* < \lambda^+$ and $M_0 \in K_\lambda$.
* **Reason.** "Decomposable over" is defined only for models in $K_\lambda$ (Definition 3.2.2,
  l. 3270–3277: "Let $M^* \in K_\lambda$ …", with $\alpha^* < \lambda^+$ and all
  $N_\epsilon \in K_\lambda$). If $\alpha^* \ge \lambda^+$, the union $M_{\alpha^*}$ can have
  cardinality $\lambda^+$, for instance when every step is proper, and then it is not decomposable
  over anything. If $\alpha^* = 0$, the hypothesis is empty and the conclusion "$M_0$ is
  decomposable over $M_0$" requires $M_0 \in K_\lambda$. The only use (proof of
  Proposition 3.2.4) has $\alpha^* = \omega$ and $M_0 \in K_\lambda$.
* **Status of confirmation.** To be filled in by the author.

#### A.1.6 Proposition 5.3.8: long transitivity for $NF^*$ (*confirmed by the author*)

* **Place.** Proposition 5.3.8, l. 4656–4662.
* **Original.** "For $x=a,b$ let $\langle M_{x,\alpha}:\alpha \leq \alpha^{*} \rangle$ be an
  increasing continuous sequence of models. Suppose $\alpha<\alpha^{*} \Rightarrow
  NF^{*}(M_{a,\alpha},M_{a,\alpha+1}, M_{b,\alpha},M_{b,\alpha+1})$. Then
  $NF^*(M_{a,0},M_{a,\alpha^{*}},M_{b,0},M_{b,\alpha^{*}})$."
* **Should read.** Add the hypotheses $\alpha^* < \lambda^+$ and $M_{a,0}, M_{b,0} \in K_\lambda$,
  and also $\alpha^* \neq 0$ (see C.1).
* **Reason.** $NF^*$ is a relation on quadruples from $K_\lambda$ (Definition 5.3.1, l. 4511), so
  the conclusion requires $M_{a,\alpha^*}, M_{b,\alpha^*} \in K_\lambda$. For
  $\alpha^* \ge \lambda^+$ these unions can have cardinality $\lambda^+$. For $\alpha^* = 0$ the
  hypothesis is empty, and the conclusion $NF^*(M_{a,0},M_{a,0},M_{b,0},M_{b,0})$ needs
  $M_{a,0}, M_{b,0} \in K_\lambda$ and $M_{a,0} \preceq M_{b,0}$, none of which is assumed. For
  $\alpha^* > 0$ the inequality $M_{a,0} \preceq M_{b,0}$ follows from the first step. The uses
  (Proposition 5.3.9(3) and Theorems 5.4.7 and 5.5.1) satisfy the added hypotheses.
* **Status of confirmation.** To be filled in by the author.

#### A.1.7 Definition 5.4.2 and Proposition 5.4.3: $NF^{uq}$ and $\bigotimes^-$ (*confirmed by the author*)

* **Place.** Definition 5.4.2, l. 4887–4889; Proposition 5.4.3, l. 4895–4896.
* **Original.** Definition 5.4.2: "$NF^{uq}:=\{(M_0,M_1,M_2,M_3)$: there is $a \in M_1-M_0$ such
  that $(M_0,M_1,a) \in K^{3,uq}$ and $tp(a,M_2,M_3)$ does not fork over $M_0$\}."
  Proposition 5.4.3: "(1) $\bigotimes^-_{NF^{uq}}$. (2) For every relation $R$,
  $\bigotimes_{R} \Rightarrow \bigotimes^-_{R}$."
* **Should read.**
  * In $NF^{uq}$ the element $a$ is part of the data, and the relation includes the conditions of
    Definition 5.4.1(1): $M_0 \preceq M_n \preceq M_3$ for $n = 1,2$, all models in $K_\lambda$.
  * (1) holds for this relation when weak uniqueness (Definition 5.4.1(2)) compares
    amalgamations that move the same element $a$ of $N_1$.
  * (2) holds for every relation $R$ that is closed under isomorphisms.
* **Reason.** Weak uniqueness for $NF^{uq}$ comes from the uniqueness triple
  $(M_0, M_1, a)$. If the element is quantified existentially, two amalgamations of $N_1, N_2$
  over $N_0$ may witness $NF^{uq}$ through different elements of $N_1$, and nothing then identifies
  them. Definition 5.4.2 also omits $M_0 \preceq M_n \preceq M_3$, which clause (1) of
  $\bigotimes^-$ demands.
* **Proposition 5.4.3(2).** The statement needs $R$ to be closed under isomorphisms. It is used twice in the formalized proof. In weak uniqueness (clause (2) of $\bigotimes^-$), the second amalgamation is moved by an isomorphism onto the same copies of $N_1$ and $N_2$ as the first, so that the weak uniqueness of $\bigotimes_R$, which compares amalgamations of the same two models, applies. In clause (3) of $\bigotimes^-$, the relation $R$ is carried along the isomorphic copy of $M_3$ that realizes the embedding $f$. The paper does not state this hypothesis. *Author-confirmed: the omission is the author's.*
* **Status of confirmation.** To be filled in by the author (for the whole entry, including
  Proposition 5.4.3(2)).

#### A.1.8 Definition 7.1.4: the relation $\prec^+_{\lambda^+}$ (*confirmed by the author*)

* **Place.** Definition 7.1.4, l. 5965–5970 (with clauses (b)–(d), l. 5973–5981).
* **Original.** "… if there are increasing continuous sequences of models in $K_\lambda$,
  $\langle N_{0,\alpha}:\alpha<\lambda^+ \rangle$, $\langle N_{1,\alpha}:\alpha<\lambda^+ \rangle$,
  $\langle N^{\oplus}_{1,\alpha}:\alpha<\lambda^+ \rangle$, and there is a club $E$ of $\lambda^+$
  such that: …"
* **Should read.** $\langle N_{0,\alpha}\rangle$ and $\langle N_{1,\alpha}\rangle$ are increasing
  continuous. $\langle N^{\oplus}_{1,\alpha}\rangle$ is only increasing (in $K_\lambda$).
* **Reason.** As written, the definition can never hold. Let $\delta \in E$ be a limit point of
  $E$. By (b) and (c), $N_{1,\alpha} \preceq N^{\oplus}_{1,\alpha} \preceq N_{1,\beta}$ for
  $\alpha < \beta$ in $E$. So continuity of both sequences at $\delta$ gives
  $N_{1,\delta} = N^{\oplus}_{1,\delta}$. But (d) requires $N^{\oplus}_{1,\delta}$ to realize
  non-algebraic types over $N_{1,\delta}$. The author confirmed that continuity was intended only
  for the first two sequences.
* **Status of confirmation.** To be filled in by the author.

#### A.1.9 Definition 7.1.11: the $\prec^+_{\lambda^+}$-game (*approved by the author*)

* **Place.** Definition 7.1.11, l. 6203–6208 (the move of player 0) and l. 6217–6219 (winning).
* **Original.** "The $\alpha+1$ move: Player 0 chooses a model $N_{0,\alpha+1}$ such that …
  (1) $N_{0,\alpha} \preceq N_{0,\alpha+1}$. (2) $N_{0,\alpha+1} \bigcap N_{1,\alpha}=N_{0,\alpha}$."
  and "At the end of the game, player 2 wins the game if
  $\bigcup \{N_{0,\alpha}:\alpha<\lambda^+\}\prec^+_{\lambda^+} \bigcup \{N_{1,\alpha}:\alpha<\lambda^+ \}$."
* **Should read.**
  * Player 0 must play a proper extension, $N_{0,\alpha} \prec N_{0,\alpha+1}$ (with (2)
    unchanged).
  * Player 1 wins if, whenever $\bigcup_\alpha N_{0,\alpha} \in K_{\lambda^+}$, it stands in the
    relation $\prec^+_{\lambda^+}$ to $\bigcup_\alpha N_{1,\alpha}$.
  * The rules for player 1 at each move ($N_{1,\alpha} \preceq N_{1,\alpha+1}$ and
    $NF(N_{0,\alpha},N_{1,\alpha},N_{0,\alpha+1},N_{1,\alpha+1})$) are part of what a winning
    strategy must guarantee, for every partial play of the game.
* **Reason.** Under the original rule, player 0 may keep $N_{0,\alpha}$ constant. Then
  $\bigcup_\alpha N_{0,\alpha} \in K_\lambda$, while $\prec^+_{\lambda^+}$ is a relation on
  $K_{\lambda^+}$ (Definition 7.1.4), so player 1 can never win and Proposition 7.1.12(c) fails.
  The paper derives Proposition 7.1.12(a),(b) from plays in which the $N_{0,\alpha}$ represent a
  given model of cardinality $\lambda^+$, and strict moves of player 0 still allow this. The
  strictness of player 0's moves and the condition $\bigcup_\alpha N_{0,\alpha} \in K_{\lambda^+}$
  are not in the paper's text. They are the author's decision.
* **Status of confirmation.** To be filled in by the author.

#### A.1.10 Proposition 8.1.3(a) and (b) (*confirmed by the author*: (a) 2026-11-10, (b) 2026-11-13)

* **Place.** Proposition 8.1.3(a), l. 6766–6767; Proposition 8.1.3(b), l. 6767–6772.
* **Original.** (a): "If $M_0 \in K^{sat}$ and $M_0 \preceq^{NF}_{\lambda^+} M_1$, then
  $M_0 \preceq^{\otimes}_{\lambda^+} M_1$." (b): "If $\langle M_\epsilon:\epsilon \leq \delta \rangle$
  is a $\preceq^{NF}_{\lambda^+}$-increasing continuous sequence of models in $K^{sat}$ and for
  every $\epsilon \in \delta,\ M_\epsilon \preceq^{NF}_{\lambda^+}M_{\delta+1}$, then
  $M_\delta \preceq^{\otimes}_{\lambda^+} M_{\delta+1}$."
* **Should read.**
  * (a): "If $M_0, M_1 \in K^{sat}$, $M_0 \neq M_1$ and $M_0 \preceq^{NF}_{\lambda^+} M_1$, then
    $M_0 \preceq^{\otimes}_{\lambda^+} M_1$."
  * (b): add the hypotheses $M_{\delta+1} \in K^{sat}$ and $M_\delta \neq M_{\delta+1}$.
* **Reason.**
  * By Definition 8.1.2 (l. 6755–6760), $M_0 \preceq^{\otimes}_{\lambda^+} M_1$ requires
    $M_0, M_1 \in K^{sat}$ and $M_0 \prec M_1$, in addition to a realization condition.
  * In (a), neither $M_1 \in K^{sat}$ nor $M_0 \neq M_1$ follows from
    $M_0 \preceq^{NF}_{\lambda^+} M_1$. For instance, with $M_1 = M_0$ the hypotheses hold, since
    $\preceq^{NF}_{\lambda^+}$ is reflexive on $K^{sat}$, but $M_0 \prec M_0$ is false.
  * (b) has the same omission. "In $K^{sat}$" covers only $\epsilon \le \delta$, and with
    $M_{\delta+1} := M_\delta$ all hypotheses hold while $M_\delta \prec M_\delta$ fails.
  * The paper's proof (l. 6778 ff.) establishes only the realization condition.
  * The only use of (b) (Theorem 9.1.13, a ⇒ b) satisfies both added hypotheses. (a) is not used.
* **Status of confirmation.** To be filled in by the author (for (a) and (b)).

#### A.1.11 Definition 2.6.5: weak local character for $\prec^*_\lambda$-increasing sequences (*confirmed by the author*, 2026-11-16)

* **Place.** Definition 2.6.5, l. 2507–2516. It is used through clause (4) of Definition 2.6.6
  (weak local character), l. 2518–2532, and in the proof of Theorem 2.6.8(1), Case 2,
  l. 2607–2638.
* **Original.** "Let $\frak{s}$ be a semi-good $\lambda$-frame except local character.
  $\frak{s}$ is said to satisfy *weak local character for $\prec^*_\lambda$-increasing sequences*
  when: If $\alpha^*< \lambda^+$ and $\langle M_\alpha:\alpha \leq \alpha^*+1 \rangle$ is an
  $\prec^*_\lambda-$increasing continuous sequence of models, then for some element
  $a \in M_{\alpha^*+1}-M_{\alpha^*}$ and ordinal $\alpha<\alpha^*$,
  $tp(a,M_{\alpha^*},M_{\alpha^*+1})$ does not fork over $M_\alpha$." (l. 2507–2516)
* **Should read.** The author's statement: the definition should not require $\prec^*$ for the
  last pair of the chain; for the last pair it requires only $M_{\alpha^*} \prec M_{\alpha^*+1}$.
  That is: "If $\alpha^* < \lambda^+$, $\langle M_\alpha:\alpha \leq \alpha^* \rangle$ is a
  $\prec^*_\lambda$-increasing continuous sequence of models, and
  $M_{\alpha^*} \prec M_{\alpha^*+1}$ with $M_{\alpha^*+1} \in K_\lambda$, then for some element
  $a \in M_{\alpha^*+1}-M_{\alpha^*}$ and ordinal $\alpha<\alpha^*$,
  $tp(a,M_{\alpha^*},M_{\alpha^*+1})$ does not fork over $M_\alpha$." (The clause
  $M_{\alpha^*+1} \in K_\lambda$ is kept from the original: there it follows from
  $M_{\alpha^*} \prec^*_\lambda M_{\alpha^*+1}$, since $\prec^*_\lambda$ is a relation on
  $K_\lambda$ by Definition 2.6.6(1). This wording of the corrected statement is the
  formalization's and is for the author to check.)
* **Reason.** The proof of Theorem 2.6.8(1), Case 2, applies the definition (as clause (4) of
  Definition 2.6.6) with $\alpha^* = \omega$ to
  $\langle M_n : n \le \omega\rangle^\frown\langle N_\omega\rangle$. Clause (b) of its
  construction makes $\langle M_n : n \le \omega\rangle$ $\prec^*_\lambda$-increasing, and for
  the last pair the proof shows $M_\omega \preceq N_\omega$ ("by smoothness", l. 2633–2634) with
  $M_\omega \neq N_\omega$, but not $M_\omega \prec^*_\lambda N_\omega$. As written, the
  definition demands $M_\omega \prec^*_\lambda N_\omega$, and nothing in Definition 2.6.6 provides
  it. With the corrected definition the last pair needs only $M_\omega \prec N_\omega$, and the
  paper's proof of Theorem 2.6.8(1), Case 2, is complete: the gap formerly recorded as B.9 is a
  consequence of the erroneous definition and is closed by correcting it. (Reclassified on
  2026-11-16 by the author from a gap in the proof, class B, to an erratum in the definition,
  class A.)
* **The formalization.** It has not yet been changed to follow this correction: it still encodes
  Definition 2.6.5 as originally written, and states Theorem 2.6.8(1) under (full) local character
  instead of weak local character.
* **Status of confirmation.** Confirmed by the author from his own understanding, not checked
  against other sources. In the author's words: "Confirmed by the author on the basis of his own
  understanding of what the definition should say. NOT checked against other papers related to
  this one. In particular, the same definition appears in the author's formalization of the
  (unpublished) joint paper with Shelah, where this point is essential; it must be checked there."

#### A.1.12 Theorem 9.1.13(c): continuity omitted (*confirmed by the author*, 2026-11-16)

* **Place.** Theorem 9.1.13(c), l. 7485–7490; proof, l. 7493–7495.
* **Original.** "There is a sequence $\langle M_\epsilon:\epsilon \leq \lambda^++1 \rangle$ of
  models in $K^{sat}$ such that for each $\epsilon,\zeta$ with $\epsilon<\zeta \leq \lambda^++1$,
  we have $\epsilon \neq \lambda^+ \Leftrightarrow M_\epsilon \prec^+_{\lambda^+}M_\zeta
  \Leftrightarrow M_\epsilon \preceq^{NF}_{\lambda^+} M_\zeta$."
* **Should read.** "There is an increasing continuous sequence
  $\langle M_\epsilon:\epsilon \leq \lambda^++1 \rangle$ of models in $K^{sat}$ such that for
  each $\epsilon,\zeta$ with $\epsilon<\zeta \leq \lambda^++1$, we have $\epsilon \neq \lambda^+
  \Leftrightarrow M_\epsilon \prec^+_{\lambda^+}M_\zeta \Leftrightarrow M_\epsilon
  \preceq^{NF}_{\lambda^+} M_\zeta$." Only "increasing continuous" is added; the rest of (c),
  including the equivalences for all pairs $\epsilon < \zeta$, is kept as is.
* **Reason.** The proof's "$c \Rightarrow a$ is clear" needs continuity: without it the sequence
  says nothing about smoothness at $\lambda^+$. Proposition 8.1.6, through which b ⇒ c is proved,
  produces an increasing continuous sequence, and Theorem 9.1.7 assumes one. In the analogous
  statements of Shelah [Sh:600], Claim 8.4 (hypothesis (*), p. 125) and Claim 8.5 ((***),
  p. 126), the sequence is explicitly increasing continuous, in $K^{nice}_{\lambda^+}$, with
  $M_i <^+ M_j$ for all $i<j\le\lambda^++1$ except $(i,j)=(\lambda^+,\lambda^++1)$, and
  $\neg(M_{\lambda^+} \le^* M_{\lambda^++1})$.
* **Not settled by this erratum.** The proof of b ⇒ c gives $M_\epsilon \prec^+_{\lambda^+}
  M_\zeta$ only for $\zeta = \epsilon+1$; the other pairs (in particular limit $\zeta$) are open.
  See item 2 of "To be confirmed by the author". *(2026-11-25: recorded as the gap B.10.)*
* **The formalization.** It includes continuity, but its statement of (c) is weaker than the
  corrected text: it asserts $\prec^+_{\lambda^+}$ only between consecutive models. This is a
  difference between the formalization and the paper, not a reading of the paper. The Lean
  statement has not been changed (see B.10).
* **Status of confirmation.** Confirmed by the author, and cross-checked against
  [Sh:600, Claims 8.4–8.5], where continuity appears explicitly. Caveat: Sh:600 works with
  $K^{nice}$ and $\le^*$, $<^+$ rather than $K^{sat}$ and $\preceq^{NF}$; the correspondence is not
  checked in detail. In Sh:600 the limit-$\zeta$ case of $<^+$ is a hypothesis (*), not derived.
  (Of the three values: *confirmed by the author and checked against sources*, with this caveat.)

### A.2 Misprints (*confirmed by the author*)

#### A.2.1 Proposition 4.1.8

* **Place.** Proposition 4.1.8, l. 3675–3676.
* **Original.** "… and $f:M^*_1 \to M^*_2$ is an isomorphism over $M \bigcup \{a\}$ …"
* **Should read.** "… is an isomorphism over $M$ …"
* **Reason.** Here $(M,N,a) \preceq_{bs} (M^*_n,N^*_n,a)$, so $a \in N^*_n - M^*_n$, and in
  particular $a \notin M^*_1$. An isomorphism with domain $M^*_1$ cannot be "over $a$".
* **Status of confirmation.** To be filled in by the author.

#### A.2.2 Proposition 5.3.9(2)

* **Place.** Proposition 5.3.9, item (2) of the active text, l. 4688–4690.
* **Original.** "If $NF(M_0,M_1,M_2,M_3)$, then we can find $N_1,N_3$ such that
  $NF^*(M_1,N_1,M_2,N_3)$ …"
* **Should read.** "… $NF^*(M_0,N_1,M_2,N_3)$ …"
* **Reason.** The base of the conclusion must be the base $M_0$ of the hypothesis. With base
  $M_1$, the relation $NF^*$ would require $M_1 \preceq M_2$, which is not given. Definition 5.3.2
  defines $NF$ from $NF^*$ over the same base $M_0$.
* **Status of confirmation.** To be filled in by the author.

#### A.2.3 Proposition 5.4.4

* **Place.** Proposition 5.4.4, conclusion, l. 4926–4927.
* **Original.** "Then $(f^a_{\alpha^*},id_{N^a_{2,0}},N^a_{2,\alpha^*})E_{N_{1,0}}
  (f^a_{\alpha^*},id_{N^a_{2,0}},N^b_{2,\alpha^*})$."
* **Should read.** The second triple is $(f^b_{\alpha^*},id_{N^a_{2,0}},N^b_{2,\alpha^*})$.
* **Reason.** $f^a_{\alpha^*}$ is an embedding into $N^a_{2,\alpha^*}$, not into
  $N^b_{2,\alpha^*}$, so the second triple as written need not be an amalgamation. The
  proposition compares the two amalgamations built along the $a$-side and the $b$-side, with
  $f^b_{\alpha^*}:N_{1,\alpha^*} \to N^b_{2,\alpha^*}$ on the $b$-side.
* **Status of confirmation.** To be filled in by the author.

#### A.2.4 Proposition 9.1.5

* **Place.** Proposition 9.1.5(1), l. 7237–7239.
* **Original.** "The sequences $\bar{M}^1:=\langle M_{\alpha,1}:\alpha<\lambda^{+2} \rangle,\
  \bar{M}^2:=\langle M_{\alpha,1}:\alpha<\lambda^{+2} \rangle$ are …"
* **Should read.** "$\bar{M}^2:=\langle M_{\alpha,2}:\alpha<\lambda^{+2} \rangle$", and
  hypothesis (1) applies to both sequences.
* **Reason.** As written, the two sequences coincide, while hypothesis (2) defines
  $M_2 = \bigcup_\alpha M_{\alpha,2}$. The proposition compares two different representations.
* **Status of confirmation.** To be filled in by the author.

#### A.2.5 Theorem 11.1.5(1)

* **Place.** Theorem 11.1.5, conclusion (1), l. 8054–8056.
* **Original.** "There is a good $\lambda^+$-frame
  $\mathfrak{s}^+=(K^{sat},\preceq^{NF}_{\lambda^+}\restriction K^{sat},S^{bs,+},⨿^+)$ …"
* **Should read.**
  $\mathfrak{s}^+=((K^{sat})^{up},(\preceq^{NF}_{\lambda^+}\restriction K^{sat})^{up},S^{bs,+},⨿^+)$,
  as in Definition 10.1.6 and Theorem 11.1.1.
* **Reason.** The frame $\mathfrak{s}^+$ is defined in Definition 10.1.6 (l. 7599–7600) with the
  class $(K^{sat})^{up}$ and the relation $(\preceq^{NF}_{\lambda^+}\restriction K^{sat})^{up}$,
  and Theorem 11.1.1 states the same result in that form. Without "up", conclusion (1) names a
  different structure from the frame $\mathfrak{s}^+$ of Definition 10.1.6.
* **Status of confirmation.** To be filled in by the author.

---

## B. Gaps in proofs

#### B.1 Theorem 6.1.3(e) applied in its dual form (Propositions 10.1.12 and 10.1.13(1))

* **Place.** Theorem 6.1.3(e) (l. 5548–5552). Applications: Proposition 10.1.12, step (34)
  (l. 7819–7821), and Proposition 10.1.13(1) (proof, l. 7852–7856).
* **Original.** Theorem 6.1.3(e): "Suppose $\widehat{NF}(N_0,N_1,M_0,M_1)$,
  $tp(a,N_0,M_0) \in S^{bs}(N_0)$. Then $tp(a,N_1,M_1)$ does not fork over $N_0$." Step (34):
  "By 26, and Theorem 5.15.e (respecting the frame): (34) $tp(a_1,M_2,M_6)$ does not fork over
  $N_2$." (Theorem 5.15 is Theorem 6.1.3.)
* **What is needed.** The dual form, with the roles of the two sides exchanged: an element of
  $N_1$ whose type over $N_0$ is basic, and the conclusion about its type over $M_0$.
* **Reason.** Theorem 6.1.3(e) covers an element of $M_0$ and a type over $N_1$. At step (34) the
  element $a_1$ lies in $N_4$ (the "$N_1$" side of (26)), and the type is over $M_2$ (the "$M_0$"
  side). The same happens in Proposition 10.1.13(1). The dual form is true: it follows from long
  transitivity (Theorem 5.5.1) and Theorem 5.4.10.

#### B.2 Proposition 10.1.12, steps (24) and (28)–(29)

* **Place.** Proposition 10.1.12, proof, l. 7793–7808.
* **Original.** "(28) There is an isomorphism $g:M_6 \to M_4$ over $M_0 \bigcup N_2$. Then we will
  conclude: (29) $tp(a_1,g[M_2],M_4)$ does not fork over $M_0$."
* **What is needed.** $g$ over $M_0 \cup N_4$.
* **Reason.** Step (29) needs $g(a_1) = a_1$, but $a_1 \in N_1 \subseteq N_4$ need not lie in
  $N_2$, so an isomorphism over $M_0 \cup N_2$ may move it. The repair takes $g$ over
  $M_0 \cup N_4$. This uses Theorem 7.1.13(c) with $N^* = N_4$, together with
  $\widehat{NF}(N_0,N_4,M_0,M_6)$ and $\widehat{NF}(N_0,N_4,M_0,M_4)$, which follow from
  transitivity of $\widehat{NF}$. At step (24), the model $M_2$ should come from
  Proposition 7.1.12(b) (so that $M_0 \prec^+_{\lambda^+} M_2$). That gives $M_2 \in K^{sat}$, as
  the paper states, whereas Theorem 6.1.3(c) alone does not. "Without loss of generality
  $N_4 \cap M_2 = N_2$" is obtained by renaming $M_2$ over $M_0 \cup N_2$.

#### B.3 Proposition 10.1.4, the direction ⇐

* **Place.** Proposition 10.1.4, proof of the second direction, l. 7583–7587.
* **Original.** "Suppose $tp(a_1,M_0,M_1)=tp(a_2,M_0,M_2)$. Take an amalgamation
  $(f_1,f_2,M_3)$ of $M_1,M_2$ over $M_0$ with $f_1(a_1)=f_2(a_2)$."
* **What is needed.** An argument that does not amalgamate in $K$ at cardinality $\lambda^+$.
* **Reason.** $(K,\preceq)$ need not have the amalgamation property in $\lambda^+$, so the
  amalgamation taken in the proof need not exist. The repair extends $M_1, M_2$
  by $\prec^+_{\lambda^+}$ and applies Theorem 7.1.13(b) directly. Only the restrictions of the
  types to models $N \in K_\lambda$ are used, as in the last sentence of the paper's proof.

#### B.4 Theorem 9.1.7: the claim $(*)$ and clause 4 of the construction

* **Place.** Theorem 9.1.7, proof: clause 4 (l. 7306–7307), Claim $(*)_\beta$ (l. 7339–7340),
  and the case $\delta \in S$ (l. 7462 ff.).
* **Original.** Clause 4: "If $\beta \in S$ then
  $(M_\beta,M_{\beta+1}) \cong (M^*_{\lambda^+},M^*_{\lambda^++1})$." Claim: "For every
  $\beta \leq \lambda^+$ $(*)_\beta$: …"
* **What is needed.** At a step $\delta \in S$, $M_{\delta+1}$ is chosen as the image of
  $M^*_{\lambda^++1}$ under an extension of the isomorphism $f_{\lambda^+}$ built in the proof.
  The claim is stated for all $\beta < \lambda^{+2}$.
* **Reason.** In the case $\delta \in S$, the proof later extends the isomorphism $f_{\lambda^+}$,
  obtained from Theorem 7.1.13, to $M_{\delta+1}$. An arbitrary isomorphism of pairs as in
  clause 4 need not extend $f_{\lambda^+}$. Choosing $M_{\delta+1}$ at stage $\delta$ through such
  an extension removes the problem. The claim is stated for $\beta \le \lambda^+$ but used for all
  $\beta < \lambda^{+2}$. It was established for all $\beta < \lambda^{+2}$.

#### B.5 Theorem 9.1.7, hypothesis, and its use in Theorem 9.1.13 (b ⇒ c)

* **Place.** Theorem 9.1.7, l. 7284–7289. Theorem 9.1.13, proof, l. 7494 ("$b \Rightarrow c$
  holds by Proposition 8.1.6").
* **Original.** "… such that for each $\alpha,\beta$ with $\alpha<\beta<\lambda^+$, we have
  $M^*_\alpha \prec^+_{\lambda^+} M^*_\beta \preceq^{NF}_{\lambda^+}M^*_{\lambda^++1}$ …"
* **What is needed.** Theorem 9.1.7 under the weaker hypothesis
  $M^*_\alpha \prec^+_{\lambda^+} M^*_{\alpha+1}$ and
  $M^*_\beta \preceq^{NF}_{\lambda^+} M^*_{\lambda^++1}$ for $\alpha, \beta < \lambda^+$.
* **Reason.** Proposition 8.1.6, which supplies the sequence in the application, gives
  $\prec^+_{\lambda^+}$ only between consecutive models, not for all pairs $\alpha < \beta$. The
  proof of Theorem 9.1.7 uses only the weaker hypothesis, so the theorem holds in this stronger
  form and the application goes through. (See also A.1.12 and item 2 at the end.)

#### B.6 Claim 5.5.2 (in the proof of Theorem 5.5.1)

* **Place.** Claim 5.5.2 (l. 5230–5244) and its use of Proposition 5.4.4 (l. 5248–5256).
* **Original.** Claim 5.5.2(1): "$M_{b,0} \preceq N_{b,0}$." The proof substitutes
  $\langle M_{a,\epsilon}\rangle, \langle M_{b,\epsilon}\rangle, \langle N_{b,\epsilon}\rangle$
  into Proposition 5.4.4.
* **What is needed.** Equal first models, $N_{b,0} = M_{b,0}$.
* **Reason.** Proposition 5.4.4 assumes $N^a_{2,0} = N^b_{2,0}$ (its hypothesis (5)), while the
  claim gives only $M_{b,0} \preceq N_{b,0}$. The repair replaces the bottom of the sequence
  $\langle N_{b,\epsilon}\rangle$ by $M_{b,0}$; the first step is preserved by monotonicity. The
  conclusion is then obtained from monotonicity (Proposition 5.3.9) and Proposition 5.3.3.

#### B.7 Proposition 6.1.6(d)

* **Place.** Proposition 6.1.6(d), proof, l. 5715–5748.
* **Original.** "By item a for every $\alpha$, there is a club $E_{\alpha,0} \subseteq \lambda^+$
  such that $(\epsilon<\zeta\wedge \{\epsilon,\zeta \} \subseteq E_{\alpha,0}) \Rightarrow
  NF(M_{\alpha,\epsilon},M_{\alpha,\zeta},M_{\alpha+1,\epsilon},M_{\alpha+1,\zeta})$." Case a:
  "Define $E:=\bigcap \{E_\alpha:\alpha<\delta \}$ …"
* **What is needed.** Clubs for all pairs $\beta < \gamma$ of indices, and in Case a a
  representation of the union, with its own club at the top index.
* **Reason.** The clubs $E_{\alpha,0}$ relate only $\alpha$ and $\alpha+1$, but the proof uses
  that $\langle M_{\alpha,\epsilon} : \alpha \rangle$ is increasing for all pairs of indices.
  Case a also uses $M_{\delta,\epsilon}$, although $E_\alpha$ is defined only for
  $\alpha < \delta$. Both are repaired as indicated.

#### B.8 Proposition 3.1.10, condition (7)

* **Place.** Proposition 3.1.10, proof, l. 3228–3229.
* **Original.** "Now, without loss of generality, condition 7 is satisfied, too."
* **What is needed.** An argument for condition (7).
* **Reason.** The proof constructs conditions 1–6, 8 and 9 and gives no argument for 7. It can be
  obtained in the successor step of the induction on $\beta$. Column $\beta$ is extended to
  column $\beta+1$ by Proposition 3.1.8, whose conclusion (5) is exactly condition (7) for all
  $\alpha$. Proposition 3.1.8 in turn rests on the cited Proposition 2.5.7, which amalgamates two
  extensions with basic types so that neither forks.

#### B.9 Theorem 2.6.8(1): density (*withdrawn*: reclassified as erratum A.1.11, author, 2026-11-16)

This item was recorded as a gap in the proof of Theorem 2.6.8(1), Case 2 (l. 2632–2638): the
proof applies Definition 2.6.5 to $\langle M_n : n \le \omega\rangle^\frown\langle N_\omega\rangle$,
whose last pair is shown only to satisfy $M_\omega \prec N_\omega$, while Definition 2.6.5 as
written requires $M_\omega \prec^*_\lambda N_\omega$. The author decided (2026-11-16) that the error
is in the definition, not in the proof: Definition 2.6.5 should not require $\prec^*$ for the last
pair. With the corrected definition the proof is complete. See A.1.11. The number B.9 is kept so
that references to it remain valid.

#### B.10 Theorem 9.1.13, b ⇒ c: $\prec^+_{\lambda^+}$ for non-consecutive pairs (*author's decision, 2026-11-25*)

* **Place.** Theorem 9.1.13(c), l. 7485–7490; proof of b ⇒ c, l. 7494 ("by Proposition 8.1.6").
  Corrected (c): see A.1.12 (continuity added).
* **Gap.** Proposition 8.1.6 gives $M_\epsilon \prec^+_{\lambda^+} M_{\epsilon+1}$ and
  $M_\epsilon \preceq^{NF}_{\lambda^+} M_{\lambda^++1}$ for $\epsilon < \lambda^+$. Corrected (c)
  needs $M_\epsilon \prec^+_{\lambda^+} M_\zeta$ (and $\preceq^{NF}$) for all
  $\epsilon < \zeta \le \lambda^++1$ with $\epsilon \neq \lambda^+$. The paper gives no argument for the
  other pairs. By case:
  * *$\zeta = \xi+1 \le \lambda^+$:* follows from Proposition 7.1.10(c) ($M_\epsilon \preceq^{NF}
    M_\xi \prec^+ M_{\xi+1}$), with $M_\epsilon \preceq^{NF} M_\xi$ from the $\preceq^{NF}$-chain
    (Lean: `prop_7_1_10_c`, and the internal step `key` of `thm_9_1_13`). Not formalized in the
    statement.
  * *$\zeta = \lambda^++1$:* can be closed by replacing the top model, as in [Sh:600], proof of
    Claim 8.5 (pp. 126–127, checked against the PDF of [Sh:600]). Take $M'$ with
    $M_{\lambda^++1} \prec^+ M'$ (Proposition 7.1.12(a)) and use
    $\langle M_i : i \le \lambda^+\rangle^\frown\langle M'\rangle$. Then $M_\epsilon \prec^+ M'$ by
    Proposition 7.1.10(c). $M_{\lambda^+} \npreceq^{NF} M'$ is kept by Proposition 6.1.6(c), and
    $M' \in K^{sat}$ by Proposition 7.1.10(b). (c) is existential, so the replacement is allowed.
    Not formalized.
  * *Limit $\zeta \le \lambda^+$:* needs continuity of $\prec^+_{\lambda^+}$ along increasing
    continuous chains. The paper states this only as the wish (***) in the discussion before
    Definition 7.1.4 (l. 5938–5941) and does not prove it. [Sh:600] Claim 7.7(3) states the
    analogue for its $<^+$, with proof "Similar". Whether continuity of $\prec^+$ holds is open. An
    attempted proof reduces it to a base change for $NF$
    inside a given model: from $NF(N_0,N_1,N_2,N_3)$ and $N_0 \preceq N_2^* \preceq N_2$, find
    $N_1^*$ with $N_1 \cup N_2^* \subseteq N_1^* \preceq N_3$ and $NF(N_2^*,N_1^*,N_2,N_3)$. The
    paper does not have this; the existence theorem for $NF$ (l. 4615–4627) builds a new $N_3$
    and does not give it.
* **Classification.** B (gap in the proof), not an erratum (author's decision, 2026-11-25).
* **The formalization.** The Lean statement of `thm_9_1_13` (c) is unchanged:
  * the sequence is increasing continuous in $K^{sat}$;
  * $\prec^+$ holds between consecutive models;
  * $\preceq^{NF}$ holds into the top model;
  * $\preceq^{NF}$ fails at $(\lambda^+,\lambda^++1)$.

  For this version the equivalence (a) ⇔ (b) ⇔ (c) is fully proved. Continuity of $\prec^+$ is
  not formalized (author's decision, 2026-11-25). The `-- PROOF-STAGE CHANGE` tag stays.
* **Status of confirmation.** Classification: author's decision. The case $\zeta=\lambda^++1$:
  checked against [Sh:600]. The limit case: open.

---

## C. Implicit assumptions made explicit

#### C.1 $\alpha^* \neq 0$ (*confirmed by the author*)

* **Place.** Proposition 5.3.8 (l. 4656–4662) and Theorem 5.5.1 (l. 5210–5215).
* **Original.** Theorem 5.5.1: "For $x=a,b$, let $\langle M_{x,\epsilon}:\epsilon \leq \alpha^*
  \rangle$ be a $\prec$-increasing continuous sequence of models in $K_\lambda$. Suppose
  $\epsilon<\alpha^* \Rightarrow NF(M_{a,\epsilon},M_{a,\epsilon+1},M_{b,\epsilon},M_{b,\epsilon+1})$.
  Then $NF(M_{a,0},M_{a,\alpha^*},M_{b,0},M_{b,\alpha^*})$." Proposition 5.3.8 is quoted in A.1.6.
* **Should read.** Add $0 < \alpha^*$.
* **Reason.** $\alpha^*$ is the length of a sequence of steps and was never meant to be $0$. For
  $\alpha^* = 0$ the hypothesis is empty, and the conclusion $NF(M_{a,0},M_{a,0},M_{b,0},M_{b,0})$
  needs $M_{a,0} \preceq M_{b,0}$, which is not assumed. For $\alpha^* > 0$ it follows from the
  step at $0$.
* **Status of confirmation.** To be filled in by the author.

#### C.2 $K_\lambda \neq \emptyset$ in Proposition 3.1.9

* **Place.** Proposition 3.1.9(1), l. 3117; proof, l. 3124–3126.
* **Original.** "$K_{\lambda^+}\neq \emptyset$, and it has no $\preceq$-maximal model." Proof:
  "as we can choose an increasing continuous sequence of models in $K_\lambda$,
  $\langle M_\alpha:\alpha<\lambda^+ \rangle$ …"
* **Should read.** Add the hypothesis $K_\lambda \neq \emptyset$.
* **Reason.** The empty class satisfies Hypothesis 3.0.1, which, unlike the conjugation property,
  does not include categoricity in $\lambda$. For it, $K_{\lambda^+} = \emptyset$, so (1) fails.
  The proof starts the chain from a first model of $K_\lambda$, which it assumes exists. The paper
  never states $K_\lambda \neq \emptyset$. Where conjugation is assumed (Sections 10–11 and the
  main theorems), $K_\lambda \neq \emptyset$ follows from categoricity in $\lambda$, and nothing
  needs to be added.
* **Status of confirmation.** Not confirmed.

#### C.3 $\lambda$ is infinite

* **Place.** Proposition 7.1.12(a) (l. 6242–6243); Theorem 7.1.18(b) (l. 6684–6686);
  Proposition 8.1.5 (l. 6991–6996); Proposition 8.1.6 (l. 7021 ff.); Propositions 9.1.4 (l. 7212 ff.),
  9.1.5 (l. 7234 ff.) and 9.1.6 (l. 7262 ff.); Theorem 9.1.7 (l. 7283 ff.); Theorem 9.1.13
  (l. 7479 ff.); Proposition 10.1.4 (l. 7563 ff.); Proposition 10.1.7(a),(b) (l. 7623–7626);
  Proposition 10.1.8 (l. 7634 ff.).
* **Original.** These statements put no condition on $\lambda$ beyond those of the frame.
* **Should read.** Add $\aleph_0 \le \lambda$.
* **Reason.**
  * The arguments use that $\lambda^+$ is an infinite regular cardinal, with clubs and
    stationary sets in the usual sense, and that $\lambda^{+2}$ is a limit ordinal. For finite
    $\lambda$ these fail.
  * Several statements need a model in $K_\lambda$, for instance reflexivity of
    $\preceq^{NF}_{\lambda^+}$. For finite $\lambda$, $K_\lambda$ can be empty while all the frame
    axioms, which speak only about $K_\lambda$, hold vacuously. Example: the empty vocabulary, $K$
    the sets of size 1 or 3 ordered by inclusion, and $\lambda = 2$. There a model of size 3 has
    no $\preceq^{NF}_{\lambda^+}$-reflexivity witness.
  * The paper clearly intends $\lambda$ to be infinite.
* **Status of confirmation.** Not confirmed.

#### C.4 Proposition 7.1.7: $N_0 \in K_\lambda$ (*approved by the author*)

* **Place.** Proposition 7.1.7, l. 6055–6065.
* **Original.** "Suppose: (a) For $n=1,2$ $NF(M_{0,0},M_{0,1},M_{n,0},M_{n,1})$. (b)
  $M_{1,0} \preceq N_0,\ M_{2,0} \preceq N_0$. (c) $N_0 \bigcap M_{0,1}=M_{0,0}$. Then for some
  model $N_1$ with $NF(M_{0,0},M_{0,1},N_0,N_1)$ …"
* **Should read.** Add $N_0 \in K_\lambda$.
* **Reason.** $NF$ is a relation on quadruples from $K_\lambda$, so the conclusion
  $NF(M_{0,0},M_{0,1},N_0,N_1)$ is false when $N_0 \notin K_\lambda$. Every use (proof of
  Theorem 7.1.13) has $N_0 = N_{2\epsilon+1} \in K_\lambda$.
* **Status of confirmation.** To be filled in by the author.

#### C.5 Proposition 10.1.4: $M_0, M_1, M_2 \in K^{sat}$

* **Place.** Proposition 10.1.4, l. 7564–7568, with Definition 10.1.3, l. 7556.
* **Original.** "For every $M_0,M_1,M_2$ with $M_0 \preceq^{NF}_{\lambda^+} M_1 \wedge M_0
  \preceq^{NF}_{\lambda^+} M_2$ and every $a_1,a_2$ with $a_1 \in M_1-M_0 \wedge a_2 \in M_2-M_0$:
  $tp^+(a_1,M_0,M_1)=tp^+(a_2,M_0,M_2) \Leftrightarrow tp(a_1,M_0,M_1)=tp(a_2,M_0,M_2)$."
* **Should read.** Add $M_0, M_1, M_2 \in K^{sat}$ (and $\lambda$ infinite, C.3).
* **Reason.** Definition 10.1.3 defines $tp^+(a,M_0,M_1)$ only "for $M_0,M_1 \in K^{sat}$". For
  other models the left-hand side is not defined in the paper. Read as a type in
  $((K^{sat})^{up}, \dots)$ over models outside $(K^{sat})^{up}$, it is a one-element class, and
  ⇐ fails.
* **Status of confirmation.** Not confirmed.

#### C.6 Proposition 10.1.7(b): representatives in $K^{sat}$

* **Place.** Proposition 10.1.7(b), l. 7624–7626, with Definition 10.1.6(2), l. 7606–7610.
* **Original.** "$⨿^+$ is well-defined: It does not depend on the triple $(M_0,M_1,a)$ that
  represents the type."
* **Should read.** The representing triples range over those with models in $K^{sat}$
  (and $\lambda$ is infinite, C.3).
* **Reason.** Definition 10.1.6(2) defines non-forking of $tp^+(a,M_1,M_2)$ only for
  $\{M_0,M_1,M_2\} \subseteq K^{sat}$. For a representative outside $K^{sat}$ the defining
  condition is false, so independence of the representative can hold only among representatives
  in $K^{sat}$.
* **Status of confirmation.** Not confirmed.

#### C.7 Corollary 11.1.6: $0 < n$

* **Place.** Corollary 11.1.6, l. 8073 and l. 8083–8084; proof, l. 8091–8092.
* **Original.** "(1) $n<\omega$. … \emph{then} there is a good $\lambda^{+n}$-frame
  $\mathfrak{s}^n$ …". Proof: "By induction on $n$, using Theorem 11.1.5."
* **Should read.** $0 < n < \omega$.
* **Reason.** For $n = 0$ the conclusion asks for a good $\lambda$-frame. Hypothesis (3) and the
  $WDmId$ part of (4) are then vacuous, and only $2^\lambda < 2^{\lambda^+}$ remains, so nothing
  upgrades the given semi-good frame to a good one. The induction in the proof has base
  $\mathfrak{s}^0 = \mathfrak{s}$, which is only semi-good. Good frames arise from
  $\mathfrak{s}^1 = \mathfrak{s}^+$ on. (No counterexample for $n = 0$ is claimed: the case is
  simply not supported by the hypotheses.) Theorem 11.1.7 needs no change and holds for all $n$.
* **Status of confirmation.** Not confirmed.

#### C.8 Theorem 1.0.2: the function $\mu_{unif}$

* **Place.** Theorem 1.0.2(2), l. 523–524. The definition of $\mu_{unif}$ (l. 8012–8021) and
  Proposition "unifleq" (l. 8023–8025) lie inside a `comment` block (l. 7977–8037).
* **Original.** "(2) $m<\omega \Rightarrow
  I(\lambda^{+(2+m)},K)<\mu_{unif}(\lambda^{+(2+m)},2^{\lambda^{+(1+m)}})$."
* **Should read.** Keep (2), and add the inequality
  $\mu_{unif}(\lambda^{+(2+m)},2^{\lambda^{+(1+m)}}) \le 2^{\lambda^{+(2+m)}}$ for every $m$. This
  is the commented Proposition "unifleq", "For every $\mu$, $\mu_{unif}(\mu^+,2^\mu) \leq
  2^{\mu^+}$" (proof: "Easy."), at $\mu = \lambda^{+(1+m)}$.
* **Reason.** In the active text $\mu_{unif}$ is never defined, so hypothesis (2) refers to an
  unknown function, and for a large enough function it says nothing. With the inequality, (2)
  implies hypothesis (2) of Theorem 11.1.7,
  $I(\lambda^{+(2+m)},K) < 2^{\lambda^{+(2+m)}}$, which is how the paper proves Theorem 1.0.2. The
  active Theorem 11.1.7 has $2^{\lambda^{+(2+m)}}$, with the $\mu_{unif}$ version commented out
  (l. 8101–8103).
* **Provenance of the added inequality.** The inequality is not in the published paper. Proposition
  "unifleq" (l. 8023–8025, proof "Easy.") is commented out in the LaTeX source, inside the
  `comment` block l. 7977–8037, so the published paper does not contain it. In the formalized
  statement it is a hypothesis added by the formalization. It stays an explicit hypothesis of the
  formalized Theorem 1.0.2: it is assumed, not proved.
* **Status of confirmation (updated 2026-11-25).**
  * *The definition of $\mu_{unif}$.* The formalization uses the definition of [Sh:88r], from the
    author's screenshot, as written: $\mu_{unif}(\lambda^+,\chi)$ is the first $\mu$ with
    $\langle c_\alpha : \alpha<\mu\rangle$, $c_\alpha : {}^{\lambda^+>}(\lambda^+) \to \chi$, such that
    no $\rho \in {}^{\lambda^+}\chi$ has, for every $\alpha$, some $\eta \in {}^{\lambda^+}(\lambda^+)$
    with $\{\delta<\lambda : c_\alpha(\eta\restriction\delta)\neq\rho(\delta)\}$ stationary in
    $\lambda$. [Sh:88r] has $\delta<\lambda$; the formalization follows it as written. Section 1 of
    `MUUNIF_DEFINITION.md` confirmed by the author (2026-11-25). Lean: AUX `muUnif`
    (`Frames.lean`).
  * *The old definition.* The definition in the tex comment block (l. 8012–8021) is kept only as a
    note in `MUUNIF_DEFINITION.md` §5; its equivalence with [Sh:88r] was not checked. (An earlier
    version of this entry used it and said the screenshot showed it accurate; that was wrong.)
  * *The inequality.* $\mu_{unif}(\lambda^+,2^\lambda) \le 2^{\lambda^+}$ for infinite $\lambda$ is
    **proved** in Lean for the [Sh:88r] definition as written (AUX `muUnif_le`; family
    $c_\rho(\nu) := \rho(\mathrm{length}\,\nu)$, of size $(2^\lambda)^{\lambda^+} = 2^{\lambda^+}$). The
    claim that it is easy comes from personal communication from Prof. Saharon Shelah. The tex
    says "for every $\mu$"; the Lean lemma assumes $\lambda$ infinite, which holds in Theorem 1.0.2.
  * *Theorem 1.0.2.* The frozen `thm_1_0_2` is unchanged and keeps `hunif` as an explicit
    hypothesis (with $\mu_{unif}$ a free parameter). The AUX corollary `thm_1_0_2_muUnif` takes
    $\mu_{unif}$ = `muUnif` and has no `hunif` (discharged by `muUnif_le`).
  * *A discrepancy (not used by `hunif`).* The screenshot of [Sh:88r] gives the value
    $\mu_{unif}(\lambda^+,2^\lambda) = 2^\lambda$ for $\lambda \ge \beth_\omega$, while the tex comment
    (l. 8030–8034) says $\mu_{unif}(\mu^+,2^\mu) = 2^{\mu^+}$ for $\mu \ge \beth_\omega$. Only the upper
    bound is used.
  * *Identification (resolved, author, 2026-11-26).* The $\mu_{unif}$ of the paper is the one of
    [Sh:88r]: the author confirms this, and supplied the screenshot of the definition
    (`MUUNIF_DEFINITION.md`). Lean: `thm_1_0_2_muUnif` (Theorem 1.0.2 with $\mu_{unif}$ =
    `muUnif`, without `hunif`) and `muUnif_le`. The frozen `thm_1_0_2` holds for any function
    $\mu_{unif}$ satisfying (2) and `hunif`, so it does not depend on this identification.

#### C.9 Proposition 3.1.10: $\theta^a < \lambda^+$ (restriction of the formalized statement, not an erratum; *author's decision, 2026-11-13*)

This item differs from C.1–C.8: the paper does not need the hypothesis. It records a restriction
made in the formalization.

* **Place.** Proposition 3.1.10, l. 3165–3171; its proof, l. 3212–3229; Proposition 3.1.8,
  l. 3014–3029, with its proof l. 3040–3106.
* **Original.** "For $x=a,b$ let $\langle M_{x,\alpha}:\alpha<\theta^x \rangle$ be an increasing
  continuous sequence of models in $K_\lambda$ such that $M_{a,0}=M_{b,0}$ …". There is no bound
  on $\theta^a$.
* **Formalized statement.** Adds $\theta^a < \lambda^+$. The paper does not contain this
  hypothesis, and the author believes that exactly the same proof works without it. So it is not
  an erratum of the paper.
* **What it excludes.** Only the case $\theta^a = \lambda^+$. The hypotheses already give
  $\theta^a \le \lambda^+$: for $\beta < \theta^a$ the elements $d_{a,\alpha}$ ($\alpha < \beta$)
  are distinct elements of $M_{a,\beta} \in K_\lambda$, so $|\beta| \le \lambda$.
* **Where it is used.**
  * The construction goes by induction on $\beta$. The successor step extends column $\beta$,
    $\langle M_{\alpha,\beta} : \alpha < \alpha^* \rangle$, to column $\beta+1$ by applying
    Proposition 3.1.8 to the whole column.
  * Proposition 3.1.8 is stated for a sequence $\langle M_\alpha:\alpha \leq \theta \rangle$ in
    $K_\lambda$, that is, a sequence with a last model in $K_\lambda$.
  * When $\alpha^*$ is a limit ordinal, the column has no last model. So the formal proof first
    adds $\bigcup_{\alpha<\alpha^*} M_{a,\alpha}$ as a last model.
  * For $\alpha^* < \lambda^+$ this union has cardinality $\lambda$ and lies in $K_\lambda$. For
    $\alpha^* = \lambda^+$ it has cardinality $\lambda^+$, and Proposition 3.1.8 as stated does
    not apply.
  * This is the only use of $\theta^a < \lambda^+$.
* **The paper's own proof.** It does the same: "For $\beta=\gamma+1$ use Proposition 3.1.8.1"
  (l. 3227), applied to the column. For $\alpha^* = \lambda^+$ the column has no last model in
  $K_\lambda$. So the paper's proof also uses Proposition 3.1.8 in a form it does not state: for a
  sequence of length $\lambda^+$ with no last model. The proof does not mention the case.
* **Why the author's belief is plausible.** The construction itself seems to give that form.
  * In the proof of Proposition 3.1.8 the last model $M_\theta$ is used only at the end, to rename
    the amalgam back ("Now $f_\theta:M_\theta \to N_\theta^*$ is an embedding. Extend
    $f_\theta^{-1}$ …", l. 3100–3106).
  * The successor and limit steps use only models of $K_\lambda$ at indices below $\theta$.
  * A passage that the authors commented out (l. 3058–3076) even treats the case
    $\alpha = \theta = \lambda^+$.
  * This was not checked in detail, and not in Lean.
* **Status.** A restriction of the formalized statement. It was made because the formal proof
  reuses Proposition 3.1.8 as stated. The Lean statement keeps it. The only use in the paper
  (Proposition 5.4.6, with $\theta^a = \alpha^*+1$ and $\alpha^* < \lambda^+$) is covered.
* **Status of confirmation.** To be filled in by the author.

---

## D. Remarks on the formalization (not errata of the paper)

#### D.1 The ambient set U: an encoding device and an example of the difficulty of checking fidelity

*Author's decision (2026-11-13): this is not a mathematical fidelity problem. It is recorded as an
example of the difficulty of checking fidelity.*

**(a) What the encoding does.**
The paper does not mention an ambient set. In the formalization every model is a structure whose
universe is a subset of one fixed type `U`; the type carries no structure, and the structures of
two models are not required to agree on their intersection. It is used to make intersections,
differences and unions of universes literal and to provide room for placing copies of models (the
size hypothesis `Room U lam`). The theorems are stated for every `U` satisfying this size
hypothesis. This is not needed mathematically, and we found no mathematical weakening of the
theorems.

**(b) What went wrong with fidelity.**
The ambient set was introduced by the agent as an encoding decision, without a flag marking it as
an addition that goes beyond the paper, and without asking the author. Its first description, in
the documentation, said only that a model is a structure "whose universe is a subset of a fixed
ambient type `U`", "so that `M ⊆ N`, `M ∩ N`, `N - M` and unions of chains are literal" (working
notes, B.1: "a subset of an ambient type `U`"); it did not say that `U` carries no structure, and it did
not speak of an ambient structure; the author, who wrote the paper, first suspected that the
encoding silently assumed amalgamation, and settling that required reading the definition of a
model and the lemmas that rename models. The question was settled only by inspecting the Lean
definition.

**(c) The lesson.**
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

## To be confirmed by the author

The following items are recorded in the working notes, but their status or wording is not yet
settled. They are not part of the lists above.

1. **Proposition 8.1.3(b).** Resolved (author, 2026-11-13): an erratum, recorded in A.1.10.
2. **Theorem 9.1.13(c)** (l. 7485–7490). **Resolved (author, 2026-11-16):** an erratum (A.1,
   incomplete statement), recorded in A.1.12. Continuity is added: the sequence
   $\langle M_\epsilon:\epsilon \leq \lambda^++1 \rangle$ is increasing continuous. The rest of
   (c) is kept as is; it is not weakened to successor pairs. Source: [Sh:600, Claims 8.4–8.5].
   * *Still open:* the proof of b ⇒ c (l. 7494, "by Proposition 8.1.6") gives
     $M_\epsilon \prec^+_{\lambda^+} M_\zeta$ only for $\zeta = \epsilon + 1$. For the other pairs
     with $\epsilon \neq \lambda^+$, in particular limit $\zeta$, no proof was found and no
     counterexample either. In [Sh:600] the limit case is a hypothesis ((*) of Claim 8.4), not
     derived. *Proposed classification: B (gap in the proof of b ⇒ c), to be confirmed by the
     author.*
   * *Resolved (author, 2026-11-25):* classified as B, recorded in B.10 (case analysis; top-model
     replacement for $\zeta=\lambda^++1$; limit $\zeta$ needs continuity of $\prec^+$, not
     formalized). The Lean (c) is unchanged.
3. **Proposition 3.1.10.** *Resolved (author, 2026-11-13).* $\theta^a < \lambda^+$ is not an
   erratum but a restriction of the formalized statement, now C.9 (with where it is used and what
   fails without it).
4. **Theorem 2.6.8(1)** (B.9). **Resolved (author, 2026-11-16):** an erratum in Definition 2.6.5
   (class A), not a gap in the proof (class B). Definition 2.6.5 should not require $\prec^*$ for
   the last pair (only $M_{\alpha^*} \prec M_{\alpha^*+1}$); with the corrected definition the
   paper's proof of Theorem 2.6.8(1), Case 2, is complete. Recorded in A.1.11; B.9 is withdrawn.
   The record of the question follows.
   * *Author's answer (2026-11-13):* the hypothesis is weak local character exactly as written in
     the paper.
   * The step in question, explained in B.9, is at l. 2634–2638. The proof applies
     Definition 2.6.5 to $\langle M_n : n \le \omega\rangle^\frown\langle N_\omega\rangle$. As
     written, Definition 2.6.5 requires $M_\omega \prec^*_\lambda N_\omega$ for the last pair, but
     the proof shows only $M_\omega \preceq N_\omega$.
   * *Open question for the author:* is Definition 2.6.5 meant to require $\prec^*$ also for the
     last pair?
     * If yes, this is a gap in the proof (B).
     * If no, the last pair needs only $M_{\alpha^*} \prec M_{\alpha^*+1}$. Then the paper's
       proof uses only weak local character, and the item is dropped.
   * *Proposed classification: B.*
5. **Proposition 5.4.3(2).** *Resolved (author, 2026-11-13):* an erratum of the paper, recorded in
   A.1.7.
6. *Not reviewed by the author* (author, 2026-11-13: there is no substantial difference in the
   proof, and it will not be reviewed now). Two entries of the notes' list of proof gaps describe
   a different route rather than a failure of the paper's argument. Proposed classification: not
   gaps in the proof (B); they are kept here as they are:
   * The use of Proposition 5.5.3 in the proof of Theorem 5.5.1 (l. 5291 ff.): "without loss of
     generality $f_\epsilon = id$" and the disjointness $M_{a,\alpha^*} \cap M_0 = M_{a,0}$ were
     avoided by working with the embeddings $f_\epsilon$ directly.
   * Proposition 3.1.10, the identity case (condition (8)): the rectangle is moved by a single
     injection on the union of the top row, and the hypothesis of (8) is what makes it injective.

Items 7–9 come from an assessment of Sections 2.3–2.4. They are
findings of the formalization that the author has not reviewed yet. **Deferred** (2026-11-26): the three infinitary-logic findings are not reviewed
in this round.

7. **Proposition 2.4.5: the proof of $PC_{\aleph_0}$ does not define the class $K$.**
   * Statement (l. 1808–1811): "The AEC of transitive partial orders is an AEC which is
     $PC_{\aleph_0}$ and it has LST-number $\aleph_0$."
   * Proof (l. 1814–1820): $\tau^+ := \{<\} \cup \{f_n:n<\omega\}$, the theory says that $<$ is a
     partial order and each $f_n$ is a $\tau$-automorphism, and "$K$ is the class of reductions
     to $\tau$ of $\tau^+$-models of $\mathbb{T}$ which omit $p(x,y):=\{f_n(x) \neq y:n<\omega\}$".
   * What does not follow: omitting $p$ means that every $y$ equals some $f_n(x)$. So every such
     model is countable, and its automorphism group acts transitively on the whole order. The
     class defined is the countable partial orders with this property. It differs from $K$,
     which has uncountable models and requires linear components (compare
     $\mathbb{Z} \times \{0,1\}$ with $(m,i)<(n,j) \iff m<n$). The relation $\preceq$ is not
     treated.
   * The statement itself appears to be true with a different coding.
   * *Proposed classification: B (gap in the proof).*
8. **Proposition 2.3.5: an unstated step.**
   * Statement (l. 1549–1555): "there is a model $M \in K_{\aleph_0}$ such that
     $(K_M)_{\aleph_1} \neq \emptyset$", with $K_M=\{N \in K:N \equiv_{L_{\infty,\omega}}M\}$
     (Definition 2.3.1, l. 1438–1443).
   * The proof (l. 1574–1576) reduces it to Proposition 2.3.9, which gives a countable
     $N \preceq M'$ with $N \preceq_{L_{\omega_1,\omega}} M'$ for a small $M'$ of cardinality
     $\aleph_1$ (l. 1580–1583).
   * What does not follow directly: the statement needs $M' \equiv_{L_{\infty,\omega}} N$, while
     the proof gives only $N \equiv_{L_{\omega_1,\omega}} M'$.
   * The missing step is Scott's theorem. The Scott sentence of the countable model $N$ is an
     $L_{\omega_1,\omega}$-sentence, $M'$ satisfies it, and its models are
     $L_{\infty,\omega}$-equivalent to $N$. (Also implicit: $N$ is infinite, as it is
     $L_{\omega_1,\omega}$-equivalent to an uncountable model.)
   * *Proposed classification: B (an omitted standard step).*
9. **Theorem 2.3.8: a model of cardinality $\aleph_1$ is not assumed.**
   * Statement (l. 1569–1571; "a translation of Theorem 2.7 from [bls]", l. 1568): "If the class
     $K$ is $PC_{\aleph_0}$ and every model of cardinality $\aleph_1$ is $L^*$-small for every
     countable fragment $L^*$ of $L_{\omega_1,\omega}$ then $K$ has a $L_{\omega_1,\omega}$-small
     models $M'$ of cardinality $\aleph_1$."
   * What does not follow: if $K$ has no model of cardinality $\aleph_1$, the hypothesis holds
     vacuously and the conclusion fails.
   * Example: the reducts to the empty vocabulary of the models of the empty theory in the
     language $\{c_n : n<\omega\}$ that omit $\{x \neq c_n : n<\omega\}$. These are the nonempty
     countable sets, a $PC_{\aleph_0}$ class with no model of cardinality $\aleph_1$.
   * Suggested reading: add "$K$ has a model of cardinality $\aleph_1$". The only use (proof of
     Proposition 2.3.5, l. 1575) has $I(\aleph_1,K) > 0$, which supplies it.
   * Whether [BLS] Theorem 2.7 states this hypothesis was not checked.
   * *Proposed classification: A (incomplete as written).*

10. **Theorem 1.0.2: the hypothesis added in C.8**
    ($\mu_{unif}(\lambda^{+(2+m)},2^{\lambda^{+(1+m)}}) \le 2^{\lambda^{+(2+m)}}$, the commented-out
    Proposition "unifleq"). *Updated 2026-11-25:* proved in Lean (AUX `muUnif_le`) for the
    [Sh:88r] definition as written; `thm_1_0_2` keeps `hunif`. **Resolved (author, 2026-11-26):**
    the $\mu_{unif}$ of the paper is the one of [Sh:88r] (the author supplied the screenshot of the
    definition; `MUUNIF_DEFINITION.md`). See `thm_1_0_2_muUnif` and `muUnif_le`. `thm_1_0_2` itself
    holds for any function $\mu_{unif}$ satisfying (2) and `hunif`, so it does not depend on this
    identification. See C.8.

---

## Entries whose confirmation status the author must fill in

These entries are marked *confirmed* or *approved by the author*, but the working notes do not say
how the confirmation was made (from memory or reasoning, or by checking sources). Their field
*Status of confirmation* reads *to be filled in by the author*. The value to enter is one of:
*confirmed by the author and checked against sources*; *confirmed by the author from his own
understanding, not checked against other sources*; *not confirmed*.

| Entry | Item | What the notes record |
|---|---|---|
| A.1.1 | Definition 1.0.22(1), $E^*$: $N_2 \in K$ instead of $N_2 \in K_\lambda$ | confirmed (decision Q1) |
| A.1.2 | Definition 2.6.1(3), non-forking for big models | confirmed (decision Q2) |
| A.1.3 | Conjecture 11.1.4, $\lambda^{+2}$ instead of $\lambda^+$ | confirmed; "the author checked the source" (source not named) |
| A.1.4 | Theorem 5.3.7(c), existence for $NF$ | confirmed |
| A.1.5 | Proposition 3.2.5, $\alpha^* < \lambda^+$ and $M_0 \in K_\lambda$ | confirmed |
| A.1.6 | Proposition 5.3.8, $\alpha^* < \lambda^+$, bottom models in $K_\lambda$ | confirmed |
| A.1.7 | Definition 5.4.2 and Proposition 5.4.3 ($NF^{uq}$, $\bigotimes^-$; closure under isomorphisms in 5.4.3(2)) | confirmed; 5.4.3(2): "the omission is the author's" (2026-11-13) |
| A.1.8 | Definition 7.1.4, continuity only for the first two sequences | confirmed: "continuity was intended only for the first two sequences" |
| A.1.9 | Definition 7.1.11, the game | approved (author's decision) |
| A.1.10 | Proposition 8.1.3(a),(b) | confirmed: (a) 2026-11-10, (b) 2026-11-13 |
| A.2.1 | Proposition 4.1.8, "over $M$" | confirmed (decision Q6, misprints) |
| A.2.2 | Proposition 5.3.9(2), base $M_0$ | confirmed (decision Q6, misprints) |
| A.2.3 | Proposition 5.4.4, $f^b_{\alpha^*}$ in the second triple | confirmed (decision Q6, misprints) |
| A.2.4 | Proposition 9.1.5, $\bar{M}^2 = \langle M_{\alpha,2} \rangle$ | confirmed (decision Q6, misprints) |
| A.2.5 | Theorem 11.1.5(1), $(K^{sat})^{up}$ | confirmed (decision Q6, misprints) |
| C.1 | $\alpha^* \neq 0$ (Proposition 5.3.8, Theorem 5.5.1) | confirmed: "$\alpha^*$ … was never meant to be $0$" |
| C.4 | Proposition 7.1.7, $N_0 \in K_\lambda$ | approved |
| C.9 | Proposition 3.1.10, $\theta^a < \lambda^+$ (restriction of the formalized statement) | author's decision (2026-11-13); the author believes the same proof works without it |

For reference, the other entries of parts A and C have these values: A.1.11 *confirmed by the
author from his own understanding, not checked against other sources*; A.1.12 *confirmed by the
author and checked against sources* ([Sh:600, Claims 8.4–8.5], with the caveat stated there); C.2, C.3, C.5, C.6, C.7
*not confirmed*; C.8: definition of $\mu_{unif}$ from [Sh:88r] as written, confirmed by the author
(2026-11-25); the added inequality is proved in Lean for that definition (see C.8).

# The definition of μ_unif used for the formalization: [Sh:88r]

Source: [Sh:88r], from the screenshot the author uploaded (2026-11-25). This replaces the
earlier version of this file, which used the definition from a commented-out block of the tex
source. That definition is kept below only as a note (section 5).

Lean: the AUX definition `muUnif` and the AUX lemma `muUnif_le` in `NonForkingFrames/Frames.lean`
formalize sections 1 and 3; `thm_1_0_2_muUnif` is Thm 1.0.2 with this `μ_unif`.

## 1. The definition ([Sh:88r])

Let $\lambda$ be a cardinal and $\chi$ a cardinal. $\mu_{unif}(\lambda^+, \chi)$ is the first
cardinal $\mu$ such that there is a sequence $\langle c_\alpha : \alpha < \mu \rangle$ with:

(a) $c_\alpha : {}^{\lambda^+ >}(\lambda^+) \to \chi$, where ${}^{\lambda^+ >}(\lambda^+)$ is the set
    of sequences of ordinals $< \lambda^+$ of length $< \lambda^+$;

(b) there is no $\rho \in {}^{\lambda^+}\chi$ such that for every $\alpha < \mu$ there is
    $\eta \in {}^{\lambda^+}(\lambda^+)$ for which
    $\{\delta < \lambda : c_\alpha(\eta \restriction \delta) \neq \rho(\delta)\}$
    is stationary in $\lambda$.

Equivalently, (b) says: for every $\rho \in {}^{\lambda^+}\chi$ there is $\alpha < \mu$ such that
for every $\eta \in {}^{\lambda^+}(\lambda^+)$ the set
$\{\delta < \lambda : c_\alpha(\eta \restriction \delta) \neq \rho(\delta)\}$ is not stationary
in $\lambda$.

[Sh:88r] has $\delta < \lambda$; the formalization follows it as written.

## 2. Points for the comparison

* **The letter $\mu$.** In [Sh:88r] $\mu$ is the length of the sequence $\langle c_\alpha \rangle$.
  In the tex source (and in the old definition, section 5) $\mu$ is the cardinal with
  $\chi = 2^\mu$, $\lambda^+ = \mu^+$. The use in Thm 1.0.2 is at
  $\lambda := \lambda_{paper}^{+(1+m)}$, $\chi := 2^{\lambda}$, i.e. the hypothesis `hunif` is
  $\mu_{unif}(\lambda^+, 2^\lambda) \le 2^{\lambda^+}$ in the notation of [Sh:88r].
* **Existence of the minimum.** The family in section 3 satisfies (a) and (b), so the set of such
  $\mu$ is nonempty and "the first cardinal" is defined.
* **"Stationary".** Stationary as a subset of $\lambda$ in the usual sense (meets every club of
  $\lambda$). The formalization will use the project's `IsClubIn` / `IsStationaryIn`
  (`AEC.lean`, l. 174–180).
* **A value stated in the screenshot.** The screenshot says
  $\mu_{unif}(\lambda^+, 2^\lambda) = 2^\lambda$ for $\lambda \ge \beth_\omega$, while the tex
  comment (l. 8030–8034) says $\mu_{unif}(\mu^+, 2^\mu) = 2^{\mu^+}$ for $\mu \ge \beth_\omega$.
  This discrepancy is not used by `hunif` (only the upper bound of section 3 is). It is recorded in
  `ERRATA.md`, C.8.

## 3. Proof of $\mu_{unif}(\lambda^+, \chi) \le \chi^{\lambda^+}$ ($\lambda$ infinite)

For each $\rho \in {}^{\lambda^+}\chi$ let $c_\rho(\nu) := \rho(\mathrm{length}(\nu))$ for
$\nu \in {}^{\lambda^+ >}(\lambda^+)$. This satisfies (a), since $\mathrm{length}(\nu) < \lambda^+$.

Then $c_\rho(\eta \restriction \delta) = \rho(\delta)$ for every $\eta \in {}^{\lambda^+}(\lambda^+)$
and every $\delta < \lambda^+$, in particular every $\delta < \lambda$. So for the index $\rho$
itself and every $\eta$, the set
$\{\delta < \lambda : c_\rho(\eta \restriction \delta) \neq \rho(\delta)\}$ is empty, hence not
stationary in $\lambda$ ($\emptyset$ does not meet the club $\lambda$ of $\lambda$; this uses that
$\lambda$ is a limit ordinal, true for $\lambda$ infinite). So no $\rho$ witnesses the failure
of (b).

Enumerating $\{c_\rho : \rho \in {}^{\lambda^+}\chi\}$ gives a sequence of length
$|{}^{\lambda^+}\chi| = \chi^{\lambda^+}$ satisfying (a) and (b). Hence
$\mu_{unif}(\lambda^+, \chi) \le \chi^{\lambda^+}$.

For $\chi = 2^\lambda$ with $\lambda$ infinite:
$(2^\lambda)^{\lambda^+} = 2^{\lambda \cdot \lambda^+} = 2^{\lambda^+}$. This gives `hunif`
($\lambda$ is infinite in Thm 1.0.2, since $\lambda = \lambda_{paper}^{+(1+m)}$ and
$\lambda_{paper}$ is infinite).

## 4. Status

* Definition: from the author's screenshot of [Sh:88r]; section 1 confirmed by the author
  (2026-11-25), with $\delta < \lambda$ in (b) as in the screenshot. The author confirmed that
  this is the $\mu_{unif}$ of the paper (`ERRATA.md`, C.8).
* Proof of section 3: proposed by the author (2026-11-25); formalized as `muUnif_le`.

## 5. Note: the old definition (from the commented-out tex block)

*From the commented-out tex block; equivalence with [Sh:88r] not checked.*

Source: the arXiv source, inside the `\begin{comment} … \end{comment}` block l. 7977–8037,
Definition at l. 8011–8021:

```latex
What is $\mu_{unif}(\lambda^{+2},2^{\lambda^+})$?
\begin{definition}
Let $\mu$ be a cardinal. $\mu_{unif}(\mu^+,2^\mu):=Min \{|P|:P$ is
a family of subsets of $^{\mu^+}(2^{\mu})$
:=$\{g:g:\mu^+ \to 2^{\mu}\}$
with union $^{\mu^+}(2^{\mu})$ and for each $A \in P$ there is a
function $c$ with domain $\bigcup \{^\alpha
(2^\mu):\alpha<\mu^+\}$ such that for each $f \in A$, the set
$\{\delta \in \mu^+:c(f \restriction \delta)=f(\delta)\}$ is not
stationary\}.
\end{definition}
```

followed by Prop `unifleq` (l. 8023–8028): "For every $\mu$,
$\mu_{unif}(\mu^+,2^\mu) \leq 2^{\mu^+}$." Proof: "Easy."

Visible differences from [Sh:88r] (not an equivalence check): the old definition covers
${}^{\mu^+}(2^\mu)$ by sets $A$ with one $c$ per set, $c$ is applied to $f \restriction \delta$
for the same $f$ that is compared, and the condition is that the set where $c$ *agrees* with $f$
is not stationary. [Sh:88r] has one $c_\alpha$ per index, $c_\alpha$ is applied to
$\eta \restriction \delta$ for an arbitrary $\eta \in {}^{\lambda^+}(\lambda^+)$ unrelated to
$\rho$, and the condition is that the set where $c_\alpha$ *disagrees* with $\rho$ is not
stationary.

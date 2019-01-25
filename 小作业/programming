## Week 1

#### 1. Try to derive Hoare’s backward assignment axiom from Floyd’s forward assignment axiom, and the inverse.

- (1) derive forward axiom from Hoare axiom

(1) $P \Rightarrow \exists v E=E[v/V] \wedge P[v/V]$
(2) $\{P[E/V]\}$ $V:= E$ $\{P\}$
(3) $\{P\} V:= E \{\exists v V=E[v/V] \wedge P[v/V]\}$

- (2) derive Hoare axiom from forward axiom

(1) $\exists v. V=E[v/V] \wedge P[v/V]$
(2) 构造一个v使得$P[E/V][v/V] = P[E[v/V]/V]$
(3) $P \Rightarrow \exists v E=E[v/V] \wedge P[v/V]$

#### 2. ‘A formally verified program is a correct program which will always work as required’.

- Q1
    经过形式化证明的程序不一定完全正确，只是基于证明系统的公理和推理规则证明，但是是否符合实际意义，这是不好说的。
- Q2
    停机问题，无法进行数学抽象的程序或者复杂度十分高的模型都不能使用Hoare逻辑对程序进行形式化证明

#### 3. 证明FAC

(1) {x $\in$ N} 前置条件
(2) {x $\in$ N  1=1} 纯逻辑
(3) {1=>y} 
(4) {x $\in$ N $\wedge$ y=1}
(5) {x $\in$ N $\wedge$ y=1 $\wedge$ x = x}
(6) {x $\Rightarrow$ z}
(7) {x $\in$ N $\wedge$ y=1 $\wedge$ z=x}
(8) {x $\in$ N $\wedge \exists k \in N, y=1 \times x \dots \times(x-(k-1)) \wedge z = (x - k)$ }
(9) {z $\ne$ 0}
(10) {$y \times z \Rightarrow y$}
(11) {z - 1 $\Rightarrow$ z}
(12) {while $\urcorner z =0 do \ \ y = y \times z; z=z-1 $}
(13) {x $\in$ N $\wedge \exists k \in N, y=1 \times x \dots \times(x-(k-1)) \wedge z = (x - k) \wedge z=0$ }
(14) {y = x!}

## Week 2

#### 1. Prove

##### 证明Specification合取
$$
(1) P_{1} \wedge P_{2}\Rightarrow P_{1} \\
(2) \{P_{1} \wedge P_{2}\} C \{Q_{1}\} \\
(3) P_{1} \wedge P_{2} \Rightarrow P_{2} \\
(4) \{P_{1} \wedge P_{2} \}C\{Q_{2}\} \\
(5) \{P_{1} \wedge P_{2}\} C \{Q_{1} \wedge Q_{2}\}
$$

##### 证明Specification析取
$$
(1) Q_{1} \Rightarrow Q_{1} \vee Q_{2} \\
(2) \{P_{1}\}C\{Q_{1} \vee Q_{2}\} \\
(3) Q_{2} \Rightarrow Q_{1} \vee Q_{2} \\
(4) \{P_{2}\}C\{Q_{1} \vee Q_{2}\} \\
(5) \{P_{1} \vee P_{2}\}C\{Q_{1} \vee Q_{2}\}
$$

### 2. 证明

* $[T] C [n=91]$
将问题转换成while，if的规则形式

将C转换后得到如下形式
{T}
    m := 91 - n
    while (n $\neq$ 91)
        do
        if (n > 100)
        then n := n - 10;m := m + 10
        else n := n+11; m := m-11
{n = 91}

P = (m+n=91)
S = (n $\neq$ 91)
Q = (n = 91)

(1) P $\wedge \urcorner$ S $\Rightarrow$  Q
(2) P$\wedge$Q $\Rightarrow$ E-R>0

#### Lab

* 不等号修改为键盘输入

```prolog
theory test2
imports Hoare_Logic
begin
lemma mc: "VARS m n::int
    {True}
    m := 91-n;
    WHILE n != 91 INV {m+n=91}
    DO
        IF n > 100 THEN n := n-10; m := m + 10
        ELSE n := n + 11; m := m - 11
        FI
    OD
    {n = 91}"
apply vcg
apply auto
done
end
"
```

## Week 3

#### 1.证明Peano Arithmetic...


#### 2. 证明正确性
(1) {$lo \ge 0 \wedge lo \le hi \wedge hi \le len(A)$}
(2) {pivot := A[hi]}
(3) {$lo \ge 0 \wedge lo \le hi \wedge \le len(A) \wedge pivot := A[hi]$}
(4) {i=lo $\wedge$ j=lo}
(5) {$lo \ge 0 \wedge hi \wedge hi \le len(A) \wedge pivot:=A[hi]$}
(6) {j $le$ hi}
(7) {$lo\ge 0 \wedge lo\le hi\wedge hi \le len(A)⋀pivot≔A[hi] \wedge 𝑖=lo\wedge j=lo\wedge j\le hi$}
(8) IF(A[j] $\le$ pivot) THEN swap A[i],A[j]; i:=i+1; ELSE swap A[i],A[hi]
(9){$lo \ge 0⋀lo \le hi \wedge hi\ le len(A) \wedge pivot≔A[hi] \wedge 𝑖=lo \wedge j=lo \wedge j \le hi \wedge A[j] \wedge pivot,A[i/j],A[j/i],(i+1)/i$}
(10) {$lo \ge 0 \wedge lo \le hi \wedge hi \le len(A) \wedge pivot≔A[hi] \wedge 𝑖=lo \wedge j=lo \wedge j \le hi \wedge A[j] \ge pivot,A[hi/i],A[i/hi]$}
(11) {$lo \ge 0 \wedge lo \le hi \wedge hi \le len(A) \wedge pivot≔A[hi] \wedge (∀k.(k \ge lo \wedge k<i) \Rightarrow A[k] \le pivot)$}
(12) {$lo \ge 0 \wedge lo \le hi \wedge hi \le len(A) \wedge pivot≔A[hi] \wedge (∀k.(k \ge i \wedge k \le hi) \Rightarrow A[k] > pivot)$}
(13) {$(∀k.(𝑘 \ge 𝑙𝑜 \wedge k<i) \Rightarrow A[k] \le pivot) \wedge (∀k.(k \ge i \wedge k \le hi) \Rightarrow A[k] > pivot)$}

#### LAB

```
theory test3
imports Hoare_Logic
begin
lemma Partition:
"
VARS A hi lo pivot i j
    {0 < length(A::('a::order)list)}
    pivot := A[hi];
    i := lo;
    FOR j := lo UNTIL hi-1 DO
        IF(A[j] <= pivot) 
        THEN swap A[i],A[j]; i=i+1;
        ELSE swap A[i],A[hi];
        FI
    OD
}
"
apply vcg_simp
apply auto
done
end
```

## Week 4
#### 1. 证明wp(S, Q)...

#### 2. 证明Soundness

已知$\vdash \{P\}V:=E{[\exists v.V=E[v/V] \wedge P[v/V]]}$，证明$\models \{P\}V:=E \{ \exists v.V = E[v/V] \wedge P[v/V]\}$
$\vdash \{P\}V:=E{[\exists v.V=E[v/V] \wedge P[v/V]]}$
$\vdash \{Q[E/V] V:= E \{Q\} \}$
$\forall s_{1}, s_{2} s_{sem}(Q[E/V]) s_{1} \wedge C_{sem}(V:=E) s_{1},s_{2} \Rightarrow S_{sem}Q_{s2}$
$\forall s_{1} S_{sem}(Q[E/V])s_{1} \Rightarrow S_{sem} Q(S_{1}[(E_{sem}, E_{s_{1}})/v])$
$Q \Rightarrow {\exists v.V=E[v/V] \wedge P[v/V]}$
即$Q \vdash \{P\}V:=E \{ \exists v.V = E[v/V] \wedge P[v/V]\}$，也就得出
$\models \{P\}V:=E \{ \exists v.V = E[v/V] \wedge P[v/V]\}$

#### 3. 改良规则 for-command

#### 4. DutchFlag问题

快速排序可以满足题目要求
(1) 令lo=0, hi=N-1, 第一个元素作为pivot
(2) hi从后向前搜索到第一个比p小的元素，key和当前位置元素交换
(3) 从lo向后搜索第一个比p大的元素和p的值进行交换
(4) 重复2-3步直到lo>=hi
(5) 循环结束后，A[lo..m]元素总比p小，A[m..hi]总比p大

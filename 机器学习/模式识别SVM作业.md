# 模式识别SVM作业

* 201828013229075
* 李佳政
* 计算技术研究所

## 1. SVM硬间隔

* 划分超平面判别函数定义为,

$$w^{T}x + b = 0$$

* 令数据集中的点有如下形式，

$$\begin{cases} 
w^{T}x_{i} + b = +1, & y_i=+1,\\
w^{T}x_{i} + b = -1, & y_i=-1
\end{cases}$$

* 所以最近的两个点$x_{1}$,$x_{2}$之间的间隔为

$$\gamma=\frac{1}{2}\frac{w^{T}x_1-x2}{||w||}=\frac{1}{||w||}$$

* 欲要找到最大的间隔，也就是最大化$\frac{1}{||w||}$，等价于最小化$||w||^2$，选择平方是因为可以转换为凸二次优化问题，同时方便后面使用拉格朗日乘子法求导,可以得到如下SVM表达形式,

$$
\mathop {\min } \limits_{w,b} \frac{1}{2}||w||^2 \\
{\rm s.t.}\ \ \  y_i(w^Tx_i+b) \geqslant 1, \ \ \ \ i=1,2,...m.
$$

* 根据拉格朗日乘子法，可以得到对偶问题，其中$\alpha_i \geqslant 0$为拉格朗日乘子.

$$
\begin{aligned}
L(w,b,\alpha) &= \frac{1}{2}||w||^2 + \sum_{i=1}^m \alpha_i(1-y_i(w^Tx_i+b)) \\
&= \frac{1}{2}||w||^2+\sum_{i=1}^{m}\alpha_i - w^T\sum_{i=1}^{m}\alpha_iy_ix_i - b\sum_{i=1}^{m}\alpha_i y_i \\
\end{aligned}
$$

* 令$L(w,b,\alpha)$对$w$与$b$分别求偏导为0可得,

$$
\begin {aligned}
w &= \sum_{i=1}^{m}\alpha_iy_ix_i, \\
0 &= \sum_{i=1}^{m}\alpha_iy_i.\\
\end {aligned}
$$

* 代入$L(w, b, \alpha)$后可得，

$$
\begin{aligned}
\mathop {\max} \limits_{\alpha}
L(w, b, \alpha) &= -\frac{1}{2}w^Tw + \sum_{i=1}^{m}\alpha_i  \\
&= -\frac{1}{2}\sum_{i=1}^{m}\sum_{j=1}^{m}\alpha_i \alpha_j y_i y_j x_i^T x_j + \sum_{i=1}^{m}\alpha_i \\
{\rm s.t.} & \sum_{i=1}^{m}\alpha_i y_i = 0, \\
& \alpha_i \geqslant 0, i=1, 2, ... , m
\end{aligned}
$$

* 解出$\alpha$后，我们可以得到判别函数超平面可以得到模型,

$$
\begin{aligned}
    f(x) &= w^Tx + b \\
         &= \sum_{i=1}^{m}\alpha_i y_i x_i^T x +b
\end{aligned}
$$

* 因为上述过程需要满足KKT(Karush-Kuhn-Tucker)条件,

$$
\begin{cases}
\alpha_i \geqslant 0; \\
y_i f(x_i) - 1 \geqslant 0; \\
\alpha_i (y_i f(x_i) - 1) = 0;
\end{cases}
$$

根据KKT的第三个条件可知,$\alpha_i=0$或$y_i f(x_i) = 1$至少有一个满足，所以可以看出，如果$\alpha_i > 0$，那么必有$y_i f(x_i) = 1$, 所对应的样本点位于最大的间隔边界上，是一个支持向量。而$\alpha_i=0$的样本点对最终模型没有影响。
结论：在硬间隔条件下，训练完成后，大部分的训练样本都不需要保留，最终模型仅与支持向量有关.

* 由于数据集每个类别只有一个样本，则必定为支持向量，所以最终模型$f(x)$为,

$$
\begin{cases}
\alpha_1 - \alpha_2 = 0 \\
w = \alpha_1 x_1 - \alpha_2 x_2 \\
b = \frac{1}{2} ((1-w^T x_1) + (-1-w^T x_2)) \\
\end{cases}
f(x) = w^T x + b
$$

* 其中$\alpha_1$与$\alpha_2$的选取不影响超平面的方向，但应以最小化$w^Tw$的原则取。

## 2. 高斯核无限维度内积

* 核内积形式,

$$
\kappa(x_1, x_2) = x_1x_2
$$

* 高斯核

$$
\begin{aligned}
    \kappa(x_1, x_2) &= e^{-\frac{||x_1-x_2||^2}{2\sigma^2}}
\end{aligned}
$$

* 根据$e^x$的泰勒展开公式可知，

$$
e^x \approx 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \frac{x^4}{4!} + \dots + \frac{x^n}{n!}
$$

* 那么把上述泰勒展开带入高斯核可以得到一个无穷维度的映射:

$$
\kappa(x_1, x_2) = 1 + (-\frac{||x_1-x_2||^2}{2\sigma^2}) + \frac{(\frac{-||x_1-x_2||^2}{2\sigma^2})^2}{2!} + \dots + \frac{(\frac{-||x_1-x_2||^2}{2\sigma^2})^n}{n!}
$$

* 其中距离函数可以得出，

$$
||x_1 - x_2||^2 = x_1^Tx_1 + 2x_1x_2 + x_2^Tx_2 
$$

* **结论**：所以高斯核最终可以表达为一个无限维度(n)的特征向量内积乘积。
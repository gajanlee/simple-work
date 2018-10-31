# Reading Report
* 姓名：李佳政
* 学号：201828013229075

## Title: Lasso Shrinage

**LASSO**: Least Absolute Shrinkage and Selection Operator

### Two advantages
* Reduce over fitting. Original least squares have low bias but large variance, so it is overfitting the train set.
* Feature selection. Ridge regression is a continuous process, so its result weight matrix is more dense than lasso.

### Orthonormal Formulae
The shrinkage can be gleaned from the orthonormal design case, therefore, the original equation can be easily shown to be
$$ \beta_{j} = \rm{sign}(\beta_{j}^{0})(|\beta_{j}^{0}|-\gamma)^{+}$$

The $\gamma$ is used to select feature. We can know that

### Insight from 1996 to 2018
Because the paper is public in 1996, it's a really long peroid from now.

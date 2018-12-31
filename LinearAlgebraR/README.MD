# Linear Algebra for Data Science in R
## Eric Eager

# Introduction to Linear Algebra
- **Linear Algebra** is the study of linear systems of equations.
- The most basic unit is the **Vector** which is a collection on *N* elements.
- The **Traspose** of a vector is when you exchange the X and Y values along the diagonal axis.
- You can create vectors using the function `rep()`.
- You can create vectors with patterns using the function `seq()`.
- You can create a vector by the function `c()` and the values separated by a comma.
- **Matrices** are simply the superimposition of vectors.
- You can create a matrix using the function `matrix()`.
- The addition symbol on vectors adds them element by element.
-  A Matrix with M columns and N rows can only be multiplied by another matrix with M rows.
- To do **Matrix Multiplication**, you would use the operator `%*%`.
- Remember that `B%*%A` is not the same as `A%*%B`; order matters.
- The identity matrix is one that is full of 0's aside from the diagonal full of ones.
- You can find the inverse of a matrix using the function `solve()`.


# Matrix-Vector Equations
- A Fundamental question is whether an object can be built from other atomic objects; are they unique?
- A system of linear equations must have only a single solution.
- To check to if a solution exists:
  * Does it have an inverse?
  * The determinant is non-zero.
  * The rows and columns of the Matrix form a basis.
    - A **Basis** being the set of all vectors with n elements.
- You can tell if a matrix is invertible in if you get a return matrix from the function `solve(<M>)`.
- You can get the determinant of a matrix using the function `det(<M>)`.
```
# A-1 * b equation in R
x <- solve(A)%*%b
```
- If you have more equations than unknownws, then there must be redundant information.
- Some options for solving non-square matrices:
  * Row Reduction: by hand.
  * Least Squares: more rows than columns.
  * Singular Value Decomposition: More columns than rows.
- You can find the Moore Penrose Generalized inverse using the function `MASS::ginv()`.
- This is not a true inverse but a best attempt at some of the same properties.


# Eigenvalues and Eigenvectors
- Eigenvalues and Eigenvectors are what are used for Computer Vision.
- The goal is to create a few matrices that have the same effect as scalar multiplication.
- Eigenvectors are entirely about direction and not magnitude.
- You can get the eigen values using the function `eigen()`.
- If the eigenvalues λ1, λ2, ..., λn of AA are distinct and v1, v2, ..., vn is a set of associated eigenvectors, then this set of vectors forms a **Basis** for the set of n-dimensional vectors.
- Eigenpairs turn matrix multiplication into a linear combination of scalar multiplications.


# Principal Component Analysis
- **Principle Component Analysis** is the most common form of dimensional reduction in Machine Learning.
- While having more rows is usually an improvement, it is not always the case thinking about columns.
- The *eigenvectors* on (A^t*A)/(n-1) and the corresponding eigenvectors are orthogonal.
- The total variance of the data is the sum of the eigenvalues in this calculation.
- Those *eigenvalues* are the principle components of the data in matrix A.
- You can get the *PCA* using the function `prcomp()`.


# Research:

# Reference:

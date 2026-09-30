# Maths & Statistics Foundations

[← ML model families](08-ml-model-families.md) · [Back to README](../README.md) · [Next: Data engineering →](10-data-engineering.md)

You do not need to finish a degree's worth of mathematics before touching data. It is often more effective to learn the mathematical idea when a real analysis or model gives you a reason to care.

This page is a map of the foundations that repay the effort.

## Descriptive statistics

Start with mean, median, percentiles, variance, standard deviation, distributions, outliers, covariance, and correlation. These tools let you summarise what data looks like before you fit anything complicated.

Important habit: a single average can hide multiple groups, skew, outliers, or changing behaviour over time. Plot the data.

## Probability

Probability gives a language for uncertainty. Useful early topics include:

- events and conditional probability;
- independence;
- random variables;
- expectation and variance;
- common distributions (Bernoulli, binomial, normal, Poisson);
- Bayes' rule.

[Seeing Theory](https://seeing-theory.brown.edu/) is a visual introduction to probability and statistics. [Khan Academy's statistics and probability course](https://www.khanacademy.org/math/statistics-probability) offers a broad path with exercises.

## Statistical inference

Inference asks what a sample tells us about a larger population or process. Core ideas include:

- sampling and sampling bias;
- estimators;
- confidence intervals;
- hypothesis tests and p-values;
- statistical power;
- experimental versus observational studies;
- multiple comparisons.

Learn the limitations alongside the formulas. A tiny p-value does not tell you the effect is practically important, and observational data does not automatically establish causation.

## Linear algebra

Machine learning and numerical computing use vectors and matrices everywhere. Prioritise:

- vectors and dot products;
- matrices and matrix multiplication;
- systems of linear equations;
- norms and distance;
- projections;
- eigenvalues/eigenvectors and singular value decomposition (later, when PCA gives you a reason).

[3Blue1Brown's Essence of Linear Algebra](https://www.3blue1brown.com/topics/linear-algebra) is excellent for visual intuition.

## Calculus and optimisation

You do not need advanced calculus for every data role, but derivatives help explain how models are fitted.

Useful topics:

- functions and rates of change;
- derivatives and partial derivatives;
- gradients;
- chain rule;
- minima/maxima;
- gradient descent.

The goal is to understand statements like “the optimiser changes the parameters in the direction that reduces the loss.”

## Information and loss functions

As you progress, terms such as entropy, cross-entropy, likelihood, log-likelihood, and KL divergence appear frequently. Learn them when you encounter classification, probabilistic modelling, or information theory rather than memorising them in isolation.

## Experimental design and causality

Data science often influences decisions, so “does X cause Y?” matters. Learn to distinguish:

- randomised experiment vs observational study;
- correlation vs causation;
- confounder vs mediator;
- selection bias;
- treatment/control groups;
- pre-registration and multiple testing concerns.

Even a basic awareness prevents confidently answering questions that the data cannot support.

## Resources by level

**Gentle / visual**

- [Seeing Theory](https://seeing-theory.brown.edu/) — visual probability and statistics.
- [Khan Academy: Statistics and probability](https://www.khanacademy.org/math/statistics-probability) — broad, exercise-based path.
- [3Blue1Brown](https://www.youtube.com/@3blue1brown) — visual maths channel; especially linear algebra and calculus series.

**Data/ML-oriented**

- [StatQuest](https://www.youtube.com/@statquest) — statistics and ML concepts in compact visual lessons.
- [OpenIntro Statistics](https://www.openintro.org/book/os/) — free textbook with exercises and datasets.

**More formal**

- [Mathematics for Machine Learning](https://mml-book.github.io/) — linear algebra, analytic geometry, matrix decompositions, vector calculus, probability/continuous optimisation, then ML applications.

## Practice checkpoint

Take one real dataset. For one numeric column, calculate mean, median, standard deviation, and percentiles, then draw a histogram. Write two sentences explaining what the plot shows that the mean alone does not.

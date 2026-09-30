# Machine-Learning Model Families

[← Docker](07-docker.md) · [Back to README](../README.md) · [Next: Maths & statistics →](09-maths-statistics.md)

## What is a machine-learning model?

A machine-learning model is a parameterised function or procedure that learns patterns from data so it can make predictions, assign scores, group observations, reduce dimensions, or otherwise generalise beyond the exact examples it was shown.

“Model” covers very different things, from a straight regression line to an ensemble of thousands of decision trees. The important early skill is recognising **what kind of problem you have**, not memorising every algorithm.

## Supervised versus unsupervised learning

### Supervised learning

You have input features `X` and a target/label `y` that represents the answer you want to predict.

- **Regression:** predict a numerical value, such as delivery time.
- **Classification:** predict a category or probability, such as whether a customer will churn.

### Unsupervised learning

You do not supply a labelled target. The algorithm tries to find useful structure in the inputs.

- **Clustering:** group similar observations.
- **Dimensionality reduction:** represent data with fewer variables while retaining important structure.
- **Anomaly detection:** find unusual observations (some anomaly methods are supervised, many are not).

There are also semi-supervised, self-supervised, reinforcement, ranking, and other learning settings. Supervised/unsupervised is the right first distinction, not the final taxonomy.

## Families of models

### Linear models

Linear regression, logistic regression, and related models combine features using learned weights. They are fast, strong baselines, and often easier to interpret than more complex models. “Linear” refers to the form in the model parameters; feature engineering can still express useful nonlinear relationships.

### Decision trees

A decision tree repeatedly splits data with rules such as `age < 30`. Trees naturally capture nonlinear interactions and are easy to visualise when small, but a single deep tree can overfit.

### Ensembles of trees

**Random forests** train many decorrelated trees and aggregate them. **Gradient-boosted trees** build trees sequentially so later trees correct earlier errors. Tree ensembles are extremely strong for many structured/tabular prediction problems.

### Support Vector Machines (SVMs)

SVMs find separating boundaries with a maximum-margin idea and can use kernels to model nonlinear boundaries. They can work very well on medium-sized, carefully scaled datasets but may be less convenient on very large datasets.

### Nearest neighbours

Methods such as k-nearest neighbours (k-NN) predict based on nearby training examples. They are intuitive and useful baselines, but prediction becomes expensive as the dataset grows and distance becomes less meaningful in very high-dimensional spaces.

### Naive Bayes

Probabilistic classifiers that make strong simplifying independence assumptions. Despite the “naive” assumption, they can be effective for tasks such as text classification and are fast to train.

### Neural networks

Layered models that learn flexible nonlinear representations. They dominate many image, language, audio, and other high-dimensional tasks. They can also be used for tabular data, although simpler models are often competitive there.

### Clustering

Clustering tries to discover groups without labelled answers. k-means optimises around cluster centres; hierarchical clustering builds a tree of groups; density-based methods such as DBSCAN/HDBSCAN can identify irregularly shaped clusters and noise.

### Dimensionality reduction

PCA finds directions capturing variance; manifold-learning approaches can create nonlinear lower-dimensional representations. Dimensionality reduction can support visualisation, compression, noise reduction, or downstream modelling.

## Specific models and algorithms

| Model / algorithm | Family | Supervised? | Typical use / intuition |
|---|---|---|---|
| Linear Regression | Linear model | Yes — regression | Predict a numeric target with a weighted combination of features. |
| Logistic Regression | Linear model | Yes — classification | Model class probability through a linear decision boundary in feature space. |
| Decision Tree | Tree | Yes | Learn a sequence of if/then splits for regression or classification. |
| Random Forest | Bagged tree ensemble | Yes | Average/vote across many trees to improve stability and reduce variance. |
| Gradient Boosting | Boosted tree ensemble | Yes | Build weak trees sequentially to correct previous errors. |
| [XGBoost](https://xgboost.readthedocs.io/en/stable/python/python_intro.html) | Gradient-boosted trees | Yes | Highly optimised boosting library widely used on structured/tabular data. |
| k-NN | Nearest neighbours | Yes | Predict from the outcomes of nearby training observations. |
| SVC / SVR | Support vector machine | Yes | Margin-based classification/regression, optionally with nonlinear kernels. |
| Naive Bayes | Probabilistic | Yes | Fast classifier with conditional-independence assumptions. |
| Multilayer Perceptron | Neural network | Yes (commonly) | General-purpose feed-forward nonlinear model. |
| [KMeans](https://scikit-learn.org/stable/modules/clustering.html#k-means) | Clustering | No | Group observations around `k` learned centres. |
| DBSCAN | Density-based clustering | No | Find dense regions and label sparse points as noise. |
| PCA | Dimensionality reduction | No | Project data onto directions that explain the most variance. |
| Isolation Forest | Anomaly detection | Usually no | Isolate unusual points using random tree partitions. |

## Model choice is not just algorithm choice

A complete modelling process also includes:

- defining the target correctly;
- splitting training/validation/test data without leakage;
- choosing meaningful metrics;
- preprocessing features;
- handling class imbalance;
- cross-validation;
- tuning hyperparameters;
- analysing errors;
- checking fairness, drift, and operational constraints;
- establishing a baseline.

A sophisticated algorithm on a badly defined target is still a bad model.

## Overfitting and generalisation

A model **overfits** when it learns the training data too specifically and performs poorly on new data. We care about **generalisation**: performance on data that represents future/unseen cases.

This is why train/test splits and cross-validation are central. Never repeatedly look at the test set while choosing the model and then call that number an unbiased final estimate.

## Metrics depend on the problem

Accuracy can be misleading for rare events. Mean squared error may punish large regression errors more strongly than you want. Ranking systems need ranking metrics. Forecasts need time-aware validation. Learn metrics alongside models.

## Resources by level

**Very approachable**

- [StatQuest with Josh Starmer](https://www.youtube.com/@statquest) — visual explanations of statistics and ML algorithms without skipping the important ideas.
- [Google Machine Learning Crash Course](https://developers.google.com/machine-learning/crash-course) — practical fundamentals and exercises.

**Hands-on with Python**

- [scikit-learn](https://scikit-learn.org/stable/) — model families, preprocessing, evaluation, pipelines, examples.
- [scikit-learn MOOC](https://inria.github.io/scikit-learn-mooc/) — free course recommended by the scikit-learn project.
- [XGBoost getting started](https://xgboost.readthedocs.io/en/latest/get_started.html) — focused introduction to boosted trees.

**Deeper theory**

- [An Introduction to Statistical Learning](https://www.statlearning.com/) — free textbook with a more statistical treatment and labs.
- [The Elements of Statistical Learning](https://hastie.su.domains/ElemStatLearn/) — advanced reference; not a first ML text.

## Practice checkpoint

Choose one small classification dataset. Fit a logistic regression, decision tree, and random forest with scikit-learn. Use the same train/test split and metric for all three. Compare results, but also compare training time, interpretability, and failure cases. The goal is not to crown a permanent “winner”; it is to see how model families behave differently.

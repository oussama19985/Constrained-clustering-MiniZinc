# Constrained-clustering-MiniZinc

A generic clustering algorithm with "must-link" and "cannot-link" constraints.

The first model implements a clustering algorithm that takes randomized or custom input data (distance matrix) coupled with "must-link"/"cannot-link" constraints and outputs the assigned cluster for each instance without any constraint on the minimal number of instances per cluster.
Similarly, the second model outputs the the assigned cluster for each example, but each cluster must contain a minimal number of exemples specified by the user.

We observe that adding/removing "must-link"/"cannot-link" constraints has a good impact on the model's performance.

Note: "must-link" and "cannot-link" constraints are additional information provided by the user as input.

Oussama Chiboub

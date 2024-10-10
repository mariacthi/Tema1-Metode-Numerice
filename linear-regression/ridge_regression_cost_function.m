function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation

  % very similar to linear_regression_cost_function and
  % lasso_regression_cost_function

  [m, n] = size(FeatureMatrix);
  t = length(Theta);

  % finding h(x) for every line of the FeatureMatrix
  % by skipping the first element of Theta so that
  % the dimensions fit
  h = FeatureMatrix * Theta(2 : t);

  Error= (1 / (2 * m)) * sum ((h - Y) .^ 2);

  Error += lambda * sum(Theta .^ 2);

endfunction

function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation


  [m, n] = size(FeatureMatrix);
  t = length(Theta);

  % finding h(x) for every line of the FeatureMatrix
  % by skipping the first element of Theta so that
  % the dimensions fit
  h = FeatureMatrix * Theta(2 : t);

  % almost the same function as linear_regression_cost_function,
  % the only difference is the second term in the sum (lambda * norm)
  Error= (1 / m) * sum ((Y - h) .^ 2 + lambda * norm(Theta, 1));
endfunction

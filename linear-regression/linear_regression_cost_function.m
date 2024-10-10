function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation

  [m, n] = size(FeatureMatrix);
  t = length(Theta);

  % finding h(x) for every line of the FeatureMatrix
  % by skipping the first element of Theta so that
  % the dimensions fit
  h = FeatureMatrix * Theta(2 : t);

  % h will contain on each line the value for each respective
  % line in FeatureMatrix, so I can directly subtract Y from it
  Error = (1 / (2 * m)) * sum ((h - Y) .^ 2);
endfunction

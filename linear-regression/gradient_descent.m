function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation

  Theta = zeros(n, 1);

  for i = 1 : iter
    % calculating the prediction
    h = FeatureMatrix * Theta;

    % Y has to be transposed to fit the dimensions of the
    % values calculated before
    error = h - Y;

    % the formula uses the elements from FeatureMatrix by columns
    % so it needs to be transposed to be able to calculate the gradient
    grad = (1 / m) * FeatureMatrix' * error;

    Theta = Theta - alpha * grad;
  endfor

  % adding the first value in the vector of weights
  Theta = [0; Theta];
endfunction

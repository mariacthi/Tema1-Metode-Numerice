function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers

  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg

  % TODO: cost_function implementation

  % TODO1: get Theta1 and Theta2 (from params). Hint: reshape

  t1 = hidden_layer_size * (input_layer_size + 1);
  Theta1 = reshape(params(1 : t1), hidden_layer_size, input_layer_size + 1);

  Theta2 = reshape(params((1 + t1) : end), output_layer_size, ...
                   hidden_layer_size + 1);

  % TODO2: Forward propagation

  % adding a column of 1 to the feature matrix (the bias)
  m = size(X, 1);
  a1 = [ones(m, 1) X];

  % calculating activations of the hidden layer
  z2 = Theta1 * a1';
  a2 = [ones(1, m); sigmoid(z2)];

  % calculating activations of the output layer
  z3 = Theta2 * a2;
  a3 = sigmoid(z3);

  % TODO3: Compute the error in the output layer and perform backpropagation

  %Convert the labels to binary vectors
  y_vec = zeros(output_layer_size, m);
  for i = 1 : m
    y_vec(y(i), i) = 1;
  endfor

  error3 = a3 - y_vec;

  % calculating the error in the hidden layer
  deriv_sigmoid = a2 .* (1 - a2);
  error2 = (Theta2' * error3) .* (deriv_sigmoid);

  % eliminating the bias component
  error2(1, :) = [];

  % TODO4: Determine the gradients

  delta2 = error3 * a2';
  delta1 = error2 * a1;

  grad1 = (1 / m) * delta1;
  grad1(:, 2 : end) += (lambda / m) * Theta1(:, 2 : end);

  grad2 = (1 / m) * delta2;
  grad2(:, 2 : end) += (lambda / m) * Theta2(:, 2 : end);

  % TODO5: Final J and grad

  grad = [grad1(:); grad2(:)];

  J = (1 / m) * sum(sum((-y_vec) .* log(a3) - (1 - y_vec) .* log(1 - a3)));
  J += (lambda / (2 * m)) * sum(sum(Theta1(:, 2 : end) .^ 2));
  J += (lambda / (2 * m)) * sum(sum(Theta2(:, 2 : end) .^ 2));
endfunction

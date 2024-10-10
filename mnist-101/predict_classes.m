function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers

  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter

  % TODO: predict_classes implementation

  t1 = hidden_layer_size * (input_layer_size + 1);
  Theta1 = reshape(weights(1 : t1), hidden_layer_size, input_layer_size + 1);

  Theta2 = reshape(weights((1 + t1) : end), output_layer_size, ...
                   hidden_layer_size + 1);

  % forward propagation
  % adding a column of 1 to the feature matrix (the bias)
  m = size(X, 1);
  a1 = [ones(m, 1) X];

  % calculating activations of the hidden layer
  z2 = Theta1 * a1';
  a2 = [ones(1, m); sigmoid(z2)];

  % calculating activations of the output layer
  z3 = Theta2 * a2;
  a3 = sigmoid(z3);

  [~, classes] = max(a3);
  classes = classes';
endfunction

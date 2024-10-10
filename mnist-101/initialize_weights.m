function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values

  % TODO: initialize_weights implementation

  epsilon = sqrt(6) / sqrt(L_prev + L_next);

  % the values of the matrix will be randomly generated
  % numbers that are included in the interval (-epsilon, epsilon)
  matrix = 2 * epsilon * rand(L_next, L_prev + 1) - epsilon;
endfunction

function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  % TODO: normal_equation implementation

  A = FeatureMatrix' * FeatureMatrix;
  Theta = zeros(columns(FeatureMatrix), 1);

  % calculating the eigenvalues of the system matrix
  eigvalues = eig(A);

  for i = 1 : length(eigvalues)
    if (eigvalues(i) < 0)
      % the system matrix is not positive definite
      Theta = [0; Theta];
      return;
    endif
  endfor

  b = FeatureMatrix' * Y;

  Theta_new = conjugate_gradient(A, b, Theta, tol, iter);
  Theta = [0; Theta_new];
endfunction

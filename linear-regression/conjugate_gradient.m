function [x] = conjugate_gradient(A, b, x0, tol, max_iter)
  % taken from the pseudocode in the theoretical part
  r = b - A * x0;
  v = r;
  x = x0;
  tol_squared = tol ^ 2;
  k = 1;

  while k <= max_iter && r' * r > tol_squared
    t = (r' * r) / (v' * A * v);
    x = x + t * v;
    r_1 = r - t * A * v;
    s = (r_1' * r_1) / (r' * r);
    r = r_1;
    v = r + s * v;
    k += 1;
  endwhile
endfunction

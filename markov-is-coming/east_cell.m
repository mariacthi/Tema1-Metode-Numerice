function [rows, cols] = east_cell(rows_old, cols_old, i, j, m, n)
  % the current cell doesn't have a wall to the east (it has the posibility
  % of moving to the east cell)

  if j < n
     [rows, cols] = add_new_pos(rows_old, cols_old,
                    (i - 1) * n + j, (i - 1) * n + j + 1);
  elseif j == n
    % there is no cell to the east -> LOSE
    [rows, cols] = add_new_pos(rows_old, cols_old, (i - 1) * n + j, m * n + 2);
  endif

endfunction

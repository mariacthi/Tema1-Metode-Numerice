function [rows, cols] = north_cell(rows_old, cols_old, i, j, m, n)
  % the current cell doesn't have a wall to the north (it has the posibility
  % of moving to the north cell)

  if i > 1
    [rows, cols] = add_new_pos(rows_old, cols_old,
                   (i - 1) * n + j, (i - 2) * n + j);
  elseif i == 1
    % there is no cell to the north -> WIN
    [rows, cols] = add_new_pos(rows_old, cols_old, (i - 1) * n + j, m * n + 1);
  endif

endfunction

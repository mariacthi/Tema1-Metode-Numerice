function [rows, cols] = south_cell(rows_old, cols_old, i, j, m, n)
  % the current cell doesn't have a wall to the south (it has the posibility
  % of moving to the south cell)

  if i < m
    [rows, cols] = add_new_pos(rows_old, cols_old, (i - 1) * n + j, i * n + j);
  elseif i == m
    % there is no cell to the south -> WIN
    [rows, cols] = add_new_pos(rows_old, cols_old, (i - 1) * n + j, m * n + 1);
  endif

endfunction

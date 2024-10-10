function [rows, cols] = west_cell(rows_old, cols_old, i, j, m, n)
  % the current cell doesn't have a wall to the west (it has the posibility
  % of moving to the west cell)

  if j > 1
    [rows, cols] = add_new_pos(rows_old, cols_old,
                   (i - 1) * n + j, (i - 1) * n + j - 1);
  elseif j == 1
    % there is no cell to the west -> LOSE
    [rows, cols] = add_new_pos(rows_old, cols_old, (i - 1) * n + j, m * n + 2);
  endif

endfunction

function [rows, cols] = add_new_pos(rows_old, cols_old, row_index, col_index)
  % adding a new element to the arrays used for the sparse matrix

  rows = [rows_old, row_index];
  cols = [cols_old, col_index];
endfunction

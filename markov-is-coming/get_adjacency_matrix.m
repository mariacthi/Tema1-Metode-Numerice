function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Adj -> the adjacency matrix associated to the given labyrinth

  % TODO: get_adjacency_matrix implementation

  m = rows(Labyrinth);
  n = columns(Labyrinth);

  rows = [];
  cols = [];
  ones = [];

  for i = 1 : m
    for j = 1 : n
      % obtaining the binary form of the number in the Labyrinth
      bytes = reshape(dec2bin(Labyrinth(i, j), 4), 4, []);
      bytes = flip(bytes);

      % when the byte is 0, then that means we can move at the cell
      % situated at west/ east/ south/ north, as per each of the
      % following cases

      if bytes(1) == '0'
        [rows, cols] = west_cell(rows, cols, i, j, m, n);
        ones = [ones, 1];
      endif

      if bytes(2) == '0'
        [rows, cols] = east_cell(rows, cols, i, j, m, n);
        ones = [ones, 1];
      endif

      if bytes(3) == '0'
        [rows, cols] = south_cell(rows, cols, i, j, m, n);
        ones = [ones, 1];
      endif

      if bytes(4) == '0'
        [rows, cols] = north_cell(rows, cols, i, j, m, n);
        ones = [ones, 1];
      endif
    endfor
  endfor

  % adding the 2 cases of WIN and LOSE
  [rows, cols] = add_new_pos(rows, cols, m * n + 1, m * n + 1);
  [rows, cols] = add_new_pos(rows, cols, m * n + 2, m * n + 2);
  ones = [ones, 1, 1];

  Adj = sparse(rows, cols, ones, m * n + 2, m * n + 2);
endfunction



function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Link -> the link matrix associated to the given labyrinth

  % TODO: get_link_matrix implementation

  Adj = get_adjacency_matrix(Labyrinth);
  m = rows(Adj);
  n = columns(Adj);

  % finding the rows that have nonzero elemnents in them
  nonzero_rows = find(sum(Adj, 2) != 0);
  r = length(nonzero_rows);

  % initiating the arrays that will contain the data needed for the
  % sparse Link matrix
  rows_link = [];
  cols_link = [];
  values_link = [];

  for i = 1 : r
    % here I am interested in finding the columns of the nonzero elements
    % on each nonzero row I found previously
    [rows_array, cols_array, values_array] = find(Adj(nonzero_rows(i), :));
    c = length(cols_array);

    for j = 1 : c
      rows_link = [rows_link, nonzero_rows(i)];
      cols_link = [cols_link, cols_array(j)];
      values_link = [values_link, 1.0 / c];
    endfor
  endfor

  Link = sparse(rows_link, cols_link, values_link, m, n);
endfunction

function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix

	% path -> the states chosen by the algorithm

  % TODO: heuristic_greedy implementation

  path = [start_position];

  m = rows(Adj);
  n = columns(Adj);
  visited = zeros(1, m * n);

  visited(start_position) = 1;
  % 1 = true
  % 0 = false

  while !isempty(path)
    position = path(end);

    if (position == m - 1)
      return;
    endif

    % finding the columns that contain nonzero elements in the adjacency
    % matrix on the line of the current position (finding the neighbours)
    [rows_array, cols_array, values_array] = find(Adj(position, :));
    c = length(cols_array);

    ok = 0;
    max_prob = 0;
    for i = 1 : c
      if visited(cols_array(i)) == 0
        ok = 1;
        if probabilities(cols_array(i)) > max_prob
          % if there is at least one unvisited neighbour, then I also
          % check for the maximum probability among the neighbours
          max_prob = probabilities(cols_array(i));
          neigh = cols_array(i);
        endif
      endif
    endfor

    if ok == 0
      % position has no unvisited neighbours
      path(end) = [];
    endif

    visited(neigh) = 1;
    path = [path, neigh];
  endwhile

endfunction

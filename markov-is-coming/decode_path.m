function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns

	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation

  l = length(path);
  for i = 1 : (l - 1)
    % decoded_path(i, 1) -> the index of the line
    % decoded_path(i, 2) -> the index of the column
    decoded_path(i, 1) = idivide(path(i), int32(cols)) + 1;
    decoded_path(i, 2) = rem(path(i), cols);

    if decoded_path(i, 2) == 0
      decoded_path(i, 2) += cols;
      decoded_path(i, 1) -= 1;
    endif
  endfor
endfunction

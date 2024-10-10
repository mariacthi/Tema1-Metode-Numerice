function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  % TODO: parse_labyrinth implementation

  fid = fopen(file_path, "rt");
  if (fid < 0)
    error("Cannot open file");
  endif


  % reading the number of rows and columns from the file
  m = fscanf(fid, "%d", 1);
  n = fscanf(fid, "%d", 1);

  % reading the elements of the matrix from the file
  Labyrinth = zeros(m, n);
  for i = 1 : m
    for j = 1 : n
      Labyrinth(i, j) = fscanf(fid, "%d", 1);
    endfor
  endfor

  fclose(fid);
endfunction

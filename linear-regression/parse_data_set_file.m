function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_data_set_file implementation

  fid = fopen(file_path, "rt");
  if (fid < 0)
    error("Cannot open file");
  endif

  % reading the number of rows and columns from the file
  m = fscanf(fid, "%d", 1);
  n = fscanf(fid, "%d", 1);

  Y = [];
  InitialMatrix = cell(m, n);

  for i = 1 : m
    % reading the first number of each line
    elem = fscanf(fid, "%d", 1);
    Y = [Y; elem];

    for j = 1 : n
      % reading the rest of the elements of the line as strings
      elem = fscanf(fid, "%s", 1);
      InitialMatrix{i, j} = elem;
    endfor
  endfor

  fclose(fid);
endfunction

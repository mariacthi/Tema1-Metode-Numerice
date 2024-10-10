function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation

  fid = fopen(file_path, "rt");
  if (fid < 0)
    error("Cannot open file");
  endif

  % reading the first line and splitting it to find out how many
  % cells has one line in the csv file (columns)
  header = fgetl(fid);
  headers = strsplit (header, ",");
  columns = length(headers);

  % reading the rest of the file to find out how many lines it has
  data = textscan(fid, "%s", "Delimiter", ",");
  lines = length(data{1}) / columns;

  Y = [];
  InitialMatrix = cell(lines, columns - 1);

  for i = 1 : lines
    Y = [Y; str2num(data{1}{(i - 1) * columns + 1})];

    for j = 2 : columns
      InitialMatrix{i, j - 1} = data{1}{(i - 1) * columns + j};
    endfor
  endfor

  fclose(fid);
endfunction

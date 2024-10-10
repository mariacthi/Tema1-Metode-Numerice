function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % TODO: prepare_for_regression implementation

  [m, n] = size(InitialMatrix);

  for i = 1 : m
    % index for the columns of the FeatureMatrix, which is needed because
    % it might be different from the number of columns the InitialMatrix has
    new_column = 1;

    for j = 1 : n
      % comparing the string with the 5 words that are possible
      % and if it's none of them, then the string is a number
      % that can be converted using str2num function
      if strcmp(InitialMatrix{i, j}, 'yes')
        FeatureMatrix(i, new_column) = 1;
      elseif strcmp(InitialMatrix{i, j}, 'no')
        FeatureMatrix(i, new_column) = 0;
      elseif strcmp(InitialMatrix{i, j}, 'semi-furnished')
        FeatureMatrix(i, new_column) = 1;
        new_column += 1;
        FeatureMatrix(i, new_column) = 0;
      elseif strcmp(InitialMatrix{i, j}, 'unfurnished')
        FeatureMatrix(i, new_column) = 0;
        new_column += 1;
        FeatureMatrix(i, new_column) = 1;
      elseif strcmp(InitialMatrix{i, j}, 'furnished')
        FeatureMatrix(i, new_column) = 0;
        new_column += 1;
        FeatureMatrix(i, new_column) = 0;
      else
        FeatureMatrix(i, new_column) = str2num(InitialMatrix{i, j});
      endif

      new_column += 1;
    endfor
  endfor
endfunction

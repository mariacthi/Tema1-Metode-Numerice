function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)

  % G -> iteration matrix
	% c -> iteration vector

  % TODO: get_Jacobi_parameters

  m = rows(Link);
  n = columns(Link);

  % the G matrix is the Link matrix without the columns
  % and rows that are specific for the WIN and LOSE state
  % (thus the last two are not needed)
  G = Link(1 : (m - 2), 1 : (n - 2));

  % the c array contains the column of the WIN state
  c = Link(1 : (m - 2), (n - 1));
endfunction

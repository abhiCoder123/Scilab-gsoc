// Demo for spectral -- Scilab 

getd('../macros')


// Data preparation
M = csvRead('Datasets/forestfires.csv')
x = M(:, [5, 7]);

// Data cleaning
function xnorm = norma(x)
	n 	= length(x)
	mi  = min(x)
	ma  = max(x)
	for i=1:n
		x(i) = 1.0*(x(i) - mi)/(ma - mi)
	end

	xnorm = x
endfunction

x(or(isnan(x),'c'),:) = []

x(:, 2) = norma(real(x(:, 2)))
x(:, 1) = norma(real(x(:, 1)))

flags = spectralCluster(x, 3);
scatter(x(:, 2), x(:, 1),  1, flags, 'x')
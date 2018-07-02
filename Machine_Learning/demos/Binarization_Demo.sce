// Demo script for Binarization

// Data preparation
M = csvRead('Datasets/titanic.csv')
x = M(:, 10);
x(or(isnan(x),'c'),:) = []
x = real(x);
x = binarize(x);
disp(tabul(x))
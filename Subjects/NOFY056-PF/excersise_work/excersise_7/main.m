% Matlab/Octave: řešení soustavy lineárních algebraických rovnic a následná zkouška

format = '%s%20.15f%20.15f%20.15f\n';
nmax = 10_000;

% matice soustavy
A = ones(nmax)/nmax;
A = A - diag(diag(A)) + eye(nmax);

% sloupcový vektor pravé strany
b = ones(nmax, 1);
fprintf(format, 'b =', b(1:3))

% vektor řešení
x = A\b;
fprintf(format, 'x =', x(1:3))

% zkouška
b = A*x;

fprintf(format, 'b =', b(1:3))
% normy
fprintf(format, 'd =', sum(abs(b - 1)), sqrt(sum((b - 1).^2)), max(abs(b - 1)))
% totéž
fprintf(format, 'd =', norm(b - 1, 1), norm(b - 1, 2), norm(b - 1,Inf))

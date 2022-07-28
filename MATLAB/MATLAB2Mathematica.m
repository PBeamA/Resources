%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB2Mathematica.m
%
% Pakorn.Aschakulporn@otago.ac.nz
% https://pbeama.github.io/
% Modified: Thursday 28 July 2022 (13:19)
% * Comments removed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function str = MATLAB2Mathematica(STR)
str = char(STR);

GREEK = {'alpha', 'beta', 'gamma', 'delta', 'epsilon', 'zeta', 'theta', 'iota', 'kappa', 'lambda', 'mu', 'nu', 'xi', 'omicron', 'pi', 'rho', 'sigma', 'tau', 'upsilon', 'phi', 'chi', 'psi', 'omega'};

for i = 1 : length(GREEK)
str = regexprep(str, GREEK{i}, sprintf('\\\\[%s]', [upper(GREEK{i}(1)), GREEK{i}(2 : end)]));
end

EXPRESSION = {'exp', 'sin', 'log', 'cos', 'tan'};

EXPRESSION = {'exp'};

for i = 1 : length(EXPRESSION)
str = regexprep(str, [EXPRESSION{i}, '('], sprintf('%s[', [upper(EXPRESSION{i}(1)), EXPRESSION{i}(2 : end)]));
end

for i = 1 : length(EXPRESSION)

loc = strfind(str, sprintf('%s[', [upper(EXPRESSION{i}(1)), EXPRESSION{i}(2 : end)]));
for j = 1 : length(loc)
jloc = loc(j);

GO = 1;
while GO >= 1
jloc = jloc + 1;

if strcmp(str(jloc), '(')
GO = GO + 1;
elseif strcmp(str(jloc), ')')
GO = GO - 1;
if GO == 0
str(jloc) = ']';
end
end

end

end
end

str = regexprep(str, '*', ' ');
end
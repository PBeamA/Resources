%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% numsep.m
%
% Beam.Aschakulporn@otago.ac.nz
% https://pbeama.github.io/
% Modified: Thursday 23 December 2021 (00:02)
% * Comments removed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function str = numsep(num)
if ~ischar(num)
str = num2str(num);
else
str = num;
end
j = find(str == '.', 1);
if isempty(j)
str = fliplr(str);
i = 0;
while i < length(str)
i = i + 3;
if i < length(str)
i = i + 1;
str = [str(1 : i - 1), ',', str(i : end)];
end
end
str = fliplr(str);
else
str = [numsep(str2double(str(1 : j - 1))), str(j : end)];
end
end
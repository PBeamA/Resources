%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% shadex.m
%
% Beam.Aschakulporn@otago.ac.nz
% https://pbeama.github.io/
% Modified: Wednesday 22 December 2021 (23:43)
% * Comments removed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function shadex(x1, x2)
hold on
ylimits = get(gca, 'ylim'); % Get y axis limits

colour = [0.4, 0.4, 0.4]; % Grey
p = fill([x1, x2, x2, x1], sort([ylimits, ylimits]), colour);
set(p, 'FaceAlpha', 0.25, 'EdgeColor', 'none');

end

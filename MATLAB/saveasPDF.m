%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% saveasPDF.m
%
% Beam.Aschakulporn@otago.ac.nz
% https://pbeama.github.io/
% Modified: Thursday 23 December 2021 (00:02)
% * Comments removed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function saveasPDF(h, filename)
fig = h;
set(fig,'PaperPositionMode', 'auto');
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];

title([])
set(gca, 'LooseInset', get(gca, 'TightInset'));

print(fig, filename, '-dpdf', '-bestfit', '-painters')

print(fig, regexprep(filename, '.pdf', '.png'), '-dpng', '-r600')

end
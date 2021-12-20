function saveasPDF(h, filename)
% Eg. saveasPDF(gcf, sprintf('Filename'))
fig = h;
% fig.PaperPositionMode = 'auto';
set(fig,'PaperPositionMode', 'auto');
fig_pos = fig.PaperPosition;
fig.PaperSize = [fig_pos(3) fig_pos(4)];


% get(gca, 'ylim')
% try
%     set(gca, 'ylim', [min([0, get(gca, 'ylim')]), max(get(gca, 'ylim'))])
% end
title([])
set(gca, 'LooseInset', get(gca, 'TightInset'));

% print(fig, filename, '-dpdf', '-bestfit')
print(fig, filename, '-dpdf', '-bestfit', '-painters')
% print(fig, filename, '-dpdf')
% close(fig)

% print(fig, regexprep(filename, '.pdf', '.png'), '-dpng', '-r0')
print(fig, regexprep(filename, '.pdf', '.png'), '-dpng', '-r600')

end
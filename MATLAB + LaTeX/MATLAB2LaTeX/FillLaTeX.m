function FillLaTeX
close all
clear all
clc


% src = 'EssayII.tex'
src = 'EssayIIPresentation.tex'
dst = regexprep(src, '.tex', 'Filled.tex')
DataFilename = 'MATLAB\EssayIIDATA.txt'

%%% Copy bib file
if isfile(regexprep(src, '.tex', '.bib'))
    copyfile(regexprep(src, '.tex', '.bib'), regexprep(src, '.tex', 'Filled.bib'))
end





fidsrc = fopen(src, 'rt');
STRING = fread(fidsrc, '*char')';

fclose(fidsrc);
% STRING
fidData = fopen(DataFilename, 'rt');
while ~feof(fidData)
    LINE = fgetl(fidData);
    
    VariableName = regexprep(LINE, ' =.*', '');
    VariableValue = regexprep(LINE, '.*= ', '');
    
%     VariableValue = regexprep(VariableValue, '\\', '\\\\');
    
    STRING = regexprep(STRING, sprintf('\\\\Sexpr{%s}', VariableName), VariableValue);
end
fclose(fidData);
% 
% 
% 
STRING
fiddst = fopen(dst, 'wt');
% fprintf(fiddst, sprintf('%s', STRING))
fprintf(fiddst, '%s', STRING)
fclose(fiddst);

% 
% [~, filenamedst, ~] = fileparts(dst);
% [~, filenamesrc, ~] = fileparts(src);
% 
% fprintf(fiddst, '%s', [HEADER, regexprep(sprintf('%c', fread(fidsrc)), filenamesrc, filenamedst)]);
% 
% filenameOut = regexprep(filename, '.txt', '.tex');
% if isfile(filename)
%     if true
%         % if ~isfile(filenameOut)
%         fidin = fopen(filename, 'rt');
%         
%         fidout = fopen(filenameOut, 'wt');
%         
%         fprintf(fidout, '%s\n', '%'*ones(50, 1));
%         LINE = '\\newcommand{\\Sexpr}[1]{\\csname #1 \\endcsname}\n';
%         
%         fprintf(fidout, LINE);
%         fprintf(fidout, '%s\n', '%'*ones(50, 1));
%         
%         while ~feof(fidin)
%             LINE = fgetl(fidin);
%             % LINE = regexprep(LINE, ' = ', '}{');
%             % LINE = ['\\newcommand{\\', LINE, '}'];
%             
%             LINE = regexprep(LINE, ' = ', ' \\\\endcsname{');
%             LINE = ['\\expandafter\\newcommand\\csname ', LINE, '}'];
%             % LINE = regexprep(LINE, ',', '{,}');
%             LINE = [LINE, '\n'];
%             fprintf(fidout, LINE);
%         end
%         
%         fclose(fidout);
%         fclose(fidin);
%         
%     end
% end

command = sprintf('pdflatex %s', dst)
[status,cmdout] = system(command ,'-echo')

command = sprintf('biber %s', regexprep(dst, '.tex', '.bcf'))
[status,cmdout] = system(command ,'-echo')


command = sprintf('pdflatex %s', dst)
[status,cmdout] = system(command ,'-echo')
command = sprintf('pdflatex %s', dst)
[status,cmdout] = system(command ,'-echo')
end

























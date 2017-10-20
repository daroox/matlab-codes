%%%   https://tex.stackexchange.com/questions/298410/matlab2tikz-spectrogram-is-too-big

%%%%        M A T L A B

% These steps are needed for my example; replace with your actual spectrogram.
peaks;        % make a random 3d plot
view(0,90);   % adjust view to match spectrogram
colormap jet; % set colormap (match this in pgfplots)
colormap(brewermap([],'YlGnBu'))
title('');    % clear title

% Clean plot of any labels/annotations/text
colorbar off; % turn off colorbar (does nothing in this example)
shading flat; % remove any grid (might not be needed)
axis off;     % turn off axes

% Output file
fname = 'mydemo';  % base name; choose anything you like
print('-depsc2',fname); % print to eps (can't go direct to pdf without trimming)
system(['convert ' fname '.eps ' fname '.pdf']); % convert to pdf (ImageMagick)

% Print min/max values for use in pgfplots
ax = gca;
fprintf('xmin: %6.3f\nxmax: %6.3f\n',ax.XLim); % x limits
fprintf('ymin: %6.3f\nymax: %6.3f\n',ax.YLim); % y limits
fprintf('zmin: %6.3f\nzmax: %6.3f\n',ax.CLim); % colorbar limits

%
%                L A T E X
%

\documentclass{standalone}
\usepackage{pgfplots,siunitx}
\usepgfplotslibrary{colorbrewer} %new
\usepgfplotslibrary{units}
\pgfplotsset{
  compat=1.13,
  unit markings=parenthesis,
  unit code/.code 2 args={\si{#1#2}},
  mlspectrogram/.style={
    enlargelimits=false, axis on top, use units,
    xlabel=Time, x unit=\second,
    ylabel=Frequency, y unit=\kilo\hertz,
    colormap/YlGnBu, colorbar,%new
		
    colorbar style={ylabel=Power/Frequency, y unit=\decibel\per\hertz},
  },
}
\sisetup{per-mode=symbol}

\begin{document}
\begin{tikzpicture}
\begin{axis}[mlspectrogram]
\addplot % min and max values on following 2 lines are lifted from MATLAB output
  [point meta min=-6.5466,point meta max=8.0752]
  graphics[xmin=-3,xmax=3,ymin=-3,ymax=3]{mydemo};
\end{axis}
\end{tikzpicture}
\end{document}

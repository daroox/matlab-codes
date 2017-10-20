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

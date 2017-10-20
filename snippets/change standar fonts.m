It's possible to change default fonts, both for the axes and for other text, by adding the following lines to the startup.m file.

% Change default axes fonts.
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', 14)

% Change default text fonts.
set(0,'DefaultTextFontname', 'Times New Roman')
set(0,'DefaultTextFontSize', 14)
If you don't know if you have a startup.m file, run

which startup
to find its location. If Matlab says there isn't one, run

userpath
to know where it should be placed.

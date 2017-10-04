### Figure Positioning while plotting

in the commandline type in  `figure(1)` the move the empty window to the position you like the type in `p = get(gcf, 'Position')`

```matlab
p = [1939 457 819 646];
 set(0, 'DefaultFigurePosition', p)
 figure(1)
 plot(t,amp_t1)
 title('oscilloscope single curve')
 xlabel('time of flight (ns)')
 ylabel('signal (arb u)')
 grid
 ```

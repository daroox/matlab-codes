### Figure Positioning while plotting

Type in the commandline `figure(1)` the move the empty window to a position you like then type
`p = get(gcf, 'Position')`. After getting the position one can copy the position and write it in the script.

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

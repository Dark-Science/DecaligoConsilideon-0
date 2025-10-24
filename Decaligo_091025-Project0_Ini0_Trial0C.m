% Decaligo Consilideon Project 0:
% Ini. Trial 0C
% Written by Ian T. Draney

% Initialize:
v_0 = 200 %(m/s)
x_0 = 0 %(m)
y_0 = -1000 %(m)
t = 0   %(s)
theta_0 = 89*(pi/180)
theta = theta_0

% Properties
g = 9.81    %(m/s^2)
m = 1       %(kg)
dt = 0.8    %(s)
flag = 8/dt;

% Define Trajectory
a = [0
    -g]
v = [(v_0*cos(theta_0))
    (v_0*sin(theta_0)-g*t)]
r = [x_0
    y_0]

% Graph Setup
posLabelForm = sprintf("(x, y, t)");
text(2,300,posLabelForm)
hold on;                    % Hold plot, do not reset plot, add to current fig instead

% Update vector functions v, r per step of time, a is const.
for i = t:flag              % Loop once every dt
    plot(r(1),r(2), 'o')    % Plot r

    % Label plotted position and graph
    posLabel = sprintf("(%.0f, %.0f, %.0f)",r(1),r(2),t);
    text(r(1),r(2),posLabel)

    axis([0 40 -1050 -100]);% Disable auto axis scaling
    drawnow;                % Force draw
    t += dt                 % Update current time
    r = [r(1) + (v(1)*dt)   % Update position
        r(2) + (v(2)*dt)]
    v = [v(1)               % Update velocity
        v(2)-g*t]
endfor

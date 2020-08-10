%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1D

clear
clc

% Number of points
dx = 0.02;
x=0:dx:1;

%velocity
u=-1.1;

% Set final time
tfinal = 10.0;

% Set timestepS
dt = 0.001;

% Set initial condition
Uo = 0.75*exp(-((x-0.5)/0.1).^2)';
t = 0;

U = Uo;

% Loop until t > tfinal
while (t < tfinal)
    % Forward Euler Step
    
    meme=[U(2:end);U(2)];
    memex=[U(end-1);U(1:end-1)];
    cdxd=centraldiff(dx,meme,memex);
    U(2:end) = U(2:end) - dt*u*cdxd(2:end);
    U(1) = U(end); % enforce periodicity

    % Increment time
    t = t + dt;

    % Plot current solution
    clf
    plot(x,Uo,'b*');
    hold on;
    plot(x,U,'*','color',[0 0.5 0]);
    xlabel('x','fontsize',16); ylabel('U','fontsize',16);
    title(sprintf('t = %f\n',t));
    axis([0, 1, -0.5, 1.5]);
    grid on;
    drawnow;
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %% 2D

clear 
clc

dx=0.02; x=0:dx:1;
dy=0.02; y=0:dy:1;
 
u=1.2; v=-1.1; tfinal = 10.0; dt = 0.001;

Uo= 0.75*exp(-(((x-0.5)/0.1).^2)-(((y-0.5)/0.2).^2))';

t = 0; 
U=[Uo,Uo];

% Loop until t > tfinal
while (t < tfinal)
    % Forward Euler Step
    
    meme=[U(2:end,1);U(2,1)];
    memex=[U(end-1,1);U(1:end-1,1)];
    
    memememe=[U(2:end,2);U(2,2)];
    memexmemex=[U(end-1,2);U(1:end-1,2)];
    
    cdxd=centraldiff(dx,meme,memex);
    cdxdxd=centraldiff(dy,memememe,memexmemex);
    
    U(2:end,1) = U(2:end,1) - dt*u*cdxd(2:end);
    U(2:end,2) = U(2:end,2) - dt*v*cdxdxd(2:end);
    U(1,1) = U(end,1);
    U(1,2) = U(end,2);
    % enforce periodicity

    % Increment time
    t = t + dt;
% 
%     Plot current solution
    clf
    plot(x,Uo,'b*');
    hold on;
    plot(x,U,'*','color',[0 0.5 0]);
    xlabel('x','fontsize',16); ylabel('u','fontsize',16);
    title(sprintf('t = %f\n',t));
    axis([0, 1, -0.5, 1.5]);
    grid on;
    drawnow;
 
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
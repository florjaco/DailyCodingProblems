function pi_est = Estimate_Pi_MonteCarlo(nsim)
% # Daily Coding Problem: Problem #14
% 
% # This problem was asked by Google.
% 
% # The area of a circle is defined as ?r^2. Estimate ? to 3 decimal places using a Monte Carlo method.
% 
% # Hint: The basic equation of a circle is x^2 + y^2 = r^2.
% 
% # Taking r=1
% 
% # Area of a square of side 2r ==> 2r*2r = 4r^2
% 
% # Area of circle ?r^2 
% 
% # Ratio of area of circle to area of square is  ?r^2/4r^2 =  ?/4 ==> Pi_estimate = 4*Ratio of area of circle to area of square


%% SLOWER VERSION 
% circle=0;
% square=0;

% for i=1:nsim
%     x_y=2*rand(1,2)-1;
%     x(i)=x_y(1);
%     y(i)=x_y(2);
%     mod(i)=x(i)^2+y(i)^2;
%     
%     if (mod(i)<=1)
%         circle=circle+1;
%     end
%     square=square+1;
%     pi_est=round(4*circle/square,3);
%     
% %     hold on
% %     if mod(i)<=1
% %         plot(x(i),y(i),'r.'); axis square; drawnow
% %         title(['Nsim = ' num2str(nsim) ' Pi estimate = ' num2str(pi_est)])
% %     else
% %         plot(x(i),y(i),'b.'); axis square; drawnow
% %         title(['Nsim = ' num2str(nsim) ' Pi estimate = ' num2str(pi_est)])
% %     end
%     
% end


% %% FASTER VERSION, NO PLOT
% x_y=2*rand(nsim,2)-1; %generate nsim x 2 random numbers between -1 and 1 that represent points inside a square of side 2
% x=x_y(:,1); %get x coord of point
% y=x_y(:,2); % get y coord of point
% mod=x.^2+y.^2; %get distance of point from the center
% 
% circle=sum(mod<=1); %the point belongs to a circle centered around zero if mod is <=1
% pi_est=round(4*circle/nsim,3); %estimate pi

%% EVEN FASTER VERSION
% check only in one quadrant
%# Area of a square of side r ==> r*r = r^2
% 
% # Area of 1/4 circle 1/4*?r^2 
% 
% # Ratio of area of circle to area of square is  1/4*?r^2/r^2 =  ?/4 ==> Pi_estimate = 4*Ratio of area of circle to area of square

x_y=rand(nsim,2); %generate nsim x 2 random numbers between -1 and 1 that represent points inside a square of side 2
x=x_y(:,1); %get x coord of point
y=x_y(:,2); % get y coord of point
mod=x.^2+y.^2; %get distance of point from the center

circle=sum(mod<=1); %the point belongs to a circle centered around zero if mod is <=1
pi_est=round(4*circle/nsim,3); %estimate pi
end

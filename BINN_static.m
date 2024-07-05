
clear all; close all;

%A=5; 
%A=0.01 or A=100 no different
A=5; 
%A=0.01 or A=100 no different
B=1; 
dt=0.01;
u=1; 
%u=0.1 no different  u=10 failed
E=40; 
D=1; 

Q=0.01;
stopf=0;t=0;
Env=41;
%initial value Z_3Dmatrix_activityvaule_changewithtime(i); o==obstacle_map
N=zeros(Env,Env,101);
o=zeros(Env,Env);
esc=zeros(Env,Env);
Close_check=zeros(Env,Env);
rstep=1;
U=zeros(Env,Env);

Dx=21;
Dy=32;

o(12:25,25)=1;
o(12,13:25)=1;
o(25,13:25)=1;

for i=1:100
for xi=1:Env
   for yi=1:Env
      S_ex=0;
      for m=xi-1:xi+1
         if (m>0 && m<Env+1)%%%limit space
            for n=yi-1:yi+1
               if (n>0 && n<Env+1)
                  rr=sqrt((m-xi)*(m-xi)+(n-yi)*(n-yi)); %%distance
                  if (rr>0 && rr<2)
                     w=u/rr;  %% near node
                  else
                     w=0;
                  end
                  if (N(m,n,i)>0) %%
                     S_ex=S_ex + w*N(m,n,i);
                  end
%                      if esc(m,n)==1
%                         S_ex=0;
%                      end
               end
            end
         end
      end
      %if (xi==tx(i) && yi==ty(i)) %%if it is targert
      if xi==Dx && yi==Dy %%if it is targert
         S_ex=S_ex+E;
      end
      if o(xi,yi)==1
         S_in=E;
      else
         S_in=0;
      end
%        if esc(xi,yi)==1
%          S_esc=0;
%       else
%          S_esc=Q;
%       end
%      if o(xi,yi)==1, % when D=0, we need this condition
%         dz=0;
%      else
         dz=-A*N(xi,yi,i)+(B-N(xi,yi,i))*S_ex-(D+N(xi,yi,i))*S_in;
         %dz=-A*N(xi,yi,i)+(B-N(xi,yi,i))*S_ex-(D+N(xi,yi,i))*S_in+(C-N(xi,yi,i))*S_esc;
%      end;
      N(xi,yi,i+1)=N(xi,yi,i)+dz*dt;

   end
 end

end
%end %%if detect
t=i+1;

%plot neural dynamics
figure; 
xmin = 1; xmax = Env; dx = 1;
ymin = 1; ymax = Env; dy = 1;

x = xmin:dx:xmax;
y = ymin:dy:ymax;

for i=1:t-1
   z = N(1: Env,1:Env,i);
   mesh(x,y,z);
   title([])
   axis([xmin xmax ymin ymax -1 1]);
   pause(0.2);
%create many picture files 
%   M(:,i) = getframe;
%    M(i) = getframe;
% 
%   gfm=getframe;
%   fm=frame2im(gfm);
%   filename=['nd',num2str(i),'.bmp']; %jpg
%   imwrite(fm,filename);

end

t=i+1;

%% plot path
rx=19;
ry=21;
while (rstep<=35)
%while ( rstep<=15)
   %rstep=rstep+1;
   nextp=0;
   px(rstep)=rx;
   py(rstep)=ry;
   pz(rstep)=N(rx,ry,t);
   for mm=rx-1:rx+1
      for nn=ry-1:ry+1
          %if (mm>0 && mm<21 && nn>0 && nn<21)
           if (mm>0 && mm<Env+1 && nn>0 && nn<Env+1)
            if N(mm,nn,t)  >nextp
                %&&safe(1,LLL)<=15
               nextp=N(mm,nn,t);
               px(rstep)=mm;
               py(rstep)=nn;
               pz(rstep)=N(mm,nn,t);
            end
             
          end
      end
   end
      rx=px(rstep); 
      ry=py(rstep);
      rstep=rstep+1;
end

figure;
zxy=zeros(Env,Env);
mesh(zxy);
hold on;
view (2);
axis equal;
plot(px(1),py(1),'*');
plot(px,py,'.-');
plot(Dx,Dy,'r*');
[ox,oy]=find(o);
plot(ox,oy,'ks','MarkerFaceColor','k');
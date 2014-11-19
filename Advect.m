function Nv = Advect(mat,U,Vo,V)
% mat is the initial/previous values
% U is the x-velocity at the final time step
% V is the y-velocity at the final time step
% Vo is the initial y-velocity 
dx = 4736.745349870635; % interval of longitude in meters
dy = 4907.190566378487; % interval of latitude in meters
dt = 2; % time interval in minutes
Nx = 101; % length of the longitude axis
Ny = 101; % length of the latitude axis
a = (dt/2)/(12*dx); 
b = (dt/2)/(12*dy);

for i=1:Ny
     %constructing the matrix elements for x-axis(longitude)
     
     
    for j1=1:Nx
        a1x(1,j1)= 2;
%         if j1 == 1
%             a1x(1,j1)=2-(2*a*60*(11*UU(i,j1)-18*UU(i,j1+1)+9*UU(i,j1+2)-2*UU(i,j1+3)... %na-edit na
%                 +11*Uo(i,j1)-18*Uo(i,j1+1)+9*Uo(i,j1+2)-2*Uo(i,j1+3))...
%                 +2*b*60*(11*VV(i,j1)-18*VV(i+1,j1)+9*VV(i+2,j1)-2*VV(i+3,j1)...
%                 +11*Vo(i,j1)-18*Vo(i+1,j1)+9*Vo(i+2,j1)-2*Vo(i+3,j1)));
%         elseif j1 == 2
%             a1x(1,j1)=2+(2*a*60*(-1*2*UU(i,j1-1)-3*UU(i,j1)+6*UU(i,j1+1)-10*UU(i,j1+2)... %na-edit na
%                 -1*2*Uo(i,j1-1)-3*Uo(i,j1)+6*Uo(i,j1+1)-10*Uo(i,j1+2))...
%                 +2*b*60*(-1*2*VV(i-1,j1)-3*VV(i,j1)+6*VV(i+1,j1)-10*VV(i+2,j1)...
%                 -1*2*Vo(i-1,j1)-3*Vo(i,j1)+6*Vo(i+1,j1)-10*Vo(i+2,j1)));
%         elseif j1 == 100
%             a1x(1,j1)=2-(2*a*60*(-1*2*UU(i,j1+1)-3*UU(i,j1)+6*UU(i,j1-1)-10*UU(i,j1-2)...%na-edit na
%                 -1*2*Uo(i,j1+1)-3*Uo(i,j1)+6*Uo(i,j1-1)-10*Uo(i,j1-2))...
%                 +2*b*60*(-1*2*VV(i+1,j1)-3*VV(i,j1)+6*VV(i-1,j1)-10*VV(i-2,j1)...
%                 -1*2*Vo(i+1,j1)-3*Vo(i,j1)+6*Vo(i-1,j1)-10*Vo(i-2,j1)));
%         elseif j1 == 101
%             a1x(1,j1)=2+(2*a*60*(11*UU(i,j1)-18*UU(i,j1-1)+9*UU(i,j1-2)-2*UU(i,j1-3)...%na-edit na
%                 +11*Uo(i,j1)-18*Uo(i,j1-1)+9*Uo(i,j1-2)-2*Uo(i,j1-3))...
%                 +2*b*60*(11*VV(i,j1)-18*VV(i-1,j1)+9*VV(i-2,j1)-2*VV(i-3,j1)...
%                 +11*Vo(i,j1)-18*Vo(i-1,j1)+9*Vo(i-2,j1)-2*Vo(i-3,j1)));
%         else
%             a1x(1,j1)=2+(a*60*(-UU(i,j1+2)+8*UU(i,j1+1)-8*UU(i,j1-1)+UU(i,j1-2)...%na-edit na
%                 -Uo(i,j1+2)+8*Uo(i,j1+1)-8*Uo(i,j1-1)+Uo(i,j1-2))...
%                 +b*60*(-VV(i+2,j1)+8*VV(i+1,j1)-8*VV(i-1,j1)+VV(i-2,j1)...
%                 -Vo(i+2,j1)+8*Vo(i+1,j1)-8*Vo(i-1,j1)+Vo(i-2,j1)));
        
        Nowx(j1,1)=mat(j1,i);
    end


    for j2=1:Nx-1
        a2x(1,j2)= -1*8*U(i,j2)*60*a;
    end
    for j3=2:Nx
        a3x(1,j3-1)= 8*U(i,j3)*60*a;
    end
    for j4=1:Nx-2
        a4x(1,j4)= U(i,j4)*60*a;
    end
    for j5=3:Nx
        a5x(1,j5-2)= -1*U(i,j5)*60*a;
    end
       
        Mlx = diag(a1x,0)+diag(a2x,-1)+diag(a3x,1)+diag(a4x,-2)+diag(a5x,2);
        Mlx(2,1)=-2*U(i,1)*60*2*a;                                            
        Mlx(2,2)=-3*U(i,2)*60*2*a;
        Mlx(2,3)= 6*U(i,3)*60*2*a;
        Mlx(2,4)=-10*U(i,4)*60*2*a;
        Mlx(1,1)=-11*U(i,1)*60*2*a;
        Mlx(1,2)= 18*U(i,2)*60*2*a;
        Mlx(1,3)= -9*U(i,3)*60*2*a;
        Mlx(1,4)= 2*U(i,4)*60*2*a;                %na-edit na, correct!
        Mlx(Nx-1,Nx)= 2*U(i,Nx)*60*2*a;
        Mlx(Nx-1,Nx-1)= 3*U(i,Nx-1)*60*2*a;
        Mlx(Nx-1,Nx-2)= -6*U(i,Nx-2)*60*2*a;
        Mlx(Nx-1,Nx-3)= 10*U(i,Nx-3)*60*2*a;
        Mlx(Nx,Nx)= 11*U(i,Nx)*60*2*a;
        Mlx(Nx,Nx-1)= -18*U(i,Nx-1)*60*2*a;
        Mlx(Nx,Nx-2)= 9*U(i,Nx-2)*60*2*a;
        Mlx(Nx,Nx-3)= -2*U(i,Nx-3)*60*2*a;
        
    for j1=1:Nx
        a1xx(j1,1)=2;
    end
    for j2=1:Nx-1
       a2xx(j2,1)= 8*Vo(j2,i)*60*a;
    end
    for j3=2:Nx
        a3xx(j3-1,1)= -8*Vo(j3,i)*60*a;
    end
    for j4=1:Nx-2
        a4xx(j4,1)= -Vo(j4,i)*60*a;
    end
    for j5=3:Nx
        a5xx(j5-2,1)= Vo(j5,i)*60*a;
    end
          
        Mrx = diag(a1xx,0)+diag(a2xx,-1)+diag(a3xx,1)+diag(a4xx,-2)+diag(a5xx,2);
        Mrx(2,1)= 2*Vo(1,i)*60*2*b;
        Mrx(2,2)= 3*Vo(2,i)*60*2*b;
        Mrx(2,3)= -6*Vo(3,i)*60*2*b;
        Mrx(2,4)= 10*Vo(4,i)*60*2*b;
        Mrx(1,1)= 11*Vo(1,i)*60*2*b;
        Mrx(1,2)= -18*Vo(2,i)*60*2*b;          
        Mrx(1,3)= 9*Vo(3,i)*60*2*b;
        Mrx(1,4)= -2*Vo(4,i)*60*2*b;
        Mrx(Nx-1,Nx)= -2*Vo(Nx,i)*60*2*b;            %na-edit na, correct!
        Mrx(Nx-1,Nx-1)= -3*Vo(Nx-1,i)*60*2*b;
        Mrx(Nx-1,Nx-2)= 6*Vo(Nx-2,i)*60*2*b;
        Mrx(Nx-1,Nx-3)= -10*Vo(Nx-3,i)*60*2*b;
        Mrx(Nx,Nx)= -11*Vo(Nx,i)*60*2*b;
        Mrx(Nx,Nx-1)= 18*Vo(Nx-1,i)*60*2*b;
        Mrx(Nx,Nx-2)= -9*Vo(Nx-2,i)*60*2*b;
        Mrx(Nx,Nx-3)= 2*Vo(Nx-3,i)*60*2*b;
       
        
        
        Nowxx = (Mlx/Mrx)*Nowx;
%         for jj=1:Nx
%             Newx(jj,1) = Nowxx(jj,1);
        
%         end
        newnewx = Nowxx';
        for jjj=1:Nx
            Nu(i,jjj) = newnewx(1,jjj);
        end
        
end
        
for j=1:Nx
     %constructing the matrix elements for y-axis(latitude)
     for i1=1:Ny
            b1x(i1,1) = 2;
%         if i1 == 1
%             b1x(i1,1)=2-(2*b*60*(11*V(i1,j)-18*V(i1+1,j)+9*V(i1+2,j)-2*V(i1+3,j)... %na-edit na
%                 +11*VV(i1,j)-18*VV(i1+1,j)+9*VV(i1+2,j)-2*VV(i1+3,j))...
%                 +2*a*60*(11*U(i1,j)-18*U(i1,j+1)+9*U(i1,j+2)-2*U(i1,j+3)...
%                 +11*UU(i1,j)-18*UU(i1,j+1)+9*UU(i1,j+2)-2*UU(i1,j+3)));
%         elseif i1 == 2
%             b1x(i1,1)=2+(2*b*60*(-1*2*V(i1-1,j)-3*V(i1,j)+6*V(i1+1,j)-10*V(i1+2,j)...
%                 -1*2*VV(i1-1,j)-3*VV(i1,j)+6*VV(i1+1,j)-10*VV(i1,j))...
%                 +2*a*60*(-1*2*U(i1,j-1)-3*U(i1,j)+6*U(i1,j+1)-10*U(i1,j+2)... %na-edit na
%                 -1*2*UU(i1,j-1)-3*UU(i1,j)+6*UU(i1,j+1)-10*UU(i1,j+2)));
%         elseif i1 == 100
%             b1x(i1,1)=2-(2*b*60*(-1*2*V(i1+1,j)-3*V(i1,j)+6*V(i1-1,j)-10*V(i1-2,j)...%na-edit na
%                 -1*2*VV(i1+1,j)-3*VV(i1,j)+6*VV(i1-1,j)-10*VV(i1-2,j))...          
%                 +2*a*60*(-1*2*U(i1,j+1)-3*U(i1,j)+6*U(i1,j-1)-10*U(i1,j-2)...
%                 -1*2*UU(i1,j+1)-3*UU(i1,j)+6*UU(i1,j-1)-10*UU(i1,j-2)));
%         elseif i1 == 101
%             b1x(i1,1)=2+(2*b*60*(11*V(i1,j)-18*V(i1-1,j)+9*V(i1-2,j)-2*V(i1-3,j)...%na-edit na
%                 +11*VV(i1,j)-18*VV(i1-1,j)+9*VV(i1-2,j)-2*VV(i1-3,j))...
%                 +2*A*60*(11*U(i1,j)-18*U(i1,j-1)+9*U(i1,j-2)-2*U(i1,j-3)...
%                 +11*UU(i1,j)-18*UU(i1,j-1)+9*UU(i1,j-2)-2*UU(i1,j-3)));
%         else
%             b1x(i1,1)=2+(b*60*(-V(i1+2,j)+8*V(i1+1,j)-8*V(i1-1,j)+V(i1-2,j)...%na-edit na
%                 -VV(i1+2,j)+8*VV(i1+1,j)-8*VV(i1-1,j)+VV(i1-2,j))...
%                 +a*60*(-U(i1,j+2)+8*U(i1,j+1)-8*U(i1,j-1)+U(i1,j-2)...
%                 -UU(i1,j+2)+8*UU(i1,j+1)-8*UU(i1,j-1)+UU(i1,j-2)));
%         end
        Nowy(i1,1)=Nu(j,i1);
    end
    for i2=1:Ny-1
        b2x(i2,1)= -1*8*V(i2,j)*60*b;
    end
    for i3=2:Ny
        b3x(i3-1,1)= 8*V(i3,j)*60*b;
    end
    for i4=1:Ny-2
        b4x(i4,1)= V(i4,j)*60*b;
    end
    for i5=3:Ny
        b5x(i5-2,1)= -1*V(i5,j)*60*b;
    end
        
        Mly = diag(b1x,0)+diag(b2x,-1)+diag(b3x,1)+diag(b4x,-2)+diag(b5x,2);
        Mly(2,1)=-2*V(1,j)*60*2*b;
        Mly(2,2)=-3*V(2,j)*60*2*b;
        Mly(2,3)= 6*V(3,j)*60*2*b;
        Mly(2,4)=-10*V(4,j)*60*2*b;
        Mly(1,1)= -11*V(1,j)*60*2*b;
        Mly(1,2)= 18*V(2,j)*60*2*b;
        Mly(1,3)=-1*9*V(3,j)*60*2*b;
        Mly(1,4)= 2*V(4,j)*60*2*b;                    %na-edit na , correct!
        Mly(Ny-1,Ny)= 2*V(Ny,j)*60*2*b;
        Mly(Ny-1,Ny-1)=3*V(Ny-1,j)*60*2*b;
        Mly(Ny-1,Ny-2)= -6*V(Ny-2,j)*60*2*b;
        Mly(Ny-1,Ny-3)= 10*V(Ny-3,j)*60*2*b;
        Mly(Ny,Ny)= 11*V(Ny,j)*60*2*b;
        Mly(Ny,Ny-1)= -18*V(Ny-1,j)*60*2*b;
        Mly(Ny,Ny-2)= 9*V(Ny-2,j)*60*2*b;
        Mly(Ny,Ny-3)= -2*V(Ny-3,j)*60*2*b;
        
        
    for i1=1:Ny
        b1xx(1,i1)=2;
    end
    for i2=1:Ny-1
        b2xx(1,i2)= 8*U(j,i2)*86400*a;
    end
    for i3=2:Ny
        b3xx(1,i3-1)= -8*U(j,i3)*86400*a;
    end
    for i4=1:Ny-2
        b4xx(1,i4)= -U(j,i4)*86400*a;
    end
    for i5=3:Ny
        b5xx(1,i5-2)= U(j,i5)*86400*a;
    end
        
        Mry = diag(b1x,0)+diag(b2x,-1)+diag(b3x,1)+diag(b4x,-2)+diag(b5x,2);
        Mry(2,1)= 2*U(j,1)*60*2*a;
        Mry(2,2)= 3*U(j,2)*60*2*a;
        Mry(2,3)= -6*U(j,3)*60*2*a;
        Mry(2,4)= 10*U(j,4)*60*2*a;
        Mry(1,1)= 11*U(j,1)*60*2*a;
        Mry(1,2)= -18*U(j,2)*60*2*a;         %na-edit na, correct!
        Mry(1,3)= 9*U(j,3)*60*2*a;
        Mry(1,4)= -2*U(j,4)*60*2*a;
        Mry(Ny-1,Ny)= -2*U(j,Ny)*60*2*a;
        Mry(Ny-1,Ny-1)= -3*U(j,Ny-1)*60*2*a;
        Mry(Ny-1,Ny-2)= 6*U(j,Ny-2)*60*2*a;
        Mry(Ny-1,Ny-3)= -10*U(j,Ny-3)*60*2*a;
        Mry(Ny,Ny)= -11*U(j,Ny)*60*2*a;
        Mry(Ny,Ny-1)= 18*U(j,Ny-1)*60*2*a;
        Mry(Ny,Ny-2)= -9*U(j,Ny-2)*60*2*a;
        Mry(Ny,Ny-3)= 2*U(j,Ny-3)*60*2*a;
        
        
        Nowyy = (Mly/Mry)*Nowy;
%         for ii=1:Ny
%             Newy(ii,1) = Nowyy(ii,1);
%         end
        
        newnewy = Nowyy;
        for iii=1:Ny
            Nv(iii,j) = newnewy(iii,1);
        end
        
end
        
      
        
        
        
        
        
        
     
        
        
        



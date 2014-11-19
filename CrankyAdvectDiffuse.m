function Nv = Cranky(mat,U,V,Uo,Vo)
dx = 8598.32033133897; % interval of longitude
dy = 8542.06451089253; % interval of latitude
dt = 12/24; % time interval
Nx = 50; % length of the longitude axis
Ny = 50; % length of the latitude axis
a = (3/4)*(1/2)*(dt/2)/(12*dx); 
b = (1/2)*(dt/2)/(12*dy);

for ki = 1:Nx
    for kj = 1:Ny
        Kux = (-1*U(ki,kj+2)+8*U(ki,kj+1)-8*U(ki,kj-1)+U(ki,kj-2))/dx;
        Kvx = (-1*V(ki,kj+2)+8*V(ki,kj+1)-8*V(ki,kj-1)+V(ki,kj-2))/dx;
        Kuy = (-1*U(ki+2,kj)+8*U(ki+1,kj)-8*U(ki-1,kj)+U(ki-2,kj))/dy;
        Kvy = (-1*V(ki+2,kj)+8*V(ki+1,kj)-8*V(ki-1,kj)+V(ki-2,kj))/dy;
        K(i,j)=0.10*dx*dy*sqrt(Kux^2 + 0.5*(Kvx + Kuy)^2 + Kvy^2);
    end
end

for i=1:Ny
     %constructing the matrix elements for x-axis(longitude)
    for j1=1:Nx
        if j1 == 1
            a1x(1,j1)=2+a*(-U(i,j1+2)+8*U(i,j1+1)-8*U(i,Nx)+U(i,Nx-1)-Uo(i,j1+2)+8*Uo(i,j1+1)-8*Uo(i,Nx)+Uo(i,Nx-1))+30*(a/dx)*K(i,j1);%-Uo(i,j1+2)+8*Uo(i,j1+1)-8*Uo(i,Nx)+Uo(i,Nx-1)
        elseif j1 == 2
            a1x(1,j1)=2+a*(-U(i,j1+2)+8*U(i,j1+1)-8*U(i,j1-1)+U(i,Nx)-Uo(i,j1+2)+8*Uo(i,j1+1)-8*Uo(i,j1-1)+Uo(i,Nx))+30*(a/dx)*K(i,j1);%-Uo(i,j1+2)+8*Uo(i,j1+1)-8*Uo(i,j1-1)+Uo(i,Nx)
        elseif j1 == 49
            a1x(1,j1)=2+a*(-U(i,1)+8*U(i,j1+1)-8*U(i,j1-1)+U(i,j1-2)-Uo(i,1)+8*Uo(i,j1+1)-8*Uo(i,j1-1)+Uo(i,j1-2))+30*(a/dx)*K(i,j1);%-Uo(i,1)+8*Uo(i,j1+1)-8*Uo(i,j1-1)+Uo(i,j1-2)
        elseif j1 == 50
            a1x(1,j1)=2+a*(-U(i,2)+8*U(i,1)-8*U(i,j1-1)+U(i,j1-2)-Uo(i,2)+8*Uo(i,1)-8*Uo(i,j1-1)+Uo(i,j1-2))+30*(a/dx)*K(i,j1);%-Uo(i,2)+8*Uo(i,1)-8*Uo(i,j1-1)+Uo(i,j1-2)
        else
            a1x(1,j1)=2+a*(-U(i,j1+2)+8*U(i,j1+1)-8*U(i,j1-1)+U(i,j1-2)-Uo(i,j1+2)+8*Uo(i,j1+1)-8*Uo(i,j1-1)+Uo(i,j1-2))+30*(a/dx)*K(i,j1);%-Uo(i,j1+2)+8*Uo(i,j1+1)-8*Uo(i,j1-1)+Uo(i,j1-2)
        end
        
        Nowx(j1,1)=mat(j1,i);
    end
    for j2=1:Nx-1
        a2x(1,j2)= -1*8*U(i,j2)*86400*a;
    end
    for j3=2:Nx
        a3x(1,j3-1)= 8*U(i,j3)*86400*a;
    end
    for j4=1:Nx-2
        a4x(1,j4)= U(i,j4)*86400*a;
    end
    for j5=3:Nx
        a5x(1,j5-2)= -1*U(i,j5)*86400*a;
    end
       
        Mlx = diag(a1x,0)+diag(a2x,1)+diag(a3x,-1)+diag(a4x,2)+diag(a5x,-2);
        Mlx(1,Nx-1)=-1*U(i,1)*86400*a;
        Mlx(1,Nx)=8*U(i,1)*86400*a;
        Mlx(2,Nx)=-1*U(i,2)*86400*a;
        Mlx(Nx-1,1)=U(i,1)*86400*a;
        Mlx(Nx,1)=-1*8*U(i,1)*86400*a;
        Mlx(Nx,2)=U(i,2)*86400*a;
        
        
    for j1=1:Nx
        if j1 == 1
            a1xx(j1,1)=2+a*(-U(j1+2,i)+8*U(j1+1,i)-8*U(Nx,i)+U(Nx-1,i)-Uo(j1+2,i)+8*Uo(j1+1,i)-8*Uo(Nx,i)+Uo(Nx-1,i));%-Uo(j1+2,i)+8*Uo(j1+1,i)-8*Uo(Nx,i)+Uo(Nx-1,i)
        elseif j1 == 2
            a1xx(j1,1)=2+a*(-U(j1+2,i)+8*U(j1+1,i)-8*U(j1-1,i)+U(Nx,i)-Uo(j1+2,i)+8*Uo(j1+1,i)-8*Uo(j1-1,i)+Uo(Nx,i));%-Uo(j1+2,i)+8*Uo(j1+1,i)-8*Uo(j1-1,i)+Uo(Nx,i)
        elseif j1 == 49
            a1xx(j1,1)=2+a*(-U(1,i)+8*U(j1+1,i)-8*U(j1-1,i)+U(j1-2,i)-Uo(1,i)+8*Uo(j1+1,i)-8*Uo(j1-1,i)+Uo(j1-2,i));%-Uo(1,i)+8*Uo(j1+1,i)-8*Uo(j1-1,i)+Uo(j1-2,i)
        elseif j1 == 50
            a1xx(j1,1)=2+a*(-U(2,i)+8*U(1,i)-8*U(j1-1,i)+U(j1-2,i)-Uo(2,i)+8*Uo(1,i)-8*Uo(j1-1,i)+Uo(j1-2,i));%-Uo(2,i)+8*Uo(1,i)-8*Uo(j1-1,i)+Uo(j1-2,i)
        else
            a1xx(j1,1)=2+a*(-U(j1+2,i)+8*U(j1+1,i)-8*U(j1-1,i)+U(j1-2,i)-Uo(j1+2,i)+8*Uo(j1+1,i)-8*Uo(j1-1,i)+Uo(j1-2,i));%-Uo(j1+2,i)+8*Uo(j1+1,i)-8*Uo(j1-1,i)+Uo(j1-2,i)
        end
    end
    for j2=1:Nx-1
        a2xx(j2,1)= -1*8*U(j2,i)*86400*a;
    end
    for j3=2:Nx
        a3xx(j3-1,1)= 8*U(j3,i)*86400*a;
    end
    for j4=1:Nx-2
        a4xx(j4,1)= U(j4,i)*86400*a;
    end
    for j5=3:Nx
        a5xx(j5-2,1)= -1*U(j5,i)*86400*a;
    end
          
        
        Mrx = diag(a1xx,0)+diag(a2xx,-1)+diag(a3xx,1)+diag(a4xx,-2)+diag(a5xx,2);
        Mrx(1,Nx-1)=U(1,i)*86400*a;
        Mrx(1,Nx)=-1*8*U(1,i)*86400*a;
        Mrx(2,Nx)=U(2,i)*86400*a;
        Mrx(Nx-1,1)=-1*U(1,i)*86400*a;
        Mrx(Nx,1)=8*U(1,i)*86400*a;
        Mrx(Nx,2)=-1*U(2,i)*86400*a;
        
        Nowxx = inv(Mlx)*Mrx*Nowx;
        for jj=1:Nx
            Newx(jj,1) = Nowxx(jj,1);
        end
        
        newnewx = Newx';
        for jjj=1:Nx
            Nu(i,jjj) = newnewx(1,jjj);
        end
        
end
        
for j=1:Nx
     %constructing the matrix elements for y-axis(latitude)
    for i1=1:Ny
        if i1 == 1
            b1x(i1,1)=2+b*(-V(i1+2,j)+8*V(i1+1,j)-8*V(Ny,j)+V(Ny-1,j)-Vo(i1+2,j)+8*Vo(i1+1,j)-8*Vo(Ny,j)+Vo(Ny-1,j));%-Vo(i1+2,j)+8*Vo(i1+1,j)-8*Vo(Ny,j)+Vo(Ny-1,j)
        elseif i1 == 2
            b1x(i1,1)=2+b*(-V(i1+2,j)+8*V(i1+1,j)-8*V(i1-1,j)+V(Ny,j)-Vo(i1+2,j)+8*Vo(i1+1,j)-8*Vo(i1-1,j)+Vo(Ny,j));%-Vo(i1+2,j)+8*Vo(i1+1,j)-8*Vo(i1-1,j)+Vo(Ny,j)
        elseif i1 == 49
            b1x(i1,1)=2+b*(-V(1,j)+8*V(i1+1,j)-8*V(i1-1,j)+V(i1-2,j)-Vo(1,j)+8*Vo(i1+1,j)-8*Vo(i1-1,j)+Vo(i1-2,j));%-Vo(1,j)+8*Vo(i1+1,j)-8*Vo(i1-1,j)+Vo(i1-2,j)
        elseif i1 == 50
            b1x(i1,1)=2+b*(-V(2,j)+8*V(1,j)-8*V(i1-1,j)+V(i1-2,j)-Vo(2,j)+8*Vo(1,j)-8*Vo(i1-1,j)+Vo(i1-2,j));%-Vo(2,j)+8*Vo(1,j)-8*Vo(i1-1,j)+Vo(i1-2,j)
        else
            b1x(i1,1)=2+b*(-V(i1+2,j)+8*V(i1+1,j)-8*V(i1-1,j)+V(i1-2,j)-Vo(i1+2,j)+8*Vo(i1+1,j)-8*Vo(i1-1,j)+Vo(i1-2,j));%-Vo(i1+2,j)+8*Vo(i1+1,j)-8*Vo(i1-1,j)+Vo(i1-2,j)
        end
        Nowy(i1,1)=Nu(j,i1);
    end
    for i2=1:Ny-1
        b2x(i2,1)= -1*8*V(i2,j)*86400*b;
    end
    for i3=2:Ny
        b3x(i3-1,1)= 8*V(i3,j)*86400*b;
    end
    for i4=1:Ny-2
        b4x(i4,1)= V(i4,j)*86400*b;
    end
    for i5=3:Ny
        b5x(i5-2,1)= -1*V(i5,j)*86400*b;
    end
        
        Mly = diag(b1x,0)+diag(b2x,1)+diag(b3x,-1)+diag(b4x,2)+diag(b5x,-2);
        Mly(1,Ny-1)=-1*V(1,j)*86400*b;
        Mly(1,Ny)=8*V(1,j)*86400*b;
        Mly(2,Ny)=-1*V(2,j)*86400*b;
        Mly(Ny-1,1)=V(1,j)*86400*b;
        Mly(Ny,1)=-1*8*V(1,j)*86400*b;
        Mly(Ny,2)=V(2,j)*86400*b;
        
        
    for i1=1:Ny
        if i1 == 1
            b1xx(1,i1)=2+b*(-V(j,i1+2)+8*V(j,i1+1)-8*V(j,Ny)+V(j,Ny-1)-Vo(j,i1+2)+8*Vo(j,i1+1)-8*Vo(j,Ny)+Vo(j,Ny-1));%-Vo(j,i1+2)+8*Vo(j,i1+1)-8*Vo(j,Ny)+Vo(j,Ny-1)
        elseif i1 == 2
            b1xx(1,i1)=2+b*(-V(j,i1+2)+8*V(j,i1+1)-8*V(j,i1-1)+V(j,Ny)-Vo(j,i1+2)+8*Vo(j,i1+1)-8*Vo(j,i1-1)+Vo(j,Ny));%-Vo(j,i1+2)+8*Vo(j,i1+1)-8*Vo(j,i1-1)+Vo(j,Ny)
        elseif i1 == 49
            b1xx(1,i1)=2+b*(-V(j,1)+8*V(j,i1+1)-8*V(j,i1-1)+V(j,i1-2)-Vo(j,1)+8*Vo(j,i1+1)-8*Vo(j,i1-1)+Vo(j,i1-2));%-Vo(j,1)+8*Vo(j,i1+1)-8*Vo(j,i1-1)+Vo(j,i1-2)
        elseif i1 == 50
            b1xx(1,i1)=2+b*(-V(j,2)+8*V(j,1)-8*V(j,i1-1)+V(j,i1-2)-Vo(j,2)+8*Vo(j,1)-8*Vo(j,i1-1)+Vo(j,i1-2));%-Vo(j,2)+8*Vo(j,1)-8*Vo(j,i1-1)+Vo(j,i1-2)
        else
            b1xx(1,i1)=2+b*(-V(j,i1+2)+8*V(j,i1+1)-8*V(j,i1-1)+V(j,i1-2)-Vo(j,i1+2)+8*Vo(j,i1+1)-8*Vo(j,i1-1)+Vo(j,i1-2));%-Vo(j,i1+2)+8*Vo(j,i1+1)-8*Vo(j,i1-1)+Vo(j,i1-2)
        end
    end
    for i2=1:Ny-1
        b2xx(1,i2)= -1*8*V(j,i2)*86400*b;
    end
    for i3=2:Ny
        b3xx(1,i3-1)= 8*V(j,i3)*86400*b;
    end
    for i4=1:Ny-2
        b4xx(1,i4)= V(j,i4)*86400*b;
    end
    for i5=3:Ny
        b5xx(1,i5-2)= -1*V(j,i5)*86400*b;
    end
        
        Mry = diag(b1xx,0)+diag(b2xx,-1)+diag(b3xx,1)+diag(b4xx,-2)+diag(b5xx,2);
        Mry(1,Ny-1)=V(j,1)*86400*b;
        Mry(1,Ny)=-1*8*V(j,1)*86400*b;
        Mry(2,Ny)=V(j,2)*86400*a;
        Mry(Ny-1,1)=-1*V(j,1)*86400*b;
        Mry(Ny,1)=8*V(j,1)*86400*b;
        Mry(Ny,2)=-1*V(j,2)*86400*b;
        
        Nowyy = inv(Mly)*Mry*Nowy;
        for ii=1:Ny
            Newy(ii,1) = Nowyy(ii,1);
        end
        
        newnewy = Newy;
        for iii=1:Ny
            Nv(iii,j) = newnewy(iii,1);
        end
        
end

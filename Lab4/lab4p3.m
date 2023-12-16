x=[1,0,2;
  -1,3,1;
  -2,4,0];

h=[1,-1;
   0,2];

y=DSLSI2D(h,x)

function [y]=DSLSI2D(h,x)
    [Mh,Nh] = size(h);
    [Mx,Nx] = size(x);
    y= zeros(Mh+Mx-1,Nh+Nx-1);
    for k=0:Mh-1
      for l=0:Nh-1
        y(k+1:k+Mx,l+1:l+Nx)=y(k+1:k+Mx,l+1:l+Nx)+h(k+1,l+1)*x;
      end
    end
end

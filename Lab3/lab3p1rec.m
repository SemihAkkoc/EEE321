Number = [3 1 3 2 1];
K = [3];
x = DTMFTRA(Number);
k = DTMFTRA(K);
X=FT(x);
Kw = FT(k);
omega = linspace(-8192*pi, 8192*pi, 10241);
omega = omega(1:10241);
figure(1);
plot(omega, abs(X))
figure(2);
plot(omega, abs(Kw))

function x= DTMFTRA(Number)
    x=0;
    t=linspace(0,1,10241);
    num_size=length(Number);
    for ii = 1:1:num_size
        % using step function to create a rectangular signal
        rect = heaviside(t - 0.25*(ii-1)) - heaviside(t - 0.25*ii);
        if Number(ii)==0
            x = x + (cos(t*2*pi*1336)+cos(t*2*pi*941)).*(rect); 

        elseif Number(ii)==1
            x = x + (cos(t*2*pi*697)+cos(t*2*pi*1209)).*(rect);     
        
        elseif Number(ii)==2
            x = x + (cos(t*2*pi*697)+cos(t*2*pi*1336)).*(rect);
         
        elseif Number(ii)==3
            x = x + (cos(t*2*pi*697)+cos(t*2*pi*1477)).*(rect);
         
        elseif Number(ii)==4
            x = x + (cos(t*2*pi*770)+cos(t*2*pi*1209)).*(rect);
        
        elseif Number(ii)==5
            x = x + (cos(t*2*pi*770)+cos(t*2*pi*1336)).*(rect);
        
        elseif Number(ii)==6
            x = x + (cos(t*2*pi*770)+cos(t*2*pi*1477)).*(rect);
        
        elseif Number(ii)==7
            x = x + (cos(t*2*pi*852)+cos(t*2*pi*1209)).*(rect);
         
        elseif Number(ii)==8
            x = x + (cos(t*2*pi*852)+cos(t*2*pi*1336)).*(rect);
        
        elseif Number(ii)==9
            x = x + (cos(t*2*pi*852)+cos(t*2*pi*1477)).*(rect); 

        end
    end
end


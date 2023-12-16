function [y]=DTLTI(a,b,x,Ny)
    y=zeros(Ny,1);

    for ii=1:Ny
        for jj=1:length(b)
            if (ii-jj)<=length(x) && (ii-jj)>=0
                y(ii)=y(ii)+b(jj)*x(ii-jj+1);
            end
        end
    end

    for ii=1:Ny
        for jj=1:length(a)
            if (ii-jj)>=0
                y(ii)=y(ii)+a(jj)*y(ii-jj+1);
            end
        end
    end

    end
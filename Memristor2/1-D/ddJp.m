function [ n ] = ddJp(n, ni,E,dt,di,mu,D,lim )
m=max(max(abs(E)))/1e8 ;

if m<1e-8
    m=1e-8;
end

Ei=E+m;


J=zeros(ni+1,1);


 i=2:ni;
 
     J(i)=(mu(i).*0.25.*(n(i)+n(i-1)).*(Ei(i)+Ei(i-1)))+D(i).*((n(i)-n(i-1)))/di;
     
for i=(1):ni
    
    if  n(i)>lim
      
        if J(i)<0
            J(i)=0;
        end
        if J(i+1)>0
            J(i+1)=0;
        end
        
    end
    
end


dJ=zeros(ni,1);
    i=1:ni;
   dJ(i)=(J(i+1)-J(i))/di;
n=n+dJ*dt;

end


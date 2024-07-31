function [G,R]=growth(data, shock3)

G=zeros(12,8);
R=zeros(12,1);
t=data.time(3:end)/60;
M=data.data(3:end,[11 [1:10] 12],[8:-1:1]);

drug=[0 [2:1/6:3]];
y=zeros(1,23);

for j=1:12 
    for i=1:8
        
        v=log2(M(:,j,i));
   
        if (shock3==1 && j==10 && i==3) % manual correction
            o1=-2.7;
            o2=-0.7;
        else
            o1=-3;
            o2=-1;
        end

        %times at which log OD is o1 and o2
        i1=find(v>o1,1);
        i2=find(v>o2,1);

     
        %if not empty
        if ~isempty(i2)            
            c=polyfit(t(i1:i2),v(i1:i2)',1);
            G(j,i)=c(1); % growth rate            
        end
        
    end


    vv=G(j,:);
    i1=find(vv==0,1);
    i1=max(i1,3);
    ii=[i1-2:i1];
    cc = polyfit( drug(ii) , vv(ii) , 3 );
    drug_range=linspace(drug(i1-2),1+drug(i1),100);
    vvv = polyval( cc, drug_range );
    g0=vv(1)/2;
    iy = find( vvv < g0 ,1);
    y = drug_range(iy);
    if(~isempty(y))
        R(j)=y;
    end

end

end


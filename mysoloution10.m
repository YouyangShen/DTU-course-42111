%% section 1
xy = readmatrix('xy.txt');
neighbors = readmatrix('neighbors.txt');
distances = readmatrix('distances.txt');

figure;
%plot([xy(:,1),xy(:,2)]);
hold on
for i=1:100
    for j=2:10
        TF = isnan(neighbors(i,j));
        if TF==0;
        plot([xy(i,1),xy(neighbors(i,j),1)],[xy(i,2),xy(neighbors(i,j),2)]);
        end
    end
end

%% section 3

V = zeros(100,50)*NaN;
V(1,:) = 0;
for j = 2:10
    TF = isnan(neighbors(i,j));
    if TF==0;
    V(neighbors(1,j),2) = V(1,1)+distances(neighbors(1,j),2);
    end
end
u = zeros(100,50)*NaN;
for t = 3:50
    for i = 2:100
        temp = zeros(1,10)*NaN;
        for j = 2:10
            TF = isnan(neighbors(i,j));
            if TF==0;
                temp(1,1) = V(i,t-1);
                temp(1,j) = V(neighbors(i,j),t-1) + distances(i,j);
                c = min(temp);
                V(i,t) = c;
                for k = 1:10
                    if temp(1,k) == c;
                        u(i,t) = neighbors(i,k);
                        hold on
                        plot([xy(i,1),xy(u(i,t),1)],[xy(i,2),xy(u(i,t),2)],'r','LineWidth',2)
                    end
                end
            end
        end
    end
end

%% section 4




function [local] =getLocalMaximum(M,m1,m2,np) 
% the function is to get the few local maximums in a matrix
% M is traget matrix
% m1*m1 the size of local matrix
% np is the total of the local maximum
% the format of local is abscissa value, ordinate value, maxumum
[a,b] = size(M);
local = zeros(fix(a/m1*b/m2)*np,3);
n = 0;
[a,b] = size(M);
subMatrix = zeros(m1,m2);	                    % local matrix
for x = 1:m1/2:a
	for y = 1:m2:b
       	 if x+m1-1 <= a && y+m2-1 <= b
            subMatrix = M(x:x+m1-1,y:y+m2-1);
            s = sort(subMatrix(:),'descend');
            for k = 1:np
            	[r,c] = find(M == s(k));
            	n = n+1;
                local(n,:) = [r,c,s(k)];
            end
        end
       end
end

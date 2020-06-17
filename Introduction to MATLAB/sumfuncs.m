%% Generation of function

function [s]=sumfuncs(Y)

% Sum up the rows (individual function) of Y
sizeY=size(Y);
nrows=sizeY(1);
ncols=sizeY(2);

s=zeros(1,ncols);
for z=1:nrows
    s(1,:)=s(1,:)+Y(z,:); % Calculates the total value 
end

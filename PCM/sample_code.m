
%% Quantization of the signal (Uniform Quantization)

ymax=round(max(sample_signal));                 % Find the max amplitude and round off for easy calculation
ymin=round(min(sample_signal));                 % Find the min amplitude and round off for easy calculation4 

bits = 2;                                       % Number of bits for representation for 12 choosen to 
                                                % represent in 4 bits 

step_size = (2*ymax)/(2^bits);                  % Calculating the step size
                                                % No. of division to go dividing the steps equally
step_division=(ymin-(step_size/2)):step_size:(ymax+(step_size/2));       
step_value=[ymin:step_size:ymax];               % Get the value of steps 
[index,quants]= quantiz(sample_signal,step_value,step_division);   % Uniform Quantization performed 
 % Finding the length/size of the signal where the value is quantized partitioned
l1=length(index);
% quants has the quantized values; find the size of the array
l2=length(quants);

%Perfoming Uniform Quantization (Mid-Rise Type)
for i=1:l1
  if(index(i)~=0)
  index(i)=index(i)-1;
  end
i=i+1;
end
for i=1:l2
  if(quants(i)==ymin-(step_size/2))
  quants(i)=ymin+(step_size/2);
  end
end
figure;                                        % Create New figure for plotting
subplot(2,1,1)                                  
stem(quants);                                  % Quantized Mid Level Output plotted 
% Description to the plots
title('Quantized Signal Uniform Mid Level');
xlabel('Discrete Time'); ylabel ('Amplitude');

%% PCM Encoding 

bin=zeros(l1,bits);
for i=1:l1
  fin=index(1,i);
  tmp=bits;
  while 1<fin
fin=floor(fin/2);
bin(i,tmp)=rem(fin,2);
tmp=tmp-1;
  end
bin(i,1)=fin;
end
bitr=1;

for i=0:l1-1
    if (bin(i+1)==0)
        y(2*i+1)=0;
        y((2*i)+2)=0;
    else
        y(2*i+1)=1;
        y((2*i)+2)=0;
    end 
end



 
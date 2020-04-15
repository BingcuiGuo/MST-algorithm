cats = cell(1,12); 

signal_name = {'R03v1_Tx1_','R03v1_Tx2_','R04v1_Tx1_','R04v1_Tx2_','R05v1_Tx1_',...
    'R05v1_Tx2_','Y04v2_Tx1_','Y04v2_Tx2_', 'Y06v2_Tx1_', 'Y06v2_Tx2_', 'Y10v2_Tx1_',...
    'Y10v2_Tx2_'};

for j=1:12
    n=1; 
    temp = zeros(10000,1000);  
for i = 1:1000
    filename = strcat(signal_name{j}, num2str(i, '%04.f'),'.sig');
    if isfile(filename)
        temp(:,n) = read_packet(filename); 
        n = n+1; 
    else
        continue;
    end
end

while(sum(temp(:,end))==0)
    temp = temp(:,1:end-1); 
end
cats{1,j} = temp; 

end

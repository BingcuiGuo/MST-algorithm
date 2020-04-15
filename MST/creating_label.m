function[output] = creating_label(label_size, input, nsample, training_proportion,missing_value)
training_sample = nsample*training_proportion;
test_sample = nsample-training_sample-missing_value;
category_number = nsample/label_size; 
category_training_size = category_number*training_proportion; 

train_label = zeros(1,training_sample); 
test_label = zeros(1,test_sample); 

counter = 1; 

for i = 1:label_size
    temp = input{1,i};
    [row_num, col_num] = size(temp); 
    train_label(((i-1)*category_training_size+1):i*category_training_size) = i.* ones(category_training_size,1)';
    test_label(counter:counter+col_num-category_training_size-1) = i.* ones(col_num-category_training_size,1)';
    counter = counter+col_num-category_training_size; 
end

train_label = categorical(train_label); 
test_label = categorical(test_label); 
output = cell(1,2);
output{1,1} = train_label; 
output{1,2} = test_label;
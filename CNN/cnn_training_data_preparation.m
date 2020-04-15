function [cnn_data_result] = cnn_training_data_preparation(input,train_size,nsample, training_proportion,label_size,threshold,missing_value)
training_set_sample_size = int16(nsample*training_proportion);
test_set_sample_size = nsample-training_set_sample_size-missing_value; 
category_number = nsample/label_size; 
category_training_size = int16(category_number*training_proportion); 
cnn_training_data = zeros(train_size,2,1,training_set_sample_size);
cnn_testing_data = zeros(train_size,2,1,test_set_sample_size);
n=1;
m=1; 
cnn_data_result = cell(1,2);
for i = 1:label_size
    temp = input{1,i};
    [row_num,column_num] = size(temp); 
    random_number = randperm(column_num)';
    random_index = random_number(1:category_training_size); 
    test_random_index = random_number(category_training_size+1:column_num);
    temp_train = zeros(train_size,2,1,category_training_size);
    temp_test = zeros(train_size,2,1,column_num-category_training_size); 
    for k = 1:category_training_size
        start = find(temp(:,random_index(k))>threshold,1); 
        temp_train(:,1,1,k) = real(temp(start:start+train_size-1,random_index(k)));
        temp_train(:,2,1,k) = imag(temp(start:start+train_size-1,random_index(k)));
    end
    for j = 1:length(test_random_index)
        start = find(temp(:,test_random_index(j))>threshold,1); 
        temp_test(:,1,1,j) = real(temp(start:start+train_size-1,test_random_index(j)));
        temp_test(:,2,1,j) = imag(temp(start:start+train_size-1,test_random_index(j)));
    end
    cnn_training_data(1:train_size,1:2,1,n:n+category_training_size-1) = temp_train; 
    cnn_testing_data(1:train_size,1:2,1,m:m+length(test_random_index)-1)=temp_test; 
    n = n+category_training_size; 
    m = m+length(test_random_index); 
end
cnn_data_result{1,1} = cnn_training_data;
cnn_data_result{1,2} = cnn_testing_data; 

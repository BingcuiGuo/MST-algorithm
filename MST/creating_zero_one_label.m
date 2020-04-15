function[one_zero_train_label] = creating_zero_one_label(sample_size, training_proportion,label_size)
one_zero_train_label = cell(1,label_size); 
training_size = sample_size*training_proportion; 
category_size = training_size/label_size; 
for i = 1:label_size
    mst_train_label = zeros(1,training_size);
    mst_train_label(1,(i-1)*category_size+1:i*category_size) = ones(1,category_size); 
    one_zero_train_label{1,i} = mst_train_label; 
end

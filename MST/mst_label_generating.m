function[train_label] = mst_label_generating(label_size, nsample, training_proportion)
training_sample = int16(nsample*training_proportion);
category_number = nsample/label_size; 
category_training_size = int16(category_number*training_proportion); 
train_label = zeros(1,training_sample); 

for i = 1:label_size
    train_label(((i-1)*category_training_size+1):i*category_training_size) = i.* ones(category_training_size,1)';
end



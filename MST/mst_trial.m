one_zero_train_label = cell(1,12); 
mst_result = mst_data_preparation(cats,32,12000,0.9,12,0.05,6);
mst_test_32 = mst_result{1,2};
mst_train_32 = mst_result{1,1}; 

mst_label = double(train_label);

%create mst labels
first_second_label = creating_zero_one_label(12000,0.9,12);

%create network param
stage_num = 3;
neuron_per_stage = [10 15 15];
goal_per_stage = [1e-3 1e-5 1e-7];
iteration_per_stage = [100 150 250];
mlp_per_stage = [60 36 36];
layer_per_stage = [2 2 2]; 

trained_mst = mst_training(mst_label, layer_per_stage,first_second_label,mst_train_32,...
    12,stage_num,iteration_per_stage,mlp_per_stage,neuron_per_stage,goal_per_stage);

predicted_label = mst_testing(mst_test_32, trained_mst,1194);

mst_accuracy = sum(predicted_label==test_label)/numel(test_label); 








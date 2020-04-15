function[predicted_label] = mst_testing(test_data,pretrained_nets,sample_size)
[row_num, n_stage] = size(pretrained_nets);
for i = 1:n_stage
    [row_num_stage, mlp_num] = size(pretrained_nets{1,i});
    current_stage_data = zeros(mlp_num, sample_size);
    current_stage_net = pretrained_nets{1,i}; 
    for j = 1:mlp_num
        current_net = current_stage_net{1,j};
        current_stage_one_sample = current_net(test_data); 
        current_stage_data(j,1:sample_size) = current_stage_one_sample; 
    end
    test_data = current_stage_data;
end

predicted_label_test_result = zeros(1,sample_size);
for i = 1:sample_size
    predicted_label_test_result(1,i) = round(mean(test_data(1:mlp_num,i)));
end

predicted_label = categorical(predicted_label_test_result);




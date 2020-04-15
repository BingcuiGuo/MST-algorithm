function[network_total] = mst_training(train_label, layer_per_stage, zero_one_label, mst_training_data, label_size,stage_num, iteration_per_stage,mlp_per_stage, neuron_per_stage, goal_per_stage)
seed = 1;
network_total = cell(1,stage_num); 
[row_num, nsample] = size(train_label);
for i = 1:stage_num
    classification_num = mlp_per_stage(i)/label_size;
    layer_size = [];
    output_sample = zero_one_label{1,1};
    % create general mlp
    for j = 1:layer_per_stage(i)
        layer_size = [layer_size neuron_per_stage(i)];
    end
    mlp = feedforwardnet(layer_size,'trainlm');
    mlp = configure(mlp, mst_training_data,output_sample); 
    for k = 1:layer_per_stage(i)
        mlp.layers{k}.transferFcn = 'tansig';
    end
    mlp.layers{k+1}.transferFcn = 'purelin';
    mlp.trainParam.goal=goal_per_stage(i);
    mlp.trainParam.epochs = iteration_per_stage(i);

network_stage = cell(1,mlp_per_stage(i)); 
stage_input = zeros(mlp_per_stage(i),nsample); 

%training the mlp
counter=1; 
for m = 1:label_size
    for n = 1:classification_num
      rng(seed); 
      mlp = init(mlp);
      if i == stage_num
          mlp_current = train(mlp, mst_training_data,train_label);
      else
          mlp_current = train(mlp, mst_training_data, zero_one_label{1,m});
      end
      train_result = mlp_current(mst_training_data);
      stage_input(counter,1:nsample) = train_result; 
      network_stage{1,counter} = mlp_current; 
      seed = seed+1;
      counter=counter+1; 
    end
end
mst_training_data =stage_input;
network_total{1,i} = network_stage; 
end
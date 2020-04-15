function [dnn_network] = dnn_net_work(training_data, training_label)

%defind network architecture
dnn_layers = [...
imageInputLayer([64 1 1])
fullyConnectedLayer(128);
reluLayer; 
fullyConnectedLayer(128); 
reluLayer; 
fullyConnectedLayer(12);
softmaxLayer; 
classificationLayer]; 
  
%define options
options = trainingOptions('adam',...
    'MiniBatchSize', 32,...
    'Plots','training-progress');

%train the network
dnn_network = trainNetwork(training_data, training_label, dnn_layers, options);


function [cnn_network] = cnn_net_work(training_data, training_label)

%defind network architecture
cnn_layers = [...
    imageInputLayer([32 2 1])
    
    convolution2dLayer([8 2], 64); 
    maxPooling2dLayer([2 1], 'Stride',1)
    reluLayer; 
    
    convolution2dLayer([16 1],32);
    maxPooling2dLayer([2 1],'Stride',1); 
    reluLayer; 
    
    fullyConnectedLayer(128);
    reluLayer; 
 
   fullyConnectedLayer(12);
    softmaxLayer
    classificationLayer
    ];

%%define the options
options = trainingOptions('sgdm',...
 'MiniBatchSize', 32,...
    'Plots','training-progress');

%train the network
cnn_network = trainNetwork(training_data, training_label, cnn_layers, options);




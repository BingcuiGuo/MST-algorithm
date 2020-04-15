%%create test data and train data
result = cnn_training_data_preparation(cats,32,12000,0.9,12,0.05,6);
cnn_train_32 = result{1,1};
cnn_test_32 = result{1,2};

%%create test label and train label
label_cnn = creating_label(12, cats, 12000, 0.9,6);
training_label_cnn = label_cnn{1,1};
test_label_cnn = label_cnn{1,2}; 

%%train the network
cnn_net_trained = cnn_net_work(cnn_train_32, training_label_cnn); 

%test the network
predictedLabels_cnn = classify(cnn_net_trained, cnn_test_32);
cnn_accuracy = sum(predictedLabels_cnn'==test_label_cnn)/numel(test_label_cnn); 
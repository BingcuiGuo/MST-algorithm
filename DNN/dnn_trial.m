%%preparing the data
result = dnn_training_data_preperation(cats,32,12000,0.9,12,0.05,6);
dnn_test_32 = result{1,2};
dnn_train_32 = result{1,1}; 

%%create test label and train label
label_dnn = creating_label(12, cats, 12000, 0.9,6);
training_label_dnn = label_dnn{1,1};
test_label_dnn = label_dnn{1,2}; 

%%train the network
dnn_net_trained = dnn_net_work(dnn_train_32, training_label_dnn); 

%test the network
predictedLabels_dnn = classify(dnn_net_trained, dnn_test_32);
dnn_accuracy = sum(predictedLabels_dnn'==test_label_dnn)/numel(test_label_dnn); 

function res = runMatlabModel(data)

    load("C:\Users\sjatti\MATLAB\Projects\functions\currentClassifier11-16.mat")

    % Filter data
    [dataChTimeTr] = preprocessDataLive(data);

    % Extract features
    feature_table = extractFeatures(dataChTimeTr, includedFeatures);
    
    % For debugging
    % disp(data)
    % plot(dataChTimeTr')

    % Used saved model to predict
    res = currentClassifier.predict(feature_table(:, selected_features));

end

% py C:\Users\sjatti\MATLAB\Projects\NeurotechRPS\Neurotech_Pison_Pipeline\dataCollection\testData.py --matlabmodel C:\Users\sjatti\MATLAB\Projects\functions\runMatlabModel.m
% py C:\Users\sjatti\MATLAB\Projects\NeurotechRPS\Neurotech_Pison_Pipeline\dataCollection\testDataImages.py --matlabmodel C:\Users\sjatti\MATLAB\Projects\functions\runMatlabModel.m
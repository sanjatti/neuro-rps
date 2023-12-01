function [feature_table] = extractFeatures(dataChTimeTr, includedFeatures)
    
    % List of channels to include
    includedChannels = 1:size(dataChTimeTr, 1);
    
    % Initialize empty feature table
    feature_table = table();
    
    % Iterate through each included feature
    for f = 1:length(includedFeatures)
        
        % Calculate feature values based on the included feature
        switch includedFeatures{f}
            case 'var'
                fvalues = squeeze(var(dataChTimeTr, 0, 2))';
            case 'rms'
                fvalues = squeeze(sqrt(mean(dataChTimeTr.^2, 2)))';
            case 'mav'
                fvalues = squeeze(mean(abs(dataChTimeTr), 2))';
            case 'wl'
                diffs = diff(dataChTimeTr, 1, 2);
                abs_diffs = abs(diffs);
                fvalues = squeeze(sum(abs_diffs, 2))';
            case 'iav'
                fvalues = squeeze(sum(abs(dataChTimeTr), 2))';
            case 'ld'
                epsilon = 1e-3;
                fvalues = squeeze(log(epsilon + mean(dataChTimeTr.^2, 2)))';
            case 'zc'
                zc = squeeze(sum(abs(diff(sign(dataChTimeTr), 1, 2)) / 2, 2));
                fvalues = zc';
            otherwise
                disp(strcat('unknown feature: ', includedFeatures{f},', skipping....'))
                break;
        end

        % Create a table with appropriate names for feature values
        if size(fvalues, 2) == 1
            feature_table = [feature_table table(fvalues, 'VariableNames', string(strcat(includedFeatures{f})))];
        elseif size(fvalues, 2) == length(includedChannels)
            for ch = includedChannels
                feature_table = [feature_table table(fvalues(:, ch), 'VariableNames', string(strcat(includedFeatures{f}, '_', 'Ch', num2str(ch))))];
            end
        else
            for v = 1:size(fvalues, 2)
                feature_table = [feature_table table(fvalues(:, v), 'VariableNames', string(strcat(includedFeatures{f}, '_', 'val', num2str(v))))];
            end
        end
    end
end
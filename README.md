# neuro-rps
Rock-Paper-Scissors Application for Neurotechnology, Brains, and Machines. 

Data:
The data is collected using the Pison armbands. All of the data is using the right arm, default and neutral hand position, no preamble movement with the hand resting on the table, with the person in a sitting position. It was collected on three different days.

Process:
The raw lsl_data files are all included. These files were individually loaded into the environment and pre_collected_EMG_data.mlx was run to extract features and save a new feature table. These are then concatenated in processfiles.mlx. This is then loaded into offline_classification.mlx to create a classifier and run the model on the data. The other three MATLAB functions are used for live classification. 

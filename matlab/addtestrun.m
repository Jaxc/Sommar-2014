function [ loaded_matrix ] = addtestrun( t,m,freq )
%ADDTESTRUN Summary of this function goes here
%   Detailed explanation goes here

file_loc_rel = [ '../design_runs/t' num2str(t) '/m' num2str(m) '/sim_power_' freq 'GHz.csv' ];


loaded_file = importdata(file_loc_rel);

loaded_matrix = loaded_file.textdata;

size_matrix = size(loaded_matrix);

loaded_matrix(2:size_matrix(1),2:size_matrix(2)) = num2cell(loaded_file.data*1e-9);


end


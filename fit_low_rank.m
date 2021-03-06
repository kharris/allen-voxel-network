clear all
close all

addpath('../smoothness_prior')

input_file = ['../connectivities/extra_vis_friday_harbor/' ...
              'extra_vis_friday_harbor.mat'];
r = 120;
lambda = 1e5;

load(input_file)

[u,v]=proj_grad_low_rank(experiment_source_matrix',...
                         experiment_target_matrix_ipsi', ...
                         Lx, Ly_ipsi, lambda, r,...
                         'Omega', Omega', ...
                         'maxiter',100, ...
                         'step_size', 1e-7, ...
                         'tol',1e-5, ...
                         'momentum', 1,...
                         'line_search', 0);



[u,v]=proj_grad_low_rank(experiment_source_matrix',...
                         experiment_target_matrix_ipsi', ...
                         Lx, Ly_ipsi, lambda, r,...
                         'Omega', Omega', ...
                         'maxiter',1000, ...
                         'step_size', 1e-7, ...
                         'tol',1e-5, ...
                         'momentum', 1,...
                         'line_search', 0,...
                         'u0', u, 'v0', v);

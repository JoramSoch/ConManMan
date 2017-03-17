% ConManMan Demo
% _
% Demo Script for the Contrast Manager Manager
% See "design1.mat" for the batch created by this script!
% 
% Author: Joram Soch, BCCN Berlin
% E-Mail: joram.soch@bccn-berlin.de
% Date  : 19/02/2015, 11:15


% Step 1: Create some F-contrasts
%-------------------------------------------------------------------------%
names = {'ME N<>F' 'ME 1<>2' 'IA NF-12'}';
cons  = [ 1  1 -1 -1;
          1 -1  1 -1;
          1 -1 -1  1];
batch1 = cmm_set_F_cons(names, cons);

% Step 2: Create some T-contrasts
%-------------------------------------------------------------------------%
names = {'N>F' 'N<F' '1>2' '1<2' 'PI' 'NI'}';
cons  = [ 1  1 -1 -1;
         -1 -1  1  1;
          1 -1  1 -1;
         -1  1 -1  1;
          1 -1 -1  1;
         -1  1  1 -1];
batch2 = cmm_set_T_cons(names, cons);

% Step 3: Create effects of interest
%-------------------------------------------------------------------------%
clear names cons
names{1} = 'EOI';
cons{1}  = eye(4);
batch3   = cmm_set_F_cons(names, cons);

% Step 4: Merge contrast managers
%-------------------------------------------------------------------------%
batch12  = cmm_merge_batches(batch1, batch2);
batch123 = cmm_merge_batches(batch12, batch3);
batch    = batch123;
clear batch1 batch2 batch3 batch12 batch123

% Step 5: Edit standard settings
%-------------------------------------------------------------------------%
SPM_mat = 'C:\Joram\projects\Tools\ConManMan\Demo_Stats\SPM.mat';
batch   = cmm_edit_SPM_mat(batch, SPM_mat);
batch   = cmm_edit_del_cons(batch, true);

% Step 6: Append to batch and save
%-------------------------------------------------------------------------%
stat_dir = 'C:\Joram\projects\Tools\ConManMan\Demo_Stats\';
load(strcat(stat_dir,'design0.mat'));
cmm_save_batch(matlabbatch, batch, strcat(stat_dir,'design1.mat'));
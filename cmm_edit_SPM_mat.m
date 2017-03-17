function batch_out = cmm_edit_SPM_mat(batch_in, SPM_mat)
% _
% Edit SPM.mat in contrast manager
% FORMAT batch_out = cmm_edit_SPM_mat(batch_in, SPM_mat)
% 
%     batch_in  - a 1 x 1 cell array with input-batch structure
%     SPM_mat   - a string with the full filename of an SPM.mat
% 
%     batch_out - a 1 x 1 cell array with output-batch structure
% 
% Author: Joram Soch, BCCN Berlin
% E-Mail: joram.soch@bccn-berlin.de
% Date  : 19/02/2015, 09:55


% Get SPM.mat if necessary
%-------------------------------------------------------------------------%
if nargin < 2
    SPM_mat = spm_select(1,'^SPM\.mat$','Select SPM.mat!');
end;

% Edit SPM.mat in batch
%-------------------------------------------------------------------------%
batch_out = batch_in;
batch_out{1}.spm.stats.con.spmmat{1} = SPM_mat;
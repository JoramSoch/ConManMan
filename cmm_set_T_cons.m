function batch = cmm_set_T_cons(names, cons)
% _
% Create contrast manager with T-contrasts
% FORMAT batch = cmm_set_T_cons(names, cons)
% 
%     names - an N x 1 cell array with contrast names
%     cons  - an N x P matrix with contrast weight vectors
% 
%     batch - a  1 x 1 cell array with matlabbatch structure
% 
% Author: Joram Soch, BCCN Berlin
% E-Mail: joram.soch@bccn-berlin.de
% Date  : 19/02/2015, 09:20


% Set standard settings
%-------------------------------------------------------------------------%
batch{1}.spm.stats.con.spmmat = {''};
batch{1}.spm.stats.con.delete = 0;

% Set T-contrast weights
%-------------------------------------------------------------------------%
for i = 1:length(names)
    batch{1}.spm.stats.con.consess{i}.tcon.name    = names{i};
    batch{1}.spm.stats.con.consess{i}.tcon.weights = cons(i,:);
    batch{1}.spm.stats.con.consess{i}.tcon.sessrep = 'none';
end;
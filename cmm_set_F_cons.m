function batch = cmm_set_F_cons(names, cons)
% _
% Create contrast manager with F-contrasts
% FORMAT batch = cmm_set_F_cons(names, cons)
% 
%     names - an N x 1 cell array with contrast names
%     cons  - an N x 1 cell array with contrast matrices or
%             an N x P matrix with contrast weight vectors
% 
%     batch - a  1 x 1 cell array with matlabbatch structure
% 
% Author: Joram Soch, BCCN Berlin
% E-Mail: joram.soch@bccn-berlin.de
% Date  : 19/02/2015, 09:35


% Set standard settings
%-------------------------------------------------------------------------%
batch{1}.spm.stats.con.spmmat = {''};
batch{1}.spm.stats.con.delete = 0;

% Set F-contrast weights
%-------------------------------------------------------------------------%
for i = 1:length(names)
    batch{1}.spm.stats.con.consess{i}.fcon.name = names{i};
    if iscell(cons)
        batch{1}.spm.stats.con.consess{i}.fcon.weights = cons{i};
    else
        batch{1}.spm.stats.con.consess{i}.fcon.weights = cons(i,:);
    end;
    batch{1}.spm.stats.con.consess{i}.fcon.sessrep = 'none';
end;
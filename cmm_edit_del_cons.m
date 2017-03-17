function batch_out = cmm_edit_del_cons(batch_in, del_cons)
% _
% Edit "delete existing contrasts" in contrast manager
% FORMAT batch_out = cmm_edit_del_cons(batch_in, del_cons)
% 
%     batch_in  - a 1 x 1 cell array with input-batch structure
%     del_cons  - a logical whether to delete existing contrasts
% 
%     batch_out - a 1 x 1 cell array with output-batch structure
% 
% Author: Joram Soch, BCCN Berlin
% E-Mail: joram.soch@bccn-berlin.de
% Date  : 19/02/2015, 10:00


% Get "delete existing contrasts" if necessary
%-------------------------------------------------------------------------%
if nargin < 2
    del_cons = spm_input('Delete Existing Contrasts?',1,'b',{'Yes','No'},[1 0]);
end;

% Edit "delete existing contrasts" in batch
%-------------------------------------------------------------------------%
batch_out = batch_in;
batch_out{1}.spm.stats.con.delete = double(del_cons);
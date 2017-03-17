function batch_out = cmm_merge_batches(batch1, batch2)
% _
% Merge two contrast managers into one
% FORMAT batch_out = cmm_merge_batches(batch1, batch2)
% 
%     batch1    - a 1 x 1 cell array with input-batch structure
%     batch2    - a 1 x 1 cell array with input-batch structure
% 
%     batch_out - a 1 x 1 cell array with output-batch structure
% 
% Author: Joram Soch, BCCN Berlin
% E-Mail: joram.soch@bccn-berlin.de
% Date  : 19/02/2015, 10:05


% Merge contrast managers
%-------------------------------------------------------------------------%
batch_out = batch1;
batch_out{1}.spm.stats.con.consess = [batch1{1}.spm.stats.con.consess batch2{1}.spm.stats.con.consess];
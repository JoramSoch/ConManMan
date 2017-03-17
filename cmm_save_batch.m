function cmm_save_batch(batch0, batch1, filename)
% _
% Save contrast manager batch to mat-file
% FORMAT cmm_save_batch(batch0, batch1, filename)
% 
%     batch0   - a 1 x 1 cell array with append-to-batch structure
%     batch1   - a 1 x 1 cell array with contrast manager batch
%     filename - a string indicating the batch filename
% 
% Author: Joram Soch, BCCN Berlin
% E-Mail: joram.soch@bccn-berlin.de
% Date  : 19/02/2015, 10:40


% Append to batch if possible
%-------------------------------------------------------------------------%
if ~isempty(batch0)
    num_mods = length(batch0);
    matlabbatch = batch0;
    matlabbatch(num_mods+1) = batch1;
else
    matlabbatch = batch1;
end;

% Save contrast manager batch
%-------------------------------------------------------------------------%
save(filename,'matlabbatch');
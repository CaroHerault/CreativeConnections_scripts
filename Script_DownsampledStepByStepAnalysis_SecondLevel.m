spm('Defaults','fMRI'); %Initialise SPM fmri
spm_jobman('initcfg');

stepId = "5";%Choose from 1 to 5 to run the second level analysis for each step

matlabbatch{1}.spm.stats.factorial_design.dir = {strcat('D:\Data\pmodRatingPerStep_downsampled\Group_PmodStep',stepId)};
matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = {strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_021\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_022\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_023\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_024\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_025\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_027\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_028\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_029\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_031\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_032\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_033\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_035\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_036\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_037\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_038\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_039\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_040\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_041\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_042\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_043\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_044\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_045\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_046\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_047\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_048\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_049\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_050\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_051\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_052\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_053\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_054\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_055\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_056\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_057\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_059\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_060\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_061\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_062\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_063\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_064\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_065\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_066\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_067\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_068\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_069\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_070\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_071\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_072\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_073\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_074\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_075\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_076\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_077\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_078\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_080\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_081\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_082\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_083\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_084\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_085\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_086\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_087\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_088\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_089\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_090\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_091\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_092\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_093\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_094\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_095\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_096\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_097\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_098\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_099\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_100\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_102\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_103\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_104\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_105\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_107\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_108\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_109\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_111\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_112\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_113\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_114\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_115\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_116\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_117\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_118\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_119\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_120\con_000', stepId, '.nii,1')
                                                                  strcat('D:\Data\pmodRatingPerStep_downsampled\CREAFLEX_121\con_000', stepId, '.nii,1')
                                                                  };
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

%% (3) Estimate
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = {[strcat('D:\Data\pmodRatingPerStep_downsampled\Group_PmodStep',stepId,'\SPM.mat')]};
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run',matlabbatch);










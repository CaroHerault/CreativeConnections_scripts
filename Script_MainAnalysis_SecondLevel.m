spm('Defaults','fMRI'); %Initialise SPM fmri
spm_jobman('initcfg');

matlabbatch{1}.spm.stats.factorial_design.dir = {'D:\Data\pmod_mainAnalysis\Group_PmodAllTrials')};
matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = {strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_021\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_022\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_023\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_024\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_025\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_027\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_028\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_029\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_031\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_032\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_033\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_035\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_036\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_037\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_038\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_039\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_040\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_041\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_042\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_043\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_044\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_045\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_046\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_047\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_048\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_049\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_050\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_051\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_052\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_053\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_054\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_055\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_056\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_057\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_059\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_060\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_061\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_062\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_063\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_064\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_065\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_066\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_067\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_068\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_069\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_070\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_071\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_072\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_073\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_074\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_075\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_076\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_077\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_078\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_080\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_081\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_082\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_083\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_084\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_085\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_086\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_087\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_088\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_089\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_090\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_091\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_092\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_093\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_094\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_095\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_096\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_097\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_098\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_099\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_100\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_102\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_103\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_104\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_105\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_107\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_108\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_109\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_111\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_112\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_113\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_114\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_115\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_116\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_117\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_118\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_119\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_120\con_0001.nii,1')
                                                                  strcat('D:\Data\pmod_mainAnalysis\CREAFLEX_121\con_0001.nii,1')
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
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = {[strcat('D:\Data\pmod_mainAnalysis\Group_PmodAllTrials\SPM.mat')]};
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run',matlabbatch);










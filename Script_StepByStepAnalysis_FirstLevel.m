%% First level analysis GLM for the parametric modulation analysis on the rating
% Requires SPM12

%%%%%%%%%%%%%%%%%%%%
%% INITIALISATION %%
%%%%%%%%%%%%%%%%%%%%

spm('Defaults','fMRI'); %Initialise SPM fmri
spm_jobman('initcfg');
RootDirectory = pwd;

%%%%%%%%%%%%%
%% OPTIONS %%
%%%%%%%%%%%%%

%% (I) Constant parameters

TotalSubjects = 93;
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 1.6;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
        
%% (II) Loop over all subjects

for subjectIndex = 1:TotalSubjects 

    %% (1) Paths and directories info
        AllSubjectsOnsetDir = dir('D:\Data\parameters\onset_files\*');
        subjectID = AllSubjectsOnsetDir(2 + subjectIndex).name;
        
        % (a) Create a directory for the results of the pmod analysis for the subject
        subjectIndexStr = num2str(subjectIndex);
        mkdir('D:\Data\pmod_StepByStep',subjectID);
                      
        % (b) get the path of the preprocessed scans, onsets, durations and ratings info
        SubjectFmriDir = dir(strcat('D:\Data\nifti\',subjectID,'\R*'));
        SujectOnsetsDir = dir(strcat('D:\Data\parameters\onset_files\',subjectID,'\2*CREAFLEX*'));
        SujectRatingsDir = dir(strcat('D:\Data\parameters\parametric_individual_rating\',subjectID,'\2*CREAFLEX*'));
        SujectStepsDir = dir(strcat('D:\Data\parameters\parametric_steps\theoretical_R*'));
        
        SujectOnsetsDir_perStep = strcat('D:\Data\parameters\onsetFilesPerStep\',subjectID,'\');
        SujectRatingDir_perStep = strcat('D:\Data\parameters\ratingsPerStep\',subjectID,'\');
        
        % (c) specify where to write the SPM.mat
        matlabbatch{1}.spm.stats.fmri_spec.dir = {strcat('D:\Data\pmod_StepByStep\',subjectID)};
                
    %% (2) Loop over all runs of the subject
        
        volumesInRun = 335;
        trialsInRun = 100;
        
        for run_index=1:6%6
            
            %% if we are at run 6, we reduce to 95 the number of trials to scan in the run
            if run_index==6
                volumesInRun = 321;
                trialsInRun = 95;
            end

            %% selecting the scans in the run
            run_index_str = num2str(run_index); %string format for the run index number
            run_scans = spm_select('Expand', strcat(SubjectFmriDir(1).folder,'\R',num2str(run_index),'\wdn_ts_OC.nii'));
            run_scans_v=cellstr(run_scans);
            if and(run_index ~=6, size(run_scans_v)<335)
                t = size(run_scans_v);
                volumesInRun = t(1)
                t = run_index
            elseif and(run_index==6, size(run_scans_v)<321)
                t = size(run_scans_v);
                volumesInRun = t(1)
                t = run_index
            end
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).scans = run_scans_v(1:volumesInRun);

            %% Loading the onset, duration and rating info for the run
            filePrefix = extractBefore(SujectOnsetsDir(1).name,'onsets'); %is the same for file prefix in judgement files names
            onsetsInRun = load(strcat(SujectOnsetsDir(1).folder,'\',filePrefix,'onsets_R',run_index_str,'_.mat'));
            ratingsInRun = load(strcat(SujectRatingsDir(1).folder,'\',filePrefix,'judgement_',run_index_str,'.mat'));
            stepsInRun = load(strcat(SujectStepsDir(1).folder,'\theoretical_R',run_index_str,'.mat'));

            onset_forStep1 = load(strcat(SujectOnsetsDir_perStep,'Step1_onset_',run_index_str,'.mat'));
            duration_forStep1 = load(strcat(SujectOnsetsDir_perStep,'Step1_duration_',run_index_str,'.mat'));
            deviation_forStep1 = load(strcat(SujectDeviationDir_stepNumber,'Step1_deviation_',run_index_str,'.mat'));
            onset_forStep2 = load(strcat(SujectOnsetsDir_perStep,'Step2_onset_',run_index_str,'.mat'));
            duration_forStep2 = load(strcat(SujectOnsetsDir_perStep,'Step2_duration_',run_index_str,'.mat'));
            deviation_forStep2 = load(strcat(SujectDeviationDir_stepNumber,'Step2_deviation_',run_index_str,'.mat'));
            onset_forStep3 = load(strcat(SujectOnsetsDir_perStep,'Step3_onset_',run_index_str,'.mat'));
            duration_forStep3 = load(strcat(SujectOnsetsDir_perStep,'Step3_duration_',run_index_str,'.mat'));
            deviation_forStep3 = load(strcat(SujectDeviationDir_stepNumber,'Step3_deviation_',run_index_str,'.mat'));
            onset_forStep4 = load(strcat(SujectOnsetsDir_perStep,'Step4_onset_',run_index_str,'.mat'));
            duration_forStep4 = load(strcat(SujectOnsetsDir_perStep,'Step4_duration_',run_index_str,'.mat'));
            deviation_forStep4 = load(strcat(SujectDeviationDir_stepNumber,'Step4_deviation_',run_index_str,'.mat'));
            onset_forStep5 = load(strcat(SujectOnsetsDir_perStep,'Step5_onset_',run_index_str,'.mat'));
            duration_forStep5 = load(strcat(SujectOnsetsDir_perStep,'Step5_duration_',run_index_str,'.mat'));
            deviation_forStep5 = load(strcat(SujectDeviationDir_stepNumber,'Step5_deviation_',run_index_str,'.mat'));
            
            ratings_forStep1 = load(strcat(SujectRatingDir_perStep ,'Step1_rating_',run_index_str,'.mat'));
            ratings_forStep2 = load(strcat(SujectRatingDir_perStep ,'Step2_rating_',run_index_str,'.mat'));
            ratings_forStep3 = load(strcat(SujectRatingDir_perStep ,'Step3_rating_',run_index_str,'.mat'));
            ratings_forStep4 = load(strcat(SujectRatingDir_perStep ,'Step4_rating_',run_index_str,'.mat'));
            ratings_forStep5 = load(strcat(SujectRatingDir_perStep ,'Step5_rating_',run_index_str,'.mat'));
 

            
            %% Specify the conditions :
            
            %Cond 1 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).name = 'Step1';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).pmod(1).name = 'pmod';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).pmod(1).poly = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).tmod = 0;%time modulation
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).orth = 0; 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).onset = onset_forStep1.Step1_onset;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).duration = duration_forStep1.Step1_duration;
       
            %Cond 1 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).name = 'Step2';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).pmod(1).name = 'pmod';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).pmod(1).poly = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).tmod = 0;%time modulation
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).orth = 0; 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).onset = onset_forStep2.Step2_onset;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).duration = duration_forStep2.Step2_duration;
            
            %Cond 1 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).name = 'Step3';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).pmod(1).name = 'pmod';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).pmod(1).poly = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).tmod = 0;%time modulation
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).orth = 0; 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).onset = onset_forStep3.Step3_onset;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).duration = duration_forStep3.Step3_duration;
            
            %Cond 1 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).name = 'Step4';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).pmod(1).name = 'pmod';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).pmod(1).poly = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).tmod = 0;%time modulation
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).orth = 0; 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).onset = onset_forStep4.Step4_onset;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).duration = duration_forStep4.Step4_duration;
            
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).name = 'Step5';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).pmod(1).name = 'pmod';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).pmod(1).poly = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).tmod = 0;%time modulation
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).orth = 0; 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).onset = onset_forStep5.Step5_onset;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).duration = duration_forStep5.Step5_duration;
                        
            %cond 7
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(6).name = 'SliderMoving';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(6).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(6).tmod = 0;%time modulation
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(6).orth = 0; 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(6).onset = transpose(onsetsInRun.onsets{1,4});
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(6).duration = transpose(onsetsInRun.durations{1,4});          
            
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(7).name = 'crossFixation';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(7).tmod = 0;%time modulation
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(7).orth = 0; 
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(7).onset = transpose(onsetsInRun.onsets{1,1});
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(7).duration = transpose(onsetsInRun.durations{1,1})+transpose(onsetsInRun.durations{1,2});
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(7).pmod = struct('name', {}, 'param', {}, 'poly', {});

            %parametric mod for the first conditions
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).pmod(1).param = ratings_forStep1.Step1_rating;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(1).pmod(1).name = 'pmRating';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).pmod(1).param = ratings_forStep2.Step2_rating;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(2).pmod(1).name = 'pmRating';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).pmod(1).param = ratings_forStep3.Step3_rating;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(3).pmod(1).name = 'pmRating';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).pmod(1).param = ratings_forStep4.Step4_rating;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(4).pmod(1).name = 'pmRating';
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).pmod(1).param = ratings_forStep5.Step5_rating;
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).cond(5).pmod(1).name = 'pmRating';

                        
            %% Nuisance regressors
            
            motion_regresors = load([strcat(SubjectFmriDir(1).folder,'\R',run_index_str,'\motion_regressors_R24',run_index_str,'.mat')]);
            motion_regresors = motion_regresors.R; %24*335
            onset_scan = round(onsetsInRun.onsets{1,3} / TR);
            last_scan = onsetsInRun.onsets{1,3} + onsetsInRun.durations{1,3} + onsetsInRun.durations{1,4};
            last_scan = round(last_scan / TR);
            nuisance_reg = zeros(volumesInRun,3);
            for i=1:trialsInRun
                for j=onset_scan(i):last_scan(i)
                    if j<=volumesInRun
                       nuisance_reg(j,1) = i + 100*(run_index - 1); %rank of the trial
                       nuisance_reg(j,2) = onsetsInRun.onsets{1,3}(i); %onset time
                       nuisance_reg(j,3) = onsetsInRun.durations{1,4}(i); %reaction time (slider duration)
                    end
                end
            end             
             
            R = [motion_regresors(1:volumesInRun,1:24) nuisance_reg];
            save([strcat(SubjectFmriDir(1).folder,'\R',run_index_str,'\nuisance_regressors',run_index_str,'.mat')], 'R');
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).multi_reg = {[strcat(SubjectFmriDir(1).folder,'\R',run_index_str,'\nuisance_regressors',run_index_str,'.mat')]};          
              
            %% Other GLM parameters left with default value
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).multi = {''};
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).regress = struct('name', {}, 'val', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(run_index).hpf = 128;
            
        end % end of the loop over runs
     
    %% (3) Estimate
        matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = {[strcat('D:\Data\pmod_StepByStep\',subjectID,'\SPM.mat')]};
        matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
        matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
    
    %% (4) Contrast
        matlabbatch{3}.spm.stats.con.spmmat = {[strcat('D:\Data\pmod_StepByStep\',subjectID,'\SPM.mat')]} ;
        matlabbatch{3}.spm.stats.con.consess{1}.tcon.name = 'Step1_pmodRating';
        matlabbatch{3}.spm.stats.con.consess{1}.tcon.weights = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
        matlabbatch{3}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
        matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'Step2_pmodRating';
        matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
        matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';
        matlabbatch{3}.spm.stats.con.consess{3}.tcon.name = 'Step3_pmodRating';
        matlabbatch{3}.spm.stats.con.consess{3}.tcon.weights = [0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
        matlabbatch{3}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
        matlabbatch{3}.spm.stats.con.consess{4}.tcon.name = 'Step4_pmodRating';
        matlabbatch{3}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
        matlabbatch{3}.spm.stats.con.consess{4}.tcon.sessrep = 'none';
        matlabbatch{3}.spm.stats.con.consess{5}.tcon.name = 'Step5_pmodRating';
        matlabbatch{3}.spm.stats.con.consess{5}.tcon.weights = [0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
        matlabbatch{3}.spm.stats.con.consess{5}.tcon.sessrep = 'none';        
        matlabbatch{3}.spm.stats.con.delete = 0;
    
    %% (5) Run SPM
        spm_jobman('run',matlabbatch);
    
end 

    

import warnings
import sys
if not sys.warnoptions:
    warnings.simplefilter("ignore")

import numpy as np
import pandas as pd
from numpy import savetxt

# to load nifti files and extract masked fMRI data
import nibabel as nib
from nilearn.maskers import NiftiMasker,  MultiNiftiMasker
from scipy import stats

#list of the name of the nifti files corresponding to each network of Yeo 2011
ROI_names = ['network1', 'network2', 'network3', 'network5', 'network6', 'network7', 'network8', 'network11', 'network12', 'network13', 'network14', 'network16', 'network17', ]

nbRois = len(ROI_names)
print(nbRois)
n_subj = 93
finalMatrix = np.zeros((n_subj*6,nbRois*5))#the final matrix has [6 runs * 93 subject] columns and [5 steps * 17 ROIs] lines
finalMatrixMoyenne = np.zeros((n_subj,nbRois*5))

for indexNetwork in range(nbRois): #for each of the 17 networks

    print("------------------------------------------------------")
    print("------------------------------------------------------")

    #(1) We load the mask of the intersection of the network (Yeo) and the main pmod map

    NbVoxels = 0
    voxelValue = 0
    ROI_mask_path = "masks/Yeo_x_MainPmodMap/"+ROI_names[indexNetwork]+".nii"
    mask = nib.load(ROI_mask_path)#function from nibabel module to load the ROI nifti file
    imgNameForRun = [2, 41, 80, 119, 158, 197]
    #imgNameForRun = [1, 40, 79, 118, 157, 196]

    for stepIndex in range(1,6,1):#for each step

        print("----STEP : " + str(stepIndex))

        for subjIndex in range (1,n_subj+1,1):#for each subject
            print("Subject : " + str(subjIndex))
            valuePerRun = [0,0,0,0,0,0]
            
            for runIndex in range(1,7,1):#for each run of the subject
                imgName = imgNameForRun[runIndex-1]+2*(stepIndex-1)
                if imgName < 10:
                    imgNameStr = "000" + str(imgName)
                else:
                    if imgName < 100:
                        imgNameStr = "00" + str(imgName)
                    else:
                        if imgName < 1000:            
                            imgNameStr = "0" + str(imgName)
                
                #(2) for each step, for each subject and for each run, we load the nifti map with the betas

                subfMRI_datapath = "nifti_beta_pmodPerStep/"+str(subjIndex)+"/beta_"+imgNameStr+".nii" 
                subfMRI = nib.load(subfMRI_datapath)
                nifti_masker = NiftiMasker(mask_img=mask)#from nilearn module
                
                #(3) we apply the ROI mask to the beta map
                maskedData = nifti_masker.fit_transform(subfMRI)

                #(4) we compute the mean value of the voxels in the masked data
                TempVal = 0
                for i in range(maskedData[0].shape[0]):
                    TempVal = maskedData[0][i] + TempVal #sum of all the voxels of the beta map in the ROI mask
                TempVal = TempVal / maskedData[0].shape[0] #we divide by the number of voxels
                valuePerRun[runIndex-1]=TempVal
                
                finalMatrix[((subjIndex-1)*6)+runIndex-1][(indexNetwork*5)+stepIndex-1] = TempVal
            
            #we compute the average over the 6 runs
            finalMatrixMeanOverRuns[subjIndex-1,(indexNetwork*5)+stepIndex-1] = (valuePerRun[0]+valuePerRun[1]+valuePerRun[2]+valuePerRun[3]+valuePerRun[4]+valuePerRun[5])/6
            
#saving the results
savetxt("FinalMatrix.csv", finalMatrixMeanOverRuns, delimiter=';')


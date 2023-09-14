# 3DHiChAT
Predicting gene expression with 3D & 1D features. 

3D HiChAT is a simple random forest method used to predict gene expression via promoter interactions (enhancer-promoter, promoter-promoter, X-promoter). Model is trained with HiChIP H3k27ac data, H3k27ac ChiP-seq and ATAC-seq data in mouse data and tested in both mouse and human cell lines at 5 and 10kb reesolutions showing similar scores. 

Features are generated from:
i. 3D data [HiChIP H3k27ac], and  
ii. 1D data:
    a. ATAC-seq and 
    b. H3k27ac ChiP-seq. If ChiP-seq is not available user can generate peaks using PeakInferHiChIP.sh from FitHiChIP tools (https://ay-lab.github.io/FitHiChIP/html/usage/Utilities.html#inferring-peaks-from-hichip-data-for-use-in-the-hichip-pipeline)

3DHiChAT.R is trained using leave-one-chromosome-out (LOCO) method where training is performed in all chromosomes but one. This step is repeated 20 times for chromosomes 1 to 19 plus chrX. 
Input data are in the form of a txt tab delimited file (Train.txt) where the following 8 features are used in order to predict gene expression:
1. Promoter ChIP strength
2. Promoter Atac strength
3. Promoter Loop strenght
4. Promoter Connectivity
5. Promoter HiChAT score = Geometric mean of combined ATAC and ChIP strength on enhancer peaks multiplied with Loop strength. Score similat to activity score from ABC for HiChIP loops. [Loop strenght x (geometric mean (Atac strength x ChIP strength))]
6. Enhancer Atac strength
7. Enhancer Loop Strength
8. Enhancer HiChAT score. (similar to promoter).

Training dataset (Train.txt) contains 10 columns.
1. First column contains a unique ID which can be a gene name or the coordinates of the promoter bin at different resolutions.
2. Second columns contains the Chromosome number.
3. All 8 features used for testing or training (3D & 1D) in any order.

3DHiChAT.R can be used in R after installing "caret" and "randomForest" library. 

R 4.0.4 (2021-02-15) and randomForest 4.6-14 were used to calculate spearman rank correlation for the training of Train.txt file.

Download all files in a folder and test the code for both estimating predicted gene expession (3DHiChAT.R) and calculating perturbation score after enhancer removal for a specific enhancer - promoter pair. 

After running 3DHiChAT.R on the Train.txt using the following example, test spearman correlation score for chr1, which should generate value of 0.4746: 

#################################################

R

library(randomForest)

load("3DHiChAT.Rdata")

a<- read.csv('Train.txt', sep="\t", header=T)

test_chr1$random<- predict(randomfor_chr1, test_chr1)

spcor1<- cor(test_chr1$tpm,  test_chr1$random, method="spearman")

spcor1  ##0.4746914

#Testing in a new datasets should include all 20 models for each chromosome and all values should be averaged.

test_chr1$random<- predict(randomfor_chr1, test_chr1)....

..

test_chr19$random<- predict(randomfor_chr19, test_chr19)

test_chrX$random<- predict(randomfor_chrX, test_chrX)

######################################################################

For calculating perturbation score for any enhancer-promoter pair generate files before.csv and after.csv where you include all variables neccessary for 3DHiChAT before and after removing the enhancer, thus affecting most of the features (from #3 to #8).

Run 'Rscript perturbation_score.R' and the effect on gene expression is displayed (%) for that specific enhancer-promoter pair, which should generate the value of 29.2729.






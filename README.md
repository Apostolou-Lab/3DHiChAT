# 3DHiChAT
Predicting gene expression with 3D features
Random forest method for utilizing 3D features from HiChIP and 1D from ATAC-seq (and ChiP-seq if available) to predict gene expression via enhancer-promoter, promoter-promoter, X-promoter interactions. 
Promoter HUB features include ChIP strength, Atac strength, Loop strenght & Connectivity (# loops/interactions) and ABC-like score (HiChAT) based on promoter-enahncer interactions [ Loop strenght x (geometric means (Atac strength x ChIP strength)) ]

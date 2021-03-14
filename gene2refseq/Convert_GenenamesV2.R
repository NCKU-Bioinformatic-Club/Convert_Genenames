# https://www.gungorbudak.com/blog/2018/08/07/convert-gene-symbols-to-entrez-ids-in-r/
# # install
# source('https://bioconductor.org/biocLite.R')
# biocLite('org.Hs.eg.db')
rm(list = ls())

# load
library('org.Hs.eg.db')
#library('org.Mm.eg.db')
library(AnnotationDbi)

#columns(org.Hs.eg.db)
#columns(org.Mm.eg.db)


###############
## Files name setting
setwd(getwd()) ## Set current working directory
FilesName <- getwd() ## Set output directroy

Cut <- read.table(paste0(FilesName,"/cut.txt"))
CutName  <- as.vector(rownames(Cut))
CutName  <-NM_001003806
Cut2 <- AnnotationDbi::select(org.Hs.eg.db, keys=CutName, columns='SYMBOL', keytype='REFSEQ') 

CutNew <- cbind(Cut2,Cut)


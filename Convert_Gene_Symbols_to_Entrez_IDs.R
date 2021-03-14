# https://www.gungorbudak.com/blog/2018/08/07/convert-gene-symbols-to-entrez-ids-in-r/
# # install
# source('https://bioconductor.org/biocLite.R')
# biocLite('org.Hs.eg.db')
rm(list = ls())

# load
library('org.Hs.eg.db')
library('org.Mm.eg.db')


columns(org.Hs.eg.db)
columns(org.Mm.eg.db)

# you will have your own list here
symbols <- c('AHNAK', 'BOD1L1', 'HSPB1', 'SMARCA4', 'TRIM28')

# use mapIds method to obtain Entrez IDs
symbols_mapIds <- mapIds(org.Hs.eg.db, symbols, 'ENTREZID', 'SYMBOL')

###############
## Files name setting
setwd(getwd()) ## Set current working directory
FilesName <- getwd() ## Set output directroy
## Load files
# Cell cycle file
cc.genes <- read.csv(paste0(FilesName,"/Cell cycle/regev_lab_cell_cycle_genesCh.csv"))
s.genes <- cc.genes[1:43,]
TTT1 <- as.character(s.genes)
TTT2 <- mapIds(org.Hs.eg.db, TTT1, 'ENSEMBL', 'SYMBOL')
TTT2_2 <- mapIds(org.Hs.eg.db, as.character(s.genes), 'ENTREZID', 'SYMBOL')

#老鼠的基因名要小寫= =...
#https://www.cnblogs.com/awishfullyway/p/6636303.html
library(Hmisc)
s.genes2 <- capitalize(tolower(s.genes))
TTT1M <- as.character(s.genes2)
TTT3M <- mapIds(org.Mm.eg.db, TTT1M, 'ENSEMBL', 'SYMBOL')
TTT3M_2 <- mapIds(org.Mm.eg.db, TTT1M, 'ENTREZID', 'SYMBOL')

###############
# https://www.biostars.org/p/167158/
source("https://bioconductor.org/biocLite.R")
biocLite("org.Mm.eg.db")
library(AnnotationDbi)
library(org.Mm.eg.db)
#AnnotationDbi::select(org.Mm.eg.db, keys=genes, columns='ENTREZID', keytype='SYMBOL')
AnnotationDbi::select(org.Mm.eg.db, keys=TTT1, columns='ENTREZID', keytype='SYMBOL') #error

#Test
symbols2 <- c('Top2a','Top2b')
AnnotationDbi::select(org.Mm.eg.db, keys=symbols2, columns=c('ENTREZID','ENSEMBL','REFSEQ'), keytype='SYMBOL')
#Test

#老鼠的基因名要小寫= =...

#https://www.cnblogs.com/awishfullyway/p/6636303.html
library(Hmisc)
s.genes2 <- capitalize(tolower(s.genes))
TTTMUS <- AnnotationDbi::select(org.Mm.eg.db, keys=s.genes2, columns='ENSEMBL', keytype='SYMBOL')


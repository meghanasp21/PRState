#! /bin/bash
#SBATCH --mem=20G
#SBATCH -o ./out/%A.%x.%a.out # STDOUT
#SBATCH -e ./err/%A.%x.%a.err # STDERR
#SBATCH --array=1-23%23

chroms=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)
chrom=${chroms[$SLURM_ARRAY_TASK_ID-1]}

date

geno=/nrnb/users/mpagadal/oncoarray/genotypes/all/imputed/all_chrom_files
cov=/nrnb/users/mpagadal/oncoarray/covs/age-pcs
plink=/cellar/users/mpagadal/Programs/plink2
pheno=/nrnb/users/mpagadal/oncoarray/phenotypes/pheno_affection_status.txt
patients=/cellar/users/mpagadal/Data2/projects/PRState/patients/test_train/$1.txt
out=/cellar/users/mpagadal/Data2/projects/PRState/associations/train


$plink --bfile $geno/chr$chrom.nodups.maf --keep $patients --pheno $pheno --glm firth-fallback cols=+err --covar $cov --covar-name PC1-PC10,age --adjust --covar-variance-standardize --out $out/$1.chr$chrom


date

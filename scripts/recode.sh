#! /bin/bash
#SBATCH --mem=20G
#SBATCH -o ./out/%A.%x.%a.out # STDOUT
#SBATCH -e ./err/%A.%x.%a.err # STDERR
#SBATCH --array=1-23%23
#SBATCH --partition=carter-compute

chroms=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X)
chrom=${chroms[$SLURM_ARRAY_TASK_ID-1]}

date

geno=/cellar/controlled/dbgap-genetic/phs001120.v1.p1_ellipse/genotypes/all/imputed/all_chrom_files/chr$chrom.nodups.maf
plink=/cellar/users/mpagadal/Programs/plink

# PRState snps

# #African

# extract=/cellar/users/mpagadal/projects/PRState/genotypes/african/extract.txt
# out=/cellar/users/mpagadal/projects/PRState/genotypes/african

# $plink --bfile $geno --extract $extract --recode A --out $out/chr$chrom

# #European

# extract=/cellar/users/mpagadal/projects/PRState/genotypes/european/extract.txt
# out=/cellar/users/mpagadal/projects/PRState/genotypes/european

# $plink --bfile $geno --extract $extract --recode A --out $out/chr$chrom

# #European-African

# extract=/cellar/users/mpagadal/projects/PRState/genotypes/european-african/extract.txt
# out=/cellar/users/mpagadal/projects/PRState/genotypes/european-african

# $plink --bfile $geno --extract $extract --recode A --out $out/chr$chrom

# Conti snps

#African

extract=/cellar/users/mpagadal/projects/PRState/genotypes/african/extract.conti.full.txt
out=/cellar/users/mpagadal/projects/PRState/genotypes/african/conti

mkdir $out

$plink --bfile $geno --extract $extract --recode A --out $out/chr$chrom

#European

extract=/cellar/users/mpagadal/projects/PRState/genotypes/european/extract.conti.full.txt
out=/cellar/users/mpagadal/projects/PRState/genotypes/european/conti

mkdir $out

$plink --bfile $geno --extract $extract --recode A --out $out/chr$chrom

#European-African

extract=/cellar/users/mpagadal/projects/PRState/genotypes/european-african/extract.conti.full.txt
out=/cellar/users/mpagadal/projects/PRState/genotypes/european-african/conti

mkdir $out

$plink --bfile $geno --extract $extract --recode A --out $out/chr$chrom


date

#! /bin/bash
#SBATCH --mem=10G
#SBATCH -o ./out/%A.%x.%a.out # STDOUT
#SBATCH -e ./err/%A.%x.%a.err # STDERR
#SBATCH --partition=carter-compute
#SBATCH --time=1-00:00:00

date

source activate r-4.0

Rscript ~/scripts/ldlink.R /cellar/users/mpagadal/projects/PRState/data/extract.afr.rsid.extract.txt

date
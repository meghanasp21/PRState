#! /bin/bash
#SBATCH --mem=10G
#SBATCH -o ./out/%A.%x.%a.out # STDOUT
#SBATCH -e ./err/%A.%x.%a.err # STDERR
#SBATCH --array=1-10%10

echo $SLURM_ARRAY_TASK_ID
echo $HOSTNAME

export PATH=/cellar/users/mpagadal/Programs/anaconda3/bin:$PATH

samples=(european.african.80.9.train european.african.80.8.train european.african.80.6.train european.african.80.7.train european.african.80.4.train european.african.80.5.train european.african.80.2.train european.african.80.3.train european.african.80.0.train european.african.80.1.train)
sample=${samples[$SLURM_ARRAY_TASK_ID-1]}

assoc=/cellar/users/mpagadal/Data2/projects/PRState/associations/train
out=/cellar/users/mpagadal/Data2/projects/PRState/results/train
assoc_type="logistic"

date

cd $out

#make plotting dataframe

head -1 $assoc/$sample.chr1.PHENO1.glm.logistic.hybrid > $sample.GWAS
tail -n +2 -q $assoc/$sample.chr*.PHENO1.glm.logistic.hybrid  >> $sample.GWAS


echo "plink logistic files are being used for plotting"
head -1 $sample.GWAS > $sample.GWAS.ADD
awk '{ if ($8 == "ADD") { print $0} }' $sample.GWAS >> $sample.GWAS.ADD


date

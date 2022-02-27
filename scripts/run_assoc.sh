#! /bin/bash
#SBATCH --mem=20G
#SBATCH -o ./out/%A.%x.%a.out # STDOUT
#SBATCH -e ./err/%A.%x.%a.err # STDERR
#SBATCH --array=1-10%10

# samples=(european.80.8.train european.80.9.train european.80.5.train european.80.4.train european.80.7.train european.80.6.train european.80.1.train european.80.0.train european.80.3.train european.80.2.train african.80.8.train african.80.9.train african.80.5.train african.80.4.train african.80.7.train african.80.6.train african.80.1.train african.80.0.train african.80.3.train african.80.2.train)
samples=(european.african.80.9.train european.african.80.8.train european.african.80.6.train european.african.80.7.train european.african.80.4.train european.african.80.5.train european.african.80.2.train european.african.80.3.train european.african.80.0.train european.african.80.1.train)
sample=${samples[$SLURM_ARRAY_TASK_ID-1]}

date

sbatch assoc.sh $sample

date

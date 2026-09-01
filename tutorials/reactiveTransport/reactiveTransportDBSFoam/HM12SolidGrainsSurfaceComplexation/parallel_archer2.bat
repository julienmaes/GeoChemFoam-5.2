#!/bin/bash
#SBATCH --job-name=parallel
#SBATCH --time=0:20:0
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1

# Replace [budget code] below with your budget code (e.g. t01)
#SBATCH --account=ecseaj02
#SBATCH --partition=standard
#SBATCH --qos=standard

# Set the number of threads to 1 to avoid auto-threading
export OMP_NUM_THREADS=1

# Propagate the cpus-per-task setting from script to srun commands
export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK

# Configure GCF using Archer2 module
module load other-software
module load gcfoam/5.2
source $GCFOAM_DIR/etc/bashrc_archer2

# Configure Python
module load cray-python
source /work/ecseaj02/ecseaj02/gavingcf/myvenv/bin/activate

export PLATFORM=ARCHER2
echo -e "Run job_name in parallel on $NP $PLATFORM processors"

# Choose just one of the following parallel scripts.
#./createMesh.sh
#./initCaseFlow.sh
#./runCaseFlow.sh
#./processFlow.sh
#./initCaseReactiveTransport.sh
#./runCaseReactiveTransport.sh
#./processReactiveTransport.sh




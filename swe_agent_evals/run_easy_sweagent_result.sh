#!/bin/bash

# Self-constructed dataset, make sure it is the path to the dataset. 
# Or you can also use the dataset from the SWE-Bench dataset; remember the name of that should begin with "princeton-nlp/*".
DATASET_NAME="princeton-nlp/SWE-bench_Verified"

SPLIT="test" # Default split

###### Only Modify these two veriables ##########
experiment_name="4o_no_tips_In_round2"

RUN_ID=0 # The run ID to identify the run
###### Only Modify these two veriables ##########

# Self-inferenced data, make sure it is the path to the predictions
PREDICATIONS_PATH="swe_agent_preds/experiment_results/${experiment_name}/all_preds.jsonl"

max_workers=2 # Default value, can be higher with nproc=128


CACHE_LEVEL="base"

# Create output directory if it doesn't exist
mkdir -p swe_agent_evals/experiment_results/${experiment_name}

# Now use nohup to call swebench/harness/run_evaluation.py
nohup python swebench/harness/run_evaluation.py \
    --dataset_name "${DATASET_NAME}" \
    --split "${SPLIT}" \
    --predictions_path "${PREDICATIONS_PATH}" \
    --max_workers "${max_workers}" \
    --run_id "${RUN_ID}" \
    --cache_level "${CACHE_LEVEL}" \
    &> "swe_agent_evals/experiment_results/${experiment_name}/evaluation_run_${RUN_ID}.log" 2>&1 &
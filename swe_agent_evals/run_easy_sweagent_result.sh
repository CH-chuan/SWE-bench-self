# self constructed dataset, make sure it is the path to the dataset. 
# Or you can also use the dataset from the SWE-Bench dataset, remember the name of that should begin with "princeton-nlp/*".
DATASET_NAME="princeton-nlp/SWE-bench_Verified" 

SPLIT="test" # default split

# self-inferenced data, make sure it is the path to the predictions
PREDICATIONS_PATH="swe_agent_preds/experiment_results/4o_baseline/all_preds.jsonl" 

max_workers=2 # default value, but can be higher with nproc=128

RUN_ID=0 # the run id to identify the run

CACHE_LEVEL="base"

# now use nohup to call swebench/harness/run_evaluation.py
nohup python swebench/harness/run_evaluation.py \
    --dataset_name ${DATASET_NAME} \
    --split ${SPLIT} \
    --predictions_path ${PREDICATIONS_PATH} \
    --max_workers ${max_workers} \
    --run_id ${RUN_ID} \
    --cache_level ${CACHE_LEVEL} \
    &> swe_agent_evals/experiment_results/4o_baseline/evaluation_run_${RUN_ID}.log 2>&1 &
from pathlib import Path
import json

path = Path("swe_agent_preds/experiment_results/4o_no_tips_In_round2")
file_path = path / "preds.json"
output_path = path / "all_preds.jsonl"

preds = json.loads(file_path.read_text())
data = [{"instance_id": key, **value} for key, value in preds.items()]
jsonl = [json.dumps(d) for d in data]
output_path.write_text("\n".join(jsonl))

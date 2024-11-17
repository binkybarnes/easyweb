#!/bin/bash
set -x

BASE_URL="http://ec2-3-84-138-66.compute-1.amazonaws.com"

export SHOPPING="$BASE_URL:7770/"
export SHOPPING_ADMIN="$BASE_URL:7780/admin"
export REDDIT="$BASE_URL:9999"
export GITLAB="$BASE_URL:8023"
export WIKIPEDIA="$BASE_URL:8888/wikipedia_en_all_maxi_2022-05/A/User:The_other_Kiwix_guy/Landing"
export MAP="$BASE_URL:3000"
export HOMEPAGE="$BASE_URL:4399"

export AGENT_SELECTION="webarena_noplan"
# export AGENT_SELECTION="webarena_plan"

poetry run python inference_webarena.py \
    --agent-cls ModularWebAgent \
    --eval-output-dir baseline \
    --model gpt-4o \
    --eval-n-limit 10 \
    --shuffle true \
    --seed 99 \
    --max-iterations 15 \
    --eval-num-workers 1

# poetry run python inference_webarena.py \
#     --agent-cls BrowsingAgent \
#     --eval-output-dir browsingagent-baseline \
#     --model gpt-4o \
#     --eval-n-limit 10 \
#     --seed 99 \
#     --max-iterations 15 \
#     --eval-num-workers 1

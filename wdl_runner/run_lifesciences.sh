#!/usr/bin/env bash

BUCKET="cpg-peter-dev"

gcloud beta lifesciences pipelines run \
    --pipeline-file wdl_pipeline.yaml \
    --regions australia-southeast1 \
    --inputs-from-file WDL=test-wdl/ga4ghMd5.wdl,WORKFLOW_INPUTS=test-wdl/ga4ghMd5.inputs.json,WORKFLOW_OPTIONS=test-wdl/basic.papi.australia.options.json \
    --env-vars WORKSPACE=gs://${BUCKET}/wdl_runner/work,OUTPUTS=gs://${BUCKET}/wdl_runner/output \
    --logging gs://${BUCKET}/wdl_runner/logging

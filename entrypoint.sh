#!/bin/bash

echo "starting bull"

echo "redis $REDIS_URI"

bull-monitor \
  --redis-uri $REDIS_URI \
  -p 3002 \
  --prefix bull \
  --bullmq \
  -q ImportCsv -q ImportDeals -q ImportContacts \
  -q MergeContacts -q MergeContactFirstStep -q MergeContactFinalStep
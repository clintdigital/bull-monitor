#!/bin/bash

echo "starting bull"

echo "redis $REDIS_URI"

bull-monitor \
  --redis-uri $REDIS_URI \
  -p 3002 \
  --prefix bull \
  --bullmq \
  -q ImportCsv -q ImportDeals -q ImportContacts \
  -q MergeContacts -q MergeContactStep -q PreMergeContacts \
  -q MergeContactsInstagram -q MergeContactInstagramStep -q PreMergeContactsInstagram \
  -q ImportTrackDeal  -q ImportTrackContact \
  -q CampaignProcessContacts -q CampaignFinish -q CampaignSendContactToProvider -q CampaignValidateFinish \
  -q ExportCampaign -q ExportCampaignStep \
  -q DealBulkActions -q DealBulkStep \
  -q ExporterBulkActions -q ExporterBulkStep
  
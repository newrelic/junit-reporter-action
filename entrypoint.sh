#!/bin/sh

newrelic profiles add --profile githubActions \
  --licenseKey ${NEW_RELIC_INGEST_LICENSE_KEY} \
  --apiKey ${NEW_RELIC_INGEST_LICENSE_KEY} \
  --region "${NEW_RELIC_REGION}" \
  --accountId ${NEW_RELIC_ACCOUNT_ID}

newrelic profile default --profile githubActions

result=$(newrelic reporting junit \
  --accountId "${NEW_RELIC_ACCOUNT_ID}" \
  --path "${NEW_RELIC_TEST_OUTPUT_PATH}" \
  2>&1)

exitStatus=$?

if [ $exitStatus -ne 0 ]; then
  echo "::error:: $result"
fi

exit $exitStatus

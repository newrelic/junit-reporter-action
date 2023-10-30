#!/bin/sh

export NEW_RELIC_API_KEY=dummy_key
export NEW_RELIC_REGION=${NEW_RELIC_REGION}
export NEW_RELIC_LICENSE_KEY=${NEW_RELIC_INGEST_LICENSE_KEY}

result=$(newrelic reporting junit \
  --accountId "${NEW_RELIC_ACCOUNT_ID}" \
  --path "${NEW_RELIC_TEST_OUTPUT_PATH}" \
  --attributes "${NEW_RELIC_CUSTOM_ATTRIBUTES}"
  2>&1)

exitStatus=$?

if [ $exitStatus -ne 0 ]; then
  echo "::error:: $result"
fi

exit $exitStatus

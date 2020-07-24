#!/bin/sh

export NEW_RELIC_API_KEY=dummy_key
export NEW_RELIC_INSIGHTS_INSERT_KEY=${NEW_RELIC_INSERT_API_KEY}

result=$(newrelic reporting junit \
  --accountId "${NEW_RELIC_ACCOUNT_ID}" \
  --path "${NEW_RELIC_TEST_OUTPUT_PATH}" \
  2>&1)

exitStatus=$?

if [ $exitStatus -ne 0 ]; then
  echo "::error:: $result"
fi

exit $exitStatus

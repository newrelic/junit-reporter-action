[![Community Project header](https://github.com/newrelic/open-source-office/raw/master/examples/categories/images/Community_Project.png)](https://github.com/newrelic/open-source-office/blob/master/examples/categories/index.md#category-community-project)

# New Relic JUnit Reporter

[![GitHub Marketplace version](https://img.shields.io/github/release/newrelic/junit-reporter-action.svg?label=Marketplace&logo=github)](https://github.com/marketplace/actions/new-relic-junit-reporter)

A GitHub Action to send JUnit test run results to New Relic.

## Inputs

| Key                 | Required | Default | Description |
| ------------------- | -------- | ------- | ----------- |
| `accountId`         | **yes**  | -       | The account to post test run results to. This could also be a subaccount. |
| `region`            | no       | US      | The region the account belongs to. |
| `insertApiKey` | **yes**  | -       | Your New Relic [Insert API key](https://docs.newrelic.com/docs/apis/get-started/intro-apis/types-new-relic-api-keys#event-insert-key). |
| `testOutputPath`    | **yes**  | -       | The path to the JUnit output file. |

## Example usage

#### Post test run results to New Relic

The following example will post events of type `TestRun` to New Relic based on the
contents of the provided JUnit output file.

Github secrets assumed to be set:
* `NEW_RELIC_ACCOUNT_ID` - New Relic Account ID to post the event data to
* `NEW_RELIC_INSERT_API_KEY` - Insert API key
* `NEW_RELIC_APPLICATION_ID` - New Relic Application ID to create the marker on

```yaml
name: Release

on:
  - release

jobs:
  newrelic:
    runs-on: ubuntu-latest
    name: Basic Usage
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Post JUnit test results to New Relic
        uses: newrelic/junit-reporter-action@v1
        with:
          accountId: ${{ secrets.NEW_RELIC_ACCOUNT_ID }}
          insertApiKey: ${{ secrets.NEW_RELIC_INSERT_API_KEY }}
          path: test-output/integration.xml
```

#### Querying the data

Data can be queried in New Relic One [Chart Builder](https://docs.newrelic.com/docs/chart-builder/use-chart-builder/get-started/introduction-chart-builder) or with the [New Relic CLI](https://github.com/newrelic/newrelic-cli) via the `newrelic nrql query` command:

```
newrelic nrql query --accountId 12345 --query 'SELECT * from TestRun'
```

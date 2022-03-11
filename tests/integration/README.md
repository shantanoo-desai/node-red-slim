# Integration Testing

Purpose of this Integration test is to check the `/health` __HTTP GET__ API created by the default flow.

## Test Stack

- Builds the current docker image, brings the service up using `test-docker-compose.yml`
- wait a finite amount of time till the service is available for `pytest` suite to discover
- conduct simple API health check
- bring the stack down

## Running Tests

__NOTE__: make sure be in this current directory `tests/integrations`

1. Setup python virtual environment using `./scripts/00-build-test-env.sh`
2. Perform integration test using `./scripts/01-run-tests.sh`
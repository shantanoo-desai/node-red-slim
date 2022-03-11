import pytest
import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

@pytest.fixture(scope="module")
def nodered_health_url(module_scoped_container_getter):
    request_session = requests.Session()
    retries = Retry(total=5, backoff_factor=3, status_forcelist=[500, 502, 503, 504])
    request_session.mount("http://", HTTPAdapter(max_retries=retries))

    service = module_scoped_container_getter.get("custom-nodered").network_info[0]
    api_url = f"http://{service.hostname}:{service.host_port}"
    return api_url

def test_nodered_health(nodered_health_url):
    result = requests.get(nodered_health_url)
    assert result.status_code == 200
import json
import os
import sys
import requests
from datetime import datetime, timedelta

# Get env variables
days_of_retention = int(os.getenv('INPUT_RETENTION-DAYS'))
project_name = os.getenv('INPUT_PROJECT-NAME')
owner_account = os.getenv('INPUT_OWNER-ACCOUNT')
token_access = os.getenv('INPUT_ACCESS-TOKEN')
base_url_github = 'https://api.github.com/repos'

if days_of_retention is None or project_name is None or owner_account is None or token_access is None:
    print('Verify your envs variables')
    sys.exit(1)

url_completa = base_url_github + '/' + owner_account + '/' + project_name + '/actions/artifacts'
headers = {
    'Authorization': 'Bearer ' + token_access,
    'Accept': 'application/vnd.github.v3+json',
    'Content-Type': 'application/json'
}
req = requests.get(
    url_completa,
    headers=headers
)

if req.status_code < 200 or req.status_code >= 300:
    print('Fail in sent the request to server: ' + req.text)
    sys.exit(1)

result = json.loads(req.text)

if result['total_count'] == 0:
    print('Nothing artifact to processed')
    sys.exit(1)

data_atual = datetime.now()
data_minima_exclusao = data_atual - timedelta(days=days_of_retention)

total_artifacts = len(result['artifacts'])
total_artifacts_deleted = 0

print('Total artifacts found: {} ...'.format(str(total_artifacts)))

for artifact in result['artifacts']:
    data_criacao = datetime.strptime(artifact['created_at'], '%Y-%m-%dT%H:%M:%SZ')
    if data_criacao.date() > data_minima_exclusao.date():
        print('The artifactis with id "{}" isn\'t deleted, because de date is lower ...'.format(artifact['id']))
        continue

    url_delete = url_completa + '/' + str(artifact['id'])
    req = requests.delete(
        url_delete,
        headers=headers
    )

    if req.status_code < 200 or req.status_code >= 300:
        print('Failed to delete the artifact with id {} ...'.format(str(artifact['id'])))
        continue
    print('Artifact removed with sucess ...')
    total_artifacts_deleted += 1

print('Total of artifacts deleted:', str(total_artifacts_deleted))
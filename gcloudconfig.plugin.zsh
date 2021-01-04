APPLICATION_DEFAULT_CREDENTIALS_WELL_KNOWN_LOCATION=$HOME/.config/gcloud/application_default_credentials.json

function gcloudconfig_prompt_info() {
  local activeConfiguration=$(gcloud config configurations list --format=json | jq --raw-output '.[] | select(.is_active == true) | .name')
  local quotaProject=$(cat $APPLICATION_DEFAULT_CREDENTIALS_WELL_KNOWN_LOCATION | jq --raw-output '.quota_project_id // "N/A"')
  echo "(%F{yellow}\U26C5 ${activeConfiguration} | ${quotaProject}%f)"
}

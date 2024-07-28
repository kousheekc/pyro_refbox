#!/bin/zsh

source setup.sh
source local_setup.sh

function_names=("refbox" "mongodb_backend" "mqtt_bridge" "mongodb" "mqtt_broker")

for func_name in "${function_names[@]}"; do
  echo "Starting ${func_name}"
  eval "${REFBOX_COMPOSE_COMMAND} -f ${rcll_compose_files_dir}/${func_name}.yaml pull"
  exit_code=$?
  if [ ${exit_code} -ne 0 ]; then
    echo "Error: Failed to start ${func_name}"
    exit ${exit_code}
  fi
done

echo "All services updated successfully."
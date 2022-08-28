#! /bin/bash

PHASE=$1
PHASE_FILE=.dev-lifecycle-scripts.d/${PHASE}.sh
PHASE_DIR=.dev-lifecycle-scripts.d/${PHASE}

if [[ -r ${PHASE_FILE} ]]; then
  ${PHASE_FILE}
elif [[ -d ${PHASE_DIR} ]]; then
  for script in $(ls -1 ${PHASE_DIR}/*.sh | sort); do
    $script
  done
fi

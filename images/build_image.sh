#!/usr/bin/env bash

scenario_name="$1"

if [[ -z ${scenario_name} ]]; then
    echo "Scenario name is missing"
    exit 2
fi

packer_json="$(pwd)/${scenario_name}/packer_image.json"

echo "Create images for scenario"
packer validate "${packer_json}"
packer build "${packer_json}"

#!/usr/bin/env bash

project_root=$( pwd )

cd ./infrastructure/ || exit 1
scn_dir=$( pwd )

terraform apply || exit 2

# Searching for variables starting from "out-..." in current state
output="$(terraform show | grep "out-")"

# Find variable value in Terraform output
function get_value() {
    var_name=$1
    echo $(echo "${output}" | grep -E "${var_name} =" | grep -oE "\"(.+)\"" | sed -e 's/^"//' -e 's/"$//')
}


export OTC_SEC_GROUP=$(get_value "group")
export OTC_IMAGE_ID=$(get_value "image_id")
export OTC_NETWORK_ID=$(get_value "network_id")

cd "${project_root}/images" || exit 1

targets=$(find -name "packer_image.json" -printf '%h ' | sort -u)
echo ${targets}
python3 "${scn_dir}/parallel_run.py" ${targets}

cd ${scn_dir}
terraform destroy -auto-approve
cd ..

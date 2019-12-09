#!/usr/bin/env bash
export OS_AUTH_URL="https://iam.eu-de.otc.t-systems.com:443/v3"
# Following requires vars set:
function set_if_not_set() {
    if [[ -z ${!1} ]]; then
        export "$1=$2"
    fi
}

set_if_not_set TF_VAR_username ${OS_USERNAME}
set_if_not_set OS_USERNAME ${TF_VAR_username}
set_if_not_set TF_VAR_password ${OS_PASSWORD}
set_if_not_set OS_PASSWORD ${TF_VAR_password}
set_if_not_set TF_VAR_domain_name ${OS_DOMAIN_NAME}
set_if_not_set OS_DOMAIN_NAME ${TF_VAR_domain_name}
set_if_not_set TF_VAR_tenant_name ${OS_TENANT_NAME}
set_if_not_set OS_TENANT_NAME ${TF_VAR_tenant_name}

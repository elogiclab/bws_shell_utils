#######################################
#               bws_utils             #
#######################################

bws_get() {
    local key_name=$1
    local result=$(bws secret list | jq -c '.[] | select(.key == "'$key_name'") | .value' -r)
    if [[ "$?" != "0" || -z "$result" ]]
    then
        >&2 echo "Cannot retrieve secret"
        return 1
    fi
    echo $result
}

bws_source() {
    local key_name=$1
    local result=$(bws_get $key_name)
    if [[ "$?" != "0" || -z "$result" ]]
    then
        return 1
    fi
    . <(echo $result)
}

bws_add_ssh_keys() {
    local keys_to_add=${@:-$BWS_SSH_PRIVATE_KEYS}
    if [[ -z "$keys_to_add" ]]
    then
        >&2 echo "Missing parameter - cannot retrieve secret"
        return 1
    fi
    if [[ -z "$@" ]]
    for k in $(echo $keys_to_add)
    do
        local private_key=$(bws_get $k)
        if [[ "$?" != "0" || -z "$private_key" ]]
        then
            >&2 echo "Cannot add $z key"
            return 1
        fi
        ssh-add - <<< $( echo $private_key )
        if [[ "$?" != "0" ]]
        then
            return 1
        fi
    done
}
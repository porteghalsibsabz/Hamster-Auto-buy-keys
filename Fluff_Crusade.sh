#!/bin/bash

# Colors
yellow='\033[0;33m'
purple='\033[0;35m'
green='\033[0;32m'
rest='\033[0m'

# Check for jq installation
if ! command -v jq &> /dev/null; then
    # Check if the environment is Termux
    if [ -n "$TERMUX_VERSION" ]; then
        pkg update -y
        pkg install -y jq
    else
        apt update -y && apt install -y jq
    fi
fi

# Check for uuidgen installation
if ! command -v uuidgen &> /dev/null; then
    # Check if the environment is Termux
    if [ -n "$TERMUX_VERSION" ]; then
        pkg install uuid-utils -y
    else
        apt update -y && apt install uuid-runtime -y
    fi
fi

clear
echo -e "${purple}=======${yellow}Hamster Combat Game Keys${purple}=======${rest}"
echo ""
echo -en "${purple}[Optional] ${green}Enter Your telegram Bot token: ${rest}"
read -r TELEGRAM_BOT_TOKEN
echo -e "${purple}============================${rest}"
echo -en "${purple}[Optional] ${green}Enter Your Telegram Channel ID [example: ${yellow}@P_Tech2024${green}]: ${rest}"
read -r TELEGRAM_CHANNEL_ID
echo -e "${purple}============================${rest}"
echo -e "${green}Generating... Keys will be saved in [${yellow}my_keys.txt${green}]..${rest}"

PROXY_FILE="proxy.txt"

# Games
declare -A games
games[1, name]="Fluff Crusade"
games[1, appToken]="112887b0-a8af-4eb2-ac63-d82df78283d9"
games[1, promoId]="112887b0-a8af-4eb2-ac63-d82df78283d9"

# Load proxies from file
load_proxies() {
    if [[ -f "$1" ]]; then
        mapfile -t proxies <"$1"
    else
        echo -e "${yellow}Proxy file not found. We continue without a proxy.${rest}"
        proxies=()
    fi
}

# Generate client_id using current timestamp and random numbers
generate_client_id() {
    echo "$(date +%s%3N)-$(cat /dev/urandom | tr -dc '0-9' | fold -w 19 | head -n 1)"
}

# Login function to obtain a client token
login() {
    local client_id=$1
    local app_token=$2
    local proxy=${3:-}

    local proxy_option=""
    if [[ -n "$proxy" ]]; then
        proxy_option="--proxy $proxy"
    fi

    response=$(
        curl -s $proxy_option -X POST -H "Content-Type: application/json" \
        -d "{\"appToken\":\"$app_token\",\"clientId\":\"$client_id\",\"clientOrigin\":\"deviceid\"}" \
        "https://api.gamepromo.io/promo/login-client"
    )

    if [[ $? -ne 0 ]]; then
        return
    fi

    echo "$response" | jq -r '.clientToken'
}

# Generate promo code
generate_key() {
    local client_token=$1
    local promo_id=$2
    local proxy=${3:-}

    local proxy_option=""
    if [[ -n "$proxy" ]]; then
        proxy_option="--proxy $proxy"
    fi

    response=$(
        curl -s $proxy_option -X POST -H "Authorization: Bearer $client_token" \
        -H "Content-Type: application/json" \
        -d "{\"promoId\":\"$promo_id\"}" \
        "https://api.gamepromo.io/promo/create-code"
    )

    if [[ $? -ne 0 ]]; then
        echo "Error during generate key"
        return
    fi

    echo "$response" | jq -r '.promoCode'
}

# Send message to Telegram
send_to_telegram() {
    local message=$1
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d chat_id="$TELEGRAM_CHANNEL_ID" \
        -d text="$message" \
        -d parse_mode="MarkdownV2" > /dev/null 2>&1
}

# Main key generation process
generate_key_process() {
    local app_token=$1
    local promo_id=$2
    local proxy=$3

    client_id=$(generate_client_id)
    client_token=$(login "$client_id" "$app_token" "$proxy")

    if [[ -z "$client_token" ]]; then
        echo "Failed to login and get client token."
        return
    fi

    key=$(generate_key "$client_token" "$promo_id" "$proxy")
    echo "$key"
}

# Main function to control the loop
main() {
    load_proxies "$PROXY_FILE"

    while true; do
        if [[ ${#proxies[@]} -gt 0 ]]; then
            proxy=${proxies[RANDOM % ${#proxies[@]}]}
        else
            proxy=""
        fi

        key=$(generate_key_process "${games[1, appToken]}" "${games[1, promoId]}" "$proxy")

        if [[ -n "$key" ]]; then
            message="${games[1, name]} : $key"
            telegram_message="\`${key}\`"
            echo "$message" | tee -a my_keys.txt
            send_to_telegram "$telegram_message"
        else
            echo "Error generating key for ${games[1, name]}"
        fi

        sleep 120 # Wait for 2 minutes before generating the next key
    done
}

main

#!/bin/bash

# Colors
yellow='\033[0;33m'
purple='\033[0;35m'
green='\033[0;32m'
rest='\033[0m'

if ! command -v jq &> /dev/null
then
    # Check if the environment is Termux
    if [ -n "$TERMUX_VERSION" ]; then
        pkg update -y
        pkg install -y jq
    else
        apt update -y && apt install -y jq
    fi
fi

if ! command -v uuidgen &> /dev/null
then
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
echo -e "${green}generating ... Keys will be saved in [${yellow}my_keys.txt${green}]..${rest}"

EVENTS_DELAY=20
PROXY_FILE="proxy.txt"
# Set bot as channel admin. and enable manage message in admin settings.
# ربات را به عنوان ادمین کانال انتخاب کنید و manage message را فعال کنید.

# Games
declare -A games
games[1, name]="Train Miner"
games[1, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[1, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[2, name]="Train Miner"
games[2, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[2, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[3, name]="Train Miner"
games[3, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[3, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[4, name]="Train Miner"
games[4, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[4, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[5, name]="Train Miner"
games[5, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[5, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[6, name]="Train Miner"
games[6, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[6, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[7, name]="Train Miner"
games[7, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[7, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[8, name]="Train Miner"
games[8, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[8, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[9, name]="Train Miner"
games[9, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[9, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[10, name]="Train Miner"
games[10, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[10, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[11, name]="Train Miner"
games[11, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[11, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[12, name]="Train Miner"
games[12, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[12, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[13, name]="Train Miner"
games[13, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[13, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[14, name]="Train Miner"
games[14, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[14, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[15, name]="Train Miner"
games[15, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[15, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[16, name]="Train Miner"
games[16, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[16, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[17, name]="Train Miner"
games[17, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[17, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[18, name]="Train Miner"
games[18, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[18, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[19, name]="Train Miner"
games[19, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[19, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

games[20, name]="Train End"
games[20, appToken]="82647f43-3f87-402d-88dd-09a90025313f"
games[20, promoId]="c4480ac7-e178-4973-8061-9ed5b2e17954"

# Proxys
load_proxies() {
	if [[ -f "$1" ]]; then
		mapfile -t proxies <"$1"
	else
		echo -e "${yellow}Proxy file not found. We continue without a proxy.${rest}"
		proxies=()
	fi
}

# client_id
generate_client_id() {
	echo "$(date +%s%3N)-$(cat /dev/urandom | tr -dc '0-9' | fold -w 19 | head -n 1)"
}

#login
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

# Progress
emulate_progress() {
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
		-d "{\"promoId\":\"$promo_id\",\"eventId\":\"$(uuidgen)\",\"eventOrigin\":\"undefined\"}" \
		"https://api.gamepromo.io/promo/register-event"
	)

	if [[ $? -ne 0 ]]; then
		echo "Error during emulate progress"
		return
	fi

	echo "$response" | jq -r '.hasCode'
}

# Promotion keys
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

# Send to telegram
send_to_telegram() {
    local message=$1
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d chat_id="$TELEGRAM_CHANNEL_ID" \
        -d text="$message" \
        -d parse_mode="MarkdownV2" > /dev/null 2>&1
}

# key process
generate_key_process() {
	local app_token=$1
	local promo_id=$2
	local proxy=$3

	client_id=$(generate_client_id)
	client_token=$(login "$client_id" "$app_token" "$proxy")

	if [[ -z "$client_token" ]]; then
		return
	fi

	for i in {1..55}; do
		sleep $((EVENTS_DELAY * (RANDOM % 3 + 1) / 3))
		has_code=$(emulate_progress "$client_token" "$promo_id" "$proxy")

		if [[ "$has_code" == "true" ]]; then
			break
		fi
	done

	key=$(generate_key "$client_token" "$promo_id" "$proxy")
	echo "$key"
}

# main
main() {
	load_proxies "$PROXY_FILE"

	while true; do
		for game_choice in {1..10}; do
			if [[ ${#proxies[@]} -gt 0 ]]; then
				proxy=${proxies[RANDOM % ${#proxies[@]}]}
			else
				proxy=""
			fi

			key=$(generate_key_process "${games[$game_choice, appToken]}" "${games[$game_choice, promoId]}" "$proxy")

			if [[ -n "$key" ]]; then
				message="${games[$game_choice, name]} : $key"
				telegram_message="\`${key}\`"
				echo "$message" | tee -a my_keys.txt
				send_to_telegram "$telegram_message"
			else
				echo "Error generating key for ${games[$game_choice, name]}"
			fi

			sleep 10 # wait
		done
	done
}

main
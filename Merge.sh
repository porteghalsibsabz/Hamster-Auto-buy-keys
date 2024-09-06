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
games[1, name]="Merge Away"
games[1, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[1, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[2, name]="Merge Away"
games[2, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[2, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[3, name]="Merge Away"
games[3, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[3, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[4, name]="Merge Away"
games[4, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[4, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[5, name]="Merge Away"
games[5, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[5, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[6, name]="Merge Away"
games[6, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[6, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[7, name]="Merge Away"
games[7, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[7, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[8, name]="Merge Away"
games[8, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[8, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[9, name]="Merge Away"
games[9, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[9, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[10, name]="Merge Away"
games[10, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[10, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[11, name]="Merge Away"
games[11, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[11, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[12, name]="Merge Away"
games[12, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[12, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[13, name]="Merge Away"
games[13, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[13, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[14, name]="Merge Away"
games[14, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[14, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[15, name]="Merge Away"
games[15, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[15, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[16, name]="Merge Away"
games[16, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[16, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[17, name]="Merge Away"
games[17, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[17, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[18, name]="Merge Away"
games[18, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[18, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[19, name]="Merge Away"
games[19, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[19, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

games[20, name]="Merge End"
games[20, appToken]="8d1cc2ad-e097-4b86-90ef-7a27e19fb833"
games[20, promoId]="dc128d28-c45b-411c-98ff-ac7726fbaea4"

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
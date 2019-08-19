
bot_url="localhost/ai_move"
base_url="https://lichess.org/api"

while true; do
    game="$(curl -H "Authorization: Bearer 9Ps9dcG0BcdQNGpO" ${base_url}/account/playing)"
    if [[ $(jq '.nowPlaying[0] | length' <<< ${game}) -ne 0 ]]; then

        [[ $(jq '.nowPlaying[0].color' <<< ${game}) == \"white\" ]] && color="w" || color="b" 
        # get game id
        gameId="$(jq '.nowPlaying[0].gameId' <<< ${game})"
        gameId="${gameId//\"/}"
        # get board fen representation
        fen="$(jq '.nowPlaying[0].fen' <<< ${game})"
        fen="${fen//\"/}"
        board="${fen} ${color} KQkq - 0 1"

        # request action based on board
        action=$(curl -v -H "Content-Type:application/json" ${bot_url} -d "{\"board\": \"${board}\"}")

        # make move
        curl -H "Authorization: Bearer 9Ps9dcG0BcdQNGpO" -XPOST https://lichess.org/api/bot/game/${gameId}/move/${action} | jq
    fi
    sleep 5
done

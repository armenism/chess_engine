# Chess Engine

Chess Engine is a dockerized Python application REST interface running on a Stockfish chess engine.

## Setup

Container port 6969 needs to be exposed:

```bash
docker run -p 80:6969 armenism/chess_engine:latest
```

## Usage

In order for the engine to make a move, issue a POST request to the **/ai_move/** endpoint. 

An FEN (Forsyth-Edwards Notation) representation of the current board also needs to be provided in the request body.

```shell script
curl -H "Content-Type:application/json" localhost/ai_move -d "{\"board\": \"rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1\"}" 
```
The engine will respond back with a move in **UCI** format:
```shell script
e2e4
```

The engine is stateless, and as such it could be used to play multiple games at the same time.

## License
[MIT](https://choosealicense.com/licenses/mit/)
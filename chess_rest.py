import chess
import chess.engine

from flask import Flask, request, make_response

engine = chess.engine.SimpleEngine.popen_uci("/usr/games/stockfish")
app = Flask(__name__)


@app.route('/ai_move', methods=['POST'])
def generate_move():
    fen_board = request.get_json()["board"]
    board = chess.Board(fen=fen_board)

    result = engine.play(board, chess.engine.Limit(time=1.000))
    return "%s" % result.move


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=6969)


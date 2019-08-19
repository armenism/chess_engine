FROM python

# copy python chess REST
COPY chess_rest.py /

# install chess engine 
# and needed python libraries
RUN apt-get update \
    && apt-get install -y stockfish \
    && pip install python-chess flask

# run chess_rest.py as entrypoint
ENTRYPOINT [ "python", "chess_rest.py" ]
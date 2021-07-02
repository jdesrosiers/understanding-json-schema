FROM fedora

# Install system dependencies
RUN dnf update -y
RUN dnf install -y make latexmk texlive
RUN dnf install -y 'tex(fncychap.sty)' \
                   'tex(tabulary.sty)' \
                   'tex(framed.sty)' \
                   'tex(wrapfig.sty)' \
                   'tex(upquote.sty)' \
                   'tex(capt-of.sty)' \
                   'tex(needspace.sty)' \
                   'tex(overlock.sty)' \
                   'tex(inconsolata.sty)' \
                   'tex(bbding.sty)' \
                   'tex(mdframed.sty)' \
                   'tex(bbding10.pfb)'
RUN texhash
RUN pip install pipenv

# Add code
COPY . /code
WORKDIR /code

# Install Python dependencies
RUN pipenv install --system

# Build and serve website
ENTRYPOINT ["./entrypoint.sh"]

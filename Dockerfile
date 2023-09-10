FROM jupyter/minimal-notebook

USER root

ENV RACKET_VERSION=8.10
ENV RACKET_INSTALLER_URL=http://mirror.racket-lang.org/installers/$RACKET_VERSION/racket-$RACKET_VERSION-x86_64-linux-natipkg.sh

RUN wget --output-document=racket-install.sh -q ${RACKET_INSTALLER_URL} && \
    echo "yes\n1\n" | sh racket-install.sh --create-dir --unix-style --dest /usr/ && \
    rm racket-install.sh

RUN raco setup

USER jovyan

RUN echo "A" | raco pkg install iracket
RUN raco iracket install

CMD ["start-notebook.sh",  "--NotebookApp.token=''",  "--NotebookApp.password=''"]
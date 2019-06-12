FROM silkeh/clang:3.6

RUN apt-get update -y -qq && apt-get install -y -qq ca-certificates
RUN git clone https://github.com/kermitt2/pdfalto.git /usr/src/pdfalto
RUN cd /usr/src/pdfalto && git submodule update --init --recursive
RUN cd /usr/src/pdfalto && cmake ./
RUN cd /usr/src/pdfalto && make
WORKDIR /files
CMD /usr/src/pdfalto/pdfalto
ENTRYPOINT ["/usr/src/pdfalto/pdfalto"]
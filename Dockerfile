FROM python:3.6-alpine

RUN apk --no-cache add openjdk8-jre graphviz jpeg-dev zlib-dev ttf-dejavu freetype-dev git && \
    apk --no-cache --virtual=dependencies add build-base python-dev py-pip wget
RUN apk --no-cache add bash

ENV LIBRARY_PATH=/lib:/usr/lib

ENV PLANTUML_DIR /usr/local/plantuml
ENV PLANTUML_JAR plantuml.jar
ENV PLANTUML $PLANTUML_DIR/$PLANTUML_JAR

RUN \
    #wget "https://sourceforge.net/projects/plantuml/files/plantuml.jar" --no-check-certificate && \
    mkdir $PLANTUML_DIR
COPY plantuml.jar $PLANTUML_DIR
COPY TakaoFonts_00303.01.tar.xz /
RUN \
    #wget "https://launchpad.net/takao-fonts/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz" && \
    tar xvf /TakaoFonts_00303.01.tar.xz -C /usr/share/fonts/ && \
    rm -f TakaoFonts_00303.01.tar.xz && \
    ln -s /usr/share/fonts/TakaoFonts_00303.01 /usr/share/fonts/TakaoFonts && \
    pip install --upgrade pip && \
    pip install -U \
      appdirs \
      sphinx \
      sphinxbootstrap4theme \
      sphinx_materialdesign_theme \
      sphinxcontrib-blockdiag \
      sphinxcontrib-actdiag \
      sphinxcontrib-nwdiag \
      sphinxcontrib-seqdiag \
      sphinxcontrib-plantuml \
      commonmark \
      recommonmark && \
    pip freeze && \ 
      apk del dependencies
#CMD ["python3"]
CMD ["/bin/bash"]

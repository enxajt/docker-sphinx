# docker
# http://qiita.com/tsgkdt/items/4e8a2f6b4fda7401b73f
# docker run --rm -v `pwd`:/tmp/sphinx --name sphinx sphinx-plantuml sphinx-build -b html /tmp/sphinx/source /tmp/sphinx/build

# docker run --rm -v `pwd`:/tmp/sphinx -it sphinx-ubuntu
# cd /tmp/sphinx && sphinx-build source build

# sphinxを便利に
# http://qiita.com/pashango2/items/d1b379b699af85b529ce

# docker 
Sphinx 1.4.9（2016/11/24時点での最新。もうすぐ1.5が出るらしい。sphinxjp.slack.comより）
Sphinxから使えるPlantUML(sphinxcontrib-plantuml)
Sphinxから使えるblockdiag(sphinxcontrib-blockdiag)
blockdiagで日本語使いたいとき用日本語フォント(TakaoFonts)
bootstrap4対応のHTML Theme

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

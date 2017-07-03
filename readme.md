http://qiita.com/tsgkdt/items/4e8a2f6b4fda7401b73f
docker run --rm -v `pwd`:/tmp/sphinx --name sphinx sphinx-plantuml sphinx-build -b html /tmp/sphinx/source /tmp/sphinx/build

docker run --rm -v `pwd`:/tmp/sphinx -it sphinx-ubuntu
cd /tmp/sphinx && sphinx-build source build

sphinxを便利に
http://qiita.com/pashango2/items/d1b379b699af85b529ce

Sphinx 1.4.9（2016/11/24時点での最新。もうすぐ1.5が出るらしい。sphinxjp.slack.comより）
Sphinxから使えるPlantUML(sphinxcontrib-plantuml)
Sphinxから使えるblockdiag(sphinxcontrib-blockdiag)
blockdiagで日本語使いたいとき用日本語フォント(TakaoFonts)
bootstrap4対応のHTML Theme

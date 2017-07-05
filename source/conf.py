import os

extensions = [
  'sphinxcontrib.plantuml',
  'sphinxcontrib.blockdiag',
  'sphinxcontrib.seqdiag',
  'sphinxcontrib.nwdiag',
  'sphinxcontrib.actdiag',
  'sphinxcontrib.rackdiag',
  'sphinx.ext.graphviz'
]

blockdiag_fontpath = '/usr/share/fonts/TakaoFonts/TakaoPGothic.ttf'

plantjar = os.getenv('PLANTUML')
plantuml = 'java -jar %s' % plantjar

graphviz_dot_args = [
            '-Gfontname=ipag',
            '-Nfontname=ipag',
            '-Efontname=ipag' ]

markdown_title = 'System outline'
source_suffix = [ '.rst' ]
master_doc = 'index'

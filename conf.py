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

markdown_title = 'My Personal Video System outline'
source_suffix = [ '.rst' ]

import sys
import shlex

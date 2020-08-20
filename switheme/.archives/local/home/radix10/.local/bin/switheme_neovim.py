'''
Neovim dark/light mode
'''

import glob
import sys
from pynvim import attach

for file in glob.iglob(r"/tmp/nvim*/0"):
    attach('socket', path=file).command("set background=" + sys.argv[1])

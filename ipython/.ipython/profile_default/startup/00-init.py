import sys
import time

_t0 = time.perf_counter()

try:
    import numpy as np
    import scipy
    import torch
    import torchvision
except ImportError:
    pass

try:
    import matplotlib.pyplot as plt
    plt.style.use('grayscale')
    plt.rcParams["figure.autolayout"] = True
except ImportError:
    pass

from IPython import get_ipython
_ip = get_ipython()

if _ip:
    _ip.alias_manager.define_alias("..", "cd ..")
    _ip.alias_manager.define_alias("c", "clear")

_t1 = time.perf_counter()
_loaded = [mod for mod in ('numpy', 'scipy', 'torch', 'matplotlib') if mod in sys.modules]

print(f"IPython init: {(_t1 - _t0) * 1000:.1f}ms")
print(f"Loaded: {', '.join(_loaded) if _loaded else 'Standard Library only'}")

del time, sys, _t0, _t1, _ip, _loaded

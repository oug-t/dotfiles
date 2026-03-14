import time

# Tracking startup time
_start = time.time()

# Standard Library
try:
    import matplotlib.pyplot as plt
    import numpy as np
    import pandas as pd

    _has_ds = True
except ImportError:
    _has_ds = False

# Deep Learning Stack
try:
    import torch

    _has_torch = True
except ImportError:
    _has_torch = False

# IPython Configuration
from IPython import get_ipython

_ip = get_ipython()

if _ip:
    # Custom Aliases
    _ip.alias_manager.define_alias("..", "cd ..")
    _ip.alias_manager.define_alias("c", "clear")

# Visualization Tweaks
if _has_ds:
    plt.rcParams["figure.facecolor"] = "white"
    plt.rcParams["axes.grid"] = True

# Startup Report
_load_time = time.time() - _start
print(f"Startup complete in {_load_time:.3f}s")
print("Libs: os, sys, pathlib" + (", np, pd, plt" if _has_ds else ""))
print(f"DL:   {'Torch 🔥' if _has_torch else 'None 🕯️'}")

# Namespace
del _start, _load_time, _has_ds, _has_torch, _ip

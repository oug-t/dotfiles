import os

import matplotlib.pyplot as plt
import numpy as np

try:
    import torch

    has_torch = True
except ImportError:
    has_torch = False

plt.rcParams["figure.facecolor"] = "white"

if has_torch:
    print("🍵 Deep Learning Environment Loaded (NumPy, Torch, Matplotlib)")
else:
    print("🍦 Light Environment Loaded (Torch not found)")

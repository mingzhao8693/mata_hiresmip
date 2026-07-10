import numpy as np

def get_array(z, name):
    """
    Return MATLAB variable with the same dimension ordering
    as scipy.io.loadmat().
    """

    # scipy.io.loadmat MATLAB struct
    if hasattr(z, name):
        arr = np.asarray(getattr(z, name))

    # h5py MATLAB v7.3 struct
    elif hasattr(z, "keys"):
        arr = np.asarray(z[name])

        # Convert MATLAB order to NumPy/loadmat order
        arr = np.transpose(arr)

    else:
        raise TypeError("Unsupported object type")

    return np.squeeze(arr)

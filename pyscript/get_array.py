import numpy as np
import h5py


def get_array(z, name):
    """
    Extract a variable from either

      1. scipy.io.loadmat() MATLAB struct (v7.2 and earlier)
      2. h5py Group/File (MATLAB v7.3)

    Returns a NumPy array whose dimensions match MATLAB/loadmat().
    """

    # ==========================================================
    # Case 1 : scipy.io.loadmat()
    # ==========================================================
    if hasattr(z, "dtype") and z.dtype.names is not None:

        if name not in z.dtype.names:
            raise KeyError(
                f'"{name}" not found. Available variables: {z.dtype.names}'
            )

        arr = z[name]

        # MATLAB structs are usually stored as (1,1)
        if arr.size == 1:
            arr = arr[0, 0]

        return np.squeeze(np.asarray(arr))

    # ==========================================================
    # Case 2 : h5py (MATLAB v7.3)
    # ==========================================================
    if isinstance(z, (h5py.File, h5py.Group)):

        if name not in z:
            raise KeyError(
                f'"{name}" not found. Available variables: {list(z.keys())}'
            )

        obj = z[name]

        # -----------------------
        # Numeric dataset
        # -----------------------
        if isinstance(obj, h5py.Dataset):

            arr = np.asarray(obj[()])

            # MATLAB v7.3 stores dimensions reversed relative to loadmat().
            # Reverse the axes so shapes match MATLAB.
            if arr.ndim > 1:
                arr = arr.transpose()

            return np.squeeze(arr)

        # -----------------------
        # Nested group
        # -----------------------
        if isinstance(obj, h5py.Group):

            # Some MATLAB objects store numeric data in "value"
            if "value" in obj:

                arr = np.asarray(obj["value"][()])

                if arr.ndim > 1:
                    arr = arr.transpose()

                return np.squeeze(arr)

            raise TypeError(
                f'"{name}" is an HDF5 Group with contents '
                f'{list(obj.keys())}. '
                'No numeric dataset named "value" was found.'
            )

    # ==========================================================
    # Unsupported type
    # ==========================================================
    raise TypeError(
        f"Unsupported object type: {type(z)}"
    )

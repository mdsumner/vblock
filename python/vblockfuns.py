import dask.multiprocessing

from virtualizarr import open_virtual_dataset
import glob
import xarray

def open_virtual(filepath):
  return open_virtual_dataset(filepath, indexes = {}, 
      loadable_variables=['lon', 'lat', 'time', 'zlev'], 
       cftime_variables=['time'])


vdd = [
    dask.delayed(open_virtual)(filepath)
    for filepath in nc
]




files <- raadfiles::nsidc_south_daily_files()

library(reticulate)
vzarr <- import("virtualizarr")
vzarr$open_vir
dask.config.set(scheduler='processes', num_workers = 128)


nc = glob.glob("bowerbird/**/*.nc",  recursive = True)
nc.sort()




vd = dask.compute(vdd)

vds = xarray.concat(vd[0], dim = 'time', coords = 'minimal', compat = 'override')

vds.virtualize.to_kerchunk('virt_oisst.json', format='json')

files <- raadfiles::nsidc_south_daily_files()

py_run_string(py)

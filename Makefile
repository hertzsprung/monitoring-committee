MAKEFLAGS += --no-builtin-rules                                                                 
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:
.PHONY: all dist clean clean-dist

all::

dist:: all

clean:: clean-dist
	rm -rf build

clean-dist::

include $(MAKE_COMMON)/executables/Makefile
include $(MAKE_COMMON)/executables/Makefile-Gmt
include $(MAKE_COMMON)/executables/Makefile-OpenFOAM
include $(MAKE_COMMON)/globals/Makefile-OpenFOAM
include $(MAKE_COMMON)/templates/Makefile-FileSystem
include $(MAKE_COMMON)/templates/Makefile-LaTeX
include $(MAKE_COMMON)/templates/Makefile-Gnuplot
include $(MAKE_COMMON)/templates/Makefile-GmtPlot
include make/templates/Makefile-PlotMesh
include make/templates/Makefile-MountainAdvection-ContourPlot
include make/Makefile-GravityWavesMeshes
include make/Makefile-ThermalAdvectionMeshes
include make/Makefile-MountainAdvectionMeshes
include make/Makefile-GravityWaves
include make/Makefile-Grids
include make/Makefile-MountainAdvection
include make/Makefile-MC-Report-2015-06
include make/Makefile-MC-Report-2015-12
include make/Makefile-MC-Report-2016-05
include make/Makefile-MC-Report-2016-11
include make/Makefile-MC-Report-2017-06

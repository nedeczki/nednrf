SYSTOPDIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

all: sdk-download

sdk-download:
	make -s -C sdk


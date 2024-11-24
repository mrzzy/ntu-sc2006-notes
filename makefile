#
# NTU SC2006 Notes
# Project Makefile
#

.PHONY: lint fmt build
.DEFAULT: build
	
build:
	mkdocs build

fmt:
	codespell --write-changes
	mdformat --number docs/

lint:
	codespell
	mdformat --number --check docs/

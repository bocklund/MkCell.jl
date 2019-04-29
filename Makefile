BUILDDIR        = _build
PREFIX          = /usr/local/bin
COMPILE_SCRIPT  = compile/compile.jl
BUILD_ARTIFACTS = $(BUILDDIR)/mkcell $(BUILDDIR)/mkcell.dylib

$(BUILD_ARTIFACTS):
	julia $(COMPILE_SCRIPT)

build: $(BUILD_ARTIFACTS)
	julia $(COMPILE_SCRIPT)

install: build
	cp $(BUILD_ARTIFACTS) $(PREFIX)

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)

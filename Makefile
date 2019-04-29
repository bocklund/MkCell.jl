LOCALBIN        = bin
BUILDDIR        = _build
PREFIX          = /usr/local
COMPILE_SCRIPT  = compile/compile.jl
BUILD_ARTIFACTS = $(BUILDDIR)/supercellular $(BUILDDIR)/supercellular.dylib

$(BUILD_ARTIFACTS):
	julia $(COMPILE_SCRIPT)

build: $(BUILD_ARTIFACTS)
	mkdir -p $(LOCALBIN)
	cp $(BUILDDIR)/supercellular $(BUILDDIR)/supercellular.dylib $(LOCALBIN)

install: build
	cp $(LOCALBIN)/supercellular $(LOCALBIN)/supercellular.dylib $(PREFIX)

.PHONY: clean
clean:
	rm -rf $(LOCALBIN)

.PHONY: veryclean
veryclean: clean
	rm -rf $(BUILDDIR)

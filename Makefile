.PHONY: default help clean http hls all _prepare_dir
default: all

help:
	@echo "Usage: make <help>|<clean>|<http>|<hls>|<rtmp>|<all>"
	@echo "  help       display this help menu"
	@echo "  clean      cleanup project"
	@echo "  http       build the http load test tool over st(state-threads)"
	@echo "  hls        build the hls load test tool over st(state-threads)"
	@echo "  rtmp       build the rtmp load test tool over st(state-threads)"
	@echo "  all        build the http/hls load test tool over st(state-threads)"

clean: 
	(cd objs; rm -rf src sb_*_load)

http: _prepare_dir
	@echo "build the http load test tool over st(state-threads)"
	$(MAKE) -f objs/Makefile sb_http_load

rtmp: _prepare_dir
	@echo "build the http load test tool over st(state-threads)"
	$(MAKE) -f objs/Makefile sb_rtmp_load
	$(MAKE) -f objs/Makefile sb_rtmp_load_fast
	$(MAKE) -f objs/Makefile sb_rtmp_publish

hls: _prepare_dir
	@echo "build the HLS load test tool over st(state-threads)"
	$(MAKE) -f objs/Makefile sb_hls_load

all: _prepare_dir
	@echo "build the http/hls/rtmp load test tool over st(state-threads)"
	$(MAKE) -f objs/Makefile sb_http_load
	$(MAKE) -f objs/Makefile sb_hls_load
	$(MAKE) -f objs/Makefile sb_rtmp_load
	$(MAKE) -f objs/Makefile sb_rtmp_load_fast
	$(MAKE) -f objs/Makefile sb_rtmp_publish
	@echo "build ok, you can:"
	@echo "     ./objs/sb_http_load"
	@echo "     ./objs/sb_hls_load"
	@echo "     ./objs/sb_rtmp_load"
	@echo "     ./objs/sb_rtmp_load_fast"
	@echo "     ./objs/sb_rtmp_publish"

# the ./configure will generate it.
_prepare_dir:
	mkdir -p objs/src/core
	mkdir -p objs/src/os
	mkdir -p objs/src/app
	mkdir -p objs/src/main

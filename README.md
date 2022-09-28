## HLS & RTMP BENCHMARK

## Usage

Build from source, then run RTMP benchmark:

```
git clone https://github.com/SmurfManX/hls-benchmark.git &&
cd hls-benchmark && ./configure && make &&
./objs/sb_rtmp_load -c 1 -r rtmp://127.0.0.1:1935/live/livestream
```

Or directly by docker:

```bash
docker run --rm -it --network=host --name sb ossrs/srs:sb \
    ./objs/sb_rtmp_load -c 1 -r rtmp://127.0.0.1:1935/live/livestream
```

For HTTP-FLV benchmark:

```bash
docker run --rm -it --network=host --name sb ossrs/srs:sb \
    ./objs/sb_http_load -c 1 -r http://127.0.0.1:8080/live/livestream.flv
```

For HLS benchmark:

```bash
docker run --rm -it --network=host --name sb ossrs/srs:sb \
    ./objs/sb_hls_load -c 1 -r http://127.0.0.1:8080/live/livestream.m3u8
```

Or from Aliyun mirror:

```bash
docker run --rm -it --network=host --name sb \
    registry.cn-hangzhou.aliyuncs.com/ossrs/srs:sb \
    ./objs/sb_rtmp_load -c 1 -r rtmp://127.0.0.1:1935/live/livestream
```

> Note: Please use `docker kill sb` to stop it.

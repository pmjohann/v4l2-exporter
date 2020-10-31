FROM alpine:3.12

# INSTALL FFMPEG
RUN apk add --no-cache ffmpeg

# SET DEFAULT FRAME EXTENSION TO PNG
ENV EXT png

# CREATE VOLUME FOR EXPORTED FRAMES
VOLUME /frames

# COPY AND SET ENTRYPOINT
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

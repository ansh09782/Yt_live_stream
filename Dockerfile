FROM alpine:latest

RUN apk add --no-cache ffmpeg

ENV VIDEO_URL="https://drive.google.com/uc?export=download&id=10bEcXL7qek97d7QopEMtcsjYedz68mC1"

CMD ffmpeg -re -stream_loop -1 -i "$VIDEO_URL" -vcodec libx264 -preset veryfast -maxrate 3000k -bufsize 6000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 128k -ar 44100 -f flv "rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY"

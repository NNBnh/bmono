#!/bin/sh


# Values
FONT_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


# Start
#sudo dockerd
rm -rf "$FONT_PATH/dist"
sudo docker run -it -v "$FONT_PATH":/build avivace/iosevka-build && {
	sudo chown -R "$USER" "$FONT_PATH/dist"

	7z a "$FONT_PATH/bmono-ttf.zip"      "$FONT_PATH/dist/bmono/ttf"
	7z a "$FONT_PATH/bmono-unhinted.zip" "$FONT_PATH/dist/bmono/ttf-unhinted"
	7z a "$FONT_PATH/bmono-web.zip"      "$FONT_PATH/dist/bmono/woff2"
}


exit 0

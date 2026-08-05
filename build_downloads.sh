#!/usr/bin/env bash
# Joker's Last Call — 프레스킷 다운로드 ZIP 생성기
# 사용법:  cd jlc-press && bash build_downloads.sh
# assets/ 폴더에서 배포용 ZIP 4종을 downloads/ 에 만든다.
set -e
cd "$(dirname "$0")"
command -v zip >/dev/null || { echo "zip 명령이 없다. macOS/Linux 기본 포함이다."; exit 1; }
[ -d assets ] || { echo "assets/ 폴더를 찾을 수 없다. jlc-press 루트에서 실행할 것."; exit 1; }

mkdir -p downloads
rm -f downloads/*.zip
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "1/4  스크린샷…"
cp -R assets/shots "$TMP/screenshots"
( cd "$TMP" && zip -qr - screenshots ) > downloads/JLC_Screenshots.zip

echo "2/4  모션 클립…"
( cd assets && zip -qr - motion ) > downloads/JLC_Motion.zip

echo "3/4  키아트 & 로고…"
( cd assets && zip -qr - keyart logo ) > downloads/JLC_KeyArt_Logo.zip

echo "4/4  전체 프레스킷…"
mkdir -p "$TMP/JLC_PressKit"
cp -R assets/shots  "$TMP/JLC_PressKit/screenshots"
cp -R assets/motion "$TMP/JLC_PressKit/motion"
cp -R assets/keyart "$TMP/JLC_PressKit/keyart"
cp -R assets/logo   "$TMP/JLC_PressKit/logo"
cp -R assets/dev    "$TMP/JLC_PressKit/developer"
( cd "$TMP" && zip -qr - JLC_PressKit ) > downloads/JLC_PressKit_Full.zip

echo
echo "완료:"
ls -lh downloads/*.zip

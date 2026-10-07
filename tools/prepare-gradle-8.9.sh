#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PROPS="$ROOT/gradle/wrapper/gradle-wrapper.properties"
ORIGINAL_URL='https://services.gradle.org/distributions/gradle-8.9-bin.zip'
MIRROR_URL='https://mirrors.huaweicloud.com/repository/toolkit/gradle/gradle-8.9-bin.zip'
SHA_URL='https://services.gradle.org/distributions/gradle-8.9-bin.zip.sha256'
EXPECTED_SHA='d725d707bfabd4dfdc958c624003b3c80accc03f7037b5122c4b1d0ef15cecab'
LOCAL_ZIP="$ROOT/tools/gradle-8.9-bin.zip"

printf '%s\n' '[WorkoutHome] Gradle 8.9 bootstrap'
printf '%s\n' "Project: $ROOT"

if [ -x "$ROOT/gradlew" ]; then
  set +e
  VERSION_OUT=$(cd "$ROOT" && ./gradlew --version 2>&1)
  STATUS=$?
  set -e
  if [ $STATUS -eq 0 ] && grep -q 'Gradle 8\.9' <<<"$VERSION_OUT"; then
    printf '%s\n' 'Gradle 8.9 is already available.'
    exit 0
  fi
fi

if [ -f "$LOCAL_ZIP" ]; then
  printf '%s\n' "Using local Gradle archive: $LOCAL_ZIP"
  mkdir -p "$HOME/.gradle/wrapper/dists/gradle-8.9-bin/local"
  cp -f "$LOCAL_ZIP" "$HOME/.gradle/wrapper/dists/gradle-8.9-bin/local/gradle-8.9-bin.zip"
  printf '%s\n' 'Local archive staged for offline/bootstrap use.'
  exit 0
fi

# Prefer the official distribution, but provide a documented mirror fallback.
if curl -fL --connect-timeout 8 --max-time 180 -o /tmp/gradle-8.9-bin.zip "$ORIGINAL_URL"; then
  printf '%s\n' 'Downloaded Gradle 8.9 from the official Gradle distribution server.'
  if curl -fL --connect-timeout 8 --max-time 20 -o /tmp/gradle-8.9-bin.zip.sha256 "$SHA_URL"; then
    (cd /tmp && sha256sum -c gradle-8.9-bin.zip.sha256)
  else
    echo "$EXPECTED_SHA  /tmp/gradle-8.9-bin.zip" | sha256sum -c -
  fi
  mkdir -p "$ROOT/tools"
  mv /tmp/gradle-8.9-bin.zip "$LOCAL_ZIP"
  printf '%s\n' "Saved to $LOCAL_ZIP"
  exit 0
fi

printf '%s\n' 'Official Gradle server unavailable; trying Huawei Cloud mirror.'
if curl -fL --connect-timeout 8 --max-time 180 -o "$LOCAL_ZIP" "$MIRROR_URL"; then
  echo "$EXPECTED_SHA  $LOCAL_ZIP" | sha256sum -c -
  printf '%s\n' "Downloaded Gradle 8.9 from mirror: $MIRROR_URL"
  exit 0
fi

cat >&2 <<MSG
Unable to download Gradle 8.9 from either source in the current environment.
Expected sources:
  Official: $ORIGINAL_URL
  Mirror:   $MIRROR_URL
For an offline build, place gradle-8.9-bin.zip at:
  $LOCAL_ZIP
then rerun this script.
MSG
exit 2

#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk-amd64}"
if [ ! -x ./gradlew ]; then echo 'gradlew missing' >&2; exit 2; fi
./tools/prepare-gradle-8.9.sh || true
./gradlew :app:assembleDebug --stacktrace --no-daemon

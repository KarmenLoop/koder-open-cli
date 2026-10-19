#!/bin/sh
# Koder Open CLI proprietary preview downloader. Product source is not in this script.
set -eu
umask 077
fail() { printf '%s\n' "$*" >&2; exit 1; }
[ "$(uname -s)" = Darwin ] && [ "$(uname -m)" = arm64 ] || fail 'PLATFORM_UNSUPPORTED: preview 0.1.0-preview.1 currently supports macOS Apple Silicon only.'
version=0.1.0-preview.1
name="koder-open-$version-darwin-arm64"
base=${KODER_OPEN_DOWNLOAD_BASE:-"https://github.com/KarmenLoop/koder-open-cli/releases/download/v$version"}
case "$base" in https://*|http://127.0.0.1:*|http://localhost:*) ;; *) fail 'DOWNLOAD_BASE_INVALID: use HTTPS or a local test endpoint.' ;; esac
base=${base%/}
command -v curl >/dev/null 2>&1 || fail 'CURL_REQUIRED'
[ -x /usr/bin/shasum ] || fail 'SHASUM_REQUIRED'
temporary=$(mktemp -d "${TMPDIR:-/tmp}/koder-open.XXXXXX")
trap 'rm -rf -- "$temporary"' EXIT
trap 'exit 130' INT
trap 'exit 143' TERM
printf '%s\n' "Downloading Koder Open CLI $version for macOS Apple Silicon..."
curl --fail --silent --show-error --location --retry 2 --connect-timeout 15 --max-time 180 "$base/$name.sha256" -o "$temporary/checksum"
curl --fail --silent --show-error --location --retry 2 --connect-timeout 15 --max-time 180 "$base/$name.tar.gz" -o "$temporary/package.tar.gz"
expected=$(awk -v file="$name.tar.gz" 'NR==1 && NF==2 && length($1)==64 && $1!~/[^0-9a-f]/ && $2==file {print $1;valid=1} END{if(NR!=1 || !valid)exit 1}' "$temporary/checksum") || fail 'CHECKSUM_FAILED: invalid release checksum.'
actual=$(/usr/bin/shasum -a 256 "$temporary/package.tar.gz" | awk '{print $1}')
[ "$actual" = "$expected" ] || fail 'CHECKSUM_FAILED: download digest does not match this release.'
/usr/bin/tar -tzf "$temporary/package.tar.gz" > "$temporary/entries" || fail 'ARCHIVE_INVALID'
awk -v p="$name/" 'index($0,p)!=1{exit 1} {s=substr($0,length(p)+1);if(s!="" && s!="bin/" && s!~/^(bin\/koder-open|install.sh|uninstall.sh|README.md|LICENSE.txt|NODE_LICENSE.txt|BUILD.json|SHA256SUMS)$/)exit 1;count++} END{if(count!=10)exit 1}' "$temporary/entries" || fail 'ARCHIVE_INVALID: unexpected payload paths.'
/usr/bin/tar -tvzf "$temporary/package.tar.gz" > "$temporary/types" || fail 'ARCHIVE_INVALID'
awk 'substr($0,1,1)!~/[d-]/{exit 1}' "$temporary/types" || fail 'ARCHIVE_INVALID: links are not allowed in the payload.'
/usr/bin/tar -xzf "$temporary/package.tar.gz" -C "$temporary"
/bin/sh "$temporary/$name/install.sh"

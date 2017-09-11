#! /bin/bash

mkdir -p /sync/folders
mkdir -p /sync/config

exec /usr/bin/rslsync --nodaemon $*
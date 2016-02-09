#!/bin/sh

set -e
cd $(dirname "$0")/..

ln -s ExampleContent Content
ln -s Content/_config.yml _config.yml

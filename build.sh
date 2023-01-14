#!/bin/bash

PLUGIN_NAME="garand-reload"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx

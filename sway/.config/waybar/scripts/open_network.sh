#!/bin/bash

killall nm-connection-editor; [ $? -ne 0 ] && nm-connection-editor

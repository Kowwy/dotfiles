#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

echo "---" | tee -a /tmp/mybar.log
polybar mainbar 2>&1 | tee -a /tmp/mainbar.log & disown
polybar leftbar 2>&1 | tee -a /tmp/leftbar.log & disown
polybar rightbar 2>&1 | tee -a /tmp/rightbar.log & disown

echo "Bar(s) launched..."

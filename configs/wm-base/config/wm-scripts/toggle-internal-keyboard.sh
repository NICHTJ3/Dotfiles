#!/bin/bash
#/home/me/bin/toggle-keyboard

kb_name='AT Translated Set 2 keyboard'

if xinput list "$kb_name" | grep -i --quiet disable; then
  notify-send "Enabling keyboard..."
  xinput enable "$kb_name"
else
  notify-send "Disabling keyboard..."
  xinput disable "$kb_name"
fi

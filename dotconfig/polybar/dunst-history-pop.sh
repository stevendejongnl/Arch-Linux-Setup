#! /bin/sh

repeat $(dunstctl count history) {dunstctl history-pop}

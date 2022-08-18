#!/bin/bash

START=1
END=$(dunstctl count history)
 
for (( c=$START; c<=$END; c++ ))
do
	dunstctl history-pop
done

# repeat $(dunstctl count history) {dunstctl history-pop}

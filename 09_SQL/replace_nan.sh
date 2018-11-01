#!/bin/bash

for filename in *.csv; do
	sed -i.bak s/NA//g $filename
done

#!/bin/bash

rm -rf subset/*

for dir in $(ls data); do
    mkdir subset/$dir
    n=0
    # for f in $(ls -lh data/$dir | sed -n "s/.*8[0-9]K.* \(.*-$n.\?\.png$\)/\1/p" | tail -n $1); do
    for f in $(ls data/$dir | sed -n "s/\(.*-31H\.png$\)/\1/p" | tail -n $1); do
        cp data/$dir/"$f" subset/$dir/$n.png
        n=$((n+1))
    done
done

for dir in $(ls subset); do
    echo $dir: $(ls subset/$dir | wc -l)
done


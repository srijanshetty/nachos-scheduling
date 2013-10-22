#!/bin/bash

case "$1" in 
    "0")
        ./nachos -d ts -F batch0 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "1")
        ./nachos -d ts -F batch1 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "2")
        ./nachos -d ts -F batch2 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "3")
        ./nachos -d ts -F batch3 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "4")
        ./nachos -d ts -F batch4 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "5")
        ./nachos -d ts -F batch5 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "6")
        ./nachos -d ts -F batch6 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "7")
        ./nachos -d ts -F batch7 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "8")
        ./nachos -d ts -F batch8 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "9")
        ./nachos -d ts -F batch9 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
    "10")
        ./nachos -d ts -F batch10 > temp 
        grep 'Thread' temp
        grep 'Utilization' temp
        ;;
esac

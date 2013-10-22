#!/bin/bash

case "$1" in 
    "0")
        ./nachos -d ts -F batch0 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "1")
        ./nachos -d ts -F batch1 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "2")
        ./nachos -d ts -F batch2 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "3")
        ./nachos -d ts -F batch3 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "4")
        ./nachos -d ts -F batch4 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "5")
        ./nachos -d ts -F batch5 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "6")
        ./nachos -d ts -F batch6 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "7")
        ./nachos -d ts -F batch7 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk '{print $0; print "Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "8")
        ./nachos -d ts -F batch8 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "9")
        ./nachos -d ts -F batch9 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
    "10")
        ./nachos -d ts -F batch10 > temp 
        TOTAL=$(grep 'Ticks' temp | awk '{print $3}')
        cat temp | grep 'Ticks'
        grep 'Thread' temp | awk '{print $0 " Total: ", ($4+$8)}'
        grep 'Thread' temp | awk 'BEGIN {count=0; total=0;} \
                                {if( $2 != 0) count++; total=total+$6;} \
                                END{print "Average waiting time =" , total/count}'
        ;;
esac

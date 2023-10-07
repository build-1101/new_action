#!/bin/bash

function print_numbers() {
    for i in {1..5}; do
        echo "Number $i"
    done
}

function print_letters() {
    for letter in a b c d e; do
        echo "Letter $letter"
    done
}

print_numbers &
print_letters &

wait

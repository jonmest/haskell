default:
    @just --list

preview:
    stack exec site watch

build:
    stack exec site build

clean:
    stack exec site clean

compile:
    stack build

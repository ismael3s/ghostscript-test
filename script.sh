#!/bin/bash

if ! command -v gs &> /dev/null; then
    if command -v apt-get &> /dev/null; then
        sudo apt-get install ghostscript
    elif command -v yum &> /dev/null; then
        sudo yum install ghostscript
    elif command -v apk &> /dev/null; then
        apk add ghostscript
    else
        echo "Please install ghostscript"
        exit 1
    fi
fi

function compress_pdf() {
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$2 $1
}

for file in pdf/*.pdf; do
    if [[ $file != *_compressed.pdf ]]; then
        compress_pdf $file "${file%.pdf}_compressed.pdf"
    fi
done

ls -lh pdf | awk '$5 && $9 {printf "File: %-30s | Size: %s\n", $9, $5}'



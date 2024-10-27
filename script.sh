#!/bin/bash


function compress_pdf() {
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$2 $1
}

for file in pdf/*.pdf; do
    if [[ $file != *_compressed.pdf ]]; then
        compress_pdf $file "${file%.pdf}_compressed.pdf"
    fi
done

ls -lh pdf | awk '$5 && $9 {printf "File: %-30s | Size: %s\n", $9, $5}'



#!/usr/bin/env bash
set -euo pipefail

# Allow 1 or 2 args
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 <input.pdf> [output.txt]"
  exit 1
fi

INPUT="$1"

# Default sidecar if none given
if [ "$#" -eq 2 ]; then
  SIDECAR="$2"
else
  SIDECAR="output.txt"
fi

# Derived OCR PDF name
OCR_PDF="${INPUT%.pdf}_ocr.pdf"

# 1) sanity-check
if ! command -v ocrmypdf &>/dev/null; then
  echo "Error: ocrmypdf not found. Install via 'pip3 install ocrmypdf'." >&2
  exit 2
fi

# 2) OCR into a searchable PDF + side-car text file
#    --skip-text: only OCR pages lacking text
#    --sidecar:   write recognized text to SIDECAR
echo "🔍 Running OCRmyPDF…"
ocrmypdf --skip-text --sidecar "$SIDECAR" "$INPUT" "$OCR_PDF"

# 3) report
if [ -s "$SIDECAR" ]; then
  echo "✅ Text extracted to '$SIDECAR'"
  echo "✅ Searchable PDF with text-layer at '$OCR_PDF'"
else
  echo "⚠️ No text extracted—check your input PDF."
  exit 3
fi


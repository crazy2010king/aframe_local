#!/bin/bash

# Script to test all A-Frame examples
echo "A-Frame Examples Test Report"
echo "============================"
echo "Date: $(date)"
echo ""

# Counters
TOTAL=0
PASSED=0
FAILED=0
FAILED_LIST=()

# Find all HTML files
HTML_FILES=$(find /mnt/test_cc_dev/git_source/aframe_local/local/examples/ -name "*.html" | grep -v index.html | sort)

for file in $HTML_FILES; do
  TOTAL=$((TOTAL + 1))
  echo -n "Testing $file ... "

  # Check if HTML is well-formed (basic check)
  if grep -q "<html" "$file" && grep -q "<a-scene" "$file"; then
    # Check for broken internal resource links
    BROKEN_LINKS=0

    # Check aframe script exists
    if grep -q "aframe-master.min.js" "$file"; then
      # Verify relative path
      SCRIPT_PATH=$(grep -o 'src=".*aframe-master.min.js"' "$file" | cut -d'"' -f2)
      FULL_SCRIPT_PATH=$(realpath "$(dirname "$file")/$SCRIPT_PATH")
      if [ ! -f "$FULL_SCRIPT_PATH" ]; then
        BROKEN_LINKS=1
      fi
    fi

    if [ $BROKEN_LINKS -eq 0 ]; then
      echo "✅ PASS"
      PASSED=$((PASSED + 1))
    else
      echo "❌ FAIL (Broken resource links)"
      FAILED=$((FAILED + 1))
      FAILED_LIST+=("$file (Broken resource links)")
    fi
  else
    echo "❌ FAIL (Invalid A-Frame HTML)"
    FAILED=$((FAILED + 1))
    FAILED_LIST+=("$file (Invalid A-Frame HTML)")
  fi
done

echo ""
echo "Summary:"
echo "Total: $TOTAL"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo ""

if [ $FAILED -gt 0 ]; then
  echo "Failed examples:"
  for fail in "${FAILED_LIST[@]}"; do
    echo "  - $fail"
  done
fi

echo ""
echo "Test complete!"

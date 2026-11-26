
#!/bin/bash
# SPDX-FileCopyrightText: 2026 Kotaro Kitagawa
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目のテスト失敗" >&2
    res=1
}

res=0

chmod +x ./fileclean

### NORMAL INPUT ###
out=$(printf "report.txt\n" | ./fileclean)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "report.txt" ] || ng "$LINENO"

### SPACE CLEANING ###
out=$(printf "  report 01.txt  \n" | ./fileclean)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "report_01.txt" ] || ng "$LINENO"

### MULTIPLE SPACES ###
out=$(printf "my   report.txt\n" | ./fileclean)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "my_report.txt" ] || ng "$LINENO"

### EMPTY INPUT ###
out=$(printf "\n" | ./fileclean)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### MULTIPLE FILE NAMES ###
out=$(printf "report.txt\nimage.png\n" | ./fileclean)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "$(printf "report.txt\nimage.png")" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit "$res"

### TAB CLEANING ###
out=$(printf "my\treport.txt\n" | ./fileclean)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "my_report.txt" ] || ng "$LINENO"

### WHITESPACE ONLY ###
out=$(printf "   \n" | ./fileclean)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit "$res"

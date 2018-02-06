#!/bin/sh
# file: examples/equality_test.sh

testEquality()
{
	sh lab1.sh
	actual=`md5sum results.xml`
	expected="49713444858274e0dcd3b4f51bb9513d  results.xml"

  assertEquals "$actual" "$expected"
}

# load shunit2
. shunit2-2.1.6/src/shunit2
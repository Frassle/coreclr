CORE_ROOT="./bin/tests/Linux.x64.Debug/Tests/Core_Root/"

tests=$(find tests/src/hkt -name "*.il")
for test in $tests; do
	"$CORE_ROOT/ilasm" $test
done

for test in $tests; do
	testpath=$(echo "$test" | sed -E 's|(.+)\.il|\1.exe|')
	"$CORE_ROOT/corerun" $testpath
	exitcode=$?
	if [ $exitcode -ne 100 ]; then
		echo "Test exit code was $exitcode"
		exit 1
	fi
done

echo "All passed"



tests=$(find tests/src/hkt -name "*proj")

for test in $tests; do
	Tools/msbuild.sh /maxcpucount $test /p:__BuildType=Debug /p:__BuildOS=Linux
done

for test in $tests; do
	name=$(echo "$test" | sed 's|tests/src/hkt/||g')
	name=$(echo "$name" | sed -E 's|/(.+)\...proj|/\1/\1.sh|g')
	testpath="./bin/tests/Linux.x64.Debug/hkt/$name"
	bash $testpath -coreroot=/home/fraser/github.com/dotnet/coreclr/bin/tests/Linux.x64.Debug/Tests/Core_Root
done


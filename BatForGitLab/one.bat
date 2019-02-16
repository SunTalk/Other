@echo off

pushd one
pushd Lab
git pull

echo OneStart

for /L %%i in (1 1 %1) do (
	make.exe
	git add .
	git commit -m "do one"
	git push
	timeout 1
)

popd
popd



@echo off

pushd one
pushd Lab
git pull
popd
popd
pushd two
pushd Lab
git pull
popd
popd

echo TwoStart

for /L %%i in (1 1 %1) do (

	pushd one
	pushd Lab
	make.exe
	git add .
	git commit -m "do two - one"
	git pull
	git push
	popd
	popd
	
	timeout 1

	pushd two
	pushd Lab
	make2.exe
	git add .
	git commit -m "do two - two"
	git pull
	git push
	popd
	popd
	
	timeout 1

)




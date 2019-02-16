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
pushd three
pushd Lab
git pull
popd
popd

echo ThreeStart

for /L %%i in (1 1 %1) do (

	pushd one
	pushd Lab
	make.exe
	git add .
	git commit -m "do three - one"
	git pull
	git push
	popd
	popd
	
	timeout 1

	pushd two
	pushd Lab
	make2.exe
	git add .
	git commit -m "do three - two"
	git pull
	git push
	popd
	popd
	
	timeout 1

	pushd three
	pushd Lab
	make3.exe
	git add .
	git commit -m "do three - three"
	git pull
	git push
	popd
	popd
	
	timeout 1
)




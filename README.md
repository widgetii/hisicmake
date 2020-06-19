## Usage

Change directory inside `SDK_DIR/mpp/sample` and this git repo into existing
directory:

```sh
$ git init .
$ git remote add origin git@github.com:widgetii/hisicmake.git
$ git config pull.rebase false
$ git pull origin master
$ git branch --set-upstream-to=origin/master master
```

## Manual Cmake build

* 18EV200 SDK:

```
$ cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_TOOLCHAIN_FILE=tools/cmake/toolchains/arm-hisiv510-linux.cmake \
    -G Ninja
$ cmake --build build
```

* 16CV300 SDK:

```
$ cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_TOOLCHAIN_FILE=tools/cmake/toolchains/arm-hisiv500-linux.cmake \
    -G Ninja
$ cmake --build build
```

* 16EV200/EV300 SDK:

```
$ cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_TOOLCHAIN_FILE=tools/cmake/toolchains/arm-himix100-linux.cmake \
    -G Ninja
$ cmake --build build
```

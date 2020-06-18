#include("${CMAKE_CURRENT_LIST_DIR}/find_compiler.cmake")

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_CROSSCOMPILING TRUE)

# Specify the cross compiler.
set(CMAKE_C_COMPILER arm-himix100-linux-gcc CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER arm-himix100-linux-g++ CACHE FILEPATH "C++ compiler")
set(CMAKE_ASM_COMPILER arm-himix100-linux-as CACHE FILEPATH "ASM compiler")

#set(CMAKE_FIND_ROOT_PATH ?)
#set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
#set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
#set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

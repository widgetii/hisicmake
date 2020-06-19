cmake_minimum_required(VERSION 3.8)

project(sample_venc)

set(HEADERS
    common/sample_comm.h
    )

set(SOURCES
    venc/sample_venc.c
    common/sample_comm_sys.c
    common/sample_comm_isp.c
    common/sample_comm_venc.c
    common/sample_comm_vpss.c
    common/sample_comm_vi.c
    common/sample_comm_vo.c
    )

add_executable(${PROJECT_NAME}
    ${HEADERS}
    ${SOURCES}
)
target_include_directories(${PROJECT_NAME} PRIVATE common)
# for EV200/EV300
target_compile_definitions(${PROJECT_NAME} PUBLIC SENSOR0_TYPE=SONY_IMX307_2L_MIPI_2M_30FPS_12BIT)
# for CV300
target_compile_definitions(${PROJECT_NAME} PUBLIC SENSOR_TYPE=SONY_IMX290_MIPI_1080P_30FPS)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

# to prefer static libraries over dynamic use
set(CMAKE_FIND_LIBRARY_SUFFIXES .a)
find_package(HiSiliconSDK REQUIRED)
include_directories(${HISILICON_SDK_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} ${HISILICON_SDK_LIBRARIES})

find_package(Threads REQUIRED)
target_link_libraries(${PROJECT_NAME} Threads::Threads)
target_link_libraries(${PROJECT_NAME} m dl)

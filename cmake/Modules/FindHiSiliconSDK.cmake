# - Try to find HiSiliconSDK
# Once done this will define
#  HISILICON_SDK_FOUND - System has HiSilicon SDK
#  HISILICON_SDK_INCLUDE_DIRS - The HiSilicon SDK include directories
#  HISILICON_SDK_LIBRARIES - The libraries needed to use HiSilicon SDK
#  HISILICON_SDK_DEFINITIONS - Compiler switches required for using HiSilicon SDK

find_path(HISILICON_SDK_INCLUDE_DIRS hi_common.h
    HINTS ENV HISILICON_SDK_DIR
    PATH_SUFFIXES mpp/include
    REQUIRED
)

execute_process(COMMAND ${CMAKE_MODULE_PATH}/get_hisisdk_ver.py $ENV{HISILICON_SDK_DIR}
    OUTPUT_VARIABLE RAW_SDK_VER
)
if(RAW_SDK_VER)
    list(GET RAW_SDK_VER 0 HISILICON_SDK_FAMILY)
    list(GET RAW_SDK_VER 1 HISILICON_SDK_VERSION_MAJOR)
    list(GET RAW_SDK_VER 2 HISILICON_SDK_VERSION_MINOR)
    list(GET RAW_SDK_VER 3 HISILICON_SDK_VERSION_PATCH)
    list(GET RAW_SDK_VER 4 HISILICON_SDK_VERSION_TWEAK)
    set(HISILICON_SDK_VERSION_COUNT 4)
    list(GET RAW_SDK_VER 6 HISILICON_SDK_VERSION_DATE)
    list(SUBLIST RAW_SDK_VER 1 5 SDK_ONLY_VER)
    list(JOIN SDK_ONLY_VER "." HISILICON_SDK_VERSION)
    message("Detected ${HISILICON_SDK_FAMILY} SDK version ${HISILICON_SDK_VERSION}")
    set(HISILICON_SDK_FOUND 1)
endif()

set(CORE_LIBS_NAMES
    mpi
    _hiae           # Automatic exposure
    isp             # Image signal processor
    ive             # Intelligent video engine
    _hidehaze       # Remove haze
    _hidefog        # Remove fog
    _hidrc          # Dynamic range compression
    _hildci         # LDCI/Sharpen
    _hiawb          # Automatic white balance
    _hiir_auto      # IR Cut auto
    _hiaf           # Automatic focus
    upvqe           # Up voice quality enhancement
    dnvqe           # Down voice quality enhancement
    securec         # Secure C functions
    VoiceEngine
)

foreach(LIB ${CORE_LIBS_NAMES})
        find_library(FOUND_LIB_${LIB} ${LIB}
            PATH_SUFFIXES mpp/lib
            HINTS ENV HISILICON_SDK_DIR
            REQUIRED
        )
        if(FOUND_LIB_${LIB})
            list(APPEND CORE_LIBS ${FOUND_LIB_${LIB}})
        endif()
        message("Lib: ${LIB}")
        message("Found Lib: ${FOUND_LIB_${LIB}}")
endforeach(LIB)

set(SENSOR_LIBS_NAMES
    sns_imx222
    sns_imx327
    sns_imx307
    sns_imx307_2l
    sns_imx327_2l
    sns_imx335
    sns_sc4236
    sns_sc2235
    sns_sc2231
    sns_f37
    sns_sc3235
    sns_gc2053
    sns_gc2053_forcar
    sns_os05a
    )

foreach(LIB ${SENSOR_LIBS_NAMES})
        find_library(FOUND_LIB_${LIB} ${LIB}
            PATH_SUFFIXES mpp/lib
            HINTS ENV HISILICON_SDK_DIR
        )
        if(FOUND_LIB_${LIB})
            list(APPEND SENSOR_LIBS ${FOUND_LIB_${LIB}})
        endif()
        message("Lib: ${LIB}")
        message("Found Lib: ${FOUND_LIB_${LIB}}")
endforeach(LIB)

set(HISILICON_SDK_LIBRARIES
    ${CORE_LIBS}
    ${SENSOR_LIBS}
)

# - Try to find HiSiliconSDK
# Once done this will define
#  HISILICON_SDK_FOUND - System has HiSilicon SDK
#  HISILICON_SDK_INCLUDE_DIRS - The HiSilicon SDK include directories
#  HISILICON_SDK_LIBRARIES - The libraries needed to use HiSilicon SDK
#  HISILICON_SDK_DEFINITIONS - Compiler switches required for using HiSilicon SDK

find_path(HISILICON_SDK_ROOT hi_common.h
    HINTS ENV HISILICON_SDK_DIR
    PATH_SUFFIXES mpp/include
    REQUIRED
)

set(HISILICON_SDK_INCLUDE_DIRS ${HISILICON_SDK_ROOT})

set(CORE_LIBS_NAMES
    mpi
    _hiae
    isp
    _hidehaze       # Remove haze
    _hidefog        # Remove fog
    _hidrc
    _hildci
    _hiawb          # Auto white balance
    _hiir_auto      # IR Cut auto
    _hiaf           # Auto focus
    upvqe
    securec
    dnvqe
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

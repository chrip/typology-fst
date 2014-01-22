# Found on https://github.com/markusdr/fstrain
# Sets the following variables:
# OPENFST_FOUND
# OPENFST_DIR


find_path(OPENFST_INCLUDE_DIR fst.h PATHS ${OPENFST_ROOT}/include/fst "/usr/local/include/fst")
find_library(OPENFST_LIB fst PATHS ${OPENFST_ROOT}/lib "/usr/local/bin")

if(OPENFST_INCLUDE_DIR)
  set(OPENFST_FOUND 1)
  string(REGEX REPLACE "src/include/fst$" "" OPENFST_DIR ${OPENFST_INCLUDE_DIR})
  set(OPENFST_INCLUDE_DIR "${OPENFST_INCLUDE_DIR}/..")
  message(STATUS "OpenFst include: ${OPENFST_INCLUDE_DIR}")
  message(STATUS "OpenFst lib: ${OPENFST_LIB}")
else()
  message(FATAL_ERROR "No OpenFst found. Please specify OPENFST_ROOT.")
ENDIF()

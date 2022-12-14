# Compute locations from <prefix>/@{LIBRARY_DIR@/cmake/lapacke-<v>/<self>.cmake
get_filename_component(_CBLAS_SELF_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_CBLAS_PREFIX "${_CBLAS_SELF_DIR}" PATH)
get_filename_component(_CBLAS_PREFIX "${_CBLAS_PREFIX}" PATH)
get_filename_component(_CBLAS_PREFIX "${_CBLAS_PREFIX}" PATH)

# Load the LAPACK package with which we were built.
set(LAPACK_DIR "${_CBLAS_PREFIX}/lib/cmake/lapack64-3.10.1")
find_package(LAPACK NO_MODULE)

# Load lapacke targets from the install tree.
if(NOT TARGET cblas64)
  include(${_CBLAS_SELF_DIR}/cblas64-targets.cmake)
endif()

# Report lapacke header search locations.
set(CBLAS_INCLUDE_DIRS ${_CBLAS_PREFIX}/include)

# Report lapacke libraries.
set(CBLAS_LIBRARIES cblas64)

unset(_CBLAS_PREFIX)
unset(_CBLAS_SELF_DIR)

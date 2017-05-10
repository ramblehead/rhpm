# CMake system name must be something like "Linux".
# This is important for cross-compiling.

#set(CMAKE_C_COMPILER clang)
#set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)

set(CMAKE_C_FLAGS "-std=c99 -pipe -feliminate-unused-debug-types" CACHE STRING "CFLAGS")
set(CMAKE_CXX_FLAGS "-std=c++11 -pipe -feliminate-unused-debug-types -Wno-unused-parameter" CACHE STRING "CXXFLAGS")

set(CMAKE_C_LINK_FLAGS "-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed" CACHE STRING "LDFLAGS")
set(CMAKE_CXX_LINK_FLAGS "-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed" CACHE STRING "LDFLAGS")

#set(CMAKE_C_FLAGS_RELEASE "" CACHE STRING "CFLAGS for release")
#set(CMAKE_CXX_FLAGS_RELEASE "" CACHE STRING "CXXFLAGS for release")

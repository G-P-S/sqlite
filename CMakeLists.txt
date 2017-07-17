cmake_minimum_required(VERSION 2.8)
list(APPEND CMAKE_MODULE_PATH ${GOPRO_TOOLS_DIR}/cmake)
include("${GOPRO_TOOLS_DIR}/cmake/gopro.cmake")

gopro_init(sqlite3)

gopro_begin_lib(sqlite3)
include_directories(.)
gopro_dir(. GROUP src)
gopro_files(
    sqlite3.c
)
set(HEADERS
    sqlite3.h
    sqlite3ext.h
)
gopro_dir(. GROUP include)
gopro_files(${HEADERS})
gopro_public_headers(include ${HEADERS})
gopro_public_header_dir(.)
gopro_end_lib()


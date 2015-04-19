project(binlog_test)
cmake_minimum_required (VERSION 2.8)

SET(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/MyCmake" ${CMAKE_MODULE_PATH})
find_package(MySQL REQUIRED)
find_package(MySQLReplication REQUIRED)

set(CMAKE_CXX_FLAGS -std=c++11 ${CMAKE_CXX_FLAGS})
include_directories(${MYSQL_INCLUDE_DIR} ${REPLICATION_INCLUDE_DIR})
add_executable(binlog_test binlog_test.cpp)
target_link_libraries(binlog_test ${REPLICATION_LIBRARY} ${MYSQL_LIBRARY} pthread)



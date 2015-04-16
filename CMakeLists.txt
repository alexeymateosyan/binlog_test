project(binlog_test)
cmake_minimum_required (VERSION 2.6)

set(CMAKE_CXX_FLAGS -std=c++11)
include_directories(../mysql-replication-listener/include)
link_directories(../mysql-replication-listener/build/lib)
add_executable(binlog_test binlog_test.cpp)
target_link_libraries(binlog_test replication_static mysqlclient pthread)



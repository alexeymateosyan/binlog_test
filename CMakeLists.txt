project(binlog_test)
cmake_minimum_required (VERSION 2.6)

set(CMAKE_CXX_FLAGS -std=c++11)
include_directories(../mysql-replication-listener/include /home/alex/percona/include)
link_directories(/home/alex/log_api/mysql-replication-listener/build/lib /home/alex/percona/lib)
add_executable(binlog_test binlog_test.cpp)
target_link_libraries(binlog_test replication mysqlclient pthread)



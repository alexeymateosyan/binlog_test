# - Find mysqlclient
# Find the native MySQLReplication includes and library
#
#  REPLICATION_INCLUDE_DIR - where to find mysql.h, etc.
#  REPLICATION_LIBRARIES   - List of libraries when using MySQL.
#  REPLICATION_FOUND       - True if MySQL found.

IF (REPLICATION_INCLUDE_DIR)
  # Already in cache, be silent
  SET(REPLICATION_FIND_QUIETLY TRUE)
ENDIF (REPLICATION_INCLUDE_DIR)

FIND_PATH(REPLICATION_INCLUDE_DIR binlog_api.h
          $ENV{REPLICATION_DIR}/include
          NO_DEFAULT_PATH
)

SET(REPLICATION_NAMES replication)
FIND_LIBRARY(REPLICATION_LIBRARY
  NAMES ${REPLICATION_NAMES}
  PATHS 
  $ENV{REPLICATION_DIR}/lib
  /usr/lib/i386-linux-gnu
)
IF(REPLICATION_LIBRARY)
  GET_FILENAME_COMPONENT(REPLICATION_LIB_DIR ${REPLICATION_LIBRARY} PATH)
ENDIF(REPLICATION_LIBRARY)

IF (REPLICATION_INCLUDE_DIR AND REPLICATION_LIB_DIR)
  SET(REPLICATION_FOUND TRUE)
  INCLUDE_DIRECTORIES(${REPLICATION_INCLUDE_DIR})
  LINK_DIRECTORIES(${REPLICATION_LIB_DIR})
ENDIF(REPLICATION_INCLUDE_DIR AND REPLICATION_LIB_DIR)

IF (REPLICATION_FOUND)
  IF (NOT REPLICATION_FIND_QUIETLY)
    MESSAGE(STATUS "Found MySQLReplication: ${REPLICATION_LIBRARY}")
  ENDIF (NOT REPLICATION_FIND_QUIETLY)
ELSE (NOT REPLICATION_FOUND)
  IF (REPLICATION_FIND_REQUIRED)
    MESSAGE(STATUS "Looked for MySQLReplication libraries named ${REPLICATION_NAMES}.")
    MESSAGE(FATAL_ERROR "Could NOT find MySQLReplication library")
  ENDIF (REPLICATION_FIND_REQUIRED)
ENDIF (REPLICATION_FOUND)

MARK_AS_ADVANCED(
  REPLICATION_LIBRARY
  REPLICATION_INCLUDE_DIR
  )

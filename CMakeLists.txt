# Copyright 2017, akashche at redhat.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cmake_minimum_required ( VERSION 2.8.12 )

# project
project ( itw_tagsoup NONE )

set ( ${PROJECT_NAME}_SRCDIR ${OJDKBUILD_DIR}/lookaside/tagsoup )
set ( ${PROJECT_NAME}_VERSION 1.2.1 )

configure_file (
        ${CMAKE_CURRENT_LIST_DIR}/resources/run-ant.bat
        ${CMAKE_CURRENT_BINARY_DIR}/run-ant.bat )

add_custom_command ( OUTPUT tagsoup.jar
        COMMAND (robocopy ${${PROJECT_NAME}_SRCDIR} ${CMAKE_CURRENT_BINARY_DIR} /e /nfl ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
        COMMAND cmd /c run-ant.bat
        COMMAND (robocopy dist/lib/ ${CMAKE_CURRENT_BINARY_DIR} tagsoup-${${PROJECT_NAME}_VERSION}.jar ${openjdk_RBCFLAGS} ) ${openjdk_RBCPOSTFIX}
        COMMAND rename tagsoup-${${PROJECT_NAME}_VERSION}.jar tagsoup.jar
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Building tagsoup jar ..." )  
add_custom_target ( ${PROJECT_NAME} DEPENDS tagsoup.jar )
add_dependencies ( ${PROJECT_NAME} image )
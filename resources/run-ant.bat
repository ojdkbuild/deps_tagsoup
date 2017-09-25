@echo off

rem Copyright 2017, akashche at redhat.com
rem
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

@echo on

set JAVA_HOME=${icedtea_web_ITW_JAVA_HOME}
set CLASSPATH=${CMAKE_CURRENT_LIST_DIR}/BuildRequires/xalan-j2.jar;${CMAKE_CURRENT_LIST_DIR}/BuildRequires/xalan-j2-serializer.jar
${openjdk_TOOLS}/ant182/bin/ant -Dtagsoup.version=${${PROJECT_NAME}_VERSION}
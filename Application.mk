#/*
# *
# * 
# * File name: Application.mk
# * 
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# *  You may obtain a copy of the License at
# * 
# *     http://www.apache.org/licenses/LICENSE-2.0
# * 
# *  Unless required by applicable law or agreed to in writing, software
# *  distributed under the License is distributed on an "AS IS" BASIS,
# *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# *  See the License for the specific language governing permissions and
# *  limitations under the License.
# * 
# * All files in the folder are under this Apache License, Version 2.0.
# *
#*/

# This is just for mips, if you really needs MSA, un-comment and build with GCC.
# Note: Supporting GCC on NDK is already deprecated and GCC will be removed from NDK soon.


APP_PLATFORM := android-28
APP_ABI := armeabi-v7a
#APP_OPTIM := debug
APP_OPTIM := release

APP_STL := c++_shared
#APP_STL := gnustl_shared
APP_CPPFLAGS := -frtti -fexceptions

NDK_TOOLCHAIN_VERSION := clang
#NDK_TOOLCHAIN_VERSION := 4.9
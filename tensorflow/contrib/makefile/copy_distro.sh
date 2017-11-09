#!/usr/bin/env bash
# Copyright 2016 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
# Copies all build files in a single distributive

mkdir -p "${DISTR}"

find tensorflow/contrib/makefile/ -name 'libtensorflow-core*.a' -exec  cp '{}' ${DISTR} \;
find tensorflow/contrib/makefile/ -name 'libprotobuf.a' -exec  cp '{}' ${DISTR} \;
find "tensorflow/contrib/makefile/gen/${PROTOBUF}/lib/" -name 'libprotobuf.a' | cpio -pudm ${DISTR}
find tensorflow/contrib/makefile/ -name 'nsync.a' -exec  cp '{}' ${DISTR} \;

cp -rf tensorflow/contrib/makefile/gen/proto/tensorflow ${DISTR}/
HEADERS="${DISTR}/../include"
mkdir -p "${HEADERS}"
find tensorflow/core/ -name '*.h' | cpio -pdm ${HEADERS}
cp -rf tensorflow/contrib//makefile/downloads/nsync/public/ ${HEADERS}/nsync/

mkdir -p "${HEADERS}/third_party/"
cp -rf third_party/eigen3 ${HEADERS}/third_party/eigen3


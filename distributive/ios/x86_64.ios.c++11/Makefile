
CC=${CC_PREFIX} clang++
PLATFORM_CPPFLAGS=-DNSYNC_USE_CPP11_TIMEPOINT -DNSYNC_ATOMIC_CPP11 \
-I../../platform/c++11 -I../../platform/gcc_no_tls \
-I../../platform/macos -I../../platform/posix -pthread
PLATFORM_CFLAGS=-arch x86_64 -fno-exceptions -stdlib=libc++ \
-fembed-bitcode  -mios-simulator-version-min=8.0 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator11.0.sdk -fPIC -x c++ \
-std=c++11 -Werror -Wall -Wextra -pedantic
PLATFORM_LDFLAGS=-pthread
MKDEP=${CC} -x c++ -M -std=c++11
PLATFORM_C=../../platform/posix/src/clock_gettime.c \
../../platform/c++11/src/nsync_semaphore_mutex.cc \
../../platform/posix/src/per_thread_waiter.c \
../../platform/c++11/src/yield.cc \
../../platform/c++11/src/time_rep_timespec.cc \
../../platform/c++11/src/nsync_panic.cc
PLATFORM_OBJS=clock_gettime.o nsync_semaphore_mutex.o per_thread_waiter.o \
yield.o time_rep_timespec.o nsync_panic.o
TEST_PLATFORM_C=../../platform/c++11/src/start_thread.cc
TEST_PLATFORM_OBJS=start_thread.o
include ../../platform/posix/make.common
include dependfile


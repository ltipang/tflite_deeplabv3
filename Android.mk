LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LIBCAPP_ROOT_REL:= $(LOCAL_PATH)/..
LIBCAPP_ROOT_ABS:= $(LOCAL_PATH)/..

include $(CLEAR_VARS)
LOCAL_MODULE := libc
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_PATH)/libc.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libstdc++
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_PATH)/libstdc++.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libopencv
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_PATH)/libopencv_java3.so
include $(PREBUILT_SHARED_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := libtensorflowlite
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_PATH)/libtensorflowlite_c.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libtensorflowlite_gpu
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_SRC_FILES := $(LOCAL_PATH)/libtensorflowlite_gpu_gl.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := tflite_segment
LOCAL_C_INCLUDES := $(LOCAL_PATH) \
            $(LOCAL_PATH)/include/opencv \
			$(LOCAL_PATH)/include

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)

LOCAL_LDLIBS += -llog -ldl -lc
LOCAL_SHARED_LIBRARIES := libopencv \
						libtensorflowlite \
						libtensorflowlite_gpu 

#libtensorflow_inference \

LOCAL_SRC_FILES := ImageSegmentation.cpp \
                   tflite-segment.cpp


include $(BUILD_EXECUTABLE)


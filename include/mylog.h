//
// Created by hlhuang on 2019/7/4.
//

#ifndef VNNPROJECT_LOG_H
#define VNNPROJECT_LOG_H

#ifdef __cplusplus
extern "C"{
#endif

#include <android/log.h>
#define LOG_TAG    "YOLOV3_Native" // 这个是自定义的LOG的标识
//#undef LOG // 取消默认的LOG
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG, __VA_ARGS__)
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG, __VA_ARGS__)
#define LOGW(...)  __android_log_print(ANDROID_LOG_WARN,LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG, __VA_ARGS__)
#define LOGF(...)  __android_log_print(ANDROID_LOG_FATAL,LOG_TAG, __VA_ARGS__)

#ifdef __cplusplus
};
#endif

#endif //VNNPROJECT_LOG_H

adb shell 
su 
stop
setprop log.redirect-stdio true
start

#include<android/log.h>
#define LOG_TAG "pjlib"
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG ,LOG_TAG, __VA_ARGS__)
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO  ,LOG_TAG, __VA_ARGS__)
#define LOGW(...)  __android_log_print(ANDROID_LOG_WARN  ,LOG_TAG, __VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR ,LOG_TAG, __VA_ARGS__)
#define LOGF(...)  __android_log_print(ANDROID_LOG_FATAL ,LOG_TAG, __VA_ARGS__)
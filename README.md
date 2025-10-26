https://www.davthecoder.com/blog/supercharging-android-apps-with-zig-a-complete-jni-integration-guide

https://capy-ui.org/blog/porting-capy-to-android/

https://av.tib.eu/media/52832 https://github.com/ikskuh/ZigAndroidTemplate

https://github.com/zig-java/jui/blob/main/tools/class2zig.zig

https://developer.android.com/reference/android/app/Application

https://developer.android.com/ndk/samples/sample_na

https://android.googlesource.com/platform/development/+/4948c163663ecc343c97e4c2a2139234f1d3273f/ndk/sources/android/native_app_glue/android_native_app_glue.c

android.app.func_name

https://developer.android.com/ndk/guides/concepts

```
zig build-lib -target aarch64-linux-android -dynamic -O ReleaseSmall -fPIC -fsoname=libzig.so -femit-bin=zig-out/libzig.so


/home/moritz/Android/Sdk/ndk/29.0.14206865/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-objdump -D result
```

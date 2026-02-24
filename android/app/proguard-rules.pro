# Flutter ProGuard rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Dio HTTP library
-keep class dio.** { *; }
-keep class okhttp3.** { *; }
-keep class okio.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**
-dontwarn okio.**

# Gson
-keep class com.google.gson.** { *; }
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.stream.** { *; }

# Prevent stripping of networking classes
-keep class java.net.** { *; }
-keep class javax.net.** { *; }
-keep class org.apache.http.** { *; }
-keep class android.net.** { *; }

# Keep your application's classes
-keep class com.criticalalpha.critical_alpha.** { *; }

# SharedPreferences
-keep class androidx.datastore.preferences.** { *; }
-keep class androidx.datastore.** { *; }

# Connectivity Plus
-keep class dev.fluttercommunity.plus.connectivity.** { *; }

# Flutter Dotenv
-keep class io.github.cdimascio.** { *; }

# Keep attributes for stack traces
-keepattributes SourceFile,LineNumberTable
-keepattributes *Annotation*

# Prevent ProGuard from stripping interface information
-keep interface * {
    *;
}

# Prevent obfuscation of classes with native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep setters and getters in Views for animations
-keepclassmembers public class * extends android.view.View {
   void set*(***);
   *** get*();
}

# Keep custom exceptions
-keep public class * extends java.lang.Exception

# Flutter Secure Storage
-keep class com.it_nomads.fluttersecurestorage.** { *; }

# Prevent removal of runtime visible annotations
-keepattributes RuntimeVisibleAnnotations
-keepattributes RuntimeInvisibleAnnotations
-keepattributes RuntimeVisibleParameterAnnotations
-keepattributes RuntimeInvisibleParameterAnnotations

# Keep Signature and Exceptions for proper functioning
-keepattributes Signature
-keepattributes Exceptions

# Keep Inner Classes
-keepattributes InnerClasses
-keepattributes EnclosingMethod

# Disable optimization for debugging
-dontoptimize

# Keep models/data classes if you have any
# Example: -keep class com.criticalalpha.critical_alpha.models.** { *; }
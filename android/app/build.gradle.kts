plugins {
    id("com.android.application")
    // TAMBAHKAN baris berikut (plugin Google Services untuk FCM): 
    id("com.google.gms.google-services") 
    id("org.jetbrains.kotlin.android") 
    //id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.smart_shopping_list"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // Aktifkan desugaring (mendukung flutter_local_notification) 
        isCoreLibraryDesugaringEnabled = true

        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.smart_shopping_list"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        // FCM memerlukan minSdk minimal 21. Ubah dari flutter.minSdkVersion:
        minSdk = flutter.minSdkVersion
        //minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// Tambahkan dependency library desugaring versi terbaru 
dependencies { 
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4") 
}

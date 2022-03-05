# Compile AAR file in Android Studio

## Step 1: Make the library compilable in Android Studio.

Assume we have a `Project_A` which has a `Library_B` (created with (`File` -> `New` -> `New module` -> `Android Library`)). 
Usually we only open `Project_A` on Android Studio and if any changes is needed in `Library_B`, we do it from the same window.

When a new library is created, the library will likely have only one `Module` level gradle file (denoting its dependencies, 
version, compile sdk etc) and not a `Project` level gradle file. 

In our case, `Library_B` will have its own `Module` level gradle file (shown as `build.gradle (Module: Project_A.Library_B`) 
and uses the same `Project` level gradle file of `Project_A` (shown as `build.gradle (Project: Project_A`). 

If we happen to open the directory of `Library_B` as a standalone project to compile the library to an AAR file, 
it will not be possible, because gradle will not be able to find some basic dependencies.
Our goal here is to just open a library module folder as an android project, and make it independently compilable.

### Step 1.1: Add to `build.gradle` file
As previously discussed, the library will already have a module level `build.gradle` file. 
Add the following lines to the end of the files (after `dependencies` block) 
```
repositories {
    google()
}

buildscript {
    ext.kotlin_version = "1.5.31"
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:4.1.3'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
```
Samples: [baltitoolbox](https://github.com/SayantanRC/baltitoolbox/blob/main/build.gradle), [FileX](https://github.com/SayantanRC/FileX/blob/main/build.gradle)  

### Step 1.2: Create a `gradle.properties` file.
Create this file in the same location as `build.gradle`. Contents of the file:
```
android.useAndroidX=true
```
Samples: [baltitoolbox](https://github.com/SayantanRC/baltitoolbox/blob/main/gradle.properties), [FileX](https://github.com/SayantanRC/FileX/blob/main/gradle.properties)  

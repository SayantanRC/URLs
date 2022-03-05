# Compile AAR file in Android Studio

## Make the library compilable in Android Studio.

Assume we have a `Project_A` which has a `Library_B` (created with (`File` -> `New` -> `New module` -> `Android Library`)). 
Usually we only open `Project_A` on Android Studio and if any changes is needed in `Library_B`, we do it from the same window.

When a new library is created, the library will likely have only one `Module` level gradle file (denoting its dependencies, 
version, compile sdk etc) and not a `Project` level gradle file. 

In our case, `Library_B` will have its own `Module` level gradle file (shown as `build.gradle (Module: Project_A.Library_B`) 
and uses the same `Project` level gradle file of `Project_A` (shown as `build.gradle (Project: Project_A`). 

If we happen to open the directory of `Library_B` as a standalone project to compile the library to an AAR file, it will not be possible.
Our goal here is to just open a library module folder as an android project, and make it independently compilable.

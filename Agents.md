This repository is purposed for building/modding J2ME (java -source 1.3 -target 1.3 -microedition) apps with Large Language Models. Even compiled obfuscated ones. 


# BUILDING
Be attentive - J2ME apps target is java 1.3
https://github.com/klaxons1/tools_linux_jdk8 - JDK 8 linux x64 precompiled.
J2ME building libs is in uei/ folder of that repo.
And use proguard.jar to generate a stackmap; otherwise the output jar wont launch on actual kvm/phoneme/any other built-in Virtual Machine.

# DECOMPILATION
USE ONLY AND ONLY https://github.com/hourianto/sporeflower/ IT IS REALLY INMPORTANT TO USE SPOREFLOWER!
USE SPOREFLOWER FOR CHRIST SAKE.
You can take it directly from releases or to build from source code with given JDK 8.
Check if the input jar is obfuscated(classes are named like a, b, c except the main one); if not - don't use -ren=1;
If you encounter build errors after decompilation - fix them and checking with bytecode of original JAR is MANDATORY.


# ADDITIONAL TOOLS
https://nikita36078.github.io/J2ME_Docs/ - documentation of MIDP and not only.  
https://github.com/shinovon/AntiALW1 - AntiALW1 - a tool required for quick removal of DRM. It cannot be considered as piracy because purchasing is impossible nowadays; It is used
exceptionally for academic and preservation purposes. 

# Tips for creating J2ME apps:
1. Use fixed point arithmetic when possible, use float only when quality is a concern or when the price of using floats is low; actual hardware often lacks FPU.
2. Avoid memory allocations (including string concatenation) in the game cycle to avoid GC calls and freezes. Debug features can allocate memory in the game cycle.
3. Avoid anonymous classes where possible, do not overcomplicate software logic with OOP, inheritance, virtual calls. Use classes in a way similar to C structures. Storing functions in different class files is fine, as modularity can improve code maintainability.
4. When implementing complex and heavy logic (such as software rasterization) - keep hot loops as simple as possible. Avoid heavy math operations and branching. Preload fields into function-local variables when the fields do not change during function execution. 
5. HEAP LIMIT - S40 - 2MB, S60 - 16 MB, Sony Erricson - 8 MB. But some JVM have separate heap for Image objects.
6. There is no Math.atan/Math.floor/Math.pow/Math.log in J2ME. Various approximations can be used.
7. Do not depend on multiple Thread objects - J2ME devices do not have multiple CPU cores. Threads are fine only for applications where background processing or loading is required, such as online service clients.
# M3G (JSR184) related tips:
1. If you want to mess with .m3g files pyM3G can be used https://github.com/BaalNetbek/PyM3G/. Be careful - lib is in an experimental state.
2. Use 8-bit textures when applicable to reduce heap memory usage. Pngquant gives the best results as of November 2026. You can't just load 8-bit PNG in M3G, it will always load as 24/32-bit texture. You have to load 8-bit textures explicitly either via Image2D(format, w, h, image, palette) constructor (you can get image and palette arrays by manually parsing BMP files) or via Loader.load if you store the 8-bit texture in a .M3G container. MIP-mapping doesn't work with 8-bit textures on real hardware.
3. S40 and (most) SE cellphones do not support texture resolutions above 256x.
4. M3G textures are stored in heap memory on S40 devices and in main RAM on S60 ones.
# Good examples of games
https://github.com/shinovon/TheEscapists-j2me - good example of fast enough 2D game. Could use that as a reference.

# Verification
https://github.com/TASEmulators/freej2me-plus - freej2me-plus - MIDP implementation. 
But ask a user if it is needed. Building an emulator and verification takes a lot of time.

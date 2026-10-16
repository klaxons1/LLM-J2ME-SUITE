ProGuardDeobfuscator is slightly modified version of ProGuard, which was turned into a quasi deobfuscator. During file processing short obfuscated packages', classes', fields' and methods' names are replaced with more meaningful and unique across Jar file ones.

To deobfuscate a program just drag-and-drop it's Jar onto "deobfuscate.bat" file. As the result a folder with application's name will be created where deobfuscated Jar will be placed, as well as rename map and deobfuscator's log.

In order for deobfuscation to complete correctly, all libraries used by the processed program must be placed into "lib" folder. Most of the MIDP2.1 libraries are included in ProGuardDeobfuscator package.

Renaming is carried out according to following scheme:

packages -> "pkg_n"
classes -> "Class_n"
fields -> "var_n"
methods -> "sub_n"

where n is randomly increasing hexadecimal number (e.g. 10, 23, 3b, 5a, 76, 9f, f4, 140, 18d, 1e5, etc.)

By default parameters for deobfuscation J2ME midlets are used. These parameters might be changed by editing the "deobfuscate.bat" script.

--
(C) SilentKnight
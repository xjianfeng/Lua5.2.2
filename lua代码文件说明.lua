源文件划分
1. 虚拟机运转的核心功能
lapi.c 					C语言接口
lctype.c 				C标准库中 ctype 相关实现
ldebug.c 				Debug 接口
ldo.c 					函数调用以及栈管理
lfunc.c 				函数原型及闭包管理
lgc.c 					垃圾回收
lmem.c 					内存管理接口
lobject.c 				对象操作的一些函数
lopcodes.c 				虚拟机的字节码定义
lstate.c 				全局状态机
lstring.c 				字符串池
ltable.c 				表类型的相关操作
ltm.c 					元方法
lvm.c 					虚拟机
lzio.c 					输入流接口

2. 源代码解析以及预编译字节码
lcode.c 				代码生成器
ldump.c 				序列化预编译的 lua 字节码
llex.c 					词法分析器
lparser.c 				解析器
lundump.c 				还原预编译的字节码

3. 内嵌库
lauxlib.c 				库编写用到的辅助函数库
lbaselib.c 				基础库
lbitlib.c 				位操作库
lcorolib.c 				协程库
ldblib.c 				Debug库
linit.c 				内嵌库的初始化
liolib.c 				IO库
lmathlib.c 				数学库
loadlib.c 				动态扩展库管理
loslib.c 				OS 库
lstrlib.c 				字符串库
ltablib.c 				表处理库

4. 可执行的解析器，字节码编译器
lua.c 					解释器
luac.c 					字节码编译器

阅读源代码的次序
首先、阅读外围的库是如何实现功能扩展的，这样可以熟悉 Lua 公开 API。不必陷入功能细节。
然后、阅读 API 的具体实现。Lua 对外暴露的 API 可以说是一个对内部模块的一层封装，这个层次尚
未触及核心，但可以对核心代码有个初步的了解。
之后、可以开始了解 Lua VM 的实现。
接下来就是分别理解函数调用、返回，string,table,metatable 等如何实现。
debug 模块是一个额外的设施，但可以帮助你理解 lua 内部细节。
最后是 parser 等等编译相关的部分。
垃圾收集将是最难的部分，可能会花掉最多的时间去理解细节。


Lua 的内部模块暴露出来的 API 以 lua_xxx 风格命名，即 lua 后跟一个大写字母表识内部模块名，而
后由下划线加若干小写字母描述方法名。
供外部程序使用的 API 则使用 luax_xxx 的命名风格。这些在 lua 的官方文档里有详细描述。定义在
lua.h 文件中。此外，除了供库开发用的 luaL 系列 API （定义在 lauxlib.h 中）外，其它都属于内部 API ，
禁止被外部程序使用。
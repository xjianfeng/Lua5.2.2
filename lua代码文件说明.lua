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
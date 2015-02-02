#include <stdio.h>
#include <string.h>
#include <lauxlib.h>
#include <lualib.h>
#include <conio.h>

int readLuatxt(lua_State *L){
	//lua_State *L = luaL_newstate();
	//luaL_openlibs(L);
	luaL_dofile(L,"test.lua");
	//lua_close(L);
	getch();
	return 1;
}

//两数相加
static int add(lua_State * L){
	//从栈上获取lua提供的参数
	int number1 = luaL_checknumber(L,1);
	int number2 = luaL_checknumber(L,2);
	int result = number1 + number2;
	//将结果压入栈上，让lua可以读取
	lua_pushnumber(L,result);
	return 1;
}
//两数相减绝对值
static int abs(lua_State * L){
	int number1 = luaL_checknumber(L,1);
	int number2 = luaL_checknumber(L,2);
	int result = 0;
	if(number1 > number2){
		result = number1 - number2;
	} 
	else{
		result = number2 - number1;
	}
	lua_pushnumber(L,result);
	return 1;
}

//luaL_Reg 一个结构类型，{const char *name;lua_CFunction func}
static luaL_Reg Calclibs[]={
	{"add",add},
	{"abs",abs},
	{NULL,NULL}
};

//建立一个自定义类库 函数名称格式要遵从lua要求的格式 luaopen_xxx(lua_State *L)
LUALIB_API int luaopen_Calclib(lua_State *L){
	char *libname = "Calclib";
	luaL_newlib(L,Calclibs);
	return 1;
}

int Calclib_main(void){
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	//用这个接口注册库函数，不用生成动态库就可以直接使用
	luaL_requiref(L,"Calclib",luaopen_Calclib,0);  
	/*直接将每个函数注册到环境中，可以直接使用
	**lua_register(L,"add",add);
	**lua_register(L,"sub",sub);
	**/
	//注册c函数，让lua可以调用
	readLuatxt(L);
	lua_close(L);
}
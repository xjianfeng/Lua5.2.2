#include "luatest.h"

static int readLuafile(lua_State *L){
	//lua_State *L = luaL_newstate();
	//luaL_openlibs(L);
	luaL_dofile(L,"test.lua");
	//lua_close(L);
	return 1;
}

static double GetFreq(){
	LARGE_INTEGER freq;
	QueryPerformanceFrequency(&freq);
	return (double)freq.QuadPart;
	//printf("%f",(double)timestar.QuadPart);
}

static double GetCounter(){
	LARGE_INTEGER counter;
	QueryPerformanceCounter(&counter);
	return (double)counter.QuadPart;
}

static int timeFunc(lua_State *L){
	double freq = GetFreq();
	double timer = GetCounter();
	lua_pushnumber(L,timer/freq);
	return 1;
}

int main(void){
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	/*直接将每个函数注册到环境中，可以直接使用
	**lua_register(L,"add",add);
	**lua_register(L,"sub",sub);
	**/
	lua_register(L,"timeFunc",timeFunc);
	//注册c函数，让lua可以调用
	readLuafile(L);
	lua_close(L);
	getch();
}
 

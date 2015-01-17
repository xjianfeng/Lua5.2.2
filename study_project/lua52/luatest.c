#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <conio.h>

int main(void)
{
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	luaL_dofile(L,"test.lua");
	lua_close(L);
	getch();
}


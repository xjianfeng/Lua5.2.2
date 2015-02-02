#include <stdio.h>
#include <string.h>
#include <lauxlib.h>
#include <lualib.h>
#include <conio.h>
#include <time.h>
#include <Windows.h>

//读取lua文件并执行
static int readLuafile(lua_State *L);

static int timeFunc(lua_State *L);
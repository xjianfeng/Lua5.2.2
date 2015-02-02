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

//�������
static int add(lua_State * L){
	//��ջ�ϻ�ȡlua�ṩ�Ĳ���
	int number1 = luaL_checknumber(L,1);
	int number2 = luaL_checknumber(L,2);
	int result = number1 + number2;
	//�����ѹ��ջ�ϣ���lua���Զ�ȡ
	lua_pushnumber(L,result);
	return 1;
}
//�����������ֵ
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

//luaL_Reg һ���ṹ���ͣ�{const char *name;lua_CFunction func}
static luaL_Reg Calclibs[]={
	{"add",add},
	{"abs",abs},
	{NULL,NULL}
};

//����һ���Զ������ �������Ƹ�ʽҪ���luaҪ��ĸ�ʽ luaopen_xxx(lua_State *L)
LUALIB_API int luaopen_Calclib(lua_State *L){
	char *libname = "Calclib";
	luaL_newlib(L,Calclibs);
	return 1;
}

int Calclib_main(void){
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	//������ӿ�ע��⺯�����������ɶ�̬��Ϳ���ֱ��ʹ��
	luaL_requiref(L,"Calclib",luaopen_Calclib,0);  
	/*ֱ�ӽ�ÿ������ע�ᵽ�����У�����ֱ��ʹ��
	**lua_register(L,"add",add);
	**lua_register(L,"sub",sub);
	**/
	//ע��c��������lua���Ե���
	readLuatxt(L);
	lua_close(L);
}
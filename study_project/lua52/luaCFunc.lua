--加载在C中注册的库
local Calc = require("Calclib")

function testCfunc()
    local number1 = 2
    local number2 = 3
    print(string.format("Calc.add(%d,%d)=%d",number1,number2,Calc.add(number1,number2)))
    print(string.format("Calc.abs(%d,%d)=%d",number1,number2,Calc.abs(number1,number2)))
end

testCfunc()
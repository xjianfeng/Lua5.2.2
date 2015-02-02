local usertable = {}
local uid = 100000000
local time = os.time()

function createFuben(uid)
    local fuBenArray = {}
    fuBenArray[uid] = {}
    for i=1,90 do
        local tmp = {}
        tmp.fubenno = i;
        tmp.fenshu = 20000;
        tmp.finishtime = time
        table.insert(fuBenArray[uid],tmp)
    end
end
function InitModule()
    for i=1,20000 do
	    uid = uid + 1
        local fubenData = createFuben(uid)
	    table.insert(usertable,fubenData)
    end
end
InitModule()
local startime = timeFunc()
function checkStatefull(uid)
   local tablesize = #usertable
   print("tablesize:",tablesize)
   if tablesize >= 20000 then
        local fubenData = createFuben(uid)
        table.remove(usertable,tablesize)
        table.insert(usertable,tmp)
    end 
end

function findUid(Uid,starindex,endindex)
	local ishase = false
	for i=starindex,endindex do 
		if i >= endindex then
			break
		end
		if usertable[i].uid == Uid then
			ishase = true
		end
	end
	return ishase
end

function ishaseUid(Uid)
	local index = 1
	local tablesize = #usertable
	print(tablesize)
	local starindex = 1 
	local endindex = tablesize/2
	while starindex <= endindex do
		if index >= tablesize then return false end
		if findUid(Uid,starindex,endindex) then
			return true
		else
			starindex = endindex + 1
			endindex = tablesize 
			print(starindex,endindex)
		end
		index = index + 1
	end
    return false
end

for i=1,200 do
    local uid = 100000+i
    if not ishaseUid(uid) then
        print(i)
        checkStatefull(uid)
    end
end

local endtime = timeFunc()
print(endtime - startime)


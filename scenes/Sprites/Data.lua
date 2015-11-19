--
-- Author: liangjiwen
-- Date: 2015-11-15 12:56:21
--
module("Data",package.seeall)
function getEquipData(num1, num2)
	local EquipData =Equip[num1][num2]
	return EquipData
end
Equip = {}
Equip[1] ={}
Equip[1][1] = {name = "青虹剑\n江湖人用长剑",force = 20,hp = 50,fangyu = 0,price = 450,typel = "武器"}
Equip[1][2] = {name = "制式弹弓\n军中普通长弓，有一定攻击力",force = 30,hp = 0,fangyu = 0,price = 500,typel = "武器"}
Equip[1][3] = {name = "制式连弩\n军中普通连弩，有一定攻击力",force = 40,hp = 10,fangyu = 0,price = 700,typel = "武器"}
Equip[1][4] = {name = "制式护臂\n菌种普通护臂，有一定防御",force = 10,hp = 50,fangyu = 20,price = 450,typel = "武器"}
Equip[1][5] = {name = "制式长刀\n重刀，力量不足，使不得",force = 50,hp = 50,fangyu = -10,price = 800,typel = "武器"}
Equip[1][6] = {name = "七星宝剑\n曹操持之，十大宝剑之一",force = 30,hp = 30,fangyu = 0,price = 700,typel = "武器"}
Equip[1][7] = {name = "虎賁铠甲\n军中上将配备宝甲",force = 0,hp = 200,fangyu = 30,price = 1000,typel = "盔甲"}
Equip[1][8] = {name = "三叉戟\n上将纪灵的武器，锋利无比",force = 60,hp = 50,fangyu = 0,price = 1000,typel = "武器"}
Equip[1][9] = {name = "振奋铠甲\n据说可以给予人信心的铠甲",force = 0,hp = 300,fangyu = 50,price = 1450,typel = "盔甲"}
Equip[1][10] = {name = "海妖之心\n一块神奇的宝石镶嵌的武器，有着\n        特殊的魔力",force = 70,hp = 0,fangyu = 0,price = 1350,typel = "武器"}
Equip[1][11] = {name = "五禽扇\n华佗遗留的宝扇",force = 30,hp = 550,fangyu = -20,price = 1450,typel = "武器"}
Equip[1][12] = {name = "凤翼臂\n灵巧的护臂，飘飘欲仙",force = 20,hp = 200,fangyu = 60,price = 1450,typel = "护臂"}
Equip[1][13] = {name = "神圣之盾\n一面巨大的盾牌，",force = -20,hp = 700,fangyu = 50,price = 2000,typel = " 护臂"}
Equip[1][14] = {name = "虎面槊\n势大力沉的重武器，一击致命",force = 100,hp = 50,fangyu = -20,price = 2200,typel = "武器"}
Equip[1][15] = {name = "紫琼剑\n传说中紫青双剑之一",force = 60,hp = 300,fangyu = 30,price = 2200,typel = "武器"}
Equip[1][16] = {name = "日焱铠甲\n烈日下犹如熊熊燃烧的火焰",force = 20,hp = 1200,fangyu = 70,price = 2700,typel = "盔甲"}
Equip[2] ={}
Equip[2][1] = {name = "",force = 20,hp = 50,fangyu = 0,price = 450,typel = "武器"}
Equip[2][2] = {name = "",force = 20,hp = 50,fangyu = 0,price = 450,typel = "武器"}
Equip[2][3] = {name = "",force = 20,hp = 50,fangyu = 0,price = 450,typel = "武器"}

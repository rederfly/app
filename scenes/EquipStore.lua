--
-- Author: liangjiwen
-- Date: 2015-11-13 20:01:09
--

local EquipStore = class("EquipStore", function()
    return display.newScene("EquipStore")
end)
EquipStore.equip =Data.Equip[1][1]
function EquipStore:ctor()
     local scene = cc.uiloader:load("MainScene.csb"):addTo(self)
   local btn_buy = scene:getChildByName("Button_2")
   local sp_page1 =scene:getChildByTag(114)
   local sp_page2 =scene:getChildByTag(115)
   btn_buy:addTouchEventListener(function (psender, event )
    	--dump(event)
    		if event.name =="ended" then
    			 

    		end
   	
   end) 
   


--   column 每一页的列数，默认为1
--   row 每一页的行数，默认为1
--  columnSpace 列之间的间隙，默认为0
--   rowSpace 行之间的间隙，默认为0
--   viewRect 页面控件的显示区域
--   padding 值为一个表，页面控件四周的间隙
    --   left 左边间隙
    --   right 右边间隙
    --   top 上边间隙
    --   bottom 下边间隙
--   bCirc 页面是否循环,默认为false
	local pageView = cc.ui.UIPageView.new({
		viewRect = cc.rect(80,60,400,500),
		column = 4,row = 4,
		padding = {left = 16,right = 15,top = 35,bottom = 96},
		columnSpace = 11,rowSpace = 11
		})
		
	pageView :onTouch(function ( event )
		dump(event)
		print(event.pageIdx,event.itemIdx)
		if event.pageIdx == 2 then
			sp_page2:setVisible(false)
			sp_page1:setVisible(true)
			elseif event.pageIdx ==1 then
			sp_page2:setVisible(true)
			sp_page1:setVisible(false)
		end
		num1 = event.pageIdx
		num2 = event.itemIdx
		
		if num2>16 then
			num2 = num2-16
		end
		--print(num2.."000000000000")
		self.equip =Data.Equip[num1][num2]
		dump(self.equip)
		local textFiled = scene:getChildByName("Text_1")
				--dump(self.equip)
				textFiled:setString(self.equip["name"].."\n攻击力  "..
					self.equip["force"].."\n生命值  "..self.equip["hp"]
					.."\n防御  "..self.equip["fangyu"].."\n装备类型："..self.equip.typel)
				local text_price = scene:getChildByName("Text_5")
				text_price:setString(self.equip.price)
				--text_price:setFontSizeObj(30)

	end)
	self:add(pageView)
	

	for i=1,32 do
		local item =pageView:newItem()
		local content = cc.LayerColor:create(
			cc.c4b(math.random(250),
				math.random(250),
				math.random(250),
				250)
			)

		content:setTouchSwallowEnabled(false)
		content:setAnchorPoint(0,0)
		local sp_good  = display.newSprite("equip/equip"..i..".png")
		sp_good:setTouchEnabled(true)
		sp_good:setTouchSwallowEnabled(false)
		sp_good:addNodeEventListener(cc.NODE_TOUCH_EVENT, function ( event )
			--dump(event)
			--printf(i)
			
			if event.name == "began" then 
				-- print("00000000000000")
				-- local textFiled = scene:getChildByName("Text_1")
				--  num1 = i/16+1
				--  print(num1)
				--  num2 = i
				--  if num2>16 then
				--  	num2 = num2-16
				--  end
				--  print("this".. num1 .. num2)
				
				-- -- local equip = self:getEquipData(num1, num2)
				
				-- print(equip)
				-- textFiled:setString( equip["name"].."\n攻击力"..equip["force"].."\n生命值"..equip["hp"])
				-- local text_price = scene:getChildByName("Text_3")
				-- text_price:setString("1200")
				-- text_price:setFontSizeObj(30)
				return true
			end
			if event.name == "end" then
				

			end
		end)
		sp_good:setScale(84/150)
		--local x =i+100
		--sp_good:setTag(x)
		local sp_equip = display.newSprite("equip/yxbk.png")
		:pos(60,61)
		:addTo(sp_good)
		sp_equip:scale(2.5)
		sp_good:pos(42,42)
		sp_good:addTo(content,1)
		content:setContentSize(84, 84)
		item:addChild(content)
		

		pageView:addItem(item)
		
	end
	pageView:reload()


	

	
end
function EquipStore:onEnter()
end

function EquipStore:onExit()
end

return EquipStore
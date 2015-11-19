--
-- Author: liangjiwen
-- Date: 2015-11-12 17:31:22
--
Hero = require("app.scenes.StateHero")
Enemy= require("app.scenes.Enemy")
local GameScene = class("GameScene", function (  )
	return display.newPhysicsScene("GameScene")
end)
function GameScene:ctor(  )
	self:initWorld()
	scene = cc.uiloader:load("MainbgScene.csb"):addTo(self)
	 layer = cc.uiloader:load("Layer.csb"):addTo(self)
	self.image = scene:getChildByName("Image_1")
	 hero = Hero.new()
	--display.addSpriteFrames("20002/20002_stand.plist","20002/20002_stand.png")
	--self.sp_hero = display.newSprite("#20002_stand_0000.png")
	hero:setPosition(display.cx,display.cy)
	scene:add(hero)
	hero.delegate = scene
	enemy = Enemy.new()
	enemy:setPosition(800,320)
	enemy:addTo(scene)
	--enemy:doEvent("attack")
	
	

	--display.addSpriteFrames("10049/10049_walk.plist", "10049/10049_walk.png")
			--local sp = display.newSprite("#10049_walk_0000.png")
			local fram1 = display.newFrames("10049_walk_000%d.png",0,7)
			local  animation1 = display.newAnimation(fram1,.1)
			enemy:playAnimationForever(animation1)
 
	local fram1 = display.newFrames("20002_stand_000%d.png",0,7)
	local animation = display.newAnimation(fram1,.1)
	hero:playAnimationForever(animation)

	local sp_controlBg = layer:getChildByName("controlBG")
	
	local px = sp_controlBg:getPositionX()
	local py = sp_controlBg:getPositionY()

--普通攻击
	local btn_attack=layer:getChildByName("attack")
	
	self.faceto =ture
	hero.faceto = self.faceto
	local hp = 100
    btn_attack:addTouchEventListener(function(psender,event)
      	--dump(event)
      	
      	 if event ==0  then
      	 	--count= count+1 -----count   整个全局变量的话，就能确定attack是否执行了在状态机的callback中＋＋
      	 	if hero.count ==1 then
      	 		if hero.fsm:canDoEvent("attack1") then
      	 			
      	 			hero:doEvent("attack1")
      	 			--print("12121212121212121212121")
      	 			--print(hero:getPositionX())
      	 			--print(hero:getPositionX()+hero:getContentSize().width/2)
      	 		end

      	 	end
      	 	if hero.count ==2 then
      	 		if hero.fsm:canDoEvent("attack2") then
      	 			hero:doEvent("attack2")
      	 			--print(hero:getPositionX()+hero:getContentSize().width/2)
      	 		end
      	 	end
       	 	if hero.count ==3 then
       	 		if hero.fsm:canDoEvent("attack3") then
       	 			hero:doEvent("attack3")
       	 			--print(hero:getPositionX()+hero:getContentSize().width/2)
      	--  			display.addSpriteFrames("20002/20002_attack_effect.plist","20002/20002_attack_effect.png")
				 	 -- effect = display.newSprite("#20002_attack_effect_0000.png")
				 	 if self.faceto == true then 
				 	 hero.effect:setPosition(cc.p(hero:getPositionX()-100,hero:getPositionY()))
				 	else
				 		 hero.effect:setPosition(cc.p(hero:getPositionX()+100,hero:getPositionY()))
				 	end
				 	-- effect:addTo(scene,0)
				 	  hero.effect:runAction(cc.FlipX:create(self.faceto))
				 	 -- 	local frames3 = display.newFrames("20002_attack_effect_000%d.png",0,3)
				 	 -- 	local animation3 = display.newAnimation(frames3,.2)
				 	 -- 	effect:playAnimationOnce(animation3, false,function (  )
				 	 -- 		effect:removeFromParent()
				 	 -- 	end,0)
				end
       		end
       	end
      	 return true
    end)


--skill1
     local btn_skilling1 = layer:getChildByName("skill")
    
     btn_skilling1:addTouchEventListener(function(psender,event)
     	if event == 0 then
     		if hero.fsm:canDoEvent("skill1") then
     			hero:doEvent("skill1")
     			self:skillCircle(psender,5,0)
				
				if self.faceto == true then 
					hero.effect_skill:setPosition(cc.p(hero:getPositionX()-150,hero:getPositionY()+50))
				else
					hero.effect_skill:setPosition(cc.p(hero:getPositionX()+150,hero:getPositionY()+50))
				end
				
				hero.effect_skill:runAction(cc.FlipX:create(self.faceto))
				
				
      	 	end
     	end
     	return true
    end)

     local btn_skilling2 = layer:getChildByName("skilled")
    	btn_skilling2:addTouchEventListener(function(psender,event)
    		if event == 0 then 
    			if hero.fsm:canDoEvent("skill2") then
    				hero:doEvent("skill2")
    				self:skillCircle(psender,7,0)
    				
				--effect_skill:pos(hero:getPositionX(), hero:getPositionY())
				if self.faceto == true then 
					hero.effect_skill:setPosition(cc.p(hero:getPositionX()-150,hero:getPositionY()))
					hero.effect_skill:runAction(cc.MoveBy:create(3,cc.p(-500,0)))
				else
					hero.effect_skill:setPosition(cc.p(hero:getPositionX()+150,hero:getPositionY()))
					hero.effect_skill:runAction(cc.MoveBy:create(3,cc.p(500,0)))
				end
				
    			end
    		end
    		return true
    		end)
     local btn_skilling3 = layer:getChildByName("skillful")
     --local btn_skilling3 = layer:getChildByTag(55)
    	btn_skilling3:addTouchEventListener(function(psender,event)
    		if event == 0 then 
    			print("skill3")
    			if hero.fsm:canDoEvent("skill3") then
    				hero:doEvent("skill3")
    				self:skillCircle(psender,9,0)

    				

					
    				--effect_skill:runAction(cc.FlipX:create(faceto))
    				
					
    			end
    		end
    		return true
    		end)

    	local btn_skilling4 = layer:getChildByName("skill4")
    	--local btn_skilling4 = layer:getChildByTag(56)
    	btn_skilling4:addTouchEventListener(function(psender,event)
    		if event == 0 then 
    			if hero.fsm:canDoEvent("skill4") then
    				hero:doEvent("skill4")
    				self:skillCircle(psender,12,.1)
    			
    			end
    		end
    		return true
    		end)

	-- 游戏方向键
	local m_x,m_y,angle =1,1
	local sp_controlDot = layer:getChildByName("controlDot")
	local px_controlDot = sp_controlDot:getPositionX()
	local py_controlDot = sp_controlDot:getPositionY()
	local radius = sp_controlBg:getContentSize().width/2 - sp_controlDot:getContentSize().width/3
	sp_controlDot:setTouchEnabled(true)
	local count = 0
	sp_controlDot:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
		local handle
		 sharedScheduler = cc.Director:getInstance():getScheduler()
		--dump(event)
		if event.name =="began" then
			hero:doEvent("move")
			--print("move")
			self.handle =  sharedScheduler:scheduleScriptFunc(function (f)
				hero.faceto = self.faceto
				local hero_y = hero:getPositionY()+m_y*f*2
				local  hero_x = hero:getPositionX()+m_x*f*2
				if hero_y>display.cy then
						hero_y = display.cy	
				end
				if hero_y<30 then 
					hero_y = 30
				end
				if hero_x < 20 then
					hero_x = 20
				end
				if hero_x >self.image:getContentSize().width-20 then
					hero_x = self.image:getContentSize().width-20
				end
						hero:setPosition(cc.p(hero_x,hero_y))
						--hero:runAction(cc.MoveBy:create(f,cc.p(m_x*f*2,m_y*f*2)))
						self:moveFollowLayer(hero_x,hero_y)
						--scene:runAction(cc.MoveBy:create(f,cc.p(-m_x*f*2,-m_y*f*2)))
--技能特效随人动			

						if effect_skill then 
							effect_skill:setPosition(cc.p(hero_x,hero_y))
						end
						
		
			end,0,false)
			return true
		elseif event.name =="moved" then
			local dis =  math.sqrt((event.x-px)*(event.x-px)+(event.y-py)*(event.y-py))
			m_x = (event.x-px)*radius/dis
			m_y = (event.y-py)*radius/dis
--转身，3连击特效转身			
			if dis<radius then
				 angle = math.acos((event.x-px)/dis)
				--print(angle)
				sp_controlDot:setPosition(event.x,event.y)
				 
				else
					sp_controlDot:setPosition(cc.p(px+m_x,py+m_y))
			end
			if event.x<px then
				 	--print("转身")
				 	hero:runAction(cc.FlipX:create(true))
				 	self.faceto = true
				 else
					hero:runAction(cc.FlipX:create(false))
					self.faceto = false
				 end

--摇杆停止，取消时间调度
		elseif event.name =="ended" then
				
				sp_controlDot:setPosition(px_controlDot,py_controlDot)	
				m_x ,m_y =0,0
				sharedScheduler:unscheduleScriptEntry(self.handle)
				hero:doEvent("normal")
				--print("normal")
				--scheduler.unscheduleGlobal(handle)
		end
	end)
--enemy 移动
local scheduler_enemy = cc.Director:getInstance():getScheduler()
	enemy.handle =scheduler_enemy:scheduleScriptFunc(function()
		--print(enemy:getPositionX())
		--print(hero:getPositionX())
		local ax = hero:getPositionX()
		local ay = hero:getPositionY()
		local ex = enemy:getPositionX()
		local ey = enemy:getPositionY()
		enemy:movetoHero(ax,ay,ex,ey)
		--enemy:doEvent("attack")
	end,1,false)
end
function GameScene:moveFollowLayer(ax,ay)

	 x = math.max(ax, display.width/2)
	 --y = math.max(hero:getPositionY(), display.top/2)
	 x = math.min(x,self.image:getContentSize().width-display.width/2)
	 --y = math.min(y,display.top/2)
	 --self.image:runAction(cc.MoveBy:create(-ax,-ay))
	 --layer:setPosition(cc.p(-(display.cx - x),0))
	 scene:setPosition(cc.p(display.cx - x,0))
	-- y = math.max(hero:getPositionY(), )
	-- local 
	--scene:runAction(cc.Follow:create(hero))
end
function GameScene:skillCircle( btn ,time,sca)
	-- display.newSprite("Cirlce.png")
	-- :pos(posa.x, posa.y)
	-- :scale(1)
	--print("022020202020202")
	local timeto =cc.ProgressTo:create(time,0)
	local timer = cc.ProgressTimer:create(cc.Sprite:create("circle.png"))
	timer:setType(display.PROGRESS_TIMER_RADIAL)
	timer:setPercentage(100)
	timer:setBarChangeRate(cc.p(.5,.5))
	timer:setMidpoint(cc.p(.5,.5))
	timer:pos(btn:getContentSize().width/2, btn:getContentSize().height/2)
	timer:addTo(btn)
	timer:scale(.26+sca)
	--timer:setTouchEnabled(true)
	btn:setTouchEnabled(false)
	--timer:setTouchSwallowEnabled(true)
	timer:runAction(cc.Sequence:create({
		 timeto,
		cca.callFunc(function()
			timer:removeFromParent()
			btn:setTouchEnabled(true)
			end)

		}))

	
end
function GameScene:initWorld()
	self:getPhysicsWorld():setGravity(cc.p(0,0))
	self:getPhysicsWorld():setDebugDrawMask(1)
end
function GameScene:onEnter() 	
	
end
function GameScene:onExit() 
	-- body
end
return GameScene
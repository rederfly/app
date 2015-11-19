--
-- Author: liangjiwen
-- Date: 2015-11-13 11:21:03
--

local StateHero = class("StateHero", function (  )--tianjia动画
	display.addSpriteFrames("20002/20002_stand.plist","20002/20002_stand.png")
	return display.newSprite("#20002_stand_0000.png")
	--:setScale(1)
	--:pos(100, 200)
	--return display.newSprite("#20002_stand_0000.png")
	
end)
--self.delegate 
function StateHero:ctor( )
	self:addStateMachine()
	body = cc.PhysicsBody:createBox(cc.size(100, 180) )
	body:getShape(0):setRestitution(0)
	body:setCategoryBitmask(0)
	body:setCollisionBitmask(0)
	body:setContactTestBitmask(0)
	self:setPhysicsBody(body)
	
end
function StateHero:doEvent(event)
	if self.fsm:canDoEvent(event) then
		self.fsm:doEvent(event)
	end
end
-- function StateHero:canDoEvent( event )
-- 	if self.fsm:canDoEvent(event) then
-- 		--todo
-- 	end
-- end
-- function StateHero:isFinishedState()
-- 	if self:fsm:isFinishedState()
-- 		return true
-- end

-- attack计数
  StateHero.count = 1
  
function StateHero:addStateMachine(  )
	self.fsm ={}
	cc.GameObject.extend(self.fsm):addComponent("components.behavior.StateMachine"):exportMethods()
	self.fsm:setupState({
		--attack1,2,3
		--hurt
		--run
		--skill1,2,3
		--stand
		
		initial = "standing",
		terminal = "dead",
		events = {
		
		{name = "move",from = {
		"standing","hurting",
		},to ="running" }
		,
		{name = "normal",from ={"running","attacking1","attacking2","attacking3","skilling1","hurting","skilling2","skilling3","skilling4"
		 },to ="standing"}
		 ,
		{name = "attack1",from = {"hurting","standing","running"},to = "attacking1"}
		,
		 {name = "attack2",from = {"hurting","standing","running"},to="attacking2"},
		 {name = "attack3",from = {"hurting","standing","running"},to = "attacking3"},
		 {name = "hurt",   from = {"standing","running","hurting"},to = "hurting"},
		 --{name = "stop",   from = {"standing","running","attacking1","attacking2","attacking3","skilling1","hurting","skilling2","skilling3","skilling4"},to="stand"},
		--{name = "die",    from = {"standing","running","attacking1","attacking2","attacking3","skilling1","hurting","skilling2","skilling3","skilling4"},to ="dead" },
		 {name = "skill1",from ={"standing","running","attacking1","sttacking2","sttacking3"},to = "skilling1" },
		
		 {name = "skill2",from ={"standing","running"},to = "skilling2"},
		 {name = "skill3",from ={"standing","running"},to = "skilling3"},
		 {name = "skill4",from ={"standing","running"},to = "skilling4"},
		},
		callbacks = {
			--移动
			onmove = function (  )
			--self:stopAnimation()
			self:stopAllActions()
			display.addSpriteFrames("20002/20002_run.plist", "20002/20002_run.png")
			local sp = display.newSprite("#20002_run_0000.png")
			--sp:setScale(1)
			--print("move action")
			local fram1 = display.newFrames("20002_run_000%d.png",0,5)

			local  animation1 = display.newAnimation(fram1,.2)

			self:playAnimationForever(animation1)
			end,
			onnormal = function (  )
			 --self:stopAnimation()
			 self:stopAllActions()
			 --print("stand action" )
			 	display.addSpriteFrames("20002/20002_stand.plist","20002/20002_stand.png")
				local sp =  display.newSprite("#20002_stand_0000.png")
				local fram = display.newFrames("20002_stand_000%d.png",0,7)
				local  animation3 = display.newAnimation(fram,.1)
				self:playAnimationForever(animation3)

			 end,

			--攻击1
			onattack1=function (  )
			
			self:stopAllActions()
			local node1 = display.newNode()
		     if self.faceto then
		     		node1 :pos(self:getPositionX()-150,self:getPositionY()+80)
		     else	
		     	node1 :pos(self:getPositionX()+150,self:getPositionY()+80)
		     	end	
			
			self.delegate:add(node1)
			local body1 = cc.PhysicsBody:createBox(cc.size(180, 50) )
			body1:getShape(0):setRestitution(0)
			body1:setCategoryBitmask(1)
			body1:setCollisionBitmask(1)
			body1:setContactTestBitmask(1)
			node1:setPhysicsBody(body1)
			--self:addPhysicsBody(cc.p(100,-20)))
				display.addSpriteFrames("20002/20002_attack_3.plist", "20002/20002_attack_3.png")
			local sp = display.newSprite("#20002_attack_3_0000.png")
			local fram2 = display.newFrames("20002_attack_3_000%d.png",0,3)
			local  animation2 = display.newAnimation(fram2,.1)
			    self:playAnimationOnce(animation2, false, function (  )
						self:doEvent("normal")
						self.count = self.count+1
						node1:removeFromParent()


					end, 0)
				
			end
			 ,
			
			--攻击2
			onattack2=function (  )
			self:stopAllActions()
			local node1 = display.newNode()
			if self.faceto then
		     		node1 :pos(self:getPositionX()-150,self:getPositionY()-50)
		     else	
		     	node1 :pos(self:getPositionX()+150,self:getPositionY()-50)
		     	end	
			--node1 :pos(self:getPositionX()+150,self:getPositionY()-50)
			self.delegate:add(node1)
			local body1 = cc.PhysicsBody:createBox(cc.size(180, 50) )
			body1:getShape(0):setRestitution(0)
			body1:setCategoryBitmask(1)
			body1:setCollisionBitmask(1)
			body1:setContactTestBitmask(1)
			node1:setPhysicsBody(body1)
				display.addSpriteFrames("20002/20002_attack_2.plist", "20002/20002_attack_2.png")
			local sp = display.newSprite("#20002_attack_2_0000.png")
			local fram2 = display.newFrames("20002_attack_2_000%d.png",0,3)
			local  animation2 = display.newAnimation(fram2,.1)
			
					self:playAnimationOnce(animation2, false, function (  )
						self:doEvent("normal")
						self.count = self.count+1
						node1:removeFromParent()
					end, 0)
				
			--print("attack2 action")
			end
			,
			--攻击3
			onattack3 =function (  )
			
			self:stopAllActions()
			local node1 = display.newNode()
			if self.faceto then
		     		node1 :pos(self:getPositionX()-180,self:getPositionY())
		     else	
		     	node1 :pos(self:getPositionX()+180,self:getPositionY())
		     	end	
			--node1 :pos(self:getPositionX()+180,self:getPositionY())
			self.delegate:add(node1)
			local body1 = cc.PhysicsBody:createBox(cc.size(300, 50) )
			body1:getShape(0):setRestitution(0)
			body1:setCategoryBitmask(1)
			body1:setCollisionBitmask(1)
			body1:setContactTestBitmask(1)
			node1:setPhysicsBody(body1)
			display.addSpriteFrames("20002/20002_attack_1.plist", "20002/20002_attack_1.png")
			local sp = display.newSprite("#20002_attack_1_0000.png")
			local fram2 = display.newFrames("20002_attack_1_000%d.png",0,5)
			local  animation2 = display.newAnimation(fram2,.1)
			self:playAnimationOnce(animation2, false, function (  )
						self:doEvent("normal")
						self.count = 1
			end, 0)
					display.addSpriteFrames("20002/20002_attack_effect.plist","20002/20002_attack_effect.png")
				 	 self.effect = display.newSprite("#20002_attack_effect_0000.png")
				 	self.effect:addTo(self.delegate,0)
				 		local frames3 = display.newFrames("20002_attack_effect_000%d.png",0,3)
				 	 	local animation3 = display.newAnimation(frames3,.2)

				 	 	self.effect:playAnimationOnce(animation3, false,function (  )
				 	 		self.effect:removeFromParent()
				 	 		node1:removeFromParent()
				 	 	end,0)
			end,
			--受伤
			 onhurt = function (  )
			 	self:stopAllActions()
				display.addSpriteFrames("20002/20002_hurt.plist","20002/20002_hurt.png")
				local sp =  display.newSprite("#20002_hurt_0000.png")
				local frames = display.newFrames("20002_hurt_000%d.png",0,1)
				local  animation2 = display.newAnimation(frames,.1)
				--print("being hurt")
				self:playAnimationOnce(animation2,false,function()
					self:doEvent("normal")
					end,0)
			end,
			-- onstop = function (  )
			-- 	-- body
			-- end
			-- ondie = function (  )
			-- 	-- body
			-- end
			 onskill1 =function (  )
			 	self:stopAllActions()
			 	local node1 = display.newNode()
			 	local arr ={}
			 	if self.faceto then
		     		node1 :pos(self:getPositionX()-50,self:getPositionY()-50)
		     		 arr ={cc.p(-300,0),cc.p(0,300),cc.p(0,0)}
		     else	
		     	node1 :pos(self:getPositionX()+50,self:getPositionY()-50)
		     	 arr ={cc.p(300,0),cc.p(0,300),cc.p(0,0)}
		     	end	
				--node1 :pos(self:getPositionX()+50,self:getPositionY()-50)
				self.delegate:add(node1)
				
				local body1 = cc.PhysicsBody:createEdgePolygon(arr)
				body1:getShape(0):setRestitution(0)
				body1:setCategoryBitmask(1)
				body1:setCollisionBitmask(1)
			body1:setContactTestBitmask(1)
				node1:setPhysicsBody(body1)

			
			  		
				display.addSpriteFrames("20002/20002_skill.plist","20002/20002_skill.png")
				local sp =  display.newSprite("#20002_skill_0000.png")
				local frames = display.newFrames("20002_skill_00%02d.png",0,12)
				local  animation2 = display.newAnimation(frames,.1)
				--print("skill1")
				self:playAnimationOnce(animation2, false, function (  )
						self:doEvent("normal")
						
					end, 0)
				display.addSpriteFrames("20002/20002_skill_effect.plist","20002/20002_skill_effect.png")
				self.effect_skill = display.newSprite("#20002_skill_effect_0000.png")
				self.effect_skill:addTo(self.delegate,0)
				
				local frames3 = display.newFrames("20002_skill_effect_00%02d.png",0,12)
				local animation3 = display.newAnimation(frames3,.1)
				self.effect_skill:playAnimationOnce(animation3, false,function (  )
					self.effect_skill:removeFromParent()
					node1:removeFromParent()
				end,0)
			 end
			 ,
			 onskill2 = function (  )
			 self:stopAllActions()
				display.addSpriteFrames("20002/20002_attack_4.plist","20002/20002_attack_4.png")
				local sp =  display.newSprite("#20002_attack_4_0000.png")
				local frames = display.newFrames("20002_attack_4_00%02d.png",0,7)
				local  animation2 = display.newAnimation(frames,.1)
				
				self:playAnimationOnce(animation2, false, function (  )
						self:doEvent("normal")
					end, 0)
				display.addSpriteFrames("skill3/podun.plist","skill3/podun.png")
				self.effect_skill = display.newSprite("#battleBufferEffect10_10001.png")
			 	self.effect_skill:addTo(self.delegate,0)

			
				local body1 = cc.PhysicsBody:createCircle(100)
				body1:getShape(0):setRestitution(0)
				body1:setCategoryBitmask(1)
				body1:setCollisionBitmask(1)
			body1:setContactTestBitmask(1)
				self.effect_skill:setPhysicsBody(body1)
				self.effect_skill:runAction(cc.FlipX:create(true))
				local frames3 = display.newFrames("battleBufferEffect10_100%02d.png",1,10)
				local animation3 = display.newAnimation(frames3,.3)
				self.effect_skill:playAnimationOnce(animation3, false,function (  )
					self.effect_skill:removeFromParent()

				end,0)
			 end
			 ,
			 onskill3 = function (  )
			 	self:stopAllActions()
			 	local node1 = display.newNode()
			 	node1 :pos(self:getPositionX(),self:getPositionY())
		    
			
				self.delegate:add(node1)
				local body1 = cc.PhysicsBody:createBox(cc.size(200, 300) )
				body1:getShape(0):setRestitution(0)
				body1:setCategoryBitmask(1)
				body1:setCollisionBitmask(1)
			body1:setContactTestBitmask(1)
				node1:setPhysicsBody(body1)
			 	
			
		     	
				display.addSpriteFrames("20002/20002_attack_5.plist","20002/20002_attack_5.png")
				local sp =  display.newSprite("#20002_attack_5_0000.png")
				local frames = display.newFrames("20002_attack_5_00%02d.png",0,7)
				local  animation2 = display.newAnimation(frames,.1)
				
				self:playAnimationOnce(animation2, false, function (  )
						self:doEvent("normal")
					end, 0)
				display.addSpriteFrames("skill3/fire.plist","skill3/fire.png")
    				effect =display.newSprite("#opening_fire0001.png")
    				effect:setPosition(cc.p(hero:getPositionX(),hero:getPositionY()-50))
					effect:addTo(self.delegate)
    				local frames4 = display.newFrames("opening_fire000%d.png",1,9)
					local animation4 = display.newAnimation(frames4,.2)
					display.addSpriteFrames("skill3/skill3.plist","skill3/skill3.png")
    				effect_skill =display.newSprite("#kSkill_250001.png")
    				local frames3 = display.newFrames("kSkill_25000%d.png",1,7)
					local animation3 = display.newAnimation(frames3,.3)

    				effect_skill:setPosition(cc.p(self:getPositionX(),self:getPositionY()-50))
					effect_skill:addTo(self.delegate)
					effect:playAnimationOnce(animation4,false, function (  )
						effect:removeFromParent()
					end, 0)
					effect:runAction(cc.MoveBy:create(2, cc.p(0,120)))
						effect_skill:playAnimationOnce(animation3, false,function (  )
						effect_skill:removeFromParent()
						node1:removeFromParent()
					end,0)
			 	
			 end
			 ,
			onskill4 =function (  )
				self:stopAllActions()
				display.addSpriteFrames("20002/20002_attack_3.plist","20002/20002_attack_3.png")
				local sp =  display.newSprite("#20002_attack_3_0000.png")
				local frames = display.newFrames("20002_attack_3_00%02d.png",0,3)
				local  animation2 = display.newAnimation(frames,.3)
				
				self:playAnimationOnce(animation2, false, function (  )
						self:doEvent("normal")
					end, 0)
			 	
			 end
			 ,
			
			 


		}
	})	
end
return StateHero
--
-- Author: liangjiwen
-- Date: 2015-11-18 10:22:52
--
local Enemy = class("Enemy", function (  )--tianjia动画
	display.addSpriteFrames("10049/10049_walk.plist","10049/10049_walk.png")
	return display.newSprite("#10049_walk_0000.png")
	--:setScale(1)
	--:pos(100, 200)
	--return display.newSprite("#20002_stand_0000.png")
	
end)
function Enemy:ctor( )
	self:addStateMachine()
	body = cc.PhysicsBody:createBox(cc.size(90, 180) )
	body:getShape(0):setRestitution(.3)
	body:setCategoryBitmask(1)
	--body:setGroup(1)
	body:setCollisionBitmask(1)
	body:setContactTestBitmask(1)
	self:setPhysicsBody(body)
	
end
function Enemy:doEvent(event)
	--print(self.fsm:getState())
	if self.fsm:canDoEvent(event) then

		self.fsm:doEvent(event)
	end
end

function Enemy:addStateMachine(  )
	self.fsm ={}
	cc.GameObject.extend(self.fsm):addComponent("components.behavior.StateMachine"):exportMethods()
	self.fsm:setupState({
		initial = "running",
		terminal = "dead",
		events = {
		
		{name = "nromal",from = {"hurting","attacking"},to = "running"},
		{name = "attack",from = "running",to = "attacking"},
		{name = "hurt",from = {"running","attacking"},to = "hurting"},
		
		{name = "die",from ={"hurting","running","attacking"},to = "dead"}
		},	
		callbacks = {
		onnormal = function (  )
			self:stopAllActions()
			display.addSpriteFrames("10049/10049_walk.plist", "10049/10049_walk.png")
			local sp = display.newSprite("#10049_walk_0000.png")
			local fram1 = display.newFrames("10049_walk_000%d.png",0,7)
			local  animation1 = display.newAnimation(fram1,.1)
			self:playAnimationForever(animation1)
		end,
		
		onattack = function (  )
			self:stopAllActions()

			display.addSpriteFrames("10049/10049_attack.plist", "10049/10049_attack.png")
			local sp = display.newSprite("#10049_attack_0000.png")
			local fram1 = display.newFrames("10049_attack_000%d.png",0,9)
			local  animation1 = display.newAnimation(fram1,.15)
			self:playAnimationOnce(animation1, false, function (  )
				self:doEvent("nromal")
				--print("normal")
			end, 0)
		end,
		onhurt = function (  )
			self:stopAllActions()
			display.addSpriteFrames("10049/10049_hurt.plist", "10049/10049_hurt.png")
			local sp = display.newSprite("#10049_hurt_0000.png")
			local fram1 = display.newFrames("10049_hurt_000%d.png",0,1)
			local  animation1 = display.newAnimation(fram1,.1)
			self:playAnimationOnce(animation1, false, function (  )
				self:doEvent("nromal")
			end, 0)
		end,
		ondie = function (  )
			self:stopAllActions()
			display.addSpriteFrames("10049/10049_die.plist", "10049/10049_die.png")
			local sp = display.newSprite("#10049_die_0000.png")
			local fram1 = display.newFrames("10049_die_000%d.png",0,7)
			local  animation1 = display.newAnimation(fram1,.1)
			self:playAnimationOnce(animation1, true, function (  )
				
				self:removeFromParent()
			end, 0)
		end
		}
	})



end
function Enemy:movetoHero(h_x,h_y,e_x,e_y)

	
	if e_x>h_x then
		self:runAction(cc.FlipX:create(true))
	else
		self:runAction(cc.FlipX:create(false))
	end
		
	if (math.abs(e_y-h_y))<50 then
		--print("over")
		--print(self.fsm:getState())

		self:runAction(cc.MoveTo:create(0.5,cc.p(e_x,h_y)))
		self:doEvent("attack")
	
	elseif e_y>h_y then
		self:runAction(cc.MoveBy:create(.5,cc.p(0,-50)))
		self:doEvent("normal")
		--print(self.fsm:getState())

	elseif e_y<h_y then
		self:runAction(cc.MoveBy:create(.5,cc.p(0,50)))
		self:doEvent("normal")
		--print(self.fsm:getState())
	end
	
end
return Enemy
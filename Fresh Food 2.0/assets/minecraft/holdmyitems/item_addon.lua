-- Cyber and Sapling were here :3
local l = context.bl and 1 or -1

-- Keep custom global variable assignments using dot notation
global.foodCount = 0.0;
global.foodCountO = 0.0;
global.inspectionSpin = 0.0;

global.timeSpent = 0.0;

global.floating = 0.0;

-- Local variable assignment using the ternary-like structure for 'mainHand'
local easedFoodCounter = Easings:easeInQuart(context.mainHand and foodCount or foodCountO)

timeSpent = timeSpent + context.deltaTime * 30

if timeSpent > 100000 then
    timeSpent = 0
end

renderAsBlock:put("minecraft:cake", false)

-- Apple, Golden Apple
if not (
    string.find(I:getActualName(context.item), "Plate") or
    string.find(I:getActualName(context.item), "Plated") 
) then
if (
    I:isOf(context.item, Items:get("minecraft:apple")) or
    I:isOf(context.item, Items:get("minecraft:golden_apple"))
) then
    M:moveY(context.matrices, -0.025)
    M:moveX(context.matrices, -0.05 * l)
    M:rotateX(context.matrices, -7.5)
    M:rotateY(context.matrices, -5 * l)
    M:rotateY(context.matrices, 13 * l * easedFoodCounter)
    M:moveX(context.matrices, 0.08 * l * easedFoodCounter)
    M:moveY(context.matrices, -0.05 * easedFoodCounter)
end

-- Enchanted Golden Apple
if I:isOf(context.item, Items:get("minecraft:enchanted_golden_apple")) then
    M:moveY(context.matrices, -0.025)
    M:moveX(context.matrices, -0.05 * l)
    M:rotateX(context.matrices, -7.5)
    M:rotateY(context.matrices, -5 * l)
    M:rotateY(context.matrices, 13 * l * easedFoodCounter)
    M:moveX(context.matrices, 0.08 * l * easedFoodCounter)
    M:moveY(context.matrices, -0.05 * easedFoodCounter)
    
    particleManager:addParticle(
        context.particles, 
        false, 
        0.05 * l, 
        0.05, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        1.6, 
        Texture:of("minecraft", "textures/particle/fresh_glow.png"), 
        "ITEM", 
        context.hand, 
        "SPAWN", 
        "ADDITIVE", 
        0, 
        200 + (20 * M:sin(P:getAge(context.player) * 0.2))
    )
end

-- Dried Kelp
if I:isOf(context.item, Items:get("minecraft:dried_kelp")) then
    M:moveY(context.matrices, 0.025)
    M:moveX(context.matrices, -0.05 * l)
    M:rotateX(context.matrices, -7.5)
    M:rotateY(context.matrices, -15 * l)
    M:rotateY(context.matrices, 15 * l * easedFoodCounter)
    M:moveX(context.matrices, 0.08 * l * easedFoodCounter)
end

-- Cookie
if I:isOf(context.item, Items:get("minecraft:cookie")) then
    M:moveY(context.matrices, -0.025)
    M:moveX(context.matrices, -0.05 * l)

    M:rotateX(context.matrices, -7.5)
    M:rotateY(context.matrices, -5 * l)

    M:rotateY(context.matrices, 6 * l * easedFoodCounter)
    M:rotateZ(context.matrices, -6 * l *easedFoodCounter)

    M:moveX(context.matrices, 0.08 * l * easedFoodCounter)
end

-- Cake
if I:isOf(context.item, Items:get("minecraft:cake")) then
    M:moveY(context.matrices, 0.05)
    M:moveX(context.matrices, -0.1 * l)
    M:rotateX(context.matrices, 0)
    M:rotateY(context.matrices, 0 * l)
end

-- Beetroot
if I:isOf(context.item, Items:get("minecraft:beetroot")) then
    M:moveY(context.matrices, 0.15)
    M:moveX(context.matrices, -0.15 * l)
    M:moveZ(context.matrices, 0.1)

    M:rotateX(context.matrices, -7.5)
    M:rotateZ(context.matrices, -90 * l)
    M:rotateY(context.matrices, 90 * l)

    M:rotateY(context.matrices, -90 * l * easedFoodCounter)
    M:rotateX(context.matrices, -5 * easedFoodCounter)
    
    M:moveY(context.matrices, 0.1 * easedFoodCounter)
    M:moveZ(context.matrices, 0.1 * easedFoodCounter)
    M:moveX(context.matrices, 0.05 * l * easedFoodCounter)
end

-- Baked Potato, Poisonous Potato, Potato
if (
    I:isOf(context.item, Items:get("minecraft:baked_potato")) or
    I:isOf(context.item, Items:get("minecraft:poisonous_potato")) or
    I:isOf(context.item, Items:get("minecraft:potato"))
) then
    M:moveY(context.matrices, 0)
    M:moveX(context.matrices, 0 * l)

    M:rotateY(context.matrices, 5 * l * easedFoodCounter)
    M:rotateZ(context.matrices, -15 * l * easedFoodCounter)

    M:moveX(context.matrices, 0.05 * l * easedFoodCounter)
    M:moveZ(context.matrices, 0.05 * easedFoodCounter)
end

-- Bowl, Beetroot Soup, Mushroom Stew, Rabbit Stew, Suspicious Stew
if (
    I:isOf(context.item, Items:get("minecraft:beetroot_soup")) or
    I:isOf(context.item, Items:get("minecraft:bowl")) or
    I:isOf(context.item, Items:get("minecraft:mushroom_stew")) or
    I:isOf(context.item, Items:get("minecraft:rabbit_stew")) or
    I:isOf(context.item, Items:get("minecraft:suspicious_stew"))
) then
    M:scale(context.matrices, 1.25, 1.25, 1.25)

    M:moveY(context.matrices, 0.04)
    M:moveX(context.matrices, -0.05 * l)
    M:moveZ(context.matrices, 0.2)

    M:rotateX(context.matrices, -97.5)

    M:rotateZ(context.matrices, 0 * l * easedFoodCounter)
    M:rotateY(context.matrices, 5 * l * easedFoodCounter)

    M:moveX(context.matrices, 0.1 * l * easedFoodCounter)
    M:moveY(context.matrices, -0.05 * easedFoodCounter)
    M:moveZ(context.matrices, -0.05 * easedFoodCounter)
end

-- Bread
if I:isOf(context.item, Items:get("minecraft:bread")) then
    M:moveY(context.matrices, 0.015)
    M:moveX(context.matrices, -0.05 * l)
    M:moveZ(context.matrices, -0.075)

    M:rotateX(context.matrices, -7.5)
    M:rotateY(context.matrices, -5 * l)

    M:rotateY(context.matrices, 8 * l * easedFoodCounter)
    M:rotateZ(context.matrices, -7 * l * easedFoodCounter)

    M:moveX(context.matrices, 0.075 * l * easedFoodCounter)
    M:moveZ(context.matrices, 0.075 * easedFoodCounter)
end
-- Carrot, Golden Carrot
if (
    I:isOf(context.item, Items:get("minecraft:golden_carrot")) or 
    I:isOf(context.item, Items:get("minecraft:carrot"))
) then
    M:moveY(context.matrices, 0.175)
    M:moveX(context.matrices, -0.0555 * l)
    M:moveZ(context.matrices, 0.025)

    M:rotateX(context.matrices, -5)
    M:rotateZ(context.matrices, -95 * l)
    M:rotateY(context.matrices, 90 * l)

    M:rotateY(context.matrices, -90 * l * easedFoodCounter)
    M:rotateX(context.matrices, -5 * easedFoodCounter)

    M:moveY(context.matrices, 0.05 * easedFoodCounter)
    M:moveX(context.matrices, 0.15 * l * easedFoodCounter)
end

-- Chicken, Cooked Chicken
if (
    I:isOf(context.item, Items:get("minecraft:chicken")) or
    I:isOf(context.item, Items:get("minecraft:cooked_chicken"))
) then
    M:moveY(context.matrices, 0.025)
    M:moveX(context.matrices, -0.05 * l)
    M:moveZ(context.matrices, 0.1)

    M:rotateX(context.matrices, -7.5)
    M:rotateY(context.matrices, -5 * l)

    M:rotateY(context.matrices, 10 * l * easedFoodCounter)
    M:rotateZ(context.matrices, -10 * l * easedFoodCounter)
    
    M:moveX(context.matrices, 0.1 * l * easedFoodCounter)
end

-- Chorus Fruit
if I:isOf(context.item, Items:get("minecraft:chorus_fruit")) then
    M:moveY(context.matrices, 0.25)
    M:moveX(context.matrices, -0.175 * l)
    M:moveZ(context.matrices, 0.1)
    M:rotateX(context.matrices, -7.5)
    M:rotateZ(context.matrices, -90 * l)
    M:rotateY(context.matrices, 90 * l)
    M:rotateY(context.matrices, -90 * l * easedFoodCounter)
    M:rotateX(context.matrices, -6.5 * easedFoodCounter)
    M:moveY(context.matrices, 0.115 * easedFoodCounter)
    M:moveX(context.matrices, 0.15 * l * easedFoodCounter)
end

-- Cod, Cooked Cod, Salmon, Cooked Salmon, Tropical Fish
if (
    I:isOf(context.item, Items:get("minecraft:cod")) or
    I:isOf(context.item, Items:get("minecraft:cooked_cod")) or
    I:isOf(context.item, Items:get("minecraft:salmon")) or
    I:isOf(context.item, Items:get("minecraft:cooked_salmon")) or
    I:isOf(context.item, Items:get("minecraft:tropical_fish"))
) then
    M:moveY(context.matrices, 0.15)
    M:moveX(context.matrices, -0.1 * l)
    M:moveZ(context.matrices, 0.1)

    M:rotateX(context.matrices, -7.5)
    M:rotateZ(context.matrices, 90 * l)
    M:rotateY(context.matrices, -90 * l)
    
    M:rotateZ(context.matrices, 0 * l * easedFoodCounter)
    M:moveY(context.matrices, -0.1 * easedFoodCounter)
    M:moveX(context.matrices, 0.05 * l * easedFoodCounter)
    M:moveZ(context.matrices, 0.05 * easedFoodCounter)
end

-- Beef, Cooked Beef, Mutton, Cooked Mutton
if (
    I:isOf(context.item, Items:get("minecraft:cooked_beef")) or
    I:isOf(context.item, Items:get("minecraft:beef")) or
    I:isOf(context.item, Items:get("minecraft:cooked_mutton")) or
    I:isOf(context.item, Items:get("minecraft:mutton"))
) then
    M:moveY(context.matrices, -0.025)
    M:moveX(context.matrices, -0.025 * l)

    M:rotateX(context.matrices, -5)

    M:rotateZ(context.matrices, -10 * l * easedFoodCounter)

    M:moveX(context.matrices, 0.075 * l * easedFoodCounter)
end

-- Porkchop, Cooked Porkchop
if (
    I:isOf(context.item, Items:get("minecraft:cooked_porkchop")) or
    I:isOf(context.item, Items:get("minecraft:porkchop"))
) then
    M:moveY(context.matrices, -0.025)
    M:moveX(context.matrices, -0.025 * l)
    M:moveZ(context.matrices, -0.025)

    M:rotateX(context.matrices, -5)

    M:rotateZ(context.matrices, -10 * l * easedFoodCounter)

    M:moveX(context.matrices, 0.075 * l * easedFoodCounter)
end
-- Rabbit
if I:isOf(context.item, Items:get("minecraft:rabbit")) then
    M:moveY(context.matrices, 0.03)
    M:moveX(context.matrices, -0.075 * l)

    M:rotateX(context.matrices, -5)

    M:rotateY(context.matrices, 5 * l * easedFoodCounter)
    M:rotateZ(context.matrices, -10 * l * easedFoodCounter)
    
    M:moveX(context.matrices, 0.125 * l * easedFoodCounter)
    M:moveZ(context.matrices, 0.05 * easedFoodCounter)
end

-- Cooked Rabbit
if I:isOf(context.item, Items:get("minecraft:cooked_rabbit")) then
    M:moveX(context.matrices, 0.05 * l)
    M:rotateX(context.matrices, -5)

    M:rotateX(context.matrices, 10.5 * easedFoodCounter)
    M:rotateY(context.matrices, 7.5 * l * easedFoodCounter)

    M:moveX(context.matrices, 0.05 * easedFoodCounter)
    M:moveZ(context.matrices, 0.1 * easedFoodCounter)
    M:moveY(context.matrices, -0.1 * easedFoodCounter)
end

-- Melon Slice, Glistering Melon Slice
if (
    I:isOf(context.item, Items:get("minecraft:melon_slice")) or
    I:isOf(context.item, Items:get("minecraft:glistering_melon_slice"))
) then
    M:moveY(context.matrices, 0.025)
    M:moveX(context.matrices, -0.05 * l)
    M:moveZ(context.matrices, 0.025)
    M:rotateX(context.matrices, -7.5)
    M:rotateY(context.matrices, -5 * l)
   
    M:rotateX(context.matrices, 10 * easedFoodCounter)
    M:rotateZ(context.matrices, -10 * l * easedFoodCounter)
   
    M:moveX(context.matrices, 0.1 * l * easedFoodCounter)
    M:moveY(context.matrices, -0.05 * easedFoodCounter)
    M:moveZ(context.matrices, 0.05 * easedFoodCounter)
end
-- Pufferfish
if I:isOf(context.item, Items:get("minecraft:pufferfish")) then
    M:moveY(context.matrices, 0.035)
    M:moveX(context.matrices, -0.075 * l)
    M:moveZ(context.matrices, 0.1)

    M:rotateX(context.matrices, -12.5)
    M:rotateY(context.matrices, -10 * l)
    M:rotateX(context.matrices, -10)
    M:rotateZ(context.matrices, -10 * l)
    
    M:rotateY(context.matrices, 200 * l * easedFoodCounter)
    
    M:moveX(context.matrices, -0.125 * l * easedFoodCounter)
    M:moveZ(context.matrices, -0.1 * easedFoodCounter)
    M:moveY(context.matrices, -0.075 * easedFoodCounter)
end

-- Pumpkin Pie
if I:isOf(context.item, Items:get("minecraft:pumpkin_pie")) then
    M:moveY(context.matrices, 0.035)
    M:moveX(context.matrices, -0.075 * l)
    M:moveZ(context.matrices, 0.1)

    M:rotateX(context.matrices, -12.5)
    M:rotateY(context.matrices, -7.5 * l)
    M:rotateZ(context.matrices, -7.5 * l)

    M:rotateY(context.matrices, 100 * l * easedFoodCounter)

    M:moveX(context.matrices, 0.125 * l * easedFoodCounter)
    M:moveX(context.matrices, -0.2 * l * easedFoodCounter)
end

-- Rotten Flesh
if I:isOf(context.item, Items:get("minecraft:rotten_flesh")) then
    M:moveY(context.matrices, 0.125)
    M:moveX(context.matrices, -0.075 * l)
    M:moveZ(context.matrices, 0.1)

    M:rotateX(context.matrices, 35)
    M:rotateY(context.matrices, -7.5 * l)
    
    M:rotateY(context.matrices, 10 * l * easedFoodCounter)
    M:rotateX(context.matrices, -35 * easedFoodCounter)
    M:rotateZ(context.matrices, -15 * l * easedFoodCounter)

    M:moveX(context.matrices, 0.125 * l * easedFoodCounter)
    M:moveY(context.matrices, -0.05 * easedFoodCounter)
end

-- Spider Eye
if I:isOf(context.item, Items:get("minecraft:spider_eye")) then
    M:moveY(context.matrices, 0.02)
    M:moveX(context.matrices, -0.05 * l)
    M:moveZ(context.matrices, 0.1)

    M:rotateX(context.matrices, 0)
    M:rotateZ(context.matrices, -35 * l)
    M:rotateY(context.matrices, -7.5 * l)

    M:rotateY(context.matrices, 10 * l * easedFoodCounter)
    M:rotateZ(context.matrices, 35 * l * easedFoodCounter)
    M:rotateX(context.matrices, 35 * easedFoodCounter)

    M:moveX(context.matrices, 0.125 * l * easedFoodCounter)
    M:moveY(context.matrices, 0.025 * easedFoodCounter)

    M:scale(context.matrices, 1.3, 1.3, 1.3)
end

-- Sweet Berries
if I:isOf(context.item, Items:get("minecraft:sweet_berries")) then
    M:moveY(context.matrices, 0.025)
    M:moveX(context.matrices, -0.05 * l)
    M:moveZ(context.matrices, 0.075)
    M:rotateX(context.matrices, 0)
    M:rotateZ(context.matrices, -20 * l)
    M:rotateY(context.matrices, 90 * l)
    M:rotateY(context.matrices, -180 * l * easedFoodCounter)
    M:rotateZ(context.matrices, 42.5 * l * easedFoodCounter)
    M:rotateX(context.matrices, 42.5 * easedFoodCounter)
    M:moveX(context.matrices, 0 * l *easedFoodCounter)
    M:moveZ(context.matrices, -0.2 * easedFoodCounter)
    M:moveY(context.matrices, -0.175 * easedFoodCounter)
end

-- Glow Berries
if I:isOf(context.item, Items:get("minecraft:glow_berries")) then
    M:moveY(context.matrices, 0.05)
    M:moveZ(context.matrices, 0.1)
    M:moveX(context.matrices, -0.05 * l)
    M:rotateX(context.matrices, -7.5)
    M:rotateY(context.matrices, -5 * l)
    
    M:moveX(context.matrices, 0.08 * l * easedFoodCounter)
    M:moveY(context.matrices, -0.125 * easedFoodCounter)
    
    particleManager:addParticle(
        context.particles, 
        false, 
        0.1 * l, 
        0.05, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        0, 
        1.6, 
        Texture:of("minecraft", "textures/particle/fresh_glow.png"), 
        "ITEM", 
        context.hand, 
        "SPAWN", 
        "ADDITIVE", 
        0, 
        200 + (20 * M:sin(P:getAge(context.player) * 0.2))
    )
end

else
    M:rotateY(context.matrices, -360 * Easings:easeInOutBack(inspectionSpin))
    M:moveY(context.matrices, 0.05)
    M:moveZ(context.matrices, 0.2)
    M:rotateX(context.matrices, -67)
    M:rotateZ(context.matrices, 8)
end



if I:isOf(context.item, Items:get("minecraft:chorus_fruit")) and context.deltaTime ~= 0 and math.floor(timeSpent + 0.5) % 12 == 0 then

local particle_ticker = function(particle)
    particle.dy = particle.dy;
end

local value = math.random() * 0.3
        --particleManager:addParticle(context.particles, false, 0.75 * l, -0.2, -0.9, (math.random() * 0.12 - 0.06) * l, math.random() * 0.12, 0, 0, 0, 0, 0, 0, 0, 0.4, Texture:of("minecraft", "textures/particle/firefly.png"), "SCREEN", context.hand, "OPACITY", "TRANSLUCENT_L", 1, 255, particle_ticker)
        
        --math.random() -- return random number between 0 and 1;
        -- 1
        --math.random() * 0.12 -- return random number between  0 and 0.12
        -- 1 * 0.12 = 0.12

        --math.random() * 0.12 - 0.06 -- return random number between  -0.06 and 0.12
        -- 0 * 0.12 = 0 - 0.06 = -0.06
        local ypos = context.bl and 0.35 or 0.25
        if not (string.find(I:getActualName(context.item), "Plated") or string.find(I:getActualName(context.item), "plated") or string.find(I:getActualName(context.item), "Plate") or string.find(I:getActualName(context.item), "plate")) then
        particleManager:addParticle(
            context.particles, -- particle registry
            false, -- gravity if true then gravity if false then no
            0.3 * l, -- inital position by X axis
            ypos, -- inital position by Y axis
            0.15,  -- inital position by Z axis
             0, -- X speed of the particle
             (math.random() * 0.06 - 0.03), -- Y speed of the particle
             math.random() * 0.08 - 0.04, -- Z speed of the particle
             0, -- X rotation of the particle
             0, -- Y rotation of the particle
             0, -- Z rotation of the particle
             0, -- X rotation speed of the particle
             0, -- Y rotation speed of the particle
             0, -- Z rotation speed of the particle
             0.1, -- Scale of the particle
             Texture:of("minecraft", "textures/particle/end_particle.png"), -- Texture of the particle
             "ITEM", -- Render space of the particle
             context.hand, -- Hand that triggered the addition of the particle (doens't mean anything for you, but you should pass it here)
             "OPACITY", -- Lifecycle type (Opacity means that particle slowly fades it's opacity when dies). We also Have SCALE lifecycle type (you might already what it  does)
             "ADDITIVE", -- Render type of the particle (TRANSLUCENT, TRANSLUCENT_L, ADDITIVE, CUTOUT_L)
             1, -- Lifetime of the particle
             200, -- Initial opacity of the particle
             particle_ticker -- ticker function
            )
        else
            particleManager:addParticle(
            context.particles, -- particle registry
            false, -- gravity if true then gravity if false then no
            0 * l, -- inital position by X axis
            0.25, -- inital position by Y axis
            0.15,  -- inital position by Z axis
             math.random() * 0.08 - 0.04, -- X speed of the particle
             (math.random() * 0.06 - 0.03), -- Y speed of the particle
             0, -- Z speed of the particle
             0, -- X rotation of the particle
             0, -- Y rotation of the particle
             0, -- Z rotation of the particle
             0, -- X rotation speed of the particle
             0, -- Y rotation speed of the particle
             0, -- Z rotation speed of the particle
             0.1, -- Scale of the particle
             Texture:of("minecraft", "textures/particle/end_particle.png"), -- Texture of the particle
             "ITEM", -- Render space of the particle
             context.hand, -- Hand that triggered the addition of the particle (doens't mean anything for you, but you should pass it here)
             "OPACITY", -- Lifecycle type (Opacity means that particle slowly fades it's opacity when dies). We also Have SCALE lifecycle type (you might already what it  does)
             "ADDITIVE", -- Render type of the particle (TRANSLUCENT, TRANSLUCENT_L, ADDITIVE, CUTOUT_L)
             1, -- Lifetime of the particle
             200, -- Initial opacity of the particle
             particle_ticker -- ticker function
            )
        end

end
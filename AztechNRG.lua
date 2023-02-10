Omg kinda like the Tera typing in Pokemon s/v … Normal Tile = Standard stats while Tile grants a type alteration . 

If your physical unit (Moderator) goes active from a “magic” (Aztech NRG) tile it gains “wild NRG” Atk Based Magic dmg. 

If an NRG unit goes active from an NRG tile it adds a % boost to NRG based dmg. 

A “Healing” (Recharge) tile doubles the defense of a Recovery unit OR grants other units a slow continuous battery recharge or a one time “power surge” %25 or %50 AOE recharge for all nearby units…

Ranged “Broadcaster” units can further expand their bandwidth (atk range) when engaging a clock tile.

Other units lose bandwidth, but local enemies within a very short range experience a DDOS atk causing them to lose a turn or to be slowed.. something like that.

When a Moderator (atk based) unit activates from a virus tile it doubles their base stats. All other units may want to avoid the virus tile because it causes a “404 error” that removes them from the grid for a round.  This could also be used to their advantage… 

function physicalAtkTileModifier(currentAtk)
    atkModifier = 1
    return currentAtk + atkModifier
end

function healingTileModifier(hp)
    heal = 2 
    return hp + heal
end

function clockTile(atkRange)
    if (good) then
        addRange = 5 + atkRange
    elseif (bad) then
        lessRange = atkRange - 5
    end
end

function virusTile(entity)
    if (entity = moderator) then
        buff = 2 * baseStats
    elseif(entity != moderator) then
        remove = "remove from grid"
    end
end
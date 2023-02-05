enemy = {}
enemy.units = {}
--enemyData is a table. Each element is an object that contains an x position, a y position and an enemy type
--{
--positionX,
--positionY,
--type
--}
function enemy:generate_enemies(enemyData)
    for unit in all(enemyData) do
        newEnemy = nil
        if unit.type == "huitz" then
           newEnemy = make_huitz(unit.positionX, unit.positionY) 

        elseif unit.type == "xipe" then
            newEnemy = make_xipe(unit.positionX, unit.positionY) 
            newEnemy.spriteId = 192
        elseif unit.type == "tez" then
            newEnemy = make_tez(unit.positionX, unit.positionY) 
        elseif unit.type == "quetz" then
            newEnemy = make_quetz(unit.positionX, unit.positionY) 
        end
        if (newEnemy) add(self.units, newEnemy)
    end

    return enemy
end

function enemy:draw_units()
    for unit in all(self.units) do
        xPixelCoordinate = convertPositionToPixelCoordinate(unit.positionX)
        yPixelCoordinate = convertPositionToPixelCoordinate(unit.positionY)


        if (unit.type == "huitz") pal(colorEnum.orange, colorEnum.pink)
        if (unit.type == "quetz") pal(colorEnum.green, colorEnum.pink)
        if (unit.type == "tez") pal(colorEnum.grey, colorEnum.pink)
        spr(unit.spriteId, xPixelCoordinate, yPixelCoordinate)
        pal()
        palt(colorEnum.black, false)
    end
end
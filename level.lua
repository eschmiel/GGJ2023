levels = {}

levels[1] = {
   startingEnemyData = {}
}

levels[1].startingEnemyData[1] = {
        positionX = 11,
        positionY = 2,
        type = "huitz"
}


levels[1].startingEnemyData[2] = {
    type = "huitz",
    positionX = 11,
    positionY = 3
}

levels[1].startingEnemyData[3] = {
    type = "tez",
    positionX = 13,
    positionY = 4
}

levels[1].startingEnemyData[4] = {
    type = "quetz",
    positionX = 12,
    positionY = 2
}

levels[1].startingEnemyData[5] = {
    type = "xipe",
    positionX = 13,
    positionY = 3
}

enemy:generate_enemies(levels[1].startingEnemyData)
function dialogue(NameofSpeaker,message)
    local x=4
    local y=10
    local w=11
    local h=5
    
    text={}
    text.active=true
    str={}
  --  str[1]="Hi my name is rudy barua"
   -- str[2]="World"

    test=text.str
    draw_snake_box(x,y,w,h)
    draw_snake_box(0,y,4,h)
    
    spr(136, 12, 96, 2, 2)
    --print(NameofSpeaker..": Hello World", 15, 50, 8)
    --write text
    print(NameofSpeaker..":",10,84)
    for i=1, #str do
        local txt = str[i]
        local tx = convertPositionToTextPixelCoordinate(x+2)
        local ty = convertPositionToTextPixelCoordinate(y+3+i)+i*2
        print(txt,tx-2,ty+6,8)
    end
    

end

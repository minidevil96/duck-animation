duck = new Sprite

duck.image = file.loadImage(file.child("images", "duck-standing1.png"))
duck.scale = 2
duck.x = 480
duck.y = 320
duck.idle = 0
duck.nextFrame = 0
duck.curFrame = 0
duck.update = function()
    if not key.available and self.idle <= 0 then
        if time > self.nextFrame then
                self.curFrame = (self.curFrame + 1) % frames.standing.len
                self.image = frames.standing[self.curFrame]
                self.nextFrame = time + 0.15
       end if
    end if
    while key.available
        self.idle = 10
        if key.pressed("s") then
            if time > self.nextFrame then
            self.curFrame = (self.curFrame + 1) % frames.walking_down.len
            self.image = frames.walking_down[self.curFrame]
            self.nextFrame = time + 0.1
            end if
            self.y = self.y - 1.5
        end if
        if key.pressed("w") then
            if time > self.nextFrame then
            self.curFrame = (self.curFrame + 1) % frames.walking_up.len
            self.image = frames.walking_up[self.curFrame]
            self.nextFrame = time + 0.1
            end if
            self.y = self.y + 1.5
        end if
        if key.pressed("a") then
            if time > self.nextFrame then
            self.curFrame = (self.curFrame + 1) % frames.walking_left.len
            self.image = frames.walking_left[self.curFrame]
            self.nextFrame = time + 0.1
            end if
            self.x = self.x - 1.5
        end if
        if key.pressed("d") then
            if time > self.nextFrame then
            self.curFrame = (self.curFrame + 1) % frames.walking_right.len
            self.image = frames.walking_right[self.curFrame]
            self.nextFrame = time + 0.1
            end if
            self.x = self.x + 1.5
        end if
        key.clear
    end while
    self.idle = self.idle -1
end function

display(4).sprites.push duck

frames = {}
frames.walking_down = []
frames.walking_left = []
frames.walking_right = []
frames.walking_up = []
frames.standing = []

for i in file.children(file.child("images"))
    if i.indexOf("walking-down") == null then continue
    frames.walking_down.push file.loadImage(file.child("images", i))
end for
for i in file.children(file.child("images"))
    if i.indexOf("walking-up") == null then continue
    frames.walking_up.push file.loadImage(file.child("images", i))
end for
for i in file.children(file.child("images"))
    if i.indexOf("walking-left") == null then continue
    frames.walking_left.push file.loadImage(file.child("images", i))
end for
for i in file.children(file.child("images"))
    if i.indexOf("walking-right") == null then continue
    frames.walking_right.push file.loadImage(file.child("images", i))
end for
for i in file.children(file.child("images"))
    if i.indexOf("standing") == null then continue
    frames.standing.push file.loadImage(file.child("images", i))
end for

while true

    duck.update
    yield
    
end while
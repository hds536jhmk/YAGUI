--[[
Copyright (c) 2019, hds536jhmk : https://github.com/hds536jhmk/YAGUI

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
--]]
local a={ver="1.19.2",author="hds536jhmk",website="https://github.com/hds536jhmk/YAGUI/",documentation="https://hds536jhmk.github.io/YAGUI/",copyright="Copyright (c) 2019, hds536jhmk : https://github.com/hds536jhmk/YAGUI\n\nPermission to use, copy, modify, and/or distribute this software for any\npurpose with or without fee is hereby granted, provided that the above\ncopyright notice and this permission notice appear in all copies.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\" AND THE AUTHOR DISCLAIMS ALL WARRANTIES\nWITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF\nMERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR\nANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES\nWHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN\nACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF\nOR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE."}local b={TOUCH="screen_touch",MOUSEUP="mouse_up",MOUSEDRAG="mouse_drag",MOUSESCROLL="mouse_scroll",CHAR="char",KEY="key",KEYUP="key_up",PASTE="paste",DELETED="DELETED",DISCONNECTED="DISCONNECTED",LOW_PRIORITY=1,HIGH_PRIORITY=2,ONSTART=1,ONSTOP=2,ONDRAW=3,ONPRESS=4,ONFAILEDPRESS=5,ONTIMEOUT=6,ONCLOCK=7,ONEVENT=8,ONFOCUS=9,ONKEY=10,ONCHAR=11,ONMOUSESCROLL=12,MOUSE_LEFT=1,MOUSE_RIGHT=2,MOUSE_MIDDLE=3,SCROLL_UP=-1,SCROLL_DOWN=1,COMPUTER="computer",TURTLE="turtle",POCKET="pocket",ALIGN_LEFT=1,ALIGN_CENTER=2}for c,d in next,keys do if type(d)=="number"then b["KEY_"..c:upper()]=d end end;local e={}local f={}local g={}local h={}local i={}local j={}local k={}local l={}e={set_callback=function(m,n,o)if n==b.ONSTART then m.callbacks.onStart=o elseif n==b.ONSTOP then m.callbacks.onStop=o elseif n==b.ONDRAW then m.callbacks.onDraw=o elseif n==b.ONPRESS then m.callbacks.onPress=o elseif n==b.ONFAILEDPRESS then m.callbacks.onFailedPress=o elseif n==b.ONTIMEOUT then m.callbacks.onTimeout=o elseif n==b.ONCLOCK then m.callbacks.onClock=o elseif n==b.ONEVENT then m.callbacks.onEvent=o elseif n==b.ONFOCUS then m.callbacks.onFocus=o elseif n==b.ONKEY then m.callbacks.onKey=o elseif n==b.ONCHAR then m.callbacks.onChar=o elseif n==b.ONMOUSESCROLL then m.callbacks.onMouseScroll=o end end,get_computer_type=function()local p=b.COMPUTER;if turtle then p=b.TURTLE elseif pocket then p=b.POCKET end;return p,term.isColor()end,expect=function(q,...)local r={...}local s="[/%.,]"q=q or"unknown"q=tostring(q)local t=false;local u;for v=1,#r,2 do local w=tostring(r[v])local x=true;local y;for z,A in next,f.split(w,s)do local B=r[v+1]local C=type(B)if C~=A then y=C else x=false;break end end;if x then local D=w:gsub(s,", ")u=string.format("\"%s\": Bad argument #%d (expected %s, got %s)",q,(v+1)/2,D,y)t=true;break end end;if t then error(u,3)return false end;return true end}f={magic_characters={"(",")",".","%","+","-","*","?","[","]","^","$"},join=function(E,F)if not F then F=""end;local G=""for d=1,#E do local H=E[d]G=G..tostring(H)if d<#E then G=G..F end end;return G end,split=function(G,F)if not string.find(G,F)then return{G}end;local I={}local J="(.-)"..F.."()"local K;for L,M in string.gfind(G,J)do table.insert(I,L)K=M end;table.insert(I,string.sub(G,K))return I end,compare_versions=function(N,O)local P=f.split(N,".")local Q=f.split(O,".")local R=#P;local S=#Q;for v=1,math.min(R,S)do if tonumber(P[v])>tonumber(Q[v])then return 1 elseif tonumber(P[v])<tonumber(Q[v])then return-1 end end;if R>S then return 1 elseif R<S then return-1 end;return 0 end,escape_magic_characters=function(G)for d,T in next,f.magic_characters do G=G:gsub("[%"..T.."]",'%%%'..T)end;return G end,get_extension=function(U)local V,W=U:gsub(".*%.","")if W>0 then return V end;return""end,format_number=function(X,Y)X=tostring(X)Y=Y or 0;local Z=X:gsub("(.*)%..*","%1")if Y<=0 then return Z end;local _=#Z+1;local a0=X:sub(_+1,_+Y)a0=a0:reverse():gsub("0*(.*)","%1"):reverse()if#a0>0 then return Z.."."..a0 end;return Z end,trim=function(G)return G:gsub("^%s*(.-)%s*$","%1")end}g={Vector2={new=function(a1,a2)local a3={x=a1 or 0,y=a2 or 0}setmetatable(a3,g.Vector2)return a3 end,duplicate=function(self)return g.Vector2.new(self.x,self.y)end,length_sq=function(self)return math.pow(self.x,2)+math.pow(self.y,2)end,length=function(self)return math.sqrt(self:length_sq())end,unit=function(self)return self/self:length()end,dot=function(self,a4)return self.x*a4.x+self.y*a4.y end,cross=function(self,a4)return self.x*a4.y-self.y*a4.x end,rotate=function(self,a5)local a6=math.cos(a5)local a7=math.sin(a5)return g.Vector2.new(a6*self.x-a7*self.y,a7*self.x+a6*self.y)end,string=function(self,Y)if Y then return string.format("(%."..tostring(Y).."f; %."..tostring(Y).."f)",self.x,self.y)else return string.format("(%f; %f)",self.x,self.y)end end,__tostring=function(self)return self:string(0)end,__add=function(self,a4)return g.Vector2.new(self.x+a4.x,self.y+a4.y)end,__sub=function(self,a4)return g.Vector2.new(self.x-a4.x,self.y-a4.y)end,__mul=function(self,X)if type(self)=="number"then return g.Vector2.new(X.x*self,X.y*self)else return g.Vector2.new(self.x*X,self.y*X)end end,__div=function(self,X)return g.Vector2.new(self.x/X,self.y/X)end,__eq=function(self,a4)return self.x==a4.x and self.y==a4.y end,__lt=function(self,a4)return self:length_sq()<a4:length_sq()end,__le=function(self,a4)return self:length_sq()<=a4:length_sq()end},Vector3={new=function(a1,a2,a8)local a9={x=a1 or 0,y=a2 or 0,z=a8 or 0}setmetatable(a9,g.Vector3)return a9 end,duplicate=function(self)return g.Vector3.new(self.x,self.y,self.z)end,length_sq=function(self)return math.pow(self.x,2)+math.pow(self.y,2)+math.pow(self.z,2)end,length=function(self)return math.sqrt(self:length_sq())end,unit=function(self)return self/self:length()end,dot=function(self,a4)return self.x*a4.x+self.y*a4.y+self.z*a4.z end,cross=function(self,a4)return g.Vector3.new(self.y*a4.z-self.z*a4.y,self.z*a4.x-self.x*a4.z,self.x*a4.y-self.y*a4.x)end,rotate=function(self,aa,a5)local a6=math.cos(a5)return a6*self+math.sin(a5)*aa:cross(self)+(1-a6)*aa:dot(self)*aa end,string=function(self,Y)if Y then return string.format("(%."..tostring(Y).."f; %."..tostring(Y).."f; %."..tostring(Y).."f)",self.x,self.y,self.z)else return string.format("(%f; %f; %f)",self.x,self.y,self.z)end end,__tostring=function(self)return self:string(0)end,__add=function(self,a4)return g.Vector3.new(self.x+a4.x,self.y+a4.y,self.z+a4.z)end,__sub=function(self,a4)return g.Vector3.new(self.x-a4.x,self.y-a4.y,self.z-a4.z)end,__mul=function(self,X)if type(self)=="number"then return g.Vector3.new(X.x*self,X.y*self,X.z*self)else return g.Vector3.new(self.x*X,self.y*X,self.z*X)end end,__div=function(self,X)return g.Vector3.new(self.x/X,self.y/X,self.z/X)end,__eq=function(self,a4)return self.x==a4.x and self.y==a4.y and self.z==a4.z end,__lt=function(self,a4)return self:length_sq()<a4:length_sq()end,__le=function(self,a4)return self:length_sq()<=a4:length_sq()end},map=function(H,ab,ac,ad,ae,af)local ag=(H-ab)/(ac-ab)*(ae-ad)+ad;if af then return g.constrain(ag,ad,ae)end;return ag end,constrain=function(H,ah,ai)return math.min(ai,math.max(ah,H))end,round=function(X)return math.floor(X+0.5)end,round_numbers=function(...)local aj={...}local ak={}for d,X in next,aj do table.insert(ak,g.round(X))end;return table.unpack(ak)end,floor_numbers=function(...)local aj={...}local al={}for d,X in next,aj do table.insert(al,math.floor(X))end;return table.unpack(al)end,ceil_numbers=function(...)local aj={...}local am={}for d,X in next,aj do table.insert(am,math.ceil(X))end;return table.unpack(am)end}g.Vector2.__index=g.Vector2;g.Vector3.__index=g.Vector3;g.Vector2.ONE=g.Vector2.new(1,1)g.Vector2.UP=g.Vector2.new(0,-1)g.Vector2.DOWN=g.Vector2.new(0,1)g.Vector2.LEFT=g.Vector2.new(-1,0)g.Vector2.RIGHT=g.Vector2.new(1,0)g.Vector2.ZERO=g.Vector2.new(0,0)g.Vector3.ONE=g.Vector3.new(1,1,1)g.Vector3.UP=g.Vector3.new(0,1,0)g.Vector3.DOWN=g.Vector3.new(0,-1,0)g.Vector3.LEFT=g.Vector3.new(-1,0,0)g.Vector3.RIGHT=g.Vector3.new(1,0,0)g.Vector3.FORWARD=g.Vector3.new(0,0,1)g.Vector3.BACK=g.Vector3.new(0,0,-1)g.Vector3.ZERO=g.Vector3.new(0,0,0)h={has_value=function(E,H)for an,ao in next,E do if ao==H then return true,an end end;return false,nil end,has_key=function(E,d)if E[d]~=nil then return true,E[d]end;return false,nil end,serialise=function(E,ap,aq,ar,as,at,au,av)local ap=ap or 0;local at=at or"  "local aw=0;local au=au or"\n"local av=av or" "if not aq then at,au,av="","",""end;local function ax(E)local ay=at:rep(aw+1)local az="{"..au;local function aA(E)for d,H in next,E do local aB=type(d)local aC;if aB=="string"then aC=string.format("%q",d)else aC=tostring(d)end;if not as and d=="__index"then H={}end;local aD=type(H)local aE=tostring(H)az=az..string.format("%s[%s]%s=%s",ay,aC,av,av)if aD=="table"then if aw<ap then aw=aw+1;az=az..ax(H)aw=aw-1 else az=az.."{}"end elseif aD=="string"or aD=="function"then az=az..string.format("%q",aE)else az=az..string.format("%s",aE)end;if next(E,d)then az=az..","..au else az=az..au end end end;local aF=getmetatable(E)if ar and aF then aA(aF)if next(E)then az=az:sub(1,#az-#au)..","..az:sub(#az-#au+1)end end;aA(E)az=az..at:rep(aw).."}"return az end;return ax(E)end,unserialise=textutils.unserialise,unserialize=textutils.unserialize}h.serialize=h.serialise;i={colors={[1]="0",[2]="1",[4]="2",[8]="3",[16]="4",[32]="5",[64]="6",[128]="7",[256]="8",[512]="9",[1024]="a",[2048]="b",[4096]="c",[8192]="d",[16384]="e",[32768]="f"},color_to_paint=function(aG)return i.colors[aG]end,paint_to_color=function(aH)local aI,aG=h.has_value(i.colors,aH)if aI then return aG end end}j={is_area_pressed=function(aJ,aK,a1,a2,aL,aM)if aJ>=a1 and aJ<a1+aL then if aK>=a2 and aK<a2+aM then return true end end;return false end,format_event_table=function(aN)local n={}n.name=aN[1]if n.name=="mouse_click"then n.name=b.TOUCH;n.from="terminal"n.button=aN[2]n.x=aN[3]n.y=aN[4]return n elseif n.name=="monitor_touch"then n.name=b.TOUCH;n.from=aN[2]n.button=1;n.x=aN[3]n.y=aN[4]return n elseif n.name=="mouse_drag"then n.name=b.MOUSEDRAG;n.button=aN[2]n.x=aN[3]n.y=aN[4]return n elseif n.name=="mouse_up"then n.name=b.MOUSEUP;n.button=aN[2]n.x=aN[3]n.y=aN[4]return n elseif n.name=="mouse_scroll"then n.name=b.MOUSESCROLL;n.direction=aN[2]n.x=aN[3]n.y=aN[4]return n elseif n.name=="char"then n.name=b.CHAR;n.char=aN[2]return n elseif n.name=="key"then n.name=b.KEY;n.key=aN[2]return n elseif n.name=="key_up"then n.name=b.KEYUP;n.key=aN[2]return n elseif n.name=="paste"then n.name=b.PASTE;n.paste=aN[2]return n end;table.remove(aN,1)n.parameters=aN;return n end}k={_path="/.settings",set=function(aO,H)settings.set(aO,H)settings.save(k._path)end,unset=function(aO)settings.unset(aO)settings.save(k._path)end,get=function(aO)return settings.get(aO)end}l={get_monitors=function(aP)local aQ={}for d,aR in next,aP do if aR=="terminal"then aQ[aR]=term else if peripheral.getType(aR)=="monitor"then aQ[aR]=peripheral.wrap(aR)end end end;return aQ end,better_print=function(aS,aT,aU,...)local aV=f.join({...},"")local aW=aS.getTextColor()local aX=aS.getBackgroundColor()if aT then aS.setTextColor(aT)end;if aU then aS.setBackgroundColor(aU)end;print(aV)aS.setTextColor(aW)aS.setBackgroundColor(aX)end,better_clear=function(aS)aS.clear()aS.setCursorPos(1,1)end}local aY={frame={pixels={},background=nil},screens={terminal=term},clear_after_draw=true,buffer={pixels={},background=colors.black,is_pixel_custom=function(self,a1,a2)if self.pixels[a1]then if self.pixels[a1][a2]then return true end end;return false end,get_pixel=function(self,a1,a2)if self:is_pixel_custom(a1,a2)then return self.pixels[a1][a2]end;return{char=" ",foreground=self.background,background=self.background}end,set_pixel=function(self,a1,a2,char,aT,aU)local aZ=self:get_pixel(a1,a2)if char and#char==1 then aZ.char=char end;aZ.foreground=aT or aZ.background;aZ.background=aU or aZ.background;if not self.pixels[a1]then self.pixels[a1]={}end;self.pixels[a1][a2]=aZ end,clear=function(self)self.pixels={}end},set_screens=function(self,a_)self.screens=l.get_monitors(a_)end,set_monitors=function(self,aP)self:set_screens(aP)end,clear=function(self)self.buffer:clear()end,draw=function(self)local b0=self.screens;local b1=self.buffer;for b2,b3 in next,b0 do local b4,b5=b3.getCursorPos()local aL,aM=b3.getSize()for a2=1,aM do local b6={text="",background="",foreground=""}for a1=1,aL do local aZ=b1:get_pixel(a1,a2)b6.text=b6.text..aZ.char;b6.background=b6.background..i.colors[aZ.background]b6.foreground=b6.foreground..i.colors[aZ.foreground]end;b3.setCursorPos(1,a2)b3.blit(b6.text,b6.foreground,b6.background)end;b3.setCursorPos(b4,b5)end;self.frame.pixels=self.buffer.pixels;self.frame.background=self.buffer.background;if self.clear_after_draw then self:clear()end end,point=function(self,a1,a2,aG)self.buffer:set_pixel(a1,a2," ",aG,aG)end,write=function(self,a1,a2,b7,aT,aU)for b8=0,#b7-1 do char=b7:sub(b8+1,b8+1)self.buffer:set_pixel(a1+b8,a2,char,aT,aU)end end,rectangle=function(self,a1,a2,aL,aM,aG)for b8=0,aL-1 do for b9=0,aM-1 do self:point(a1+b8,a2+b9,aG)end end end,line=function(self,ba,bb,bc,bd,aG)local function be(ba,bb,bc,bd)local bf=1;if ba>bc then bf=-1 end;local bg=bc-ba;local bh=bd-bb;local bi=1;if bh<0 then bi=-1;bh=-bh end;local bj=2*bh-bg;local a2=bb;for a1=ba,bc,bf do self:point(a1,a2,aG)if bj>0 then a2=a2+bi;bj=bj-2*bg end;bj=bj+2*bh end end;local function bk(ba,bb,bc,bd)local bf=1;if bb>bd then bf=-1 end;local bg=bc-ba;local bh=bd-bb;local bl=1;if bg<0 then bl=-1;bg=-bg end;local bj=2*bg-bh;local a1=ba;for a2=bb,bd,bf do self:point(a1,a2,aG)if bj>0 then a1=a1+bl;bj=bj-2*bh end;bj=bj+2*bg end end;if math.abs(bd-bb)<math.abs(bc-ba)then if ba>bc then be(bc,bd,ba,bb)else be(ba,bb,bc,bd)end else if bb>bd then bk(bc,bd,ba,bb)else bk(ba,bb,bc,bd)end end end,circle=function(self,bm,bn,bo,aG)local bp=bo*bo;self:point(bm,bn+bo,aG)self:point(bm,bn-bo,aG)self:point(bm+bo,bn,aG)self:point(bm-bo,bn,aG)local a1=1;local a2=math.floor(math.sqrt(bp-1)+0.5)while a1<a2 do self:point(bm+a1,bn+a2,aG)self:point(bm+a1,bn-a2,aG)self:point(bm-a1,bn+a2,aG)self:point(bm-a1,bn-a2,aG)self:point(bm+a2,bn+a1,aG)self:point(bm+a2,bn-a1,aG)self:point(bm-a2,bn+a1,aG)self:point(bm-a2,bn-a1,aG)a1=a1+1;a2=math.floor(math.sqrt(bp-a1*a1)+0.5)end;if a1==a2 then self:point(bm+a1,bn+a2,aG)self:point(bm+a1,bn-a2,aG)self:point(bm-a1,bn+a2,aG)self:point(bm-a1,bn-a2,aG)end end}local bq={pressed_keys={},reset=function(self)self.pressed_keys={}end,is_key_pressed=function(self,br,d)if self.pressed_keys[d]then if br then self:remove_key(d)end;return true end;return false end,are_keys_pressed=function(self,bs,...)local keys={...}if not(#keys>0)then return false end;for bt,d in next,keys do if not self:is_key_pressed(false,d)then return false end end;if bs then self:remove_keys(table.unpack(keys))end;return true end,add_key=function(self,d)self.pressed_keys[d]=true end,remove_key=function(self,d)self.pressed_keys[d]=nil end,remove_keys=function(self,...)local keys={...}for bt,d in next,keys do self:remove_key(d)end end,manage_event=function(self,bu)if bu.name==b.KEY then self:add_key(bu.key)elseif bu.name==b.KEYUP then self:remove_key(bu.key)end end}local bv={}bv={side=nil,protocol="YAGUI-"..a.ver.."_WSS",host_prefix="_Host:",default_timeout=0.5,open=function(self,bw)rednet.open(bw)self.side=bw end,close=function(self)rednet.close(self.side)self.side=nil end,server={root={},servername=nil,hostname=nil,host=function(self,bx)if not bx then bx=os.getComputerID()end;bx=tostring(bx)local by=self.root.protocol..self.root.host_prefix..bx;if rednet.lookup(by,bx)then return false,bx end;rednet.host(by,bx)self.servername=by;self.hostname=bx;return true,bx end,unhost=function(self)rednet.broadcast(b.DISCONNECTED,self.servername)rednet.unhost(self.servername,self.hostname)self.servername=nil;self.hostname=nil end,broadcast=function(self)rednet.broadcast(aY.frame,self.servername)end},client={root={},servername=nil,host_id=nil,connect=function(self,bx)bx=tostring(bx)local by=self.root.protocol..self.root.host_prefix..bx;local bz=rednet.lookup(by,bx)if not bz then return false,bx end;self.servername=by;self.host_id=bz;return true,bx end,disconnect=function(self)self.servername=nil;self.host_id=nil end,listen=function(self,bA)if not bA then bA=self.root.default_timeout end;local bB={rednet.receive(self.servername,bA)}if bB[1]==self.host_id then local b1=bB[2]if not b1 then return false end;if b1==b.DISCONNECTED then return b1 end;aY.buffer.background=b1.background;aY.buffer.pixels=b1.pixels;return true end;return false end}}bv.server.root=bv;bv.client.root=bv;local bC={}bC={Clock={new=function(bD)local bE={enabled=true,oneshot=false,clock=os.clock(),interval=bD,callbacks={onClock=function()end}}setmetatable(bE,bC.Clock)return bE end,event=function(self,bu)if not self.enabled then self:reset_timer()return end;if os.clock()>=self.clock+self.interval then self:reset_timer()self.callbacks.onClock(self,bu)if self.oneshot then self:stop()end end end,start=function(self)self:reset_timer()self.enabled=true end,stop=function(self)self.enabled=false end,reset_timer=function(self)self.clock=os.clock()end},Label={new=function(a1,a2,b7,aT,aU)local bF={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,text_alignment=b.ALIGN_CENTER,text=b7,pos=g.Vector2.new(a1,a2),colors={foreground=aT,background=aU},callbacks={onDraw=function()end}}setmetatable(bF,bC.Label)return bF end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)local bG=f.split(self.text,"\n")if self.text_alignment==b.ALIGN_LEFT then for d,bH in next,bG do aY:write(self.pos.x,self.pos.y+d-1,bH,self.colors.foreground,self.colors.background)end elseif self.text_alignment==b.ALIGN_CENTER then local bI=0;for d,bH in next,bG do if d==1 then bI=math.floor(#bH/2)aY:write(self.pos.x,self.pos.y,bH,self.colors.foreground,self.colors.background)else aY:write(self.pos.x+bI-math.floor(#bH/2),self.pos.y+d-1,bH,self.colors.foreground,self.colors.background)end end end end},Button={new=function(a1,a2,aL,aM,b7,aT,bJ,bK)local bL={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,active=false,shortcut_once=true,shortcut={},text_alignment=b.ALIGN_CENTER,text=b7,pos=g.Vector2.new(a1,a2),size=g.Vector2.new(aL,aM),timed={enabled=false,clock=bC.Clock.new(0.5)},colors={foreground=aT,active_background=bJ,unactive_background=bK},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onTimeout=function()end}}bL.timed.clock.binded_button=bL;bL.timed.clock.oneshot=true;bL.timed.clock:stop()e.set_callback(bL.timed.clock,b.ONCLOCK,function(self,bu)self.binded_button.active=false;self.binded_button.callbacks.onPress(self.binded_button,bu)self.binded_button.callbacks.onTimeout(self.binded_button,bu)end)setmetatable(bL,bC.Button)return bL end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)if self.active then aY:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.active_background)else aY:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.unactive_background)end;local bG=f.split(self.text,"\n")local bM=math.floor((self.size.y-#bG)/2)+self.pos.y;for b9=0,#bG-1 do local bH=bG[b9+1]local bN;if self.text_alignment==b.ALIGN_LEFT then bN=self.pos.x elseif self.text_alignment==b.ALIGN_CENTER then bN=math.floor((self.size.x-#bH)/2)+self.pos.x end;aY:write(bN,bM+b9,bH,self.colors.foreground)end end,event=function(self,bu)if self.hidden then return false end;if bu.name==b.TOUCH then if j.is_area_pressed(bu.x,bu.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self:press(bu)return true else self.callbacks.onFailedPress(self,bu)end elseif bq:are_keys_pressed(self.shortcut_once,table.unpack(self.shortcut))then self:press(bu)end;if self.timed.enabled then self.timed.clock:event(bu)end end,press=function(self,bu)if self.timed.enabled then self.timed.clock:start()if not self.active then self.active=true;self.callbacks.onPress(self,bu)end else self.active=not self.active;self.callbacks.onPress(self,bu)end end},Progressbar={new=function(a1,a2,aL,aM,bO,ah,ai,aT,bP,bQ)local bR={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,active=false,pos=g.Vector2.new(a1,a2),size=g.Vector2.new(aL,aM),value={max=ai,min=ah,current=bO,draw_percentage=true,percentage_precision=2},colors={foreground=aT,filled_background=bP,unfilled_background=bQ},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end}}setmetatable(bR,bC.Progressbar)return bR end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)local bS=g.map(self.value.current,self.value.min,self.value.max,0,1,true)local bT=math.floor(self.size.x*bS)aY:rectangle(self.pos.x,self.pos.y,bT,self.size.y,self.colors.filled_background)aY:rectangle(self.pos.x+bT,self.pos.y,self.size.x-bT,self.size.y,self.colors.unfilled_background)if self.value.draw_percentage then local bU=f.format_number(bS*100,self.value.percentage_precision).."%"local bV=math.floor((self.size.x-#bU)/2)+self.pos.x;local bM=math.floor((self.size.y-1)/2)+self.pos.y;aY:write(bV,bM,bU,self.colors.foreground)end end,event=function(self,bu)if self.hidden then return false end;if bu.name==b.TOUCH then if j.is_area_pressed(bu.x,bu.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.callbacks.onPress(self,bu)end end end,set=function(self,H)local bW=g.constrain(H,self.value.min,self.value.max)self.value.current=bW end},Memo={new=function(a1,a2,aL,aM,aT,aU)local bX={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,pos=g.Vector2.new(a1,a2),size=g.Vector2.new(aL,aM),editable=true,lines={},first_visible_line=1,first_visible_char=1,cursor={visible=false,text=" ",blink=bC.Clock.new(0.5),pos=g.Vector2.new(1,1)},limits=g.Vector2.new(0,0),whitelist={},blacklist={},colors={foreground=aT,background=aU,cursor=colors.white,cursor_text=colors.black},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onFocus=function()end,onKey=function()end,onChar=function()end,onMouseScroll=function()end}}bX.cursor.blink.binded_cursor=bX.cursor;e.set_callback(bX.cursor.blink,b.ONCLOCK,function(self,bu)self.binded_cursor.visible=not self.binded_cursor.visible end)setmetatable(bX,bC.Memo)return bX end,draw=function(self)if self.hidden then return end;aY:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.background)local bY=self.cursor.pos.x-self.first_visible_char;local bZ=self.cursor.pos.y-self.first_visible_line;for a2=1,self.size.y do local bH=self.lines[a2+self.first_visible_line-1]or""local b_=bH:sub(self.first_visible_char,self.first_visible_char+self.size.x-1)aY:write(self.pos.x,self.pos.y+a2-1,b_,self.colors.foreground)end;if self.cursor.visible and bY>=0 and bY<self.size.x and bZ>=0 and bZ<self.size.y then aY:write(bY+self.pos.x,bZ+self.pos.y,self.cursor.text,self.colors.cursor_text,self.colors.cursor)end end,event=function(self,bu)if self.hidden then return false end;if not self.editable then return false end;if bu.name==b.TOUCH then if j.is_area_pressed(bu.x,bu.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then local a1=bu.x-self.pos.x;local a2=bu.y-self.pos.y;self:set_cursor(a1+self.first_visible_char,a2+self.first_visible_line)self:focus(true,bu)self.callbacks.onPress(self,bu)return true else self:focus(false,bu)self.callbacks.onFailedPress(self,bu)return false end elseif bu.name==b.DELETED then self:focus(false,bu)return false end;if self.focussed then self.cursor.blink:event(self.cursor.blink,bu)if bu.name==b.PASTE then self:write(bu.paste)elseif bu.name==b.CHAR then if self.callbacks.onChar(self,bu)then return true end;self:write(bu.char)elseif bu.name==b.KEY then if self.callbacks.onKey(self,bu)then return true end;if bu.key==b.KEY_UP then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y-1)elseif bu.key==b.KEY_DOWN then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+1)elseif bu.key==b.KEY_RIGHT then local bH=self.lines[self.cursor.pos.y]if self.lines[self.cursor.pos.y+1]and self.cursor.pos.x>=#bH+1 then self:set_cursor(1,self.cursor.pos.y+1)else self:set_cursor(self.cursor.pos.x+1,self.cursor.pos.y)end elseif bu.key==b.KEY_LEFT then if self.cursor.pos.x<=1 and self.cursor.pos.y>1 then local c0=self.lines[self.cursor.pos.y-1]self:set_cursor(#c0+1,self.cursor.pos.y-1)else self:set_cursor(self.cursor.pos.x-1,self.cursor.pos.y)end elseif bu.key==b.KEY_BACKSPACE then local bH=self.lines[self.cursor.pos.y]if self.cursor.pos.x<=1 then if self.cursor.pos.y>1 then table.remove(self.lines,self.cursor.pos.y)local c1=#self.lines[self.cursor.pos.y-1]+1;local c2=self.cursor.pos.y-1;self:set_cursor(c1,c2)self:write(bH)self:set_cursor(c1,c2)end else self.lines[self.cursor.pos.y]=bH:sub(1,self.cursor.pos.x-2)..bH:sub(self.cursor.pos.x)self:set_cursor(self.cursor.pos.x-1,self.cursor.pos.y)end elseif bu.key==b.KEY_DELETE then local bH=self.lines[self.cursor.pos.y]local c3=bH:sub(self.cursor.pos.x)if#c3>0 then self.lines[self.cursor.pos.y]=bH:sub(1,self.cursor.pos.x-1)..bH:sub(self.cursor.pos.x+1)else local c4=self.lines[self.cursor.pos.y+1]if c4 then local c1=self.cursor.pos.x;local c2=self.cursor.pos.y;table.remove(self.lines,self.cursor.pos.y+1)self:write(c4)self:set_cursor(c1,c2)end end elseif bu.key==b.KEY_ENTER then local c5=self.lines[self.cursor.pos.y]:sub(0,self.cursor.pos.x-1)local c6=c5:gsub("(%s*).*","%1")self:write("\n"..c6)elseif bu.key==b.KEY_TAB then self:write("  ")end elseif bu.name==b.MOUSESCROLL then if self.callbacks.onMouseScroll(self,bu)then return true end;self.first_visible_line=g.constrain(self.first_visible_line+bu.direction,1,#self.lines)end;return true end end,focus=function(self,c7,bu)if c7 then self.focussed=true;self.callbacks.onFocus(self,bu)else self.focussed=false;self.cursor.visible=false;self.callbacks.onFocus(self,bu)end end,set_cursor=function(self,c1,c2,c8)if not self.lines[1]then self.lines[1]=""end;if self.limits.y>0 then c2=g.constrain(c2,1,self.limits.y)end;if c8 then for a2=#self.lines+1,c2 do if not self.lines[a2]then self.lines[a2]=""end end else c2=g.constrain(c2,1,#self.lines)end;c1=g.constrain(c1,1,#self.lines[c2]+1)self.cursor.pos=g.Vector2.new(c1,c2)local bY=self.cursor.pos.x-self.first_visible_char;local bZ=self.cursor.pos.y-self.first_visible_line;if bY>=self.size.x then self.first_visible_char=self.first_visible_char+bY-self.size.x+1 elseif bY<0 then self.first_visible_char=self.first_visible_char+bY end;if bZ>=self.size.y then self.first_visible_line=self.first_visible_line+bZ-self.size.y+1 elseif bZ<0 then self.first_visible_line=self.first_visible_line+bZ end end,write=function(self,...)local b7=f.join({...},"")local bG=f.split(b7,"\n")self:set_cursor(self.cursor.pos.x,self.cursor.pos.y,true)if#self.whitelist>0 then local J="[^"..f.escape_magic_characters(f.join(self.whitelist,"")).."]"for d,bH in next,bG do bG[d]=bH:gsub(J,"")end elseif#self.blacklist>0 then local J="["..f.escape_magic_characters(f.join(self.blacklist,"")).."]"for d,bH in next,bG do bG[d]=bH:gsub(J,"")end end;if self.limits.y>0 then for a2=1,#self.lines+#bG-1-self.limits.y do table.remove(bG)end;if#bG==0 then return end end;if#bG>1 then for c9,bH in next,bG do if c9==1 then local ca=self.lines[self.cursor.pos.y]local cb=ca:sub(1,self.cursor.pos.x-1)local c3=ca:sub(self.cursor.pos.x)local cc=bG[#bG]if self.limits.x>0 then bH=bH:sub(1,self.limits.x-#cb)cc=cc:sub(1,self.limits.x-#c3)end;self.lines[self.cursor.pos.y]=cb..bH;table.insert(self.lines,self.cursor.pos.y+1,cc..c3)self:set_cursor(#cc+1,self.cursor.pos.y+1)elseif c9==#bG then break else if self.limits.x>0 then bH=bH:sub(1,self.limits.x)end;table.insert(self.lines,self.cursor.pos.y,bH)self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+1)end end else local ca=self.lines[self.cursor.pos.y]local cb=ca:sub(1,self.cursor.pos.x-1)local c3=ca:sub(self.cursor.pos.x)if self.limits.x>0 then bG[1]=bG[1]:sub(1,self.limits.x-(#cb+#c3))end;self.lines[self.cursor.pos.y]=cb..bG[1]..c3;self:set_cursor(self.cursor.pos.x+#bG[1],self.cursor.pos.y)end end,print=function(self,...)local b7=f.join({...},"\n").."\n"self:write(b7)end,clear=function(self)self.lines={""}self:set_cursor(1,1)end},Window={new=function(a1,a2,aL,aM,aU,cd)local ce={draw_priority=b.HIGH_PRIORITY,focussed=false,hidden=false,pos=g.Vector2.new(a1,a2),size=g.Vector2.new(aL,aM),drag_options={enabled=true,from=g.Vector2.new(1,1)},shadow={enabled=cd,offset=g.Vector2.new(1,1)},elements={},colors={background=aU,shadow=colors.black},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onFocus=function()end}}setmetatable(ce,bC.Window)return ce end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)if self.shadow.enabled then aY:rectangle(self.pos.x+self.shadow.offset.x,self.pos.y+self.shadow.offset.y,self.size.x,self.size.y,self.colors.shadow)end;aY:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.background)self:draw_elements()end,event=function(self,bu)if self.hidden then return false end;local cf=self:event_elements(bu)if not cf then if bu.name==b.TOUCH then if j.is_area_pressed(bu.x,bu.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.drag_options.from=g.Vector2.new(bu.x,bu.y)self.focussed=true;self.callbacks.onPress(self,bu)self.callbacks.onFocus(self,bu)return true else self.focussed=false;self.callbacks.onFailedPress(self,bu)self.callbacks.onFocus(self,bu)end elseif bu.name==b.MOUSEDRAG and self.focussed then self:drag(bu.x,bu.y)return true elseif bu.name==b.DELETED then self.focussed=false;self.callbacks.onFocus(self,bu)end else self.focussed=false;self.callbacks.onFocus(self,bu)end;return cf end,drag=function(self,a1,a2)if self.drag_options.enabled then local cg=g.Vector2.new(a1-self.drag_options.from.x,a2-self.drag_options.from.y)self.pos=self.pos+cg;for d,ch in next,self.elements do if ch.pos then ch.pos=ch.pos+cg end end;self.drag_options.from=g.Vector2.new(a1,a2)end end,set_elements=function(self,ci,cj)self.elements={}for d,ch in next,ci do if cj then ch.pos=self.pos+ch.pos-g.Vector2.ONE end;table.insert(self.elements,ch)end end,draw_elements=function(self)for d=#self.elements,1,-1 do local ch=self.elements[d]if ch.draw then ch:draw()end end end,event_elements=function(self,bu)local cf=false;for d,ch in next,self.elements do if ch.event then local ck=ch:event(bu)cf=cf or ck;if ck then bu={name=b.DELETED}end end end;return cf end}}bC.Clock.__index=bC.Clock;bC.Label.__index=bC.Label;bC.Button.__index=bC.Button;bC.Progressbar.__index=bC.Progressbar;bC.Memo.__index=bC.Memo;bC.Window.__index=bC.Window;local cl={}cl={new=function(cm,cn)local co={options={enabled=false,FPS_target=cm,EPS_target=cn},monitors={terminal=term},elements={high_priority={},low_priority={},loop={clock=bC.Clock.new(1/cm),stats_clock=bC.Clock.new(1),FPS_label=bC.Label.new(1,1,"1 FPS",colors.white),EPS_label=bC.Label.new(1,2,"1 EPS",colors.white)}},stats={pos=g.Vector2.new(1,1),elements=nil,enabled=true,enable=function(self,cp)self.enabled=cp;self.elements.stats_clock.enabled=cp;self.elements.FPS_label.hidden=not cp;self.elements.EPS_label.hidden=not cp end,update_pos=function(self)self.elements.FPS_label.pos=self.pos;self.elements.EPS_label.pos=self.pos+g.Vector2.DOWN end,FPS=0,EPS=0},callbacks={onStart=function()end,onStop=function()end,onDraw=function()end,onClock=function()end,onEvent=function()end}}co.elements.loop.stats_clock.stats=co.stats;co.stats.elements=co.elements.loop;e.set_callback(co.elements.loop.stats_clock,b.ONCLOCK,function(self,bu)self.stats:update_pos()self.stats.elements.FPS_label.text=tostring(self.stats.FPS).." FPS"self.stats.elements.EPS_label.text=tostring(self.stats.EPS).." EPS"self.stats.FPS=0;self.stats.EPS=0 end)co.stats:enable(false)setmetatable(co,cl)return co end,set_monitors=function(self,aP)self.monitors=l.get_monitors(aP)end,set_elements=function(self,ci)self.elements.high_priority={}self.elements.low_priority={}for d,H in next,ci do if H.draw_priority==b.HIGH_PRIORITY then table.insert(self.elements.high_priority,H)else table.insert(self.elements.low_priority,H)end end end,draw_elements=function(self)local function cq(E)for d=#E,1,-1 do local ch=E[d]if ch.draw then ch:draw()end end end;self.callbacks.onDraw(self)local cr=aY.screens;aY.screens=self.monitors;cq(self.elements.low_priority)cq(self.elements.high_priority)for d,ch in next,self.elements.loop do if ch.draw then ch:draw()end end;aY:draw()aY.screens=cr;if self.stats.enabled then self.stats.FPS=self.stats.FPS+1 end end,event_elements=function(self,bu)local function aN(E)for d,ch in next,E do if ch.event then if ch:event(bu)then bu={name=b.DELETED}end end end end;if self.callbacks.onEvent(self,bu)then bu={name=b.DELETED}end;if bu.name==b.TOUCH then local cs=false;for ct,aS in next,self.monitors do if bu.from==ct then cs=true;break end end;if not cs then bu={name=b.DELETED}end end;aN(self.elements.loop)local cu={}for d,ch in next,self.elements.high_priority do if ch.event then local cv=ch:event(bu)if cv then bu={name=b.DELETED}if self.elements.high_priority~=ch then table.insert(cu,{element=ch,key=d})end end end end;if#cu>0 then for d,H in next,cu do table.insert(self.elements.high_priority,1,H.element)table.remove(self.elements.high_priority,H.key+#cu)end end;aN(self.elements.low_priority)if self.stats.enabled then self.stats.EPS=self.stats.EPS+1 end end,start=function(self)self.enabled=true;bq:reset()e.set_callback(self.elements.loop.clock,b.ONCLOCK,function(cw,bu)self.callbacks.onClock(self,bu)self:draw_elements()cw.interval=1/self.options.FPS_target end)self.stats:update_pos()self.callbacks.onStart(self)while self.enabled do local cx=os.startTimer(1/self.options.EPS_target)local cy={os.pullEvent()}local bu=j.format_event_table(cy)bq:manage_event(bu)self:event_elements(bu)os.cancelTimer(cx)end;bq:reset()self.callbacks.onStop(self)end,stop=function(self)self.enabled=false end}cl.__index=cl;local cz={...}if cz[1]=="help"then local bG={{text="LIBFILE <COMMAND>",foreground=colors.green,background=nil},{text=" - help (shows this list of commands)",foreground=colors.blue,background=nil},{text=" - info (prints info about the lib)",foreground=colors.yellow,background=nil},{text=" - ver (prints version of the lib)",foreground=colors.green,background=nil},{text=" - copyright (prints copyright of the lib)",foreground=colors.blue,background=nil},{text=" - setup (adds YAGUI_PATH to computer's settings)",foreground=colors.yellow,background=nil},{text=" - create <PATH> (creates a new YAGUI project)",foreground=colors.green,background=nil}}for d,bH in next,bG do l.better_print(term,bH.foreground,bH.background,bH.text)end elseif cz[1]=="info"then l.better_print(term,colors.red,nil,"Library Version: ",a.ver)l.better_print(term,colors.yellow,nil,"Library Author: ",a.author)l.better_print(term,colors.green,nil,"Library Website: ",a.website)l.better_print(term,colors.blue,nil,"Library Documentation: ",a.documentation)elseif cz[1]=="ver"then l.better_print(term,colors.red,nil,"Library Version: ",a.ver)elseif cz[1]=="copyright"then local cA={colors.red,colors.yellow,colors.green}local cB=f.split(a.copyright,"\n\n")for d,cC in next,cB do l.better_print(term,cA[d],nil,cC)if d<#cB then read("")end end elseif cz[1]=="setup"then if shell then local cD="YAGUI_PATH"local U="/"..shell.getRunningProgram()k.set(cD,U)l.better_print(term,colors.green,nil,"Lib path was set to \"",k.get(cD),"\".")else l.better_print(term,colors.red,nil,"SHELL API ISN'T AVAILABLE!")end elseif cz[1]=="create"then if cz[2]then local U=shell.resolve(cz[2])if f.get_extension(U)~="lua"then U=U..".lua"end;if fs.exists(U)then l.better_print(term,colors.red,nil,"PATH: \"/",U,"\" already exists, please use another path or delete it.")else local cE=fs.open(U,"w")cE.write("\n-- AUTO-GENERATED with \"YAGUI create\"\nlocal YAGUI_PATH = settings.get(\"YAGUI_PATH\")\nif not (type(YAGUI_PATH) == \"string\") then printError(\"YAGUI is not installed, please install it by opening it with argument \\\"setup\\\".\"); return; end\nif not fs.exists(YAGUI_PATH) then printError(\"Couldn't find YAGUI in path: \\\"\"..YAGUI_PATH..\"\\\", Please reinstall it by opening it with argument \\\"setup\\\".\"); return; end\nlocal YAGUI = dofile(YAGUI_PATH)\n-- End of AUTO-GENERATED code\n\n")cE.close()l.better_print(term,colors.green,nil,"New project was created at \"/",U,"\".")end else l.better_print(term,colors.red,nil,"You must specify a path to create a new project.")end elseif cz[1]then l.better_print(term,colors.red,nil,"UNKNOWN COMMAND: \"",cz[1],"\"")l.better_print(term,colors.green,nil,"Use \"help\" to get a list of available commands!")end;local cF={info=a,generic_utils=e,string_utils=f,math_utils=g,table_utils=h,color_utils=i,event_utils=j,setting_utils=k,monitor_utils=l,screen_buffer=aY,input=bq,WSS=bv,wireless_screen_share=bv,gui_elements=bC,Loop=cl}for d,H in next,b do cF[d]=H end;return cF
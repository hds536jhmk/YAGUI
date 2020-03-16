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
local a={ver="1.17",author="hds536jhmk",website="https://github.com/hds536jhmk/YAGUI/",documentation="https://hds536jhmk.github.io/YAGUI/",copyright="Copyright (c) 2019, hds536jhmk : https://github.com/hds536jhmk/YAGUI\n\nPermission to use, copy, modify, and/or distribute this software for any\npurpose with or without fee is hereby granted, provided that the above\ncopyright notice and this permission notice appear in all copies.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\" AND THE AUTHOR DISCLAIMS ALL WARRANTIES\nWITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF\nMERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR\nANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES\nWHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN\nACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF\nOR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE."}local b={TOUCH="screen_touch",MOUSEUP="mouse_up",MOUSEDRAG="mouse_drag",MOUSESCROLL="mouse_scroll",CHAR="char",KEY="key",KEYUP="key_up",PASTE="paste",DELETED="DELETED",DISCONNECTED="DISCONNECTED",LOW_PRIORITY=1,HIGH_PRIORITY=2,ONSTART=1,ONSTOP=2,ONDRAW=3,ONPRESS=4,ONFAILEDPRESS=5,ONTIMEOUT=6,ONCLOCK=7,ONEVENT=8,ONFOCUS=9,ONKEY=10,ONCHAR=11,MOUSE_LEFT=1,MOUSE_RIGHT=2,MOUSE_MIDDLE=3,SCROLL_UP=-1,SCROLL_DOWN=1,COMPUTER="computer",TURTLE="turtle",POCKET="pocket",ALIGN_LEFT=1,ALIGN_CENTER=2}for c,d in next,keys do if type(d)=="number"then b["KEY_"..c:upper()]=d end end;local e={set_callback=function(f,g,h)if g==b.ONSTART then f.callbacks.onStart=h elseif g==b.ONSTOP then f.callbacks.onStop=h elseif g==b.ONDRAW then f.callbacks.onDraw=h elseif g==b.ONPRESS then f.callbacks.onPress=h elseif g==b.ONFAILEDPRESS then f.callbacks.onFailedPress=h elseif g==b.ONTIMEOUT then f.callbacks.onTimeout=h elseif g==b.ONCLOCK then f.callbacks.onClock=h elseif g==b.ONEVENT then f.callbacks.onEvent=h elseif g==b.ONFOCUS then f.callbacks.onFocus=h elseif g==b.ONKEY then f.callbacks.onKey=h elseif g==b.ONCHAR then f.callbacks.onChar=h end end,get_computer_type=function()local i=b.COMPUTER;if turtle then i=b.TURTLE elseif pocket then i=b.POCKET end;return i,term.isColor()end}local j={}j={magic_characters={"(",")",".","%","+","-","*","?","[","]","^","$"},join=function(k,l)if not l then l=""end;local m=""for d=1,#k do local n=k[d]m=m..tostring(n)if d<#k then m=m..l end end;return m end,split=function(m,l)local k={}if not(#l>0)then return k end;while true do local o=m:find(l)if o then table.insert(k,m:sub(1,o-1))m=m:sub(o+1)else table.insert(k,m)break end end;return k end,compare_versions=function(p,q)local r=j.split(p,".")local s=j.split(q,".")local t=#r;local u=#s;for v=1,math.min(t,u)do if tonumber(r[v])>tonumber(s[v])then return 1 elseif tonumber(r[v])<tonumber(s[v])then return-1 end end;if t>u then return 1 elseif t<u then return-1 end;return 0 end,escape_magic_characters=function(m)for d,w in next,j.magic_characters do m=m:gsub("[%"..w.."]",'%%%'..w)end;return m end,get_extension=function(x)local y,z=x:gsub(".*%.","")if z>0 then return y end;return""end,format_number=function(A,B)A=tostring(A)B=B or 0;local C=A:gsub("(.*)%..*","%1")if B<=0 then return C end;local D=#C+1;local E=A:sub(D+1,D+B)E=E:reverse():gsub("0*(.*)","%1"):reverse()if#E>0 then return C.."."..E end;return C end}local F={}F={Vector2={new=function(G,H)local I={x=G or 0,y=H or 0}setmetatable(I,F.Vector2)return I end,duplicate=function(self)return F.Vector2.new(self.x,self.y)end,length_sq=function(self)return math.pow(self.x,2)+math.pow(self.y,2)end,length=function(self)return math.sqrt(self:length_sq())end,unit=function(self)return self/self:length()end,dot=function(self,J)return self.x*J.x+self.y*J.y end,cross=function(self,J)return self.x*J.y-self.y*J.x end,rotate=function(self,K)local L=math.cos(K)local M=math.sin(K)return F.Vector2.new(L*self.x-M*self.y,M*self.x+L*self.y)end,string=function(self,B)if B then return string.format("(%."..tostring(B).."f; %."..tostring(B).."f)",self.x,self.y)else return string.format("(%f; %f)",self.x,self.y)end end,__tostring=function(self)return self:string(0)end,__add=function(self,J)return F.Vector2.new(self.x+J.x,self.y+J.y)end,__sub=function(self,J)return F.Vector2.new(self.x-J.x,self.y-J.y)end,__mul=function(self,A)if type(self)=="number"then return F.Vector2.new(A.x*self,A.y*self)else return F.Vector2.new(self.x*A,self.y*A)end end,__div=function(self,A)return F.Vector2.new(self.x/A,self.y/A)end,__eq=function(self,J)return self.x==J.x and self.y==J.y end,__lt=function(self,J)return self:length_sq()<J:length_sq()end,__le=function(self,J)return self:length_sq()<=J:length_sq()end},Vector3={new=function(G,H,N)local O={x=G or 0,y=H or 0,z=N or 0}setmetatable(O,F.Vector3)return O end,duplicate=function(self)return F.Vector3.new(self.x,self.y,self.z)end,length_sq=function(self)return math.pow(self.x,2)+math.pow(self.y,2)+math.pow(self.z,2)end,length=function(self)return math.sqrt(self:length_sq())end,unit=function(self)return self/self:length()end,dot=function(self,J)return self.x*J.x+self.y*J.y+self.z*J.z end,cross=function(self,J)return F.Vector3.new(self.y*J.z-self.z*J.y,self.z*J.x-self.x*J.z,self.x*J.y-self.y*J.x)end,rotate=function(self,P,K)local L=math.cos(K)return L*self+math.sin(K)*P:cross(self)+(1-L)*P:dot(self)*P end,string=function(self,B)if B then return string.format("(%."..tostring(B).."f; %."..tostring(B).."f; %."..tostring(B).."f)",self.x,self.y,self.z)else return string.format("(%f; %f; %f)",self.x,self.y,self.z)end end,__tostring=function(self)return self:string(0)end,__add=function(self,J)return F.Vector3.new(self.x+J.x,self.y+J.y,self.z+J.z)end,__sub=function(self,J)return F.Vector3.new(self.x-J.x,self.y-J.y,self.z-J.z)end,__mul=function(self,A)if type(self)=="number"then return F.Vector3.new(A.x*self,A.y*self,A.z*self)else return F.Vector3.new(self.x*A,self.y*A,self.z*A)end end,__div=function(self,A)return F.Vector3.new(self.x/A,self.y/A,self.z/A)end,__eq=function(self,J)return self.x==J.x and self.y==J.y and self.z==J.z end,__lt=function(self,J)return self:length_sq()<J:length_sq()end,__le=function(self,J)return self:length_sq()<=J:length_sq()end},map=function(n,Q,R,S,T,U)local V=(n-Q)/(R-Q)*(T-S)+S;if U then return F.constrain(V,S,T)end;return V end,constrain=function(n,W,X)return math.min(X,math.max(W,n))end,round=function(A)return math.floor(A+0.5)end,round_numbers=function(...)local Y={...}local Z={}for d,A in next,Y do table.insert(Z,F.round(A))end;return table.unpack(Z)end,floor_numbers=function(...)local Y={...}local _={}for d,A in next,Y do table.insert(_,math.floor(A))end;return table.unpack(_)end,ceil_numbers=function(...)local Y={...}local a0={}for d,A in next,Y do table.insert(a0,math.ceil(A))end;return table.unpack(a0)end}F.Vector2.__index=F.Vector2;F.Vector3.__index=F.Vector3;F.Vector2.ONE=F.Vector2.new(1,1)F.Vector2.UP=F.Vector2.new(0,-1)F.Vector2.DOWN=F.Vector2.new(0,1)F.Vector2.LEFT=F.Vector2.new(-1,0)F.Vector2.RIGHT=F.Vector2.new(1,0)F.Vector2.ZERO=F.Vector2.new(0,0)F.Vector3.ONE=F.Vector3.new(1,1,1)F.Vector3.UP=F.Vector3.new(0,1,0)F.Vector3.DOWN=F.Vector3.new(0,-1,0)F.Vector3.LEFT=F.Vector3.new(-1,0,0)F.Vector3.RIGHT=F.Vector3.new(1,0,0)F.Vector3.FORWARD=F.Vector3.new(0,0,1)F.Vector3.BACK=F.Vector3.new(0,0,-1)F.Vector3.ZERO=F.Vector3.new(0,0,0)local a1={}a1={has_value=function(k,n)for a2,a3 in next,k do if a3==n then return true,a2 end end;return false,nil end,has_key=function(k,d)if k[d]~=nil then return true,k[d]end;return false,nil end,serialise=function(k,a4,a5,a6,a7,a8,a9,aa)local a4=a4 or 0;local a8=a8 or"  "local ab=0;local a9=a9 or"\n"local aa=aa or" "if not a5 then a8,a9,aa="","",""end;local function ac(k)local ad=a8:rep(ab+1)local ae="{"..a9;local function af(k)for d,n in next,k do local ag=type(d)local ah;if ag=="string"then ah=string.format("%q",d)else ah=tostring(d)end;if not a7 and d=="__index"then n={}end;local ai=type(n)local aj=tostring(n)ae=ae..string.format("%s[%s]%s=%s",ad,ah,aa,aa)if ai=="table"then if ab<a4 then ab=ab+1;ae=ae..ac(n)ab=ab-1 else ae=ae.."{}"end elseif ai=="string"or ai=="function"then ae=ae..string.format("%q",aj)else ae=ae..string.format("%s",aj)end;if next(k,d)then ae=ae..","..a9 else ae=ae..a9 end end end;local ak=getmetatable(k)if a6 and ak then af(ak)if next(k)then ae=ae:sub(1,#ae-#a9)..","..ae:sub(#ae-#a9+1)end end;af(k)ae=ae..a8:rep(ab).."}"return ae end;return ac(k)end,unserialise=textutils.unserialise,unserialize=textutils.unserialize}a1.serialize=a1.serialise;local al={}al={colors={[1]="0",[2]="1",[4]="2",[8]="3",[16]="4",[32]="5",[64]="6",[128]="7",[256]="8",[512]="9",[1024]="a",[2048]="b",[4096]="c",[8192]="d",[16384]="e",[32768]="f"},color_to_paint=function(am)return al.colors[am]end,paint_to_color=function(an)local ao,am=a1.has_value(al.colors,an)if ao then return am end end}local ap={is_area_pressed=function(aq,ar,G,H,as,at)if aq>=G and aq<G+as then if ar>=H and ar<H+at then return true end end;return false end,format_event_table=function(au)local g={}g.name=au[1]if g.name=="mouse_click"then g.name=b.TOUCH;g.from="terminal"g.button=au[2]g.x=au[3]g.y=au[4]return g elseif g.name=="monitor_touch"then g.name=b.TOUCH;g.from=au[2]g.button=1;g.x=au[3]g.y=au[4]return g elseif g.name=="mouse_drag"then g.name=b.MOUSEDRAG;g.button=au[2]g.x=au[3]g.y=au[4]return g elseif g.name=="mouse_up"then g.name=b.MOUSEUP;g.button=au[2]g.x=au[3]g.y=au[4]return g elseif g.name=="mouse_scroll"then g.name=b.MOUSESCROLL;g.direction=au[2]g.x=au[3]g.y=au[4]return g elseif g.name=="char"then g.name=b.CHAR;g.char=au[2]return g elseif g.name=="key"then g.name=b.KEY;g.key=au[2]return g elseif g.name=="key_up"then g.name=b.KEYUP;g.key=au[2]return g elseif g.name=="paste"then g.name=b.PASTE;g.paste=au[2]return g end;table.remove(au,1)g.parameters=au;return g end}local av={}av={_path="/.settings",set=function(aw,n)settings.set(aw,n)settings.save(av._path)end,unset=function(aw)settings.unset(aw)settings.save(av._path)end,get=function(aw)return settings.get(aw)end}local ax={get_monitors=function(ay)local az={}for d,aA in next,ay do if aA=="terminal"then az[aA]=term else if peripheral.getType(aA)=="monitor"then az[aA]=peripheral.wrap(aA)end end end;return az end,better_print=function(aB,aC,aD,...)local aE=j.join({...},"")local aF=aB.getTextColor()local aG=aB.getBackgroundColor()if aC then aB.setTextColor(aC)end;if aD then aB.setBackgroundColor(aD)end;print(aE)aB.setTextColor(aF)aB.setBackgroundColor(aG)end,better_clear=function(aB)aB.clear()aB.setCursorPos(1,1)end}local aH={frame={pixels={},background=nil},screens={terminal=term},clear_after_draw=true,buffer={pixels={},background=colors.black,is_pixel_custom=function(self,G,H)G=tostring(G)H=tostring(H)if self.pixels[G]then if self.pixels[G][H]then return true end end;return false end,get_pixel=function(self,G,H)G=tostring(G)H=tostring(H)if self:is_pixel_custom(G,H)then return self.pixels[G][H]end;return{char=" ",foreground=self.background,background=self.background}end,set_pixel=function(self,G,H,char,aC,aD)G=tostring(G)H=tostring(H)local aI=self:get_pixel(G,H)if char and#char==1 then aI.char=char end;aI.foreground=aC or aI.background;aI.background=aD or aI.background;if not self.pixels[G]then self.pixels[G]={}end;self.pixels[G][H]=aI end,clear=function(self)self.pixels={}end},set_screens=function(self,aJ)self.screens=ax.get_monitors(aJ)end,set_monitors=function(self,ay)self:set_screens(ay)end,clear=function(self)self.buffer:clear()end,draw=function(self)local aK=self.screens;local aL=self.buffer;for aM,aN in next,aK do local aO,aP=aN.getCursorPos()local as,at=aN.getSize()for H=1,at do local aQ={text="",background="",foreground=""}for G=1,as do local aI=aL:get_pixel(G,H)aQ.text=aQ.text..aI.char;aQ.background=aQ.background..al.colors[aI.background]aQ.foreground=aQ.foreground..al.colors[aI.foreground]end;aN.setCursorPos(1,H)aN.blit(aQ.text,aQ.foreground,aQ.background)end;aN.setCursorPos(aO,aP)end;self.frame.pixels=self.buffer.pixels;self.frame.background=self.buffer.background;if self.clear_after_draw then self:clear()end end,point=function(self,G,H,am)self.buffer:set_pixel(G,H," ",am,am)end,write=function(self,G,H,aR,aC,aD)for aS=0,#aR-1 do char=aR:sub(aS+1,aS+1)self.buffer:set_pixel(G+aS,H,char,aC,aD)end end,rectangle=function(self,G,H,as,at,am)for aS=0,as-1 do for aT=0,at-1 do self:point(G+aS,H+aT,am)end end end,line=function(self,aU,aV,aW,aX,am)local function aY(aU,aV,aW,aX)local aZ=1;if aU>aW then aZ=-1 end;local a_=aW-aU;local b0=aX-aV;local b1=1;if b0<0 then b1=-1;b0=-b0 end;local b2=2*b0-a_;local H=aV;for G=aU,aW,aZ do self:point(G,H,am)if b2>0 then H=H+b1;b2=b2-2*a_ end;b2=b2+2*b0 end end;local function b3(aU,aV,aW,aX)local aZ=1;if aV>aX then aZ=-1 end;local a_=aW-aU;local b0=aX-aV;local b4=1;if a_<0 then b4=-1;a_=-a_ end;local b2=2*a_-b0;local G=aU;for H=aV,aX,aZ do self:point(G,H,am)if b2>0 then G=G+b4;b2=b2-2*b0 end;b2=b2+2*a_ end end;if math.abs(aX-aV)<math.abs(aW-aU)then if aU>aW then aY(aW,aX,aU,aV)else aY(aU,aV,aW,aX)end else if aV>aX then b3(aW,aX,aU,aV)else b3(aU,aV,aW,aX)end end end,circle=function(self,b5,b6,b7,am)local b8=b7*b7;self:point(b5,b6+b7,am)self:point(b5,b6-b7,am)self:point(b5+b7,b6,am)self:point(b5-b7,b6,am)local G=1;local H=math.floor(math.sqrt(b8-1)+0.5)while G<H do self:point(b5+G,b6+H,am)self:point(b5+G,b6-H,am)self:point(b5-G,b6+H,am)self:point(b5-G,b6-H,am)self:point(b5+H,b6+G,am)self:point(b5+H,b6-G,am)self:point(b5-H,b6+G,am)self:point(b5-H,b6-G,am)G=G+1;H=math.floor(math.sqrt(b8-G*G)+0.5)end;if G==H then self:point(b5+G,b6+H,am)self:point(b5+G,b6-H,am)self:point(b5-G,b6+H,am)self:point(b5-G,b6-H,am)end end}local b9={pressed_keys={},reset=function(self)self.pressed_keys={}end,is_key_pressed=function(self,ba,d)if self.pressed_keys[d]then if ba then self:remove_key(d)end;return true end;return false end,are_keys_pressed=function(self,bb,...)local keys={...}if not(#keys>0)then return false end;for bc,d in next,keys do if not self:is_key_pressed(false,d)then return false end end;if bb then self:remove_keys(table.unpack(keys))end;return true end,add_key=function(self,d)self.pressed_keys[d]=true end,remove_key=function(self,d)self.pressed_keys[d]=nil end,remove_keys=function(self,...)local keys={...}for bc,d in next,keys do self:remove_key(d)end end,manage_event=function(self,bd)if bd.name==b.KEY then self:add_key(bd.key)elseif bd.name==b.KEYUP then self:remove_key(bd.key)end end}local be={}be={side=nil,protocol="YAGUI-"..a.ver.."_WSS",host_prefix="_Host:",default_timeout=0.5,open=function(self,bf)rednet.open(bf)self.side=bf end,close=function(self)rednet.close(self.side)self.side=nil end,server={root={},servername=nil,hostname=nil,host=function(self,bg)if not bg then bg=os.getComputerID()end;bg=tostring(bg)local bh=self.root.protocol..self.root.host_prefix..bg;if rednet.lookup(bh,bg)then return false,bg end;rednet.host(bh,bg)self.servername=bh;self.hostname=bg;return true,bg end,unhost=function(self)rednet.broadcast(b.DISCONNECTED,self.servername)rednet.unhost(self.servername,self.hostname)self.servername=nil;self.hostname=nil end,broadcast=function(self)rednet.broadcast(aH.frame,self.servername)end},client={root={},servername=nil,host_id=nil,connect=function(self,bg)bg=tostring(bg)local bh=self.root.protocol..self.root.host_prefix..bg;local bi=rednet.lookup(bh,bg)if not bi then return false,bg end;self.servername=bh;self.host_id=bi;return true,bg end,disconnect=function(self)self.servername=nil;self.host_id=nil end,listen=function(self,bj)if not bj then bj=self.root.default_timeout end;local bk={rednet.receive(self.servername,bj)}if bk[1]==self.host_id then local aL=bk[2]if not aL then return false end;if aL==b.DISCONNECTED then return aL end;aH.buffer.background=aL.background;aH.buffer.pixels=aL.pixels;return true end;return false end}}be.server.root=be;be.client.root=be;local bl={}bl={Clock={new=function(bm)local bn={enabled=true,oneshot=false,clock=os.clock(),interval=bm,callbacks={onClock=function()end}}setmetatable(bn,bl.Clock)return bn end,event=function(self,bd)if not self.enabled then self:reset_timer()return end;if os.clock()>=self.clock+self.interval then self:reset_timer()self.callbacks.onClock(self,bd)if self.oneshot then self:stop()end end end,start=function(self)self:reset_timer()self.enabled=true end,stop=function(self)self.enabled=false end,reset_timer=function(self)self.clock=os.clock()end},Label={new=function(G,H,aR,aC,aD)local bo={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,text_alignment=b.ALIGN_CENTER,text=aR,pos=F.Vector2.new(G,H),colors={foreground=aC,background=aD},callbacks={onDraw=function()end}}setmetatable(bo,bl.Label)return bo end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)local bp=j.split(self.text,"\n")if self.text_alignment==b.ALIGN_LEFT then for d,bq in next,bp do aH:write(self.pos.x,self.pos.y+d-1,bq,self.colors.foreground,self.colors.background)end elseif self.text_alignment==b.ALIGN_CENTER then local br=0;for d,bq in next,bp do if d==1 then br=math.floor(#bq/2)aH:write(self.pos.x,self.pos.y,bq,self.colors.foreground,self.colors.background)else aH:write(self.pos.x+br-math.floor(#bq/2),self.pos.y+d-1,bq,self.colors.foreground,self.colors.background)end end end end},Button={new=function(G,H,as,at,aR,aC,bs,bt)local bu={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,active=false,shortcut_once=true,shortcut={},text_alignment=b.ALIGN_CENTER,text=aR,pos=F.Vector2.new(G,H),size=F.Vector2.new(as,at),timed={enabled=false,clock=bl.Clock.new(0.5)},colors={foreground=aC,active_background=bs,unactive_background=bt},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onTimeout=function()end}}bu.timed.clock.binded_button=bu;bu.timed.clock.oneshot=true;bu.timed.clock:stop()e.set_callback(bu.timed.clock,b.ONCLOCK,function(self,bd)self.binded_button.active=false;self.binded_button.callbacks.onPress(self.binded_button,bd)self.binded_button.callbacks.onTimeout(self.binded_button,bd)end)setmetatable(bu,bl.Button)return bu end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)if self.active then aH:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.active_background)else aH:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.unactive_background)end;local bp=j.split(self.text,"\n")local bv=math.floor((self.size.y-#bp)/2)+self.pos.y;for aT=0,#bp-1 do local bq=bp[aT+1]local bw;if self.text_alignment==b.ALIGN_LEFT then bw=self.pos.x elseif self.text_alignment==b.ALIGN_CENTER then bw=math.floor((self.size.x-#bq)/2)+self.pos.x end;aH:write(bw,bv+aT,bq,self.colors.foreground)end end,event=function(self,bd)if self.hidden then return false end;if bd.name==b.TOUCH then if ap.is_area_pressed(bd.x,bd.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self:press(bd)return true else self.callbacks.onFailedPress(self,bd)end elseif b9:are_keys_pressed(self.shortcut_once,table.unpack(self.shortcut))then self:press(bd)end;if self.timed.enabled then self.timed.clock:event(bd)end end,press=function(self,bd)if self.timed.enabled then self.timed.clock:start()if not self.active then self.active=true;self.callbacks.onPress(self,bd)end else self.active=not self.active;self.callbacks.onPress(self,bd)end end},Progressbar={new=function(G,H,as,at,bx,W,X,aC,by,bz)local bA={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,active=false,pos=F.Vector2.new(G,H),size=F.Vector2.new(as,at),value={max=X,min=W,current=bx,draw_percentage=true,percentage_precision=2},colors={foreground=aC,filled_background=by,unfilled_background=bz},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end}}setmetatable(bA,bl.Progressbar)return bA end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)local bB=F.map(self.value.current,self.value.min,self.value.max,0,1,true)local bC=math.floor(self.size.x*bB)aH:rectangle(self.pos.x,self.pos.y,bC,self.size.y,self.colors.filled_background)aH:rectangle(self.pos.x+bC,self.pos.y,self.size.x-bC,self.size.y,self.colors.unfilled_background)if self.value.draw_percentage then local bD=j.format_number(bB*100,self.value.percentage_precision).."%"local bE=math.floor((self.size.x-#bD)/2)+self.pos.x;local bv=math.floor((self.size.y-1)/2)+self.pos.y;aH:write(bE,bv,bD,self.colors.foreground)end end,event=function(self,bd)if self.hidden then return false end;if bd.name==b.TOUCH then if ap.is_area_pressed(bd.x,bd.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.callbacks.onPress(self,bd)end end end,set=function(self,n)local bF=F.constrain(n,self.value.min,self.value.max)self.value.current=bF end},Memo={new=function(G,H,as,at,aC,aD)local bG={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,pos=F.Vector2.new(G,H),size=F.Vector2.new(as,at),editable=true,lines={},first_visible_line=1,first_visible_char=1,cursor={visible=false,text=" ",blink=bl.Clock.new(0.5),pos=F.Vector2.new(1,1)},limits=F.Vector2.new(0,0),whitelist={},blacklist={},colors={foreground=aC,background=aD,cursor=colors.white,cursor_text=colors.black},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onFocus=function()end,onKey=function()end,onChar=function()end}}bG.cursor.blink.binded_cursor=bG.cursor;e.set_callback(bG.cursor.blink,b.ONCLOCK,function(self,bd)self.binded_cursor.visible=not self.binded_cursor.visible end)setmetatable(bG,bl.Memo)return bG end,draw=function(self)if self.hidden then return end;aH:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.background)local bH=self.cursor.pos.x-self.first_visible_char;local bI=self.cursor.pos.y-self.first_visible_line;if bH>=self.size.x then self.first_visible_char=self.first_visible_char+bH-self.size.x+1;bH=self.cursor.pos.x-self.first_visible_char-1 elseif bH<1 then self.first_visible_char=self.first_visible_char+bH;bH=0 end;if bI>=self.size.y then self.first_visible_line=self.first_visible_line+bI-self.size.y+1;bI=self.cursor.pos.y-self.first_visible_line-1 elseif bI<1 then self.first_visible_line=self.first_visible_line+bI;bI=0 end;for H=1,self.size.y do local bq=self.lines[H+self.first_visible_line-1]or""local bJ=bq:sub(self.first_visible_char,self.first_visible_char+self.size.x-1)aH:write(self.pos.x,self.pos.y+H-1,bJ,self.colors.foreground)end;if self.cursor.visible then aH:write(bH+self.pos.x,bI+self.pos.y,self.cursor.text,self.colors.cursor_text,self.colors.cursor)end end,event=function(self,bd)if self.hidden then return false end;if not self.editable then return false end;if bd.name==b.TOUCH then if ap.is_area_pressed(bd.x,bd.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then local G=bd.x-self.pos.x;local H=bd.y-self.pos.y;self:set_cursor(G+self.first_visible_char,H+self.first_visible_line)self:focus(true,bd)self.callbacks.onPress(self,bd)return true else self:focus(false,bd)self.callbacks.onFailedPress(self,bd)return false end elseif bd.name==b.DELETED then self:focus(false,bd)return false end;if self.focussed then self.cursor.blink:event(self.cursor.blink,bd)if bd.name==b.PASTE then self:write(bd.paste)elseif bd.name==b.CHAR then if self.callbacks.onChar(self,bd)then return true end;self:write(bd.char)elseif bd.name==b.KEY then if self.callbacks.onKey(self,bd)then return true end;if bd.key==b.KEY_UP then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y-1)elseif bd.key==b.KEY_DOWN then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+1)elseif bd.key==b.KEY_RIGHT then local bq=self.lines[self.cursor.pos.y]if self.lines[self.cursor.pos.y+1]and self.cursor.pos.x>=#bq+1 then self:set_cursor(1,self.cursor.pos.y+1)else self:set_cursor(self.cursor.pos.x+1,self.cursor.pos.y)end elseif bd.key==b.KEY_LEFT then if self.cursor.pos.x<=1 and self.cursor.pos.y>1 then local bK=self.lines[self.cursor.pos.y-1]self:set_cursor(#bK+1,self.cursor.pos.y-1)else self:set_cursor(self.cursor.pos.x-1,self.cursor.pos.y)end elseif bd.key==b.KEY_BACKSPACE then local bq=self.lines[self.cursor.pos.y]if self.cursor.pos.x<=1 then if self.cursor.pos.y>1 then table.remove(self.lines,self.cursor.pos.y)local bL=#self.lines[self.cursor.pos.y-1]+1;local bM=self.cursor.pos.y-1;self:set_cursor(bL,bM)self:write(bq)self:set_cursor(bL,bM)end else self.lines[self.cursor.pos.y]=bq:sub(1,self.cursor.pos.x-2)..bq:sub(self.cursor.pos.x)self:set_cursor(self.cursor.pos.x-1,self.cursor.pos.y)end elseif bd.key==b.KEY_DELETE then local bq=self.lines[self.cursor.pos.y]local bN=bq:sub(self.cursor.pos.x)if#bN>0 then self.lines[self.cursor.pos.y]=bq:sub(1,self.cursor.pos.x-1)..bq:sub(self.cursor.pos.x+1)else local bO=self.lines[self.cursor.pos.y+1]if bO then local bL=self.cursor.pos.x;local bM=self.cursor.pos.y;table.remove(self.lines,self.cursor.pos.y+1)self:write(bO)self:set_cursor(bL,bM)end end elseif bd.key==b.KEY_ENTER then self:write("\n")elseif bd.key==b.KEY_TAB then self:write("  ")end elseif bd.name==b.MOUSESCROLL then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+bd.direction)end;return true end end,focus=function(self,bP,bd)if bP then self.focussed=true;self.callbacks.onFocus(self,bd)else self.focussed=false;self.cursor.visible=false;self.callbacks.onFocus(self,bd)end end,set_cursor=function(self,bL,bM,bQ)if not self.lines[1]then self.lines[1]=""end;if self.limits.y>0 then bM=F.constrain(bM,1,self.limits.y)end;if bQ then for H=#self.lines+1,bM do if not self.lines[H]then self.lines[H]=""end end else bM=F.constrain(bM,1,#self.lines)end;bL=F.constrain(bL,1,#self.lines[bM]+1)self.cursor.pos=F.Vector2.new(bL,bM)end,write=function(self,...)local aR=j.join({...},"")local bp=j.split(aR,"\n")self:set_cursor(self.cursor.pos.x,self.cursor.pos.y,true)if#self.whitelist>0 then local bR="[^"..j.escape_magic_characters(j.join(self.whitelist,"")).."]"for d,bq in next,bp do bp[d]=bq:gsub(bR,"")end elseif#self.blacklist>0 then local bR="["..j.escape_magic_characters(j.join(self.blacklist,"")).."]"for d,bq in next,bp do bp[d]=bq:gsub(bR,"")end end;if self.limits.y>0 then for H=1,#self.lines+#bp-1-self.limits.y do table.remove(bp)end;if#bp==0 then return end end;if#bp>1 then for bS,bq in next,bp do if bS==1 then local bT=self.lines[self.cursor.pos.y]local bU=bT:sub(1,self.cursor.pos.x-1)local bN=bT:sub(self.cursor.pos.x)local bV=bp[#bp]if self.limits.x>0 then bq=bq:sub(1,self.limits.x-#bU)bV=bV:sub(1,self.limits.x-#bN)end;self.lines[self.cursor.pos.y]=bU..bq;self:set_cursor(1,self.cursor.pos.y+1,true)table.insert(self.lines,self.cursor.pos.y,bV..bN)self:set_cursor(#bV+1,self.cursor.pos.y)elseif bS==#bp then break else if self.limits.x>0 then bq=bq:sub(1,self.limits.x)end;table.insert(self.lines,self.cursor.pos.y,bq)self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+1)end end else local bT=self.lines[self.cursor.pos.y]local bU=bT:sub(1,self.cursor.pos.x-1)local bN=bT:sub(self.cursor.pos.x)if self.limits.x>0 then bp[1]=bp[1]:sub(1,self.limits.x-(#bU+#bN))end;self.lines[self.cursor.pos.y]=bU..bp[1]..bN;self:set_cursor(self.cursor.pos.x+#bp[1],self.cursor.pos.y)end end,print=function(self,...)local aR=j.join({...},"\n").."\n"self:write(aR)end,clear=function(self)self.lines={""}self:set_cursor(1,1)end},Window={new=function(G,H,as,at,aD,bW)local bX={draw_priority=b.HIGH_PRIORITY,focussed=false,hidden=false,pos=F.Vector2.new(G,H),size=F.Vector2.new(as,at),drag_options={enabled=true,from=F.Vector2.new(1,1)},shadow={enabled=bW,offset=F.Vector2.new(1,1)},elements={},colors={background=aD,shadow=colors.black},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onFocus=function()end}}setmetatable(bX,bl.Window)return bX end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)if self.shadow.enabled then aH:rectangle(self.pos.x+self.shadow.offset.x,self.pos.y+self.shadow.offset.y,self.size.x,self.size.y,self.colors.shadow)end;aH:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.background)self:draw_elements()end,event=function(self,bd)if self.hidden then return false end;local bY=self:event_elements(bd)if not bY then if bd.name==b.TOUCH then if ap.is_area_pressed(bd.x,bd.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.drag_options.from=F.Vector2.new(bd.x,bd.y)self.focussed=true;self.callbacks.onPress(self,bd)self.callbacks.onFocus(self,bd)return true else self.focussed=false;self.callbacks.onFailedPress(self,bd)self.callbacks.onFocus(self,bd)end elseif bd.name==b.MOUSEDRAG and self.focussed then self:drag(bd.x,bd.y)return true elseif bd.name==b.DELETED then self.focussed=false;self.callbacks.onFocus(self,bd)end else self.focussed=false;self.callbacks.onFocus(self,bd)end;return bY end,drag=function(self,G,H)if self.drag_options.enabled then local bZ=F.Vector2.new(G-self.drag_options.from.x,H-self.drag_options.from.y)self.pos=self.pos+bZ;for d,b_ in next,self.elements do if b_.pos then b_.pos=b_.pos+bZ end end;self.drag_options.from=F.Vector2.new(G,H)end end,set_elements=function(self,c0,c1)self.elements={}for d,b_ in next,c0 do if c1 then b_.pos=self.pos+b_.pos-F.Vector2.ONE end;table.insert(self.elements,b_)end end,draw_elements=function(self)for d=#self.elements,1,-1 do local b_=self.elements[d]if b_.draw then b_:draw()end end end,event_elements=function(self,bd)local bY=false;for d,b_ in next,self.elements do if b_.event then local c2=b_:event(bd)bY=bY or c2;if c2 then bd={name=b.DELETED}end end end;return bY end}}bl.Clock.__index=bl.Clock;bl.Label.__index=bl.Label;bl.Button.__index=bl.Button;bl.Progressbar.__index=bl.Progressbar;bl.Memo.__index=bl.Memo;bl.Window.__index=bl.Window;local c3={}c3={new=function(c4,c5)local c6={options={enabled=false,FPS_target=c4,EPS_target=c5},monitors={terminal=term},elements={high_priority={},low_priority={},loop={clock=bl.Clock.new(1/c4),stats_clock=bl.Clock.new(1),FPS_label=bl.Label.new(1,1,"1 FPS",colors.white),EPS_label=bl.Label.new(1,2,"1 EPS",colors.white)}},stats={pos=F.Vector2.new(1,1),elements=nil,enabled=true,enable=function(self,c7)self.enabled=c7;self.elements.stats_clock.enabled=c7;self.elements.FPS_label.hidden=not c7;self.elements.EPS_label.hidden=not c7 end,update_pos=function(self)self.elements.FPS_label.pos=self.pos;self.elements.EPS_label.pos=self.pos+F.Vector2.DOWN end,FPS=0,EPS=0},callbacks={onStart=function()end,onStop=function()end,onDraw=function()end,onClock=function()end,onEvent=function()end}}c6.elements.loop.stats_clock.stats=c6.stats;c6.stats.elements=c6.elements.loop;e.set_callback(c6.elements.loop.stats_clock,b.ONCLOCK,function(self,bd)self.stats:update_pos()self.stats.elements.FPS_label.text=tostring(self.stats.FPS).." FPS"self.stats.elements.EPS_label.text=tostring(self.stats.EPS).." EPS"self.stats.FPS=0;self.stats.EPS=0 end)c6.stats:enable(false)setmetatable(c6,c3)return c6 end,set_monitors=function(self,ay)self.monitors=ax.get_monitors(ay)end,set_elements=function(self,c0)self.elements.high_priority={}self.elements.low_priority={}for d,n in next,c0 do if n.draw_priority==b.HIGH_PRIORITY then table.insert(self.elements.high_priority,n)else table.insert(self.elements.low_priority,n)end end end,draw_elements=function(self)local function c8(k)for d=#k,1,-1 do local b_=k[d]if b_.draw then b_:draw()end end end;self.callbacks.onDraw(self)local c9=aH.screens;aH.screens=self.monitors;c8(self.elements.low_priority)c8(self.elements.high_priority)for d,b_ in next,self.elements.loop do if b_.draw then b_:draw()end end;aH:draw()aH.screens=c9;if self.stats.enabled then self.stats.FPS=self.stats.FPS+1 end end,event_elements=function(self,bd)local function au(k)for d,b_ in next,k do if b_.event then if b_:event(bd)then bd={name=b.DELETED}end end end end;if self.callbacks.onEvent(self,bd)then bd={name=b.DELETED}end;if bd.name==b.TOUCH then local ca=false;for cb,aB in next,self.monitors do if bd.from==cb then ca=true;break end end;if not ca then bd={name=b.DELETED}end end;au(self.elements.loop)local cc={}for d,b_ in next,self.elements.high_priority do if b_.event then local cd=b_:event(bd)if cd then bd={name=b.DELETED}if self.elements.high_priority~=b_ then table.insert(cc,{element=b_,key=d})end end end end;if#cc>0 then for d,n in next,cc do table.insert(self.elements.high_priority,1,n.element)table.remove(self.elements.high_priority,n.key+#cc)end end;au(self.elements.low_priority)if self.stats.enabled then self.stats.EPS=self.stats.EPS+1 end end,start=function(self)self.enabled=true;b9:reset()e.set_callback(self.elements.loop.clock,b.ONCLOCK,function(ce,bd)self.callbacks.onClock(self,bd)self:draw_elements()ce.interval=1/self.options.FPS_target end)self.stats:update_pos()self.callbacks.onStart(self)while self.enabled do local cf=os.startTimer(1/self.options.EPS_target)local cg={os.pullEvent()}local bd=ap.format_event_table(cg)b9:manage_event(bd)self:event_elements(bd)os.cancelTimer(cf)end;b9:reset()self.callbacks.onStop(self)end,stop=function(self)self.enabled=false end}c3.__index=c3;local ch={...}if ch[1]=="help"then local bp={{text="LIBFILE <COMMAND>",foreground=colors.green,background=nil},{text=" - help (shows this list of commands)",foreground=colors.blue,background=nil},{text=" - info (prints info about the lib)",foreground=colors.yellow,background=nil},{text=" - ver (prints version of the lib)",foreground=colors.green,background=nil},{text=" - copyright (prints copyright of the lib)",foreground=colors.blue,background=nil},{text=" - setup (adds YAGUI_PATH to computer's settings)",foreground=colors.yellow,background=nil},{text=" - create <PATH> (creates a new YAGUI project)",foreground=colors.green,background=nil}}for d,bq in next,bp do ax.better_print(term,bq.foreground,bq.background,bq.text)end elseif ch[1]=="info"then ax.better_print(term,colors.red,nil,"Library Version: ",a.ver)ax.better_print(term,colors.yellow,nil,"Library Author: ",a.author)ax.better_print(term,colors.green,nil,"Library Website: ",a.website)ax.better_print(term,colors.blue,nil,"Library Documentation: ",a.documentation)elseif ch[1]=="ver"then ax.better_print(term,colors.red,nil,"Library Version: ",a.ver)elseif ch[1]=="copyright"then local ci={colors.red,colors.yellow,colors.green}local cj=j.split(a.copyright,"\n\n")for d,ck in next,cj do ax.better_print(term,ci[d],nil,ck)if d<#cj then read("")end end elseif ch[1]=="setup"then if shell then local cl="YAGUI_PATH"local x="/"..shell.getRunningProgram()av.set(cl,x)ax.better_print(term,colors.green,nil,"Lib path was set to \"",av.get(cl),"\".")else ax.better_print(term,colors.red,nil,"SHELL API ISN'T AVAILABLE!")end elseif ch[1]=="create"then if ch[2]then local x=shell.resolve(ch[2])local aw=fs.getName(x):lower()if j.get_extension(x)~="lua"then x=x..".lua"end;if fs.exists(x)then ax.better_print(term,colors.red,nil,"PATH: \"/",x,"\" already exists, please use another path or delete it.")else local cm=fs.open(x,"w")cm.write("\n-- AUTO-GENERATED with \"YAGUI create\"\nlocal YAGUI_PATH = settings.get(\"YAGUI_PATH\")\nif not (type(YAGUI_PATH) == \"string\") then printError(\"YAGUI is not installed, please install it by opening it with argument \\\"setup\\\".\"); return; end\nif not fs.exists(YAGUI_PATH) then printError(\"Couldn't find YAGUI in path: \\\"\"..YAGUI_PATH..\"\\\", Please reinstall it by opening it with argument \\\"setup\\\".\"); return; end\nlocal YAGUI = dofile(YAGUI_PATH)\n-- End of AUTO-GENERATED code\n\n")cm.close()ax.better_print(term,colors.green,nil,"New project was created at \"/",x,"\".")end else ax.better_print(term,colors.red,nil,"You must specify a path to create a new project.")end elseif ch[1]then ax.better_print(term,colors.red,nil,"UNKNOWN COMMAND: \"",ch[1],"\"")ax.better_print(term,colors.green,nil,"Use \"help\" to get a list of available commands!")end;local cn={info=a,generic_utils=e,string_utils=j,math_utils=F,table_utils=a1,color_utils=al,event_utils=ap,setting_utils=av,monitor_utils=ax,screen_buffer=aH,input=b9,WSS=be,wireless_screen_share=be,gui_elements=bl,Loop=c3}for d,n in next,b do cn[d]=n end;return cn
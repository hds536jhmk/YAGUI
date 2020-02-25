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
local a={ver="1.10",author="hds536jhmk",website="https://github.com/hds536jhmk/YAGUI/",documentation="https://yagui.readthedocs.io/en/latest/",copyright="Copyright (c) 2019, hds536jhmk : https://github.com/hds536jhmk/YAGUI\n\nPermission to use, copy, modify, and/or distribute this software for any\npurpose with or without fee is hereby granted, provided that the above\ncopyright notice and this permission notice appear in all copies.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\" AND THE AUTHOR DISCLAIMS ALL WARRANTIES\nWITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF\nMERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR\nANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES\nWHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN\nACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF\nOR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE."}local b={TOUCH="screen_touch",MOUSEUP="mouse_up",MOUSEDRAG="mouse_drag",MOUSESCROLL="mouse_scroll",CHAR="char",KEY="key",KEYUP="key_up",PASTE="paste",DELETED="DELETED",DISCONNECTED="DISCONNECTED",LOW_PRIORITY=1,HIGH_PRIORITY=2,ONSTART=1,ONSTOP=2,ONDRAW=3,ONPRESS=4,ONFAILEDPRESS=5,ONTIMEOUT=6,ONCLOCK=7,ONEVENT=8,ONFOCUS=9,ONKEY=10,ONCHAR=11,MOUSE_LEFT=1,MOUSE_RIGHT=2,MOUSE_MIDDLE=3,SCROLL_UP=-1,SCROLL_DOWN=1,COMPUTER="computer",TURTLE="turtle",POCKET="pocket",ALIGN_LEFT=1,ALIGN_CENTER=2}for c,d in pairs(keys)do if type(d)=="number"then b["KEY_"..c:upper()]=d end end;local e={set_callback=function(f,g,h)if g==b.ONSTART then f.callbacks.onStart=h elseif g==b.ONSTOP then f.callbacks.onStop=h elseif g==b.ONDRAW then f.callbacks.onDraw=h elseif g==b.ONPRESS then f.callbacks.onPress=h elseif g==b.ONFAILEDPRESS then f.callbacks.onFailedPress=h elseif g==b.ONTIMEOUT then f.callbacks.onTimeout=h elseif g==b.ONCLOCK then f.callbacks.onClock=h elseif g==b.ONEVENT then f.callbacks.onEvent=h elseif g==b.ONFOCUS then f.callbacks.onFocus=h elseif g==b.ONKEY then f.callbacks.onKey=h elseif g==b.ONCHAR then f.callbacks.onChar=h end end,get_computer_type=function()local i=b.COMPUTER;if turtle then i=b.TURTLE elseif pocket then i=b.POCKET end;return i,term.isColor()end}local j={}j={magic_characters={"(",")",".","%","+","-","*","?","[","]","^","$"},join=function(k,l)if not l then l=""end;local m=""for d=1,#k do local n=k[d]m=m..tostring(n)if d<#k then m=m..l end end;return m end,split=function(m,l)local k={}while true do local o=m:find(l)if o then table.insert(k,m:sub(1,o-1))m=m:sub(o+1)else table.insert(k,m)break end end;return k end,compare_versions=function(p,q)local r=j.split(p,".")local s=j.split(q,".")local t=#r;local u=#s;for v=1,math.min(t,u)do if tonumber(r[v])>tonumber(s[v])then return 1 elseif tonumber(r[v])<tonumber(s[v])then return-1 end end;if t>u then return 1 elseif t<u then return-1 end;return 0 end,escape_magic_characters=function(m)for d,w in pairs(j.magic_characters)do m=m:gsub("[%"..w.."]",'%%%'..w)end;return m end,get_extension=function(x)local y,z=x:gsub(".*%.","")if z>0 then return y end;return""end}local A={}A={Vector2={new=function(B,C)local D={x=B or 0,y=C or 0}setmetatable(D,A.Vector2)return D end,length_sq=function(self)return math.pow(self.x,2)+math.pow(self.y,2)end,length=function(self)return math.sqrt(self:length_sq())end,unit=function(self)return self/self:length()end,dot=function(self,E)return self.x*E.x+self.y*E.y end,string=function(self,F)if F then return string.format("(%."..tostring(F).."f; %."..tostring(F).."f)",self.x,self.y)else return string.format("(%f; %f)",self.x,self.y)end end,__tostring=function(self)return self:string(0)end,__add=function(self,E)return A.Vector2.new(self.x+E.x,self.y+E.y)end,__sub=function(self,E)return A.Vector2.new(self.x-E.x,self.y-E.y)end,__mul=function(self,G)return A.Vector2.new(self.x*G,self.y*G)end,__div=function(self,G)return A.Vector2.new(self.x/G,self.y/G)end,__eq=function(self,E)return self:length_sq()==E:length_sq()end,__lt=function(self,E)return self:length_sq()<E:length_sq()end,__le=function(self,E)return self:length_sq()<=E:length_sq()end},Vector3={new=function(B,C,H)local I={x=B or 0,y=C or 0,z=H or 0}setmetatable(I,A.Vector3)return I end,length_sq=function(self)return math.pow(self.x,2)+math.pow(self.y,2)+math.pow(self.z,2)end,length=function(self)return math.sqrt(self:length_sq())end,unit=function(self)return self/self:length()end,dot=function(self,E)return self.x*E.x+self.y*E.y+self.z*E.z end,cross=function(self,E)return A.Vector3.new(self.y*E.z-self.z*E.y,self.z*E.x-self.x*E.z,self.x*E.y-self.y*E.x)end,string=function(self,F)if F then return string.format("(%."..tostring(F).."f; %."..tostring(F).."f; %."..tostring(F).."f)",self.x,self.y,self.z)else return string.format("(%f; %f; %f)",self.x,self.y,self.z)end end,__tostring=function(self)return self:string(0)end,__add=function(self,E)return A.Vector3.new(self.x+E.x,self.y+E.y,self.z+E.z)end,__sub=function(self,E)return A.Vector3.new(self.x-E.x,self.y-E.y,self.z-E.z)end,__mul=function(self,G)return A.Vector3.new(self.x*G,self.y*G,self.z*G)end,__div=function(self,G)return A.Vector3.new(self.x/G,self.y/G,self.z/G)end,__eq=function(self,E)return self:length_sq()==E:length_sq()end,__lt=function(self,E)return self:length_sq()<E:length_sq()end,__le=function(self,E)return self:length_sq()<=E:length_sq()end},map=function(n,J,K,L,M,N)local O=(n-J)/(K-J)*(M-L)+L;if N then return A.constrain(O,L,M)end;return O end,constrain=function(n,P,Q)return math.min(Q,math.max(P,n))end}A.Vector2.__index=A.Vector2;A.Vector3.__index=A.Vector3;A.Vector2.ONE=A.Vector2.new(1,1)A.Vector2.UP=A.Vector2.new(0,-1)A.Vector2.DOWN=A.Vector2.new(0,1)A.Vector2.LEFT=A.Vector2.new(-1,0)A.Vector2.RIGHT=A.Vector2.new(1,0)A.Vector2.ZERO=A.Vector2.new(0,0)A.Vector3.ONE=A.Vector2.new(1,1,1)A.Vector3.UP=A.Vector2.new(0,1,0)A.Vector3.DOWN=A.Vector2.new(0,-1,0)A.Vector3.LEFT=A.Vector2.new(-1,0,0)A.Vector3.RIGHT=A.Vector2.new(1,0,0)A.Vector3.FORWARD=A.Vector2.new(0,0,1)A.Vector3.BACK=A.Vector2.new(0,0,-1)A.Vector3.ZERO=A.Vector2.new(0,0,0)local R={has_value=function(k,n)for S,T in pairs(k)do if T==n then return true,S end end;return false,nil end,has_key=function(k,d)if k[d]~=nil then return true,k[d]end;return false,nil end}local U={}U={colors={[1]="0",[2]="1",[4]="2",[8]="3",[16]="4",[32]="5",[64]="6",[128]="7",[256]="8",[512]="9",[1024]="a",[2048]="b",[4096]="c",[8192]="d",[16384]="e",[32768]="f"},color_to_paint=function(V)return U.colors[V]end,paint_to_color=function(W)local X,V=R.has_value(U.colors,W)if X then return V end end}local Y={is_area_pressed=function(Z,_,B,C,a0,a1)if Z>=B and Z<B+a0 then if _>=C and _<C+a1 then return true end end;return false end,format_event_table=function(a2)local g={}g.name=a2[1]if g.name=="mouse_click"then g.name=b.TOUCH;g.from="terminal"g.button=a2[2]g.x=a2[3]g.y=a2[4]return g elseif g.name=="monitor_touch"then g.name=b.TOUCH;g.from=a2[2]g.button=1;g.x=a2[3]g.y=a2[4]return g elseif g.name=="mouse_drag"then g.name=b.MOUSEDRAG;g.button=a2[2]g.x=a2[3]g.y=a2[4]return g elseif g.name=="mouse_up"then g.name=b.MOUSEUP;g.button=a2[2]g.x=a2[3]g.y=a2[4]return g elseif g.name=="mouse_scroll"then g.name=b.MOUSESCROLL;g.direction=a2[2]g.x=a2[3]g.y=a2[4]return g elseif g.name=="char"then g.name=b.CHAR;g.char=a2[2]return g elseif g.name=="key"then g.name=b.KEY;g.key=a2[2]return g elseif g.name=="key_up"then g.name=b.KEYUP;g.key=a2[2]return g elseif g.name=="paste"then g.name=b.PASTE;g.paste=a2[2]return g end;table.remove(a2,1)g.parameters=a2;return g end}local a3={_path="/.settings",set=function(self,a4,n)settings.set(a4,n)settings.save(self._path)end,unset=function(self,a4)settings.unset(a4)settings.save(self._path)end,get=function(a4)return settings.get(a4)end}local a5={get_monitors=function(a6)local a7={}for d,a8 in pairs(a6)do if a8=="terminal"then a7[a8]=term else if peripheral.getType(a8)=="monitor"then a7[a8]=peripheral.wrap(a8)end end end;return a7 end,better_print=function(a9,aa,ab,...)local ac=j.join({...},"")local ad=a9.getTextColor()local ae=a9.getBackgroundColor()if aa then a9.setTextColor(aa)end;if ab then a9.setBackgroundColor(ab)end;print(ac)a9.setTextColor(ad)a9.setBackgroundColor(ae)end,better_clear=function(a9)a9.clear()a9.setCursorPos(1,1)end}local af={frame={pixels={},background=nil},screens={terminal=term},clear_after_draw=true,buffer={pixels={},background=colors.black,is_pixel_custom=function(self,B,C)B=tostring(B)C=tostring(C)if self.pixels[B]then if self.pixels[B][C]then return true end end;return false end,get_pixel=function(self,B,C)B=tostring(B)C=tostring(C)if self:is_pixel_custom(B,C)then return self.pixels[B][C]end;return{char=" ",foreground=self.background,background=self.background}end,set_pixel=function(self,B,C,char,aa,ab)B=tostring(B)C=tostring(C)local ag=self:get_pixel(B,C)if char and#char==1 then ag.char=char end;ag.foreground=aa or ag.background;ag.background=ab or ag.background;if not self.pixels[B]then self.pixels[B]={}end;self.pixels[B][C]=ag end,clear=function(self)self.pixels={}end},set_screens=function(self,ah)self.screens=a5.get_monitors(ah)end,set_monitors=function(self,a6)self:set_screens(a6)end,clear=function(self)self.buffer:clear()end,draw=function(self)local ai=self.screens;local aj=self.buffer;for ak,al in pairs(ai)do local am,an=al.getCursorPos()local a0,a1=al.getSize()for C=1,a1 do local ao={text="",background="",foreground=""}for B=1,a0 do local ag=aj:get_pixel(B,C)ao.text=ao.text..ag.char;ao.background=ao.background..U.colors[ag.background]ao.foreground=ao.foreground..U.colors[ag.foreground]end;al.setCursorPos(1,C)al.blit(ao.text,ao.foreground,ao.background)end;al.setCursorPos(am,an)end;self.frame.pixels=self.buffer.pixels;self.frame.background=self.buffer.background;if self.clear_after_draw then self:clear()end end,point=function(self,B,C,V)self.buffer:set_pixel(B,C," ",V,V)end,write=function(self,B,C,ap,aa,ab)for aq=0,#ap-1 do char=ap:sub(aq+1,aq+1)self.buffer:set_pixel(B+aq,C,char,aa,ab)end end,rectangle=function(self,B,C,a0,a1,V)for aq=0,a0-1 do for ar=0,a1-1 do self:point(B+aq,C+ar,V)end end end,line=function(self,as,at,au,av,V)local function aw(as,at,au,av)local ax=1;if as>au then ax=-1 end;local ay=au-as;local az=av-at;local aA=1;if az<0 then aA=-1;az=-az end;local aB=2*az-ay;local C=at;for B=as,au,ax do self:point(B,C,V)if aB>0 then C=C+aA;aB=aB-2*ay end;aB=aB+2*az end end;local function aC(as,at,au,av)local ax=1;if at>av then ax=-1 end;local ay=au-as;local az=av-at;local aD=1;if ay<0 then aD=-1;ay=-ay end;local aB=2*ay-az;local B=as;for C=at,av,ax do self:point(B,C,V)if aB>0 then B=B+aD;aB=aB-2*az end;aB=aB+2*ay end end;if math.abs(av-at)<math.abs(au-as)then if as>au then aw(au,av,as,at)else aw(as,at,au,av)end else if at>av then aC(au,av,as,at)else aC(as,at,au,av)end end end,circle=function(self,aE,aF,aG,V)local aH=aG*aG;self:point(aE,aF+aG,V)self:point(aE,aF-aG,V)self:point(aE+aG,aF,V)self:point(aE-aG,aF,V)local B=1;local C=math.floor(math.sqrt(aH-1)+0.5)while B<C do self:point(aE+B,aF+C,V)self:point(aE+B,aF-C,V)self:point(aE-B,aF+C,V)self:point(aE-B,aF-C,V)self:point(aE+C,aF+B,V)self:point(aE+C,aF-B,V)self:point(aE-C,aF+B,V)self:point(aE-C,aF-B,V)B=B+1;C=math.floor(math.sqrt(aH-B*B)+0.5)end;if B==C then self:point(aE+B,aF+C,V)self:point(aE+B,aF-C,V)self:point(aE-B,aF+C,V)self:point(aE-B,aF-C,V)end end}local aI={pressed_keys={},reset=function(self)self.pressed_keys={}end,is_key_pressed=function(self,aJ,d)if self.pressed_keys[d]then if aJ then self:remove_key(d)end;return true end;return false end,are_keys_pressed=function(self,aK,...)local keys={...}if not(#keys>0)then return false end;for aL,d in pairs(keys)do if not self:is_key_pressed(false,d)then return false end end;if aK then self:remove_keys(table.unpack(keys))end;return true end,add_key=function(self,d)self.pressed_keys[d]=true end,remove_key=function(self,d)self.pressed_keys[d]=nil end,remove_keys=function(self,...)local keys={...}for aL,d in pairs(keys)do self:remove_key(d)end end,manage_event=function(self,aM)if aM.name==b.KEY then self:add_key(aM.key)elseif aM.name==b.KEYUP then self:remove_key(aM.key)end end}local aN={}aN={side=nil,protocol="YAGUI-"..a.ver.."_WSS",host_prefix="_Host:",default_timeout=0.5,open=function(self,aO)rednet.open(aO)self.side=aO end,close=function(self)rednet.close(self.side)self.side=nil end,server={root={},servername=nil,hostname=nil,host=function(self,aP)if not aP then aP=os.getComputerID()end;aP=tostring(aP)local aQ=self.root.protocol..self.root.host_prefix..aP;if rednet.lookup(aQ,aP)then return false,aP end;rednet.host(aQ,aP)self.servername=aQ;self.hostname=aP;return true,aP end,unhost=function(self)rednet.broadcast(b.DISCONNECTED,self.servername)rednet.unhost(self.servername,self.hostname)self.servername=nil;self.hostname=nil end,broadcast=function(self)rednet.broadcast(af.frame,self.servername)end},client={root={},servername=nil,host_id=nil,connect=function(self,aP)aP=tostring(aP)local aQ=self.root.protocol..self.root.host_prefix..aP;local aR=rednet.lookup(aQ,aP)if not aR then return false,aP end;self.servername=aQ;self.host_id=aR;return true,aP end,disconnect=function(self)self.servername=nil;self.host_id=nil end,listen=function(self,aS)if not aS then aS=self.root.default_timeout end;local aT={rednet.receive(self.servername,aS)}if aT[1]==self.host_id then local aj=aT[2]if not aj then return false end;if aj==b.DISCONNECTED then return aj end;af.buffer.background=aj.background;af.buffer.pixels=aj.pixels;return true end;return false end}}aN.server.root=aN;aN.client.root=aN;local aU={}aU={Clock={new=function(aV)local aW={enabled=true,oneshot=false,clock=os.clock(),interval=aV,callbacks={onClock=function()end}}setmetatable(aW,aU.Clock)return aW end,event=function(self,aM)if not self.enabled then self:reset_timer()return end;if os.clock()>=self.clock+self.interval then self:reset_timer()self.callbacks.onClock(self,aM)if self.oneshot then self:stop()end end end,start=function(self)self:reset_timer()self.enabled=true end,stop=function(self)self.enabled=false end,reset_timer=function(self)self.clock=os.clock()end},Label={new=function(B,C,ap,aa,ab)local aX={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,text_alignment=b.ALIGN_CENTER,text=ap,pos=A.Vector2.new(B,C),colors={foreground=aa,background=ab},callbacks={onDraw=function()end}}setmetatable(aX,aU.Label)return aX end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)local aY=j.split(self.text,"\n")if self.text_alignment==b.ALIGN_LEFT then for d,aZ in pairs(aY)do af:write(self.pos.x,self.pos.y+d-1,aZ,self.colors.foreground,self.colors.background)end elseif self.text_alignment==b.ALIGN_CENTER then local a_=0;for d,aZ in pairs(aY)do if d==1 then a_=math.floor(#aZ/2)af:write(self.pos.x,self.pos.y,aZ,self.colors.foreground,self.colors.background)else af:write(self.pos.x+a_-math.floor(#aZ/2),self.pos.y+d-1,aZ,self.colors.foreground,self.colors.background)end end end end},Button={new=function(B,C,a0,a1,ap,aa,b0,b1)local b2={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,active=false,shortcut_once=true,shortcut={},text_alignment=b.ALIGN_CENTER,text=ap,pos=A.Vector2.new(B,C),size=A.Vector2.new(a0,a1),timed={enabled=false,clock=aU.Clock.new(0.5)},colors={foreground=aa,active_background=b0,unactive_background=b1},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onTimeout=function()end}}b2.timed.clock.binded_button=b2;b2.timed.clock.oneshot=true;b2.timed.clock:stop()e.set_callback(b2.timed.clock,b.ONCLOCK,function(self,aM)self.binded_button.active=false;self.binded_button.callbacks.onPress(self.binded_button,aM)self.binded_button.callbacks.onTimeout(self.binded_button,aM)end)setmetatable(b2,aU.Button)return b2 end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)if self.active then af:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.active_background)else af:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.unactive_background)end;local aY=j.split(self.text,"\n")local b3=math.floor((self.size.y-#aY)/2)+self.pos.y;for ar=0,#aY-1 do local aZ=aY[ar+1]local b4;if self.text_alignment==b.ALIGN_LEFT then b4=self.pos.x elseif self.text_alignment==b.ALIGN_CENTER then b4=math.floor((self.size.x-#aZ)/2)+self.pos.x end;af:write(b4,b3+ar,aZ,self.colors.foreground)end end,event=function(self,aM)if self.hidden then return false end;if aM.name==b.TOUCH then if Y.is_area_pressed(aM.x,aM.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self:press(aM)return true else self.callbacks.onFailedPress(self,aM)end elseif aI:are_keys_pressed(self.shortcut_once,table.unpack(self.shortcut))then self:press(aM)end;if self.timed.enabled then self.timed.clock:event(aM)end end,press=function(self,aM)if self.timed.enabled then self.timed.clock:start()if not self.active then self.active=true;self.callbacks.onPress(self,aM)end else self.active=not self.active;self.callbacks.onPress(self,aM)end end},Progressbar={new=function(B,C,a0,a1,b5,P,Q,aa,b6,b7)local b8={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,active=false,pos=A.Vector2.new(B,C),size=A.Vector2.new(a0,a1),value={max=Q,min=P,current=b5,draw_percentage=true},colors={foreground=aa,filled_background=b6,unfilled_background=b7},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end}}setmetatable(b8,aU.Progressbar)return b8 end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)local b9=A.map(self.value.current,self.value.min,self.value.max,0,1,true)local ba=math.floor(self.size.x*b9)af:rectangle(self.pos.x,self.pos.y,ba,self.size.y,self.colors.filled_background)af:rectangle(self.pos.x+ba,self.pos.y,self.size.x-ba,self.size.y,self.colors.unfilled_background)if self.value.draw_percentage then local bb=tostring(b9*100).."%"local bc=math.floor((self.size.x-#bb)/2)+self.pos.x;local b3=math.floor((self.size.y-1)/2)+self.pos.y;af:write(bc,b3,bb,self.colors.foreground)end end,event=function(self,aM)if self.hidden then return false end;if aM.name==b.TOUCH then if Y.is_area_pressed(aM.x,aM.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.callbacks.onPress(self,aM)end end end,set=function(self,n)local bd=A.constrain(n,self.value.min,self.value.max)self.value.current=bd end},Memo={new=function(B,C,a0,a1,aa,ab)local be={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,pos=A.Vector2.new(B,C),size=A.Vector2.new(a0,a1),editable=true,lines={},first_visible_line=1,first_visible_char=1,cursor={visible=false,text=" ",blink=aU.Clock.new(0.5),pos=A.Vector2.new(1,1)},limits=A.Vector2.new(0,0),whitelist={},blacklist={},colors={foreground=aa,background=ab,cursor=colors.white,cursor_text=colors.black},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onFocus=function()end,onKey=function()end,onChar=function()end}}be.cursor.blink.binded_cursor=be.cursor;e.set_callback(be.cursor.blink,b.ONCLOCK,function(self,aM)self.binded_cursor.visible=not self.binded_cursor.visible end)setmetatable(be,aU.Memo)return be end,draw=function(self)if self.hidden then return end;af:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.background)local bf=self.cursor.pos.x-self.first_visible_char;local bg=self.cursor.pos.y-self.first_visible_line;if bf>=self.size.x then self.first_visible_char=self.first_visible_char+bf-self.size.x+1;bf=self.cursor.pos.x-self.first_visible_char-1 elseif bf<1 then self.first_visible_char=self.first_visible_char+bf;bf=0 end;if bg>=self.size.y then self.first_visible_line=self.first_visible_line+bg-self.size.y+1;bg=self.cursor.pos.y-self.first_visible_line-1 elseif bg<1 then self.first_visible_line=self.first_visible_line+bg;bg=0 end;for C=1,self.size.y do local aZ=self.lines[C+self.first_visible_line-1]or""local bh=aZ:sub(self.first_visible_char,self.first_visible_char+self.size.x-1)af:write(self.pos.x,self.pos.y+C-1,bh,self.colors.foreground)end;if self.cursor.visible then af:write(bf+self.pos.x,bg+self.pos.y,self.cursor.text,self.colors.cursor_text,self.colors.cursor)end end,event=function(self,aM)if self.hidden then return false end;if not self.editable then return false end;if aM.name==b.TOUCH then if Y.is_area_pressed(aM.x,aM.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then local B=aM.x-self.pos.x;local C=aM.y-self.pos.y;self:set_cursor(B+self.first_visible_char,C+self.first_visible_line)self:focus(true,aM)self.callbacks.onPress(self,aM)return true else self:focus(false,aM)self.callbacks.onFailedPress(self,aM)return false end elseif aM.name==b.DELETED then self:focus(false,aM)return false end;if self.focussed then self.cursor.blink:event(self.cursor.blink,aM)if aM.name==b.PASTE then self:write(aM.paste)elseif aM.name==b.CHAR then if self.callbacks.onChar(self,aM)then return true end;self:write(aM.char)elseif aM.name==b.KEY then if self.callbacks.onKey(self,aM)then return true end;if aM.key==b.KEY_UP then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y-1)elseif aM.key==b.KEY_DOWN then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+1)elseif aM.key==b.KEY_RIGHT then local aZ=self.lines[self.cursor.pos.y]if self.lines[self.cursor.pos.y+1]and self.cursor.pos.x>=#aZ+1 then self:set_cursor(1,self.cursor.pos.y+1)else self:set_cursor(self.cursor.pos.x+1,self.cursor.pos.y)end elseif aM.key==b.KEY_LEFT then if self.cursor.pos.x<=1 and self.cursor.pos.y>1 then local bi=self.lines[self.cursor.pos.y-1]self:set_cursor(#bi+1,self.cursor.pos.y-1)else self:set_cursor(self.cursor.pos.x-1,self.cursor.pos.y)end elseif aM.key==b.KEY_BACKSPACE then local aZ=self.lines[self.cursor.pos.y]if self.cursor.pos.x<=1 then if self.cursor.pos.y>1 then table.remove(self.lines,self.cursor.pos.y)local bj=#self.lines[self.cursor.pos.y-1]+1;local bk=self.cursor.pos.y-1;self:set_cursor(bj,bk)self:write(aZ)self:set_cursor(bj,bk)end else self.lines[self.cursor.pos.y]=aZ:sub(1,self.cursor.pos.x-2)..aZ:sub(self.cursor.pos.x)self:set_cursor(self.cursor.pos.x-1,self.cursor.pos.y)end elseif aM.key==b.KEY_DELETE then local aZ=self.lines[self.cursor.pos.y]local bl=aZ:sub(self.cursor.pos.x)if#bl>0 then self.lines[self.cursor.pos.y]=aZ:sub(1,self.cursor.pos.x-1)..aZ:sub(self.cursor.pos.x+1)else local bm=self.lines[self.cursor.pos.y+1]if bm then local bj=self.cursor.pos.x;local bk=self.cursor.pos.y;table.remove(self.lines,self.cursor.pos.y+1)self:write(bm)self:set_cursor(bj,bk)end end elseif aM.key==b.KEY_ENTER then self:write("\n")elseif aM.key==b.KEY_TAB then self:write("  ")end elseif aM.name==b.MOUSESCROLL then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+aM.direction)end;return true end end,focus=function(self,bn,aM)if bn then self.focussed=true;self.callbacks.onFocus(self,aM)else self.focussed=false;self.cursor.visible=false;self.callbacks.onFocus(self,aM)end end,set_cursor=function(self,bj,bk,bo)if not self.lines[1]then self.lines[1]=""end;if self.limits.y>0 then bk=A.constrain(bk,1,self.limits.y)end;if bo then for C=#self.lines+1,bk do if not self.lines[C]then self.lines[C]=""end end else bk=A.constrain(bk,1,#self.lines)end;bj=A.constrain(bj,1,#self.lines[bk]+1)self.cursor.pos=A.Vector2.new(bj,bk)end,write=function(self,...)local ap=j.join({...},"")local aY=j.split(ap,"\n")self:set_cursor(self.cursor.pos.x,self.cursor.pos.y,true)if#self.whitelist>0 then local bp="[^"..j.escape_magic_characters(j.join(self.whitelist,"")).."]"for d,aZ in pairs(aY)do aY[d]=aZ:gsub(bp,"")end elseif#self.blacklist>0 then local bp="["..j.escape_magic_characters(j.join(self.blacklist,"")).."]"for d,aZ in pairs(aY)do aY[d]=aZ:gsub(bp,"")end end;if self.limits.y>0 then for C=1,#self.lines+#aY-1-self.limits.y do table.remove(aY)end;if#aY==0 then return end end;if#aY>1 then for bq,aZ in pairs(aY)do if bq==1 then local br=self.lines[self.cursor.pos.y]local bs=br:sub(1,self.cursor.pos.x-1)local bl=br:sub(self.cursor.pos.x)local bt=aY[#aY]if self.limits.x>0 then aZ=aZ:sub(1,self.limits.x-#bs)bt=bt:sub(1,self.limits.x-#bl)end;self.lines[self.cursor.pos.y]=bs..aZ;self:set_cursor(1,self.cursor.pos.y+1,true)table.insert(self.lines,self.cursor.pos.y,bt..bl)self:set_cursor(#bt+1,self.cursor.pos.y)elseif bq==#aY then break else if self.limits.x>0 then aZ=aZ:sub(1,self.limits.x)end;table.insert(self.lines,self.cursor.pos.y,aZ)self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+1)end end else local br=self.lines[self.cursor.pos.y]local bs=br:sub(1,self.cursor.pos.x-1)local bl=br:sub(self.cursor.pos.x)if self.limits.x>0 then aY[1]=aY[1]:sub(1,self.limits.x-(#bs+#bl))end;self.lines[self.cursor.pos.y]=bs..aY[1]..bl;self:set_cursor(self.cursor.pos.x+#aY[1],self.cursor.pos.y)end end,print=function(self,...)local ap=j.join({...},"\n").."\n"self:write(ap)end,clear=function(self)self.lines={""}self:set_cursor(1,1)end},Window={new=function(B,C,a0,a1,ab,bu)local bv={draw_priority=b.HIGH_PRIORITY,focussed=false,hidden=false,pos=A.Vector2.new(B,C),size=A.Vector2.new(a0,a1),drag_options={enabled=true,from=A.Vector2.new(1,1)},shadow={enabled=bu,offset=A.Vector2.new(1,1)},elements={},colors={background=ab,shadow=colors.black},callbacks={onDraw=function()end,onPress=function()end,onFailedPress=function()end,onFocus=function()end}}setmetatable(bv,aU.Window)return bv end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)if self.shadow.enabled then af:rectangle(self.pos.x+self.shadow.offset.x,self.pos.y+self.shadow.offset.y,self.size.x,self.size.y,self.colors.shadow)end;af:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.background)self:draw_elements()end,event=function(self,aM)if self.hidden then return false end;local bw=self:event_elements(aM)if not bw then if aM.name==b.TOUCH then if Y.is_area_pressed(aM.x,aM.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.drag_options.from=A.Vector2.new(aM.x,aM.y)self.focussed=true;self.callbacks.onPress(self,aM)self.callbacks.onFocus(self,aM)return true else self.focussed=false;self.callbacks.onFailedPress(self,aM)self.callbacks.onFocus(self,aM)end elseif aM.name==b.MOUSEDRAG and self.focussed then self:drag(aM.x,aM.y)return true elseif aM.name==b.DELETED then self.focussed=false;self.callbacks.onFocus(self,aM)end else self.focussed=false;self.callbacks.onFocus(self,aM)end;return bw end,drag=function(self,B,C)if self.drag_options.enabled then local bx=A.Vector2.new(B-self.drag_options.from.x,C-self.drag_options.from.y)self.pos=self.pos+bx;for d,by in pairs(self.elements)do if by.pos then by.pos=by.pos+bx end end;self.drag_options.from=A.Vector2.new(B,C)end end,set_elements=function(self,bz,bA)self.elements={}for d,by in pairs(bz)do if bA then by.pos=self.pos+by.pos-A.Vector2.ONE end;table.insert(self.elements,by)end end,draw_elements=function(self)for d=#self.elements,1,-1 do local by=self.elements[d]if by.draw then by:draw()end end end,event_elements=function(self,aM)local bw=false;for d,by in pairs(self.elements)do if by.event then local bB=by:event(aM)bw=bw or bB;if bB then aM={name=b.DELETED}end end end;return bw end}}aU.Clock.__index=aU.Clock;aU.Label.__index=aU.Label;aU.Button.__index=aU.Button;aU.Progressbar.__index=aU.Progressbar;aU.Memo.__index=aU.Memo;aU.Window.__index=aU.Window;local bC={}bC={new=function(bD,bE)local bF={options={enabled=false,FPS_target=bD,EPS_target=bE},monitors={terminal=term},elements={high_priority={},low_priority={},loop={clock=aU.Clock.new(1/bD),stats_clock=aU.Clock.new(1),FPS_label=aU.Label.new(1,1,"1 FPS",colors.white),EPS_label=aU.Label.new(1,2,"1 EPS",colors.white)}},stats={pos=A.Vector2.new(1,1),elements=nil,enabled=true,enable=function(self,bG)self.enabled=bG;self.elements.stats_clock.enabled=bG;self.elements.FPS_label.hidden=not bG;self.elements.EPS_label.hidden=not bG end,update_pos=function(self)self.elements.FPS_label.pos=self.pos;self.elements.EPS_label.pos=self.pos+A.Vector2.DOWN end,FPS=0,EPS=0},callbacks={onStart=function()end,onStop=function()end,onDraw=function()end,onClock=function()end,onEvent=function()end}}bF.elements.loop.stats_clock.stats=bF.stats;bF.stats.elements=bF.elements.loop;e.set_callback(bF.elements.loop.stats_clock,b.ONCLOCK,function(self,aM)self.stats:update_pos()self.stats.elements.FPS_label.text=tostring(self.stats.FPS).." FPS"self.stats.elements.EPS_label.text=tostring(self.stats.EPS).." EPS"self.stats.FPS=0;self.stats.EPS=0 end)bF.stats:enable(false)setmetatable(bF,bC)return bF end,set_monitors=function(self,a6)self.monitors=a5.get_monitors(a6)end,set_elements=function(self,bz)self.elements.high_priority={}self.elements.low_priority={}for d,n in pairs(bz)do if n.draw_priority==b.HIGH_PRIORITY then table.insert(self.elements.high_priority,n)else table.insert(self.elements.low_priority,n)end end end,draw_elements=function(self)local function bH(k)for d=#k,1,-1 do local by=k[d]if by.draw then by:draw()end end end;self.callbacks.onDraw(self)local bI=af.screens;af.screens=self.monitors;bH(self.elements.low_priority)bH(self.elements.high_priority)for d,by in pairs(self.elements.loop)do if by.draw then by:draw()end end;af:draw()af.screens=bI;if self.stats.enabled then self.stats.FPS=self.stats.FPS+1 end end,event_elements=function(self,aM)local function a2(k)for d,by in pairs(k)do if by.event then if by:event(aM)then aM={name=b.DELETED}end end end end;if self.callbacks.onEvent(self,aM)then aM={name=b.DELETED}end;if aM.name==b.TOUCH then local bJ=false;for bK,a9 in pairs(self.monitors)do if aM.from==bK then bJ=true;break end end;if not bJ then aM={name=b.DELETED}end end;a2(self.elements.loop)local bL={}for d,by in pairs(self.elements.high_priority)do if by.event then local bM=by:event(aM)if bM then aM={name=b.DELETED}if self.elements.high_priority~=by then table.insert(bL,{element=by,key=d})end end end end;if#bL>0 then for d,n in pairs(bL)do table.insert(self.elements.high_priority,1,n.element)table.remove(self.elements.high_priority,n.key+#bL)end end;a2(self.elements.low_priority)if self.stats.enabled then self.stats.EPS=self.stats.EPS+1 end end,start=function(self)self.enabled=true;aI:reset()e.set_callback(self.elements.loop.clock,b.ONCLOCK,function(bN,aM)self.callbacks.onClock(self,aM)self:draw_elements()bN.interval=1/self.options.FPS_target end)self.stats:update_pos()self.callbacks.onStart(self)while self.enabled do local bO=os.startTimer(1/self.options.EPS_target)local bP={os.pullEvent()}local aM=Y.format_event_table(bP)aI:manage_event(aM)self:event_elements(aM)os.cancelTimer(bO)end;aI:reset()self.callbacks.onStop(self)end,stop=function(self)self.enabled=false end}bC.__index=bC;local bQ={...}if bQ[1]=="help"then local aY={{text="LIBFILE <COMMAND>",foreground=colors.green,background=nil},{text=" - help (shows this list of commands)",foreground=colors.blue,background=nil},{text=" - info (prints info about the lib)",foreground=colors.yellow,background=nil},{text=" - ver (prints version of the lib)",foreground=colors.green,background=nil},{text=" - copyright (prints copyright of the lib)",foreground=colors.blue,background=nil},{text=" - setup (adds YAGUI_PATH to computer's settings)",foreground=colors.yellow,background=nil},{text=" - create <PATH> (creates a new YAGUI project)",foreground=colors.green,background=nil}}for d,aZ in pairs(aY)do a5.better_print(term,aZ.foreground,aZ.background,aZ.text)end elseif bQ[1]=="info"then a5.better_print(term,colors.red,nil,"Library Version: ",a.ver)a5.better_print(term,colors.yellow,nil,"Library Author: ",a.author)a5.better_print(term,colors.green,nil,"Library Website: ",a.website)a5.better_print(term,colors.blue,nil,"Library Documentation: ",a.documentation)elseif bQ[1]=="ver"then a5.better_print(term,colors.red,nil,"Library Version: ",a.ver)elseif bQ[1]=="copyright"then local bR={colors.red,colors.yellow,colors.green}local bS=j.split(a.copyright,"\n\n")for d,bT in pairs(bS)do a5.better_print(term,bR[d],nil,bT)if d<#bS then read("")end end elseif bQ[1]=="setup"then if shell then local bU="YAGUI_PATH"local x="/"..shell.getRunningProgram()a3:set(bU,x)a5.better_print(term,colors.green,nil,"Lib path was set to \"",a3.get(bU),"\".")else a5.better_print(term,colors.red,nil,"SHELL API ISN'T AVAILABLE!")end elseif bQ[1]=="create"then if bQ[2]then local x=shell.resolve(bQ[2])local a4=fs.getName(x):lower()if j.get_extension(x)~="lua"then x=x..".lua"end;if fs.exists(x)then a5.better_print(term,colors.red,nil,"PATH: \"/",x,"\" already exists, please use another path or delete it.")else local bV=fs.open(x,"w")bV.write("\n-- AUTO-GENERATED with \"YAGUI create\"\nlocal YAGUI_PATH = settings.get(\"YAGUI_PATH\")\nif not (type(YAGUI_PATH) == \"string\") then printError(\"YAGUI is not installed, please install it by opening it with argument \\\"setup\\\".\"); return; end\nif not fs.exists(YAGUI_PATH) then printError(\"Couldn't find YAGUI in path: \\\"\"..YAGUI_PATH..\"\\\", Please reinstall it by opening it with argument \\\"setup\\\".\"); return; end\nlocal YAGUI = dofile(YAGUI_PATH)\n-- End of AUTO-GENERATED code\n\n")bV.close()a5.better_print(term,colors.green,nil,"New project was created at \"/",x,"\".")end else a5.better_print(term,colors.red,nil,"You must specify a path to create a new project.")end elseif bQ[1]then a5.better_print(term,colors.red,nil,"UNKNOWN COMMAND: \"",bQ[1],"\"")a5.better_print(term,colors.green,nil,"Use \"help\" to get a list of available commands!")end;local bW={info=a,generic_utils=e,string_utils=j,math_utils=A,table_utils=R,color_utils=U,event_utils=Y,setting_utils=a3,monitor_utils=a5,screen_buffer=af,input=aI,WSS=aN,wireless_screen_share=aN,gui_elements=aU,Loop=bC}for d,n in pairs(b)do bW[d]=n end;return bW
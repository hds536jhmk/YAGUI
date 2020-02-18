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
local a={ver="1.4",author="hds536jhmk",website="https://github.com/hds536jhmk/YAGUI",copyright="Copyright (c) 2019, hds536jhmk : https://github.com/hds536jhmk/YAGUI\n\nPermission to use, copy, modify, and/or distribute this software for any\npurpose with or without fee is hereby granted, provided that the above\ncopyright notice and this permission notice appear in all copies.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\" AND THE AUTHOR DISCLAIMS ALL WARRANTIES\nWITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF\nMERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR\nANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES\nWHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN\nACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF\nOR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE."}local b={TOUCH="screen_touch",MOUSEUP="mouse_up",MOUSEDRAG="mouse_drag",CHAR="char",KEY="key",DELETED="DELETED",DISCONNECTED="DISCONNECTED",LOW_PRIORITY=1,HIGH_PRIORITY=2,ONDRAW=3,ONPRESS=4,ONTIMEOUT=5,ONCLOCK=6,ONEVENT=7,ONFOCUS=8,KEY_UP_ARROW=200,KEY_DOWN_ARROW=208,KEY_RIGHT_ARROW=205,KEY_LEFT_ARROW=203,KEY_ENTER=28,KEY_BACKSPACE=14,KEY_DELETE=211,KEY_TAB=15,MOUSE_LEFT=1,MOUSE_RIGHT=2,MOUSE_MIDDLE=3,COMPUTER="computer",COMPUTER_ADVANCED="computer_advanced",TURTLE="turtle",TURTLE_ADVANCED="turtle_advanced",POCKET="pocket",POCKET_ADVANCED="pocket_advanced"}local c={set_callback=function(d,e,f)if e==b.ONDRAW then d.callbacks.onDraw=f elseif e==b.ONPRESS then d.callbacks.onPress=f elseif e==b.ONTIMEOUT then d.callbacks.onTimeout=f elseif e==b.ONCLOCK then d.callbacks.onClock=f elseif e==b.ONEVENT then d.callbacks.onEvent=f elseif e==b.ONFOCUS then d.callbacks.onFocus=f end end,get_computer_type=function()if turtle then if term.isColor()then return b.TURTLE_ADVANCED else return b.TURTLE end elseif pocket then if term.isColor()then return b.POCKET_ADVANCED else return b.POCKET end else if term.isColor()then return b.COMPUTER_ADVANCED else return b.COMPUTER end end end}local g={}g={magic_characters={"(",")",".","%","+","-","*","?","[","]","^","$"},join=function(h,i)if not i then i=""end;local j=""for k=1,#h do local l=h[k]j=j..tostring(l)if k<#h then j=j..i end end;return j end,split=function(j,i)local h={}while true do local m=j:find(i)if m then table.insert(h,j:sub(1,m-1))j=j:sub(m+1)else table.insert(h,j)break end end;return h end,compare_versions=function(n,o)local p=g.split(n,".")local q=g.split(o,".")local r=#p;local s=#q;for t=1,math.min(r,s)do if tonumber(p[t])>tonumber(q[t])then return 1 elseif tonumber(p[t])<tonumber(q[t])then return-1 end end;if r>s then return 1 elseif r<s then return-1 end;return 0 end,escape_magic_characters=function(j)for k,u in pairs(g.magic_characters)do j=j:gsub("[%"..u.."]",'%%%'..u)end;return j end}local v={}v={Vector2={new=function(w,x)local y={x=w,y=x}setmetatable(y,v.Vector2)return y end,__add=function(self,z)return v.Vector2.new(self.x+z.x,self.y+z.y)end,__sub=function(self,z)return v.Vector2.new(self.x-z.x,self.y-z.y)end,__mul=function(self,A)return v.Vector2.new(self.x*A,self.y*A)end,__div=function(self,A)return v.Vector2.new(self.x/A,self.y/A)end},map=function(l,B,C,D,E,F)local G=(l-B)/(C-B)*(E-D)+D;if F then return v.constrain(G,D,E)end;return G end,constrain=function(l,H,I)return math.min(I,math.max(H,l))end}v.Vector2.__index=v.Vector2;local J={has_value=function(h,l)for K,L in pairs(h)do if L==l then return true,K end end;return false,nil end,has_key=function(h,k)if h.key~=nil then return true,h.key end;return false,nil end}local M={}M={colors={},color_to_paint=function(N)return M.colors[tostring(N)]end,paint_to_color=function(O)local P,N=J.has_value(M.colors,O)if P then return N end end}M.colors["1"]="0"M.colors["2"]="1"M.colors["4"]="2"M.colors["8"]="3"M.colors["16"]="4"M.colors["32"]="5"M.colors["64"]="6"M.colors["128"]="7"M.colors["256"]="8"M.colors["512"]="9"M.colors["1024"]="a"M.colors["2048"]="b"M.colors["4096"]="c"M.colors["8192"]="d"M.colors["16384"]="e"M.colors["32768"]="f"local Q={is_area_pressed=function(R,S,w,x,T,U)if R>=w and R<w+T then if S>=x and S<x+U then return true end end;return false end,format_event_table=function(V)local e={}e.name=V[1]if e.name=="mouse_click"then e.name=b.TOUCH;e.from="terminal"e.button=V[2]e.x=V[3]e.y=V[4]return e elseif e.name=="monitor_touch"then e.name=b.TOUCH;e.from=V[2]e.button=1;e.x=V[3]e.y=V[4]return e elseif e.name=="char"then e.name=b.CHAR;e.char=V[2]return e elseif e.name=="key"then e.name=b.KEY;e.key=V[2]return e elseif e.name=="mouse_drag"then e.name=b.MOUSEDRAG;e.button=V[2]e.x=V[3]e.y=V[4]return e end;table.remove(V,1)e.parameters=V;return e end}local W={_path="/.settings",set=function(self,X,l)settings.set(X,l)settings.save(self._path)end,unset=function(self,X)settings.unset(X)settings.save(self._path)end,get=function(X)return settings.get(X)end}local Y={get_monitors=function(Z)local _={}for k,a0 in pairs(Z)do if a0=="terminal"then _[a0]=term else if peripheral.getType(a0)=="monitor"then _[a0]=peripheral.wrap(a0)end end end;return _ end,better_print=function(a1,a2,a3,...)local a4=g.join({...},"")local a5=a1.getTextColor()local a6=a1.getBackgroundColor()if a2 then a1.setTextColor(a2)end;if a3 then a1.setBackgroundColor(a3)end;print(a4)a1.setTextColor(a5)a1.setBackgroundColor(a6)end,better_clear=function(a1)a1.clear()a1.setCursorPos(1,1)end}local a7={frame={pixels={},background=nil},screens={terminal=term},clear_after_draw=true,buffer={pixels={},background=colors.black,is_pixel_custom=function(self,w,x)w=tostring(w)x=tostring(x)if self.pixels[w]then if self.pixels[w][x]then return true end end;return false end,get_pixel=function(self,w,x)w=tostring(w)x=tostring(x)if self:is_pixel_custom(w,x)then return self.pixels[w][x]end;return{char=" ",foreground=self.background,background=self.background}end,set_pixel=function(self,w,x,char,a2,a3)w=tostring(w)x=tostring(x)local a8=self:get_pixel(w,x)if char and#char==1 then a8.char=char end;if a2 then a8.foreground=a2 end;if a3 then a8.background=a3 end;if not self.pixels[w]then self.pixels[w]={}end;self.pixels[w][x]=a8 end,clear=function(self)self.pixels={}end},set_screens=function(self,a9)self.screens=Y.get_monitors(a9)end,set_monitors=function(self,Z)self:set_screens(Z)end,clear=function(self)self.buffer:clear()end,draw=function(self)local aa=self.screens;local ab=self.buffer;for ac,ad in pairs(aa)do local ae,af=ad.getCursorPos()local T,U=ad.getSize()for x=1,U do local ag={text="",background="",foreground=""}for w=1,T do local a8=ab:get_pixel(w,x)ag.text=ag.text..a8.char;ag.background=ag.background..M.colors[tostring(a8.background)]ag.foreground=ag.foreground..M.colors[tostring(a8.foreground)]end;ad.setCursorPos(1,x)ad.blit(ag.text,ag.foreground,ag.background)end;ad.setCursorPos(ae,af)end;self.frame.pixels=self.buffer.pixels;self.frame.background=self.buffer.background;if self.clear_after_draw then self:clear()end end,point=function(self,w,x,N)self.buffer:set_pixel(w,x," ",N,N)end,write=function(self,w,x,ah,a2,a3)for ai=0,#ah-1 do char=ah:sub(ai+1,ai+1)self.buffer:set_pixel(w+ai,x,char,a2,a3)end end,rectangle=function(self,w,x,T,U,N)for ai=0,T-1 do for aj=0,U-1 do self:point(w+ai,x+aj,N)end end end,line=function(self,ak,al,am,an,N)local function ao(ak,al,am,an)local ap=1;if ak>am then ap=-1 end;local aq=am-ak;local ar=an-al;local as=1;if ar<0 then as=-1;ar=-ar end;local at=2*ar-aq;local x=al;for w=ak,am,ap do self:point(w,x,N)if at>0 then x=x+as;at=at-2*aq end;at=at+2*ar end end;local function au(ak,al,am,an)local ap=1;if al>an then ap=-1 end;local aq=am-ak;local ar=an-al;local av=1;if aq<0 then av=-1;aq=-aq end;local at=2*aq-ar;local w=ak;for x=al,an,ap do self:point(w,x,N)if at>0 then w=w+av;at=at-2*ar end;at=at+2*aq end end;if math.abs(an-al)<math.abs(am-ak)then if ak>am then ao(am,an,ak,al)else ao(ak,al,am,an)end else if al>an then au(am,an,ak,al)else au(ak,al,am,an)end end end,circle=function(self,aw,ax,ay,N)local az=ay*ay;self:point(aw,ax+ay,N)self:point(aw,ax-ay,N)self:point(aw+ay,ax,N)self:point(aw-ay,ax,N)local w=1;local x=math.floor(math.sqrt(az-1)+0.5)while w<x do self:point(aw+w,ax+x,N)self:point(aw+w,ax-x,N)self:point(aw-w,ax+x,N)self:point(aw-w,ax-x,N)self:point(aw+x,ax+w,N)self:point(aw+x,ax-w,N)self:point(aw-x,ax+w,N)self:point(aw-x,ax-w,N)w=w+1;x=math.floor(math.sqrt(az-w*w)+0.5)end;if w==x then self:point(aw+w,ax+x,N)self:point(aw+w,ax-x,N)self:point(aw-w,ax+x,N)self:point(aw-w,ax-x,N)end end}local aA={}aA={side=nil,protocol="YAGUI-"..a.ver.."_WSS",host_prefix="_Host:",default_timeout=0.5,open=function(self,aB)rednet.open(aB)self.side=aB end,close=function(self)rednet.close(self.side)self.side=nil end,server={root={},servername=nil,hostname=nil,host=function(self,aC)if not aC then aC=os.getComputerID()end;aC=tostring(aC)local aD=self.root.protocol..self.root.host_prefix..aC;if rednet.lookup(aD,aC)then return false end;rednet.host(aD,aC)self.servername=aD;self.hostname=aC;return true end,unhost=function(self)rednet.broadcast(b.DISCONNECTED,self.servername)rednet.unhost(self.servername,self.hostname)self.servername=nil;self.hostname=nil end,broadcast=function(self)rednet.broadcast(a7.frame,self.servername)end},client={root={},servername=nil,host_id=nil,connect=function(self,aC)aC=tostring(aC)local aD=self.root.protocol..self.root.host_prefix..aC;local aE=rednet.lookup(aD,aC)if not aE then return false end;self.servername=aD;self.host_id=aE;return true end,disconnect=function(self)self.servername=nil;self.host_id=nil end,listen=function(self,aF)if not aF then aF=self.root.default_timeout end;local aG={rednet.receive(self.servername,aF)}if aG[1]==self.host_id then local ab=aG[2]if not ab then return false end;if ab==b.DISCONNECTED then return ab end;a7.buffer.background=ab.background;a7.buffer.pixels=ab.pixels;return true end;return false end}}aA.server.root=aA;aA.client.root=aA;local aH={}aH={Clock={new=function(aI)local aJ={enabled=true,oneshot=false,clock=os.clock(),interval=aI,callbacks={onClock=function()end}}setmetatable(aJ,aH.Clock)return aJ end,event=function(self,aK)if not self.enabled then self:reset_timer()return end;if os.clock()>=self.clock+self.interval then self:reset_timer()self.callbacks.onClock(self,aK)if self.oneshot then self:stop()end end end,start=function(self)self:reset_timer()self.enabled=true end,stop=function(self)self.enabled=false end,reset_timer=function(self)self.clock=os.clock()end},Label={new=function(w,x,ah,a2,a3)local aL={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,text=ah,pos=v.Vector2.new(w,x),colors={foreground=a2,background=a3},callbacks={onDraw=function()end,onPress=function()end}}setmetatable(aL,aH.Label)return aL end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)a7:write(self.pos.x,self.pos.y,self.text,self.colors.foreground,self.colors.background)end,event=function(self,aK)if aK.name==b.TOUCH then if Q.is_area_pressed(aK.x,aK.y,self.pos.x,self.pos.y,#self.text,1)then self.callbacks.onPress(self,aK)end end end},Button={new=function(w,x,T,U,ah,a2,aM,aN)local aO={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,active=false,text=ah,pos=v.Vector2.new(w,x),size=v.Vector2.new(T,U),timed={enabled=false,clock=aH.Clock.new(0.5)},colors={foreground=a2,active_background=aM,unactive_background=aN},callbacks={onDraw=function()end,onPress=function()end,onTimeout=function()end}}aO.timed.clock.binded_button=aO;aO.timed.clock.oneshot=true;aO.timed.clock:stop()c.set_callback(aO.timed.clock,b.ONCLOCK,function(self,aK)self.binded_button.active=false;self.binded_button.callbacks.onPress(self.binded_button,aK)self.binded_button.callbacks.onTimeout(self.binded_button,aK)end)setmetatable(aO,aH.Button)return aO end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)if self.active then a7:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.active_background)else a7:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.unactive_background)end;local aP=g.split(self.text,"\n")local aQ=math.floor((self.size.y-#aP)/2)+self.pos.y;for aj=0,#aP-1 do local l=aP[aj+1]local aR=math.floor((self.size.x-#l)/2)+self.pos.x;a7:write(aR,aQ+aj,l,self.colors.foreground)end end,event=function(self,aK)if aK.name==b.TOUCH then if Q.is_area_pressed(aK.x,aK.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then if self.timed.enabled then self.timed.clock:start()if not self.active then self.active=true;self.callbacks.onPress(self,aK)end else self:press(aK)end;return true end end;if self.timed.enabled then self.timed.clock:event(aK)end end,press=function(self,aK)self.active=not self.active;self.callbacks.onPress(self,aK)end},Progressbar={new=function(w,x,T,U,aS,H,I,a2,aT,aU)local aV={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,active=false,pos=v.Vector2.new(w,x),size=v.Vector2.new(T,U),value={max=I,min=H,current=aS,draw_percentage=true},colors={foreground=a2,filled_background=aT,unfilled_background=aU},callbacks={onDraw=function()end,onPress=function()end}}setmetatable(aV,aH.Progressbar)return aV end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)local aW=v.map(self.value.current,self.value.min,self.value.max,0,1,true)local aX=math.floor(self.size.x*aW)a7:rectangle(self.pos.x,self.pos.y,aX,self.size.y,self.colors.filled_background)a7:rectangle(self.pos.x+aX,self.pos.y,self.size.x-aX,self.size.y,self.colors.unfilled_background)if self.value.draw_percentage then local aY=tostring(aW*100).."%"local aZ=math.floor((self.size.x-#aY)/2)+self.pos.x;local aQ=math.floor((self.size.y-1)/2)+self.pos.y;a7:write(aZ,aQ,aY,self.colors.foreground)end end,event=function(self,aK)if aK.name==b.TOUCH then if Q.is_area_pressed(aK.x,aK.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.callbacks.onPress(self,aK)end end end,set=function(self,l)local a_=v.constrain(l,self.value.min,self.value.max)self.value.current=a_ end},Memo={new=function(w,x,T,U,a2,a3)local b0={draw_priority=b.LOW_PRIORITY,focussed=false,hidden=false,pos=v.Vector2.new(w,x),size=v.Vector2.new(T,U),editable=true,lines={},first_visible_line=1,first_visible_char=1,cursor={visible=false,text=" ",blink=aH.Clock.new(0.5),pos=v.Vector2.new(1,1)},limits=v.Vector2.new(0,0),whitelist={},blacklist={},colors={foreground=a2,background=a3,cursor=colors.white,cursor_text=colors.black},callbacks={onDraw=function()end,onFocus=function()end}}b0.cursor.blink.binded_cursor=b0.cursor;c.set_callback(b0.cursor.blink,b.ONCLOCK,function(self,aK)self.binded_cursor.visible=not self.binded_cursor.visible end)setmetatable(b0,aH.Memo)return b0 end,draw=function(self)if self.hidden then return end;a7:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.background)local b1=self.cursor.pos.x-self.first_visible_char;local b2=self.cursor.pos.y-self.first_visible_line;if b1>=self.size.x then self.first_visible_char=self.first_visible_char+b1-self.size.x+1;b1=self.cursor.pos.x-self.first_visible_char-1 elseif b1<1 then self.first_visible_char=self.first_visible_char+b1;b1=0 end;if b2>=self.size.y then self.first_visible_line=self.first_visible_line+b2-self.size.y+1;b2=self.cursor.pos.y-self.first_visible_line-1 elseif b2<1 then self.first_visible_line=self.first_visible_line+b2;b2=0 end;for x=1,self.size.y do local b3=self.lines[x+self.first_visible_line-1]or""local b4=b3:sub(self.first_visible_char,self.first_visible_char+self.size.x-1)a7:write(self.pos.x,self.pos.y+x-1,b4,self.colors.foreground)end;if self.cursor.visible then a7:write(b1+self.pos.x,b2+self.pos.y,self.cursor.text,self.colors.cursor_text,self.colors.cursor)end end,event=function(self,aK)if not self.editable then return false end;if aK.name==b.TOUCH then if Q.is_area_pressed(aK.x,aK.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.focussed=true;local w=aK.x-self.pos.x;local x=aK.y-self.pos.y;self:set_cursor(w+self.first_visible_char,x+self.first_visible_line)self.callbacks.onFocus(self,aK)return true else self.focussed=false;self.cursor.visible=false;self.callbacks.onFocus(self,aK)return false end elseif aK.name==b.DELETED then self.focussed=false;self.cursor.visible=false;self.callbacks.onFocus(self,aK)return false end;if self.focussed then self.cursor.blink:event(self.cursor.blink,aK)if aK.name==b.CHAR then self:write(aK.char)return true elseif aK.name==b.KEY then if aK.key==b.KEY_UP_ARROW then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y-1)elseif aK.key==b.KEY_DOWN_ARROW then self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+1)elseif aK.key==b.KEY_RIGHT_ARROW then local b3=self.lines[self.cursor.pos.y]if self.lines[self.cursor.pos.y+1]and self.cursor.pos.x>=#b3+1 then self:set_cursor(1,self.cursor.pos.y+1)else self:set_cursor(self.cursor.pos.x+1,self.cursor.pos.y)end elseif aK.key==b.KEY_LEFT_ARROW then if self.cursor.pos.x<=1 and self.cursor.pos.y>1 then local b5=self.lines[self.cursor.pos.y-1]self:set_cursor(#b5+1,self.cursor.pos.y-1)else self:set_cursor(self.cursor.pos.x-1,self.cursor.pos.y)end elseif aK.key==b.KEY_BACKSPACE then local b3=self.lines[self.cursor.pos.y]if self.cursor.pos.x<=1 and self.cursor.pos.y>1 then table.remove(self.lines,self.cursor.pos.y)local b6=#self.lines[self.cursor.pos.y-1]+1;local b7=self.cursor.pos.y-1;self:set_cursor(b6,b7)self:write(b3)self:set_cursor(b6,b7)else self.lines[self.cursor.pos.y]=b3:sub(1,self.cursor.pos.x-2)..b3:sub(self.cursor.pos.x)self:set_cursor(self.cursor.pos.x-1,self.cursor.pos.y)end elseif aK.key==b.KEY_DELETE then local b3=self.lines[self.cursor.pos.y]local b8=b3:sub(self.cursor.pos.x)if#b8>0 then self.lines[self.cursor.pos.y]=b3:sub(1,self.cursor.pos.x-1)..b3:sub(self.cursor.pos.x+1)else local b9=self.lines[self.cursor.pos.y+1]if b9 then local b6=self.cursor.pos.x;local b7=self.cursor.pos.y;table.remove(self.lines,self.cursor.pos.y+1)self:write(b9)self:set_cursor(b6,b7)end end elseif aK.key==b.KEY_ENTER then self:write("\n")elseif aK.key==b.KEY_TAB then self:write("  ")end;return true end end end,set_cursor=function(self,b6,b7,ba)if not self.lines[1]then self.lines[1]=""end;if self.limits.y>0 then b7=v.constrain(b7,1,self.limits.y)end;if ba then for x=#self.lines+1,b7 do if not self.lines[x]then self.lines[x]=""end end else b7=v.constrain(b7,1,#self.lines)end;b6=v.constrain(b6,1,#self.lines[b7]+1)self.cursor.pos=v.Vector2.new(b6,b7)end,write=function(self,...)local ah=g.join({...},"")local bb=g.split(ah,"\n")self:set_cursor(self.cursor.pos.x,self.cursor.pos.y,true)if#self.whitelist>0 then local bc="[^"..g.escape_magic_characters(g.join(self.whitelist,"")).."]"for k,b3 in pairs(bb)do bb[k]=b3:gsub(bc,"")end elseif#self.blacklist>0 then local bc="["..g.escape_magic_characters(g.join(self.blacklist,"")).."]"for k,b3 in pairs(bb)do bb[k]=b3:gsub(bc,"")end end;if self.limits.y>0 then for x=1,#self.lines+#bb-1-self.limits.y do table.remove(bb)end;if#bb<=0 then return end end;if#bb>1 then for bd,b3 in pairs(bb)do if bd<=1 then local be=self.lines[self.cursor.pos.y]local bf=be:sub(1,self.cursor.pos.x-1)local b8=be:sub(self.cursor.pos.x)local bg=bb[#bb]if self.limits.x>0 then b3=b3:sub(1,self.limits.x-#bf)bg=bg:sub(1,self.limits.x-#b8)end;self.lines[self.cursor.pos.y]=bf..b3;self:set_cursor(1,self.cursor.pos.y+1,true)table.insert(self.lines,self.cursor.pos.y,bg..b8)self:set_cursor(#bg+1,self.cursor.pos.y)elseif bd>=#bb then break else if self.limits.x>0 then b3=b3:sub(1,self.limits.x)end;table.insert(self.lines,self.cursor.pos.y,b3)self:set_cursor(self.cursor.pos.x,self.cursor.pos.y+1)end end else local be=self.lines[self.cursor.pos.y]local bf=be:sub(1,self.cursor.pos.x-1)local b8=be:sub(self.cursor.pos.x)if self.limits.x>0 then bb[1]=bb[1]:sub(1,self.limits.x-(#bf+#b8))end;self.lines[self.cursor.pos.y]=bf..bb[1]..b8;self:set_cursor(self.cursor.pos.x+#bb[1],self.cursor.pos.y)end end},Window={new=function(w,x,T,U,a3,bh)local bi={draw_priority=b.HIGH_PRIORITY,focussed=false,hidden=false,pos=v.Vector2.new(w,x),size=v.Vector2.new(T,U),drag_options={enabled=true,from=v.Vector2.new(1,1)},shadow={enabled=bh,offset=v.Vector2.new(1,1)},elements={},colors={background=a3,shadow=colors.black},callbacks={onDraw=function()end,onPress=function()end,onFocus=function()end}}setmetatable(bi,aH.Window)return bi end,draw=function(self)if self.hidden then return end;self.callbacks.onDraw(self)if self.shadow then a7:rectangle(self.pos.x+self.shadow.offset.x,self.pos.y+self.shadow.offset.y,self.size.x,self.size.y,self.colors.shadow)end;a7:rectangle(self.pos.x,self.pos.y,self.size.x,self.size.y,self.colors.background)self:draw_elements()end,event=function(self,aK)local bj=self:event_elements(aK)if not bj then if aK.name==b.TOUCH then if Q.is_area_pressed(aK.x,aK.y,self.pos.x,self.pos.y,self.size.x,self.size.y)then self.drag_options.from=v.Vector2.new(aK.x,aK.y)self.focussed=true;self.callbacks.onPress(self,aK)self.callbacks.onFocus(self,aK)return true else self.focussed=false end elseif aK.name==b.MOUSEDRAG and self.focussed then self:drag(aK.x,aK.y)return true elseif aK.name==b.DELETED then self.focussed=false;self.callbacks.onFocus(self,aK)end else self.focussed=false;self.callbacks.onFocus(self,aK)end;return bj end,drag=function(self,w,x)if self.drag_options.enabled then local bk=v.Vector2.new(w-self.drag_options.from.x,x-self.drag_options.from.y)self.pos=self.pos+bk;for k,bl in pairs(self.elements)do if bl.pos then bl.pos=bl.pos+bk end end;self.drag_options.from=v.Vector2.new(w,x)end end,set_elements=function(self,bm)self.elements={}for k,l in pairs(bm)do table.insert(self.elements,l)end end,draw_elements=function(self)for k=#self.elements,1,-1 do local bl=self.elements[k]if bl.draw then bl:draw()end end end,event_elements=function(self,aK)local bj=false;for k,bl in pairs(self.elements)do local bn=bl:event(aK)bj=bj or bn;if bn then aK={name=b.DELETED}end end;return bj end}}aH.Clock.__index=aH.Clock;aH.Label.__index=aH.Label;aH.Button.__index=aH.Button;aH.Progressbar.__index=aH.Progressbar;aH.Memo.__index=aH.Memo;aH.Window.__index=aH.Window;local bo={}bo={new=function(bp,bq)local br={options={enabled=false,FPS_target=bp,EPS_target=bq},monitors={terminal=term},elements={high_priority={},low_priority={},loop={clock=aH.Clock.new(1/bp),stats_clock=aH.Clock.new(1),FPS_label=aH.Label.new(1,1,"1 FPS",colors.white),EPS_label=aH.Label.new(1,2,"1 EPS",colors.white)}},stats={pos=v.Vector2.new(1,1),elements=nil,enabled=true,enable=function(self,bs)self.enabled=bs;self.elements.stats_clock.enabled=bs;self.elements.FPS_label.hidden=not bs;self.elements.EPS_label.hidden=not bs end,FPS=0,EPS=0},callbacks={onDraw=function()end,onClock=function()end,onEvent=function()end}}br.elements.loop.stats_clock.stats=br.stats;br.stats.elements=br.elements.loop;c.set_callback(br.elements.loop.stats_clock,b.ONCLOCK,function(self,aK)self.stats.elements.FPS_label.pos=self.stats.pos;self.stats.elements.EPS_label.pos=self.stats.pos+v.Vector2.new(0,1)self.stats.elements.FPS_label.text=tostring(self.stats.FPS).." FPS"self.stats.elements.EPS_label.text=tostring(self.stats.EPS).." EPS"self.stats.FPS=0;self.stats.EPS=0 end)br.stats:enable(false)setmetatable(br,bo)return br end,set_monitors=function(self,Z)self.monitors=Y.get_monitors(Z)end,set_elements=function(self,bm)self.elements.high_priority={}self.elements.low_priority={}for k,l in pairs(bm)do if l.draw_priority==b.HIGH_PRIORITY then table.insert(self.elements.high_priority,l)else table.insert(self.elements.low_priority,l)end end end,draw_elements=function(self)local function bt(h)for k=#h,1,-1 do local bl=h[k]if bl.draw then bl:draw()end end end;self.callbacks.onDraw(self)local bu=a7.screens;a7.screens=self.monitors;bt(self.elements.low_priority)bt(self.elements.high_priority)for k,bl in pairs(self.elements.loop)do if bl.draw then bl:draw()end end;a7:draw()a7.screens=bu;if self.stats.enabled then self.stats.FPS=self.stats.FPS+1 end end,event_elements=function(self,bv)local aK=Q.format_event_table(bv)local function V(h)for k,bl in pairs(h)do if bl:event(aK)then aK={name=b.DELETED}end end end;if self.callbacks.onEvent(self,aK)then aK={name=b.DELETED}end;if aK.name==b.TOUCH then local bw=false;for bx,a1 in pairs(self.monitors)do if aK.from==bx then bw=true;break end end;if not bw then aK={name=b.DELETED}end end;V(self.elements.loop)local by={}for k,bl in pairs(self.elements.high_priority)do local bz=bl:event(aK)if bz then aK={name=b.DELETED}if self.elements.high_priority~=bl then table.insert(by,{element=bl,key=k})end end end;if#by>0 then for k,l in pairs(by)do table.insert(self.elements.high_priority,1,l.element)table.remove(self.elements.high_priority,l.key+#by)end end;V(self.elements.low_priority)if self.stats.enabled then self.stats.EPS=self.stats.EPS+1 end end,start=function(self)self.enabled=true;c.set_callback(self.elements.loop.clock,b.ONCLOCK,function(bA,aK)self.callbacks.onClock(self,aK)self:draw_elements()bA.interval=1/self.options.FPS_target end)while self.enabled do local bB=os.startTimer(1/self.options.EPS_target)local bv={os.pullEvent()}self:event_elements(bv)os.cancelTimer(bB)end end,stop=function(self)self.enabled=false end}bo.__index=bo;local bC={...}if bC[1]=="help"then local bb={{text="LIBFILE <COMMAND>",foreground=colors.green,background=nil},{text=" - help (shows this list of commands)",foreground=colors.blue,background=nil},{text=" - info (prints info about the lib)",foreground=colors.yellow,background=nil},{text=" - ver (prints version of the lib)",foreground=colors.green,background=nil},{text=" - copyright (prints copyright of the lib)",foreground=colors.blue,background=nil},{text=" - setup (adds YAGUI_PATH to computer's settings)",foreground=colors.yellow,background=nil}}for k,b3 in pairs(bb)do Y.better_print(term,b3.foreground,b3.background,b3.text)end elseif bC[1]=="info"then Y.better_print(term,colors.red,nil,"Library Version: ",a.ver)Y.better_print(term,colors.yellow,nil,"Library Author: ",a.author)Y.better_print(term,colors.green,nil,"Library Website: ",a.website)elseif bC[1]=="ver"then Y.better_print(term,colors.red,nil,"Library Version: ",a.ver)elseif bC[1]=="copyright"then local bD={colors.red,colors.yellow,colors.green}local bE=g.split(a.copyright,"\n\n")for k,bF in pairs(bE)do Y.better_print(term,bD[k],nil,bF)if k<#bE then read("")end end elseif bC[1]=="setup"then if shell then local bG="YAGUI_PATH"local bH="/"..shell.getRunningProgram()W:set(bG,bH)Y.better_print(term,colors.green,nil,"Lib path was set to ",W.get(bG))else Y.better_print(term,colors.red,nil,"SHELL API ISN'T AVAILABLE")end elseif bC[1]then Y.better_print(term,colors.red,nil,"UNKNOWN COMMAND: \"",bC[1],"\"")Y.better_print(term,colors.green,nil,"Use \"help\" to get a list of available commands!")end;local bI={info=a,generic_utils=c,string_utils=g,math_utils=v,table_utils=J,color_utils=M,event_utils=Q,setting_utils=W,monitor_utils=Y,screen_buffer=a7,WSS=aA,wireless_screen_share=aA,gui_elements=aH,Loop=bo}for k,l in pairs(b)do bI[k]=l end;return bI
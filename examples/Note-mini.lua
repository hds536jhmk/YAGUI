local a=settings.get("YAGUI_PATH")if not(type(a)=="string")then printError("YAGUI is not installed, please install it by opening it with argument \"setup\".")return end;if not fs.exists(a)then printError("Couldn't find YAGUI in path: \""..a.."\", Please reinstall it by opening it with argument \"setup\".")return end;local b=dofile(a)local c="new"local d=".txt"local e=1;local f=20;local g=6;local h=true;local i=0.5;local j=0.5;local k=string.char(149)local l=0.5;local m=colors.white;local n=nil;local o=colors.white;local p=colors.black;local q=colors.gray;local r=colors.lightGray;local s=colors.pink;local t=colors.green;local u=colors.orange;local v=colors.red;local w=colors.yellow;local x=colors.blue;local y=colors.orange;local z=colors.green;local A=colors.red;local B=true;local C=true;local D=true;local E={}for F,G in next,colors do if type(G)=="number"then E[G]={term.getPaletteColor(G)}end end;local H=c..d;local I=shell.resolve(H)local J={"1","2","3","4","5","6","7","8","9","0"}local K={...}b.screen_buffer.buffer.background=q;local L={}local M={}local function N(O,P)for F,Q in next,O do M[Q]=P end end;N({"and","break","do","else","elseif","end","false","for","function","if","in","local","nil","not","or","repeat","return","then","true","until","while"},w)N({"bit","colors","colours","commands","coroutine","disk","fs","gps","help","http","io","keys","math","multishell","os","paintutils","parallel","peripheral","rednet","redstone","rs","settings","shell","string","table","term","textutils","turtle","pocket","vector","window","YAGUI"},x)N({"info","generic_utils","string_utils","math_utils","table_utils","color_utils","event_utils","setting_utils","monitor_utils","screen_buffer","input","gui_elements","WSS","wireless_screen_share","FT","file_transfer","Loop","self"},y)local R=b.Loop(f,g)local S=b.Loop(f,g)local T=b.Loop(f,g)local U={["main"]=R,["input"]=S,["overwrite"]=T}local V=b.WSS(e)local W=b.gui_elements.Label(0,0,"Lines: 0",o)local X=b.gui_elements.Label(0,0,"Cursor: (1; 1)",o)local Y=b.gui_elements.Button(0,0,0,0,"C",o,t,v,u)local Z=b.gui_elements.Memo(0,0,0,0,o,p)local _=b.gui_elements.Label(0,0,"/path/",o)local a0=b.gui_elements.Clock(j)Y.timed.enabled=true;Y.timed.clock.interval=i;Y.shortcut={b.KEY_LEFTCTRL,b.KEY_LEFTSHIFT,b.KEY_C}Z.cursor.text=k;Z.cursor.blink.interval=l;Z.colors.cursor=n;Z.colors.cursor_text=m;Z.border=C;Z.colors.border_color=q;a0.oneshot=true;local a1=b.gui_elements.Button(0,0,0,0,"File",o,r,q,s)local a2=b.gui_elements.Window(0,0,0,0,q,B)local a3=b.gui_elements.Button(0,0,0,0,"New/Open",o,r,q,s)local a4=b.gui_elements.Button(0,0,0,0,"Save",o,r,q,s)local a5=b.gui_elements.Button(0,0,0,0,"SaveAs",o,r,q,s)local a6=b.gui_elements.Button(0,0,0,0,"Delete",o,r,q,s)local a7=b.gui_elements.Button(0,0,0,0,"Goto",o,r,q,s)local a8=b.gui_elements.Button(0,0,0,0,"Run",o,r,q,s)local a9=b.gui_elements.Button(0,0,0,0,"SyntaxHL",o,r,q,s)local aa=b.gui_elements.Button(0,0,0,0,"Exit",o,t,v,u)a2.draw_priority=b.LOW_PRIORITY;a2.hidden=true;a2.dragging.enabled=false;a2.resizing.enabled=false;a2:set_elements({a3,a4,a5,a6,a7,a8,a9,aa})a3.timed.enabled=true;a3.timed.clock.interval=i/2;a4.timed.enabled=true;a4.timed.clock.interval=i;a5.timed.enabled=true;a5.timed.clock.interval=i/2;a6.timed.enabled=true;a6.timed.clock.interval=i;a7.timed.enabled=true;a7.timed.clock.interval=i/2;a8.timed.enabled=true;a8.timed.clock.interval=i;aa.timed.enabled=true;aa.timed.clock.interval=i;a1.shortcut={b.KEY_LEFTCTRL,b.KEY_TAB}a9.active=D;local ab=b.gui_elements.Label(0,0,"",o)local ac=b.gui_elements.Memo(0,0,0,0,o,r)local ad=b.gui_elements.Label(0,0,"You can press CONTROL to cancel.",o)ac.limits=b.math_utils.Vector2(0,1)ac.cursor.text=k;ac.cursor.blink.interval=l;ac.colors.cursor=n;ac.colors.cursor_text=m;ac.border=C;ac.colors.border_color=q;local ae=b.gui_elements.Window(0,0,0,0,r,B)local af=b.gui_elements.Label(0,0,"Do you want\nto overwrite?",o)local ag=b.gui_elements.Button(0,0,0,0,"Yes",o,q,r,s)local ah=b.gui_elements.Button(0,0,0,0,"No",o,q,r,s)ae:set_elements({af,ag,ah})ag.timed.enabled=true;ag.timed.clock.interval=i;ah.timed.enabled=true;ah.timed.clock.interval=i;ag.shortcut={b.KEY_Y}ah.shortcut={b.KEY_N}af.text_alignment=b.ALIGN_CENTER;local function ai()local aj,ak=term.getSize()local al={["all"]={lLines=function()return 9,1 end,lCursor=function()return aj-5,1,b.ALIGN_RIGHT end,bCompact=function()return aj,1,1,1 end,mEditor=function()return 2,2,aj-1,ak-2 end,lPath=function()return 1,ak end,bFile=function()return 1,1,4,1 end,wFileMenu=function()return 1,2,10,8 end,bNewOpen=function()return 1,1,10,1 end,bSave=function()return 1,2,10,1 end,bSaveAs=function()return 1,3,10,1 end,bDelete=function()return 1,4,10,1 end,bGoto=function()return 1,5,10,1 end,bRun=function()return 1,6,10,1 end,bSHL=function()return 1,7,10,1 end,bQuit=function()return 1,8,10,1 end,lInputTitle=function()return 3,math.floor(ak/2-1)end,mInput=function()return 2+(C and 0 or 1),math.floor(ak/2)+(C and-1 or 0),aj-2-(C and 0 or 2),3-(C and 0 or 2)end,lInputTip=function()return 3,math.floor(ak/2+2),"You can press CONTROL to cancel."end,wOverWrite=function()return math.floor(aj/2-7),math.floor(ak/2-3),15,6 end,lOW=function()return 8,2 end,bOWAccept=function()return 2,5,3,1 end,bOWReject=function()return 13,5,2,1 end,stats=function()return aj-1,ak-1 end},[b.COMPUTER]={},[b.TURTLE]={},[b.POCKET]={lCursor=function()return 1,ak-1,b.ALIGN_LEFT end,mEditor=function()return 2,2,aj-1,ak-3 end,lPath=function()return 1,ak end,lInputTip=function()return 3,math.floor(ak/2+2),"You can press\nCONTROL to cancel."end},["this_layout"]={}}local am,an=b.generic_utils.get_computer_type()al.this_layout=al.all;for F,ao in next,al[am]do al.this_layout[F]=ao end;L=al.this_layout end;local function ap()W.pos.x,W.pos.y=L.lLines()X.pos.x,X.pos.y,X.text_alignment=L.lCursor()Y.pos.x,Y.pos.y,Y.size.x,Y.size.y=L.bCompact()Z.pos.x,Z.pos.y,Z.size.x,Z.size.y=L.mEditor()_.pos.x,_.pos.y=L.lPath()a1.pos.x,a1.pos.y,a1.size.x,a1.size.y=L.bFile()a2.pos.x,a2.pos.y,a2.size.x,a2.size.y=L.wFileMenu()a3.pos.x,a3.pos.y,a3.size.x,a3.size.y=L.bNewOpen()a4.pos.x,a4.pos.y,a4.size.x,a4.size.y=L.bSave()a5.pos.x,a5.pos.y,a5.size.x,a5.size.y=L.bSaveAs()a6.pos.x,a6.pos.y,a6.size.x,a6.size.y=L.bDelete()a7.pos.x,a7.pos.y,a7.size.x,a7.size.y=L.bGoto()a8.pos.x,a8.pos.y,a8.size.x,a8.size.y=L.bRun()a9.pos.x,a9.pos.y,a9.size.x,a9.size.y=L.bSHL()aa.pos.x,aa.pos.y,aa.size.x,aa.size.y=L.bQuit()ab.pos.x,ab.pos.y=L.lInputTitle()ac.pos.x,ac.pos.y,ac.size.x,ac.size.y=L.mInput()ad.pos.x,ad.pos.y,ad.text=L.lInputTip()ae.pos.x,ae.pos.y,ae.size.x,ae.size.y=L.wOverWrite()ae.resizing.min_size=ae.size:duplicate()ae.resizing.max_size=ae.size:duplicate()*2;af.pos.x,af.pos.y=L.lOW()ag.pos.x,ag.pos.y,ag.size.x,ag.size.y=L.bOWAccept()ah.pos.x,ah.pos.y,ah.size.x,ah.size.y=L.bOWReject()af.offset=b.math_utils.Vector2.new(0,b.math_utils.round(ae.size.y/2)-af.pos.y)for F,aq in next,U do aq.stats.pos=b.math_utils.Vector2(L.stats())aq.stats:update_pos()end end;local function ar()for F,as in next,R.monitors do b.monitor_utils.better_clear(as)for at,au in next,E do as.setPaletteColor(at,au[1],au[2],au[3])end end end;local function av()Z.rich_text={}if Z.focussed then Z.rich_text[Z.cursor.pos.y]={["background"]=q}end end;local aw={}local function ax(O,ay)for az=ay+1,#O do O[az]=nil end end;local function aA(O,aB,aC)local aD=#O;for az=aD+1,aC+aD do O[az]=aB end end;local function aE(ay,aF)local aG=b.color_utils.colors[o]local aH=b.color_utils.colors[z]local aI=b.color_utils.colors[A]ay=ay or Z.first_visible_line;aF=aF or Z.first_visible_line+Z.size.y-1;local aJ="code"local aK="none"local aL=false;local aM=""local aN=aw[ay-1]if aN then aJ=aN.state;aK=aN.nested_state;aL=aN.quote_ignore;aM=aN.current_quote end;for aO=ay,aF do if not Z.rich_text[aO]then Z.rich_text[aO]={}end;local aP=Z.lines[aO]if not aP then break end;local aQ={}local aR=b.string_utils.split(aP,"[^%w_]")local aS=0;for F,Q in next,aR do local at=M[Q]if at then aA(aQ,b.color_utils.colors[o],aS-#aQ)aA(aQ,b.color_utils.colors[at],#Q)end;aS=aS+#Q+1 end;aQ[#aQ+1]=aG;for aT=1,#aP do if not aQ[aT]then aQ[aT]=aG end;local aB=aP:sub(aT,aT)if aJ=="code"then if aB=="\""then aQ[aT]=aI;if aT~=#aP then aJ="string"aM="\""end elseif aB=="'"then aQ[aT]=aI;if aT~=#aP then aJ="string"aM="'"end elseif aP:sub(aT,aT+1)=="[["then aJ="long-string"aQ[aT]=aI elseif aP:sub(aT,aT+1)=="--"then if aP:sub(aT,aT+3)=="--[["then aJ="closed-comment"aQ[aT]=aH else aJ="comment"aQ[aT]=aH end elseif aT>#aQ then aQ[aT]=aG end elseif aJ=="string"then aQ[aT]=aI;if aB=="\\"then if aT==#aP then aK="multi-line"else local aU=aP:sub(aT+1,aT+1)if aU==aM then aL=true end end elseif aK=="none"and aT==#aP then aL=false;aM=""aJ="code"elseif aB==aM then if aL then aL=false else aM=""aJ="code"aK="none"end else aK="none"end elseif aJ=="long-string"then aQ[aT]=aI;if aP:sub(aT,aT+1)=="]]"then aQ[aT+1]=aI;aJ="code"end elseif aJ=="comment"then ax(aQ,aT-1)aJ="code"break elseif aJ=="closed-comment"then aQ[aT]=aH;if aP:sub(aT,aT+1)=="]]"then aQ[aT+1]=aH;aJ="code"end end end;aw[aO]={["state"]=aJ,["nested_state"]=aK,["quote_ignore"]=aL,["current_quote"]=aM}Z.rich_text[aO].foreground=table.concat(aQ)end end;local function aV(aW)aW=shell.resolve(aW)if#aW:gsub(" ","")==0 then aW=H end;if b.string_utils.get_extension(aW)==""then aW=aW..d end;if fs.isDir(aW)then return end;Z:clear()I=aW;if fs.exists(aW)then local aX=fs.open(aW,"r")local aY=pcall(Z.write,Z,aX.readAll())if not aY then ar()V:close()error("It took too long to open the file")end;aX.close()end;Z:set_cursor(1,1)if D then aE(1)end end;local function aZ(aW)aW=shell.resolve(aW)if#aW:gsub(" ","")==0 then aW=I end;if fs.isDir(aW)then return end;if fs.isReadOnly(aW)then return end;I=aW;local aX=fs.open(aW,"w")aX.write(table.concat(Z.lines,"\n"))aX.close()end;a0:set_callback(b.ONCLOCK,function(self)aE(self.starting_line,#Z.lines)self.starting_line=nil end)a1:set_callback(b.ONPRESS,function(self)a2.hidden=not self.active end)a2:set_callback(b.ONFAILEDPRESS,function(self)if a1.active then self.hidden=true;a1.active=false end end)a3:set_callback(b.ONTIMEOUT,function(self)ab.text=" New File / Open File "ac.bound=self;S:start()end)a3.callbacks.onActionComplete=function(aW)if aW then aW=shell.resolve(aW)aV(aW)else aV(H)end end;a4:set_callback(b.ONTIMEOUT,function(self)aZ(I)end)a5:set_callback(b.ONTIMEOUT,function(self)ab.text=" Save File As "ac.bound=self;S:start()end)a5.callbacks.onActionComplete=function(aW)if not aW then aW=I end;aW=shell.resolve(aW)if fs.exists(aW)then ag.bound=a5;a5.path=aW;T:start()else aZ(aW)end end;a5.callbacks.onOverWrite=function()aZ(a5.path)a5.path=nil end;a6:set_callback(b.ONTIMEOUT,function(self)if fs.isReadOnly(I)then return end;fs.delete(I)end)a7:set_callback(b.ONTIMEOUT,function(self)ab.text=" Go to Line "ac.bound=self;ac.whitelist=J;S:start()end)a7.callbacks.onActionComplete=function(aP)Z:set_cursor(1,tonumber(aP)or Z.cursor.pos.y)end;a8:set_callback(b.ONTIMEOUT,function(self)aZ(I)local a_=shell.openTab(I)shell.switchTab(a_)end)a9:set_callback(b.ONPRESS,function(self)D=self.active;if D then aE(1)else av()end end)aa:set_callback(b.ONTIMEOUT,function(self)R:stop()end)Y:set_callback(b.ONTIMEOUT,function(self)local b0={}for az=1,#Z.lines do local aP=Z.lines[az]if not aP then break end;local b1=aP:gsub(" ","")if#b1==0 then table.insert(b0,1,az)end end;for F,b2 in next,b0 do table.remove(Z.lines,b2)end;Z:set_cursor(1,1)if D then aE(1)end end)Z:set_callback(b.ONFOCUS,function(self)if not self.focussed then local b3=self.rich_text[self.cursor.pos.y]if b3 and b3.foreground then b3.background=nil else self.rich_text[self.cursor.pos.y]=nil end end end)Z:set_callback(b.ONMOUSESCROLL,function(self)return true end)Z:set_callback(b.ONCURSORCHANGE,function(self,b4,b5)local b6=self.rich_text[self.cursor.pos.y]if b6 and b6["foreground"]then b6["background"]=nil else self.rich_text[self.cursor.pos.y]=nil end;if self.focussed then local b7=self.rich_text[b5]if b7 and b7["foreground"]then b7["background"]=q else self.rich_text[b5]={["background"]=q}end end end)Z:set_callback(b.ONWRITE,function(self,b8,b9)if D then if a0.starting_line then a0.starting_line=math.min(a0.starting_line,math.max(1,self.cursor.pos.y-#b9+1))else a0.starting_line=math.max(1,self.cursor.pos.y-#b9+1)end;a0:start()end end)R:set_callback(b.ONDRAW,function(self)W.text=string.format("Lines: %d",#Z.lines)X.text=table.concat({"Cursor: ",tostring(Z.cursor.pos)})_.text=table.concat({"/",I})end)R:set_callback(b.ONEVENT,function(self,ba)if b.input:are_keys_pressed(true,b.KEY_LEFTCTRL,b.KEY_LEFTALT,b.KEY_S)then a5.callbacks.onPress(a5,ba)elseif b.input:are_keys_pressed(true,b.KEY_LEFTCTRL,b.KEY_N)then a3.callbacks.onPress(a3,ba)elseif b.input:are_keys_pressed(true,b.KEY_LEFTCTRL,b.KEY_S)then a4.callbacks.onTimeout(a4,ba)elseif b.input:are_keys_pressed(true,b.KEY_LEFTCTRL,b.KEY_G)then a7.callbacks.onPress(a7,ba)elseif b.input:are_keys_pressed(true,b.KEY_LEFTALT,b.KEY_R)then a8.callbacks.onTimeout(a8,ba)elseif b.input:are_keys_pressed(true,b.KEY_LEFTSHIFT,b.KEY_B,b.KEY_S)then local bb=b.screen_buffer:frame_to_nft(1,1,term.getSize())local aX=fs.open("/Note-Screenshot.nftb","wb")for az=1,#bb do local aB=bb:sub(az,az)aX.write(string.byte(aB))end;aX.close()elseif b.input:are_keys_pressed(true,b.KEY_LEFTSHIFT,b.KEY_S)then local aX=fs.open("/Note-Screenshot.nft","w")aX.write(b.screen_buffer:frame_to_nft(1,1,term.getSize()))aX.close()elseif not Z.focussed then if b.input:are_keys_pressed(false,b.KEY_LEFTCTRL,b.KEY_LEFT)then Z.first_visible_char=math.max(1,Z.first_visible_char-1)elseif b.input:are_keys_pressed(false,b.KEY_LEFTCTRL,b.KEY_RIGHT)then Z.first_visible_char=Z.first_visible_char+1 end;if b.input:are_keys_pressed(false,b.KEY_LEFTCTRL,b.KEY_UP)then Z.first_visible_line=math.max(1,Z.first_visible_line-1)elseif b.input:are_keys_pressed(false,b.KEY_LEFTCTRL,b.KEY_DOWN)then Z.first_visible_line=math.min(#Z.lines,Z.first_visible_line+1)end end;if ba.name==b.MOUSESCROLL then Z.first_visible_line=b.math_utils.constrain(Z.first_visible_line+ba.direction,1,#Z.lines)elseif ba.name==b.TERMRESIZE then ai()ap()end;if D and Z.first_visible_line+Z.size.y-1>#aw then aE(#aw)end end)ac:set_callback(b.ONKEY,function(self,ba)if ba.key==b.KEY_ENTER then self.bound.callbacks.onActionComplete(self.lines[1])S:stop()return true end end)S:set_callback(b.ONSTART,function(self)ac:focus(true)end)S:set_callback(b.ONEVENT,function(self,ba)if ba.name==b.KEY then if ba.key==b.KEY_LEFTCTRL or ba.key==b.KEY_RIGHTCTRL then S:stop()return true end elseif ba.name==b.TERMRESIZE then ai()ap()end end)S:set_callback(b.ONSTOP,function(self)ac.bound=nil;ac.whitelist={}ac:clear()ac:focus(false)end)ae:set_callback(b.ONRESIZE,function(self,bc,bd,be,bf)af.pos=b.math_utils.Vector2(self.size.x/2,self.size.y/2)-af.offset;ag.pos.y=self.size.y-1;ah.pos.x=self.size.x-2;ah.pos.y=self.size.y-1 end)ag:set_callback(b.ONTIMEOUT,function(self)self.bound.callbacks.onOverWrite()self.bound=nil;T:stop()end)ah:set_callback(b.ONTIMEOUT,function(self)T:stop()end)T:set_callback(b.ONEVENT,function(self,ba)if ba.name==b.TERMRESIZE then ai()ap()end end)ai()ap()if#K>0 then if K[1]:lower()=="help"then local b9={{text="Note <COMMAND>",foreground=colors.green,background=nil},{text=" - help (shows this list of commands)",foreground=colors.blue,background=nil},{text=" - open <PATH> (opens file at PATH)",foreground=colors.yellow,background=nil},{text=" - multi <MONITORS> (sets MONITORS\n   as io for the app)",foreground=colors.green,background=nil},{text=" - wss <MODEM_SIDE> [BROADCAST_INTERVAL]\n   (hosts a WSS server using the modem\n   on MODEM_SIDE and updates connected users\n   every BROADCAST_INTERVAL seconds)",foreground=colors.blue,background=nil}}for F,aP in next,b9 do b.monitor_utils.better_print(term,aP.foreground,aP.background,aP.text)end;return end;local bg={open={},multi={},wss={}}local bh;for F,G in next,K do if bh then table.insert(bg[bh],G)end;local bi=G:lower()if bi~=bh and bg[bi]then bh=bi end end;if#bg.open>0 then I=bg.open[1]end;if#bg.multi>0 then table.insert(bg.multi,1,"terminal")for F,aq in next,U do aq:set_monitors(bg.multi)end end;if#bg.wss>0 then if bg.wss[1]then local bj=bg.wss[1]if peripheral.getType(bj)~="modem"then b.monitor_utils.better_print(term,colors.red,nil,"Modem: ",bj," wasn't found.")return end;V:use_side(bj)V:host()V.broadcast_clock.interval=tonumber(bg.wss[2])or V.broadcast_clock.interval end end end;aV(I)R:set_elements({a1,a2,W,X,Y,Z,_,a0,V})S:set_elements({ab,ac,ad,V})T:set_elements({ae,V})for F,aq in next,U do aq.stats.FPS_label.text_alignment=b.ALIGN_RIGHT;aq.stats.EPS_label.text_alignment=b.ALIGN_RIGHT;aq.stats:show(h)aq.options.raw_mode=true;aq.options.stop_on_terminate=false end;R.options.stop_on_terminate=true;for F,as in next,R.monitors do as.setPaletteColor(colors.pink,0.467,0.467,0.467)end;R:start()ar()V:close()
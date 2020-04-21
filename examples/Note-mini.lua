local a=settings.get("YAGUI_PATH")if not(type(a)=="string")then printError("YAGUI is not installed, please install it by opening it with argument \"setup\".")return end;if not fs.exists(a)then printError("Couldn't find YAGUI in path: \""..a.."\", Please reinstall it by opening it with argument \"setup\".")return end;local b=dofile(a)local c="new"local d=".txt"local e=1;local f=60;local g=6;local h=true;local i=0.5;local j=string.char(149)local k=0.5;local l=colors.white;local m=nil;local n=colors.white;local o=colors.black;local p=colors.gray;local q=colors.lightGray;local r=colors.green;local s=colors.red;local t=colors.yellow;local u=colors.blue;local v=colors.orange;local w=colors.green;local x=colors.red;local y=true;local z=true;local A=c..d;local B=shell.resolve(A)local C={"1","2","3","4","5","6","7","8","9","0"}local D={...}b.screen_buffer.buffer.background=p;local E={init=function(self)local F,G=b.generic_utils.get_computer_type()self.this_layout=self.all;for H,I in next,self[F]do self.this_layout[H]=I end end,["all"]={lLines=function()return 9,1 end,lCursor=function()return 46,1,b.ALIGN_RIGHT end,bCompact=function()return 51,1,1,1 end,mEditor=function()return 5,2,47,17 end,lPath=function()return 1,19 end,bFile=function()return 1,1,4,1 end,wFileMenu=function()return 1,2,10,8 end,bNewOpen=function()return 1,1,10,1 end,bSave=function()return 1,2,10,1 end,bSaveAs=function()return 1,3,10,1 end,bDelete=function()return 1,4,10,1 end,bGoto=function()return 1,5,10,1 end,bRun=function()return 1,6,10,1 end,bSHL=function()return 1,7,10,1 end,bQuit=function()return 1,8,10,1 end,lInputTitle=function()return 2,9 end,mInput=function()return 2,10,49,1 end,lInputTip=function()return 3,12,"You can press CONTROL to cancel."end,wOverWrite=function()return 18,7,15,6 end,lOW=function()return 8,2 end,bOWAccept=function()return 2,5,3,1 end,bOWReject=function()return 13,5,2,1 end,stats=function()return 45,18 end},[b.COMPUTER]={},[b.TURTLE]={lCursor=function()return 34,1,b.ALIGN_RIGHT end,bCompact=function()return 39,1,1,1 end,mEditor=function()return 5,2,35,11 end,lPath=function()return 1,13 end,lInputTitle=function()return 2,5 end,mInput=function()return 2,6,37,1 end,lInputTip=function()return 3,8,"You can press CONTROL to cancel."end,wOverWrite=function()return 12,4,15,6 end,stats=function()return 33,12 end},[b.POCKET]={lCursor=function()return 1,19,b.ALIGN_LEFT end,bCompact=function()return 26,1,1,1 end,mEditor=function()return 3,2,24,17 end,lPath=function()return 1,20 end,mInput=function()return 2,10,24,1 end,lInputTip=function()return 8,12,"You can press\nCONTROL to cancel."end,wOverWrite=function()return 6,7,15,6 end,stats=function()return 21,19 end},["this_layout"]={}}E:init()local J={}local function K(L,M)if not J[M]then J[M]={}end;for N,O in next,L do J[M][N]=O end end;K({["and"]=true,["break"]=true,["do"]=true,["else"]=true,["elseif"]=true,["end"]=true,["false"]=true,["for"]=true,["function"]=true,["if"]=true,["in"]=true,["local"]=true,["nil"]=true,["not"]=true,["or"]=true,["repeat"]=true,["return"]=true,["then"]=true,["true"]=true,["until"]=true,["while"]=true},t)K({["bit"]=true,["colors"]=true,["colours"]=true,["commands"]=true,["coroutine"]=true,["disk"]=true,["fs"]=true,["gps"]=true,["help"]=true,["http"]=true,["io"]=true,["keys"]=true,["math"]=true,["multishell"]=true,["os"]=true,["paintutils"]=true,["parallel"]=true,["peripheral"]=true,["rednet"]=true,["redstone"]=true,["rs"]=true,["settings"]=true,["shell"]=true,["string"]=true,["table"]=true,["term"]=true,["textutils"]=true,["turtle"]=true,["pocket"]=true,["vector"]=true,["window"]=true,["YAGUI"]=true},u)K({["info"]=true,["generic_utils"]=true,["string_utils"]=true,["math_utils"]=true,["table_utils"]=true,["color_utils"]=true,["event_utils"]=true,["setting_utils"]=true,["monitor_utils"]=true,["screen_buffer"]=true,["input"]=true,["gui_elements"]=true,["WSS"]=true,["wireless_screen_share"]=true,["FT"]=true,["file_transfer"]=true,["Loop"]=true,["self"]=true},v)local P=b.Loop(f,g)local Q=b.Loop(f,g)local R=b.Loop(f,g)local S={["main"]=P,["input"]=Q,["overwrite"]=R}local T=b.WSS(e)local U=b.gui_elements.Label(0,0,"Lines: 0",n)local V=b.gui_elements.Label(0,0,"Cursor: (1; 1)",n)local W=b.gui_elements.Button(0,0,0,0,"C",n,r,s)local X=b.gui_elements.Memo(0,0,0,0,n,o)local Y=b.gui_elements.Label(0,0,"/path/",n)U.pos.x,U.pos.y=E.this_layout.lLines()V.pos.x,V.pos.y,V.text_alignment=E.this_layout.lCursor()W.pos.x,W.pos.y,W.size.x,W.size.y=E.this_layout.bCompact()X.pos.x,X.pos.y,X.size.x,X.size.y=E.this_layout.mEditor()Y.pos.x,Y.pos.y=E.this_layout.lPath()W.timed.enabled=true;W.timed.clock.interval=i;W.shortcut={b.KEY_LEFTCTRL,b.KEY_LEFTSHIFT,b.KEY_C}X.cursor.text=j;X.cursor.blink.interval=k;X.colors.cursor=m;X.colors.cursor_text=l;local Z=b.gui_elements.Button(0,0,0,0,"File",n,q,p)local _=b.gui_elements.Window(0,0,0,0,p,y)local a0=b.gui_elements.Button(0,0,0,0,"New/Open",n,q,p)local a1=b.gui_elements.Button(0,0,0,0,"Save",n,q,p)local a2=b.gui_elements.Button(0,0,0,0,"SaveAs",n,q,p)local a3=b.gui_elements.Button(0,0,0,0,"Delete",n,q,p)local a4=b.gui_elements.Button(0,0,0,0,"Goto",n,q,p)local a5=b.gui_elements.Button(0,0,0,0,"Run",n,q,p)local a6=b.gui_elements.Button(0,0,0,0,"SyntaxHL",n,q,p)local a7=b.gui_elements.Button(0,0,0,0,"Exit",n,r,s)Z.pos.x,Z.pos.y,Z.size.x,Z.size.y=E.this_layout.bFile()_.pos.x,_.pos.y,_.size.x,_.size.y=E.this_layout.wFileMenu()a0.pos.x,a0.pos.y,a0.size.x,a0.size.y=E.this_layout.bNewOpen()a1.pos.x,a1.pos.y,a1.size.x,a1.size.y=E.this_layout.bSave()a2.pos.x,a2.pos.y,a2.size.x,a2.size.y=E.this_layout.bSaveAs()a3.pos.x,a3.pos.y,a3.size.x,a3.size.y=E.this_layout.bDelete()a4.pos.x,a4.pos.y,a4.size.x,a4.size.y=E.this_layout.bGoto()a5.pos.x,a5.pos.y,a5.size.x,a5.size.y=E.this_layout.bRun()a6.pos.x,a6.pos.y,a6.size.x,a6.size.y=E.this_layout.bSHL()a7.pos.x,a7.pos.y,a7.size.x,a7.size.y=E.this_layout.bQuit()_.draw_priority=b.LOW_PRIORITY;_.hidden=true;_.dragging.enabled=false;_.resizing.enabled=false;_:set_elements({a0,a1,a2,a3,a4,a5,a6,a7})a1.timed.enabled=true;a1.timed.clock.interval=i;a3.timed.enabled=true;a3.timed.clock.interval=i;a5.timed.enabled=true;a5.timed.clock.interval=i;a7.timed.enabled=true;a7.timed.clock.interval=i;Z.shortcut={b.KEY_LEFTCTRL,b.KEY_TAB}a6.active=z;local a8=b.gui_elements.Label(0,0,"",n)local a9=b.gui_elements.Memo(0,0,0,0,n,q)local aa=b.gui_elements.Label(0,0,"You can press CONTROL to cancel.",n)a8.pos.x,a8.pos.y=E.this_layout.lInputTitle()a9.pos.x,a9.pos.y,a9.size.x,a9.size.y=E.this_layout.mInput()aa.pos.x,aa.pos.y,aa.text=E.this_layout.lInputTip()a9.limits=b.math_utils.Vector2(0,1)a9.cursor.text=j;a9.cursor.blink.interval=k;a9.colors.cursor=m;a9.colors.cursor_text=l;local ab=b.gui_elements.Window(0,0,0,0,q,y)local ac=b.gui_elements.Label(0,0,"Do you want\nto overwrite?",n)local ad=b.gui_elements.Button(0,0,0,0,"Yes",n,p,q)local ae=b.gui_elements.Button(0,0,0,0,"No",n,p,q)ab.pos.x,ab.pos.y,ab.size.x,ab.size.y=E.this_layout.wOverWrite()ab.resizing.min_size=ab.size;ab.resizing.max_size=ab.size*2;ac.pos.x,ac.pos.y=E.this_layout.lOW()ad.pos.x,ad.pos.y,ad.size.x,ad.size.y=E.this_layout.bOWAccept()ae.pos.x,ae.pos.y,ae.size.x,ae.size.y=E.this_layout.bOWReject()ab:set_elements({ac,ad,ae})ad.timed.enabled=true;ad.timed.clock.interval=i;ae.timed.enabled=true;ae.timed.clock.interval=i;ad.shortcut={b.KEY_Y}ae.shortcut={b.KEY_N}ac.text_alignment=b.ALIGN_CENTER;ac.offset=b.math_utils.Vector2.new(0,b.math_utils.round(ab.size.y/2)-ac.pos.y)local function af()for H,ag in next,P.monitors do b.monitor_utils.better_clear(ag)end end;local function ah()X.rich_text={}if X.focussed then X.rich_text[X.cursor.pos.y]={["background"]=p}end end;local ai={}local function aj(ak,al)local am=b.color_utils.colors[n]local an=b.color_utils.colors[w]local ao=b.color_utils.colors[x]local function ap(aq,ar,as)return aq:sub(0,ar-1)..as..aq:sub(ar+1)end;ak=ak or X.first_visible_line;al=al or X.first_visible_line+X.size.y-1;local at="code"local au="none"local av=false;local aw=""local ax=ai[ak-1]if ax then at=ax.state;au=ax.nested_state;av=ax.quote_ignore;aw=ax.current_quote end;for ay=ak,al do if not X.rich_text[ay]then X.rich_text[ay]={}end;local az=X.lines[ay]if not az then break end;local aA=""local aB=b.string_utils.split(az,"[^%w_]")local ar=0;for H,N in next,aB do for aC,aD in next,J do if aD[N]then aA=aA..string.rep(b.color_utils.colors[n],ar-#aA)..string.rep(b.color_utils.colors[aC],#N)end end;ar=ar+#N+1 end;aA=aA..b.color_utils.colors[n]for aE=1,#az do local as=az:sub(aE,aE)if at=="code"then if as=="\""then aA=ap(aA,aE,ao)if aE~=#az then at="string"aw="\""end elseif as=="'"then aA=ap(aA,aE,ao)if aE~=#az then at="string"aw="'"end elseif az:sub(aE,aE+1)=="[["then at="long-string"aA=ap(aA,aE,ao)elseif az:sub(aE,aE+1)=="--"then if az:sub(aE,aE+3)=="--[["then at="closed-comment"aA=ap(aA,aE,an)else at="comment"aA=ap(aA,aE,an)end elseif aE>#aA then aA=ap(aA,aE,am)end elseif at=="string"then aA=ap(aA,aE,ao)if as=="\\"then if aE==#az then au="multi-line"else local aF=az:sub(aE+1,aE+1)if aF==aw then av=true end end elseif au=="none"and aE==#az then av=false;aw=""at="code"elseif as==aw then if av then av=false else aw=""at="code"au="none"end else au="none"end elseif at=="long-string"then aA=ap(aA,aE,ao)if az:sub(aE,aE+1)=="]]"then aA=ap(aA,aE+1,ao)at="code"end elseif at=="comment"then aA=aA:sub(0,aE-1)at="code"break elseif at=="closed-comment"then aA=ap(aA,aE,an)if az:sub(aE,aE+1)=="]]"then aA=ap(aA,aE+1,an)at="code"end end end;ai[ay]={["state"]=at,["nested_state"]=au,["quote_ignore"]=av,["current_quote"]=aw}X.rich_text[ay].foreground=aA end end;local function aG(aH)aH=shell.resolve(aH)if#aH:gsub(" ","")==0 then aH=A end;if b.string_utils.get_extension(aH)==""then aH=aH..d end;if fs.isDir(aH)then return end;X:clear()B=aH;if fs.exists(aH)then local aI=fs.open(aH,"r")local aJ=pcall(X.write,X,aI.readAll())if not aJ then af()T:close()error("It took too long to open the file")end;aI.close()else local aI=fs.open(aH,"w")aI.write("")aI.close()end;X:set_cursor(1,1)if z then aj(1)end end;local function aK(aH)aH=shell.resolve(aH)if#aH:gsub(" ","")==0 then aH=B end;if fs.isDir(aH)then return end;if fs.isReadOnly(aH)then return end;B=aH;local aI=fs.open(aH,"w")aI.write(b.string_utils.join(X.lines,"\n"))aI.close()end;Z:set_callback(b.ONPRESS,function(self)_.hidden=not self.active end)_:set_callback(b.ONFAILEDPRESS,function(self)if Z.active then self.hidden=true;Z.active=false end end)a0:set_callback(b.ONPRESS,function(self)self.active=false;a8.text="New File / Open File"a9.bound=self;Q:start()end)a0.callbacks.onActionComplete=function(aH)if aH then aH=shell.resolve(aH)aG(aH)else aG(A)end end;a1:set_callback(b.ONTIMEOUT,function(self)aK(B)end)a2:set_callback(b.ONPRESS,function(self)self.active=false;a8.text="Save File As"a9.bound=self;Q:start()end)a2.callbacks.onActionComplete=function(aH)if not aH then aH=B end;aH=shell.resolve(aH)if fs.exists(aH)then ad.bound=a2;a2.path=aH;R:start()else aK(aH)end end;a2.callbacks.onOverWrite=function()aK(a2.path)a2.path=nil end;a3:set_callback(b.ONTIMEOUT,function(self)if fs.isReadOnly(B)then return end;fs.delete(B)end)a4:set_callback(b.ONPRESS,function(self)self.active=false;a8.text="Line"a9.bound=self;a9.whitelist=C;Q:start()end)a4.callbacks.onActionComplete=function(az)X:set_cursor(1,tonumber(az)or X.cursor.pos.y)end;a5:set_callback(b.ONTIMEOUT,function(self)aK(B)local aL=shell.openTab(B)shell.switchTab(aL)end)a6:set_callback(b.ONPRESS,function(self)z=self.active;if z then aj(1)else ah()end end)a7:set_callback(b.ONTIMEOUT,function(self)P:stop()end)W:set_callback(b.ONTIMEOUT,function(self)local aM={}for aN=1,#X.lines do local az=X.lines[aN]if not az then break end;local aO=az:gsub(" ","")if#aO==0 then table.insert(aM,1,aN)end end;for H,aP in next,aM do table.remove(X.lines,aP)end;X:set_cursor(1,1)if z then aj(1)end end)X:set_callback(b.ONFOCUS,function(self)if not self.focussed then local aQ=self.rich_text[self.cursor.pos.y]if aQ and aQ.foreground then aQ.background=nil else self.rich_text[self.cursor.pos.y]=nil end end end)X:set_callback(b.ONMOUSESCROLL,function(self)return true end)X:set_callback(b.ONCURSORCHANGE,function(self,aR,aS)local aT=self.rich_text[self.cursor.pos.y]if aT and aT["foreground"]then aT["background"]=nil else self.rich_text[self.cursor.pos.y]=nil end;if self.focussed then local aU=self.rich_text[aS]if aU and aU["foreground"]then aU["background"]=p else self.rich_text[aS]={["background"]=p}end end end)X:set_callback(b.ONWRITE,function(self,aV,aW)if z then aj(math.max(1,self.cursor.pos.y-#aW),#self.lines)end end)P:set_callback(b.ONCLOCK,function(self)U.text=string.format("Lines: %d",#X.lines)V.text="Cursor: "..tostring(X.cursor.pos)Y.text="/"..B end)P:set_callback(b.ONEVENT,function(self,aX)if b.input:are_keys_pressed(true,b.KEY_LEFTCTRL,b.KEY_LEFTALT,b.KEY_S)then a2.callbacks.onPress(a2,aX)elseif b.input:are_keys_pressed(true,b.KEY_LEFTCTRL,b.KEY_N)then a0.callbacks.onPress(a0,aX)elseif b.input:are_keys_pressed(true,b.KEY_LEFTCTRL,b.KEY_S)then a1.callbacks.onTimeout(a1,aX)elseif b.input:are_keys_pressed(true,b.KEY_LEFTCTRL,b.KEY_G)then a4.callbacks.onPress(a4,aX)elseif b.input:are_keys_pressed(true,b.KEY_LEFTALT,b.KEY_R)then a5.callbacks.onTimeout(a5,aX)elseif not X.focussed then if b.input:are_keys_pressed(false,b.KEY_LEFTCTRL,b.KEY_LEFT)then X.first_visible_char=math.max(1,X.first_visible_char-1)elseif b.input:are_keys_pressed(false,b.KEY_LEFTCTRL,b.KEY_RIGHT)then X.first_visible_char=X.first_visible_char+1 end;if b.input:are_keys_pressed(false,b.KEY_LEFTCTRL,b.KEY_UP)then X.first_visible_line=math.max(1,X.first_visible_line-1)elseif b.input:are_keys_pressed(false,b.KEY_LEFTCTRL,b.KEY_DOWN)then X.first_visible_line=math.min(#X.lines,X.first_visible_line+1)end end;if aX.name==b.MOUSESCROLL then X.first_visible_line=b.math_utils.constrain(X.first_visible_line+aX.direction,1,#X.lines)end;if z and X.first_visible_line+X.size.y-1>#ai then aj(#ai)end end)a9:set_callback(b.ONKEY,function(self,aX)if aX.key==b.KEY_ENTER then self.bound.callbacks.onActionComplete(self.lines[1])Q:stop()return true end end)Q:set_callback(b.ONSTART,function(self)a9:focus(true)end)Q:set_callback(b.ONEVENT,function(self,aX)if aX.name==b.KEY then if aX.key==b.KEY_LEFTCTRL or aX.key==b.KEY_RIGHTCTRL then Q:stop()return true end end end)Q:set_callback(b.ONSTOP,function(self)a9.bound=nil;a9.whitelist={}a9:clear()a9:focus(false)end)ab:set_callback(b.ONRESIZE,function(self,aY,aZ,a_,b0)ac.pos=b.math_utils.Vector2(self.size.x/2,self.size.y/2)-ac.offset;ad.pos.y=self.size.y-1;ae.pos.x=self.size.x-2;ae.pos.y=self.size.y-1 end)ad:set_callback(b.ONTIMEOUT,function(self)self.bound.callbacks.onOverWrite()self.bound=nil;R:stop()end)ae:set_callback(b.ONTIMEOUT,function(self)R:stop()end)if#D>0 then if D[1]:lower()=="help"then local aW={{text="Note <COMMAND>",foreground=colors.green,background=nil},{text=" - help (shows this list of commands)",foreground=colors.blue,background=nil},{text=" - open <PATH> (opens file at PATH)",foreground=colors.yellow,background=nil},{text=" - multi <MONITORS> (sets MONITORS\n   as io for the app)",foreground=colors.green,background=nil},{text=" - wss <MODEM_SIDE> [BROADCAST_INTERVAL]\n   (hosts a WSS server using the modem\n   on MODEM_SIDE and updates connected users\n   every BROADCAST_INTERVAL seconds)",foreground=colors.blue,background=nil}}for H,az in next,aW do b.monitor_utils.better_print(term,az.foreground,az.background,az.text)end;return end;local b1={open={},multi={},wss={}}local b2;for H,O in next,D do if b2 then table.insert(b1[b2],O)end;local b3=O:lower()if b3~=b2 and b1[b3]then b2=b3 end end;if#b1.open>0 then B=b1.open[1]end;if#b1.multi>0 then table.insert(b1.multi,1,"terminal")for H,b4 in next,S do b4:set_monitors(b1.multi)end end;if#b1.wss>0 then if b1.wss[1]then local b5=b1.wss[1]if peripheral.getType(b5)~="modem"then b.monitor_utils.better_print(term,colors.red,nil,"Modem: ",b5," wasn't found.")return end;T:use_side(b5)T:host()T.broadcast_clock.interval=tonumber(b1.wss[2])or T.broadcast_clock.interval end end end;aG(B)P:set_elements({Z,_,U,V,W,X,Y,T})Q:set_elements({a8,a9,aa,T})R:set_elements({ab,T})for H,b4 in next,S do b4.stats.pos=b.math_utils.Vector2(E.this_layout.stats())b4.stats:show(h)b4.options.raw_mode=true;b4.options.stop_on_terminate=false end;P.options.stop_on_terminate=true;P:start()af()T:close()
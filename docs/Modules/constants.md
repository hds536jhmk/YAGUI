
# Constants

Constants **can help you future proofing your application**. If you use them you're almost certain that if one of them changes value you're safe because you're just using a variable, and your application will automatically use the changed value when the library is updated.

## Categories

Constants **can be separated in categories based on what they are used for**.

### State Checking

These constants are used to **check return values of some functions to see in what state they returned**:

* **OK**
* **NO**
* **ERROR**

### Events

These constants are **useful when you're doing something with a `formatted_event`**, like checking what's the name of the event (e.g. `if formatted_event.name == TOUCH then --[[do stuff]] end`) or what mouse button was pressed (e.g. `if formatted_event.name == MOUSEUP and formatted_event.button == MOUSE_LEFT then --[[do stuff]] end`).

These can also be **separated in two main categories**.

#### Names

All event **constants that have to do with the name of an event**:

* **TIMER**
* **TOUCH**
* **MOUSEUP**
* **MOUSEDRAG**
* **MOUSEMOVE**
* **MOUSESCROLL**
* **CHAR**
* **KEY**
* **KEYUP**
* **PASTE**
* **REDNET**
* **MODEM**
* **TERMINATE**
* **TERMRESIZE**
* **COROUTINE**
* **DELETED**

#### Inputs

All event **constants that will help you when you need to check what key or button was pressed**:

* **MOUSE_LEFT**
* **MOUSE_RIGHT**
* **MOUSE_MIDDLE**
* **SCROLL_UP**
* **SCROLL_DOWN**
* All **keys from** [**Keys API**](http://www.computercraft.info/wiki/Keys_(API)) except that they're written in UPPERCASE and have the prefix "KEY_".

### Callbacks

All **constants that will help you to set objects' callbacks** through [`generic_utils.set_callback`](./generic_utils_module.md#set_callback):

* **ONSTART**
* **ONSTOP**
* **ONDRAW**
* **ONPRESS**
* **ONFAILEDPRESS**
* **ONTIMEOUT**
* **ONCLOCK**
* **ONEVENT**
* **ONFOCUS**
* **ONKEY**
* **ONCHAR**
* **ONMOUSESCROLL**
* **ONCURSORCHANGE**
* **ONWRITE**
* **ONCONNECT**
* **ONDISCONNECT**
* **ONSEND**
* **ONRECEIVE**
* **ONDRAG**
* **ONRESIZE**
* **ONPASTE**
* **ONHOVER**
* **ONRELEASE**

### Objects

These constants are **used to set some special properties in objects**.

This can be **separated into two groups**.

#### Priority

Used to **set an object's priority in a `Loop`** (e.g. If something has high priority it will be drawn on top of everything if it was interacted with):

* **LOW_PRIORITY**
* **HIGH_PRIORITY**

#### Text Alignment

Used to **specify text alignment on some objects**:

* **ALIGN_LEFT**
* **ALIGN_CENTER**
* **ALIGN_RIGHT**

### Computer Type

Used to check **what type of computer you're on depending on what [`generic_utils.get_computer_type`](./generic_utils_module.md#get_computer_type) returns**:

* **COMPUTER**
* **TURTLE**
* **POCKET**

### WSS & FT

These **constants are used to check `WSS` or `FT` return values and variables**:

* **NONE**
* **ALL**
* **SEND**
* **RECEIVE**
* **HOST**
* **USER**
* **DISCONNECTED**
* **CONNECTION_REQUEST**


# string_utils

Contains all **functions that are helpful when dealing with strings**.

This module has a **table that's called `magic_characters`** which is **used by the [`escape_magic_characters`](#escape_magic_characters) function** to know what characters to escape, **you shouldn't change it unless other magic_characters are added and the library isn't updated yet**.

## join

**COPY OF [`table.concat`](http://lua-users.org/wiki/TableLibraryTutorial)**.

## split

*table* : **split**( *string* : **str**, *string* : **sep** )

It **returns a table** which **contains all characters in `str` separated by `sep` except for `sep`**.

**str** is the **string that is going to be split**.

**sep** is the **string that determines where `str` is split** (this must have more than 0 characters or it will return an empty table).

```lua
-- Create a string that has some sort of text in it
local s = "f o o b a r"

-- Split s on every empty space
local t1 = string_utils.split(s, " ")
-- Join t1 and put a space between every value of it
local s1 = string_utils.join(t1, " ")

-- Prints the splitted string
print(textutils.serialise(t1))
-- Prints the joined table (it should be equal to s)
print(s1)
```

## split_by_char

*table* : **split_by_char**( *string* : **str**, *string* : **char** )

It **returns a table** which **contains all characters in `str` separated by `char` except for `char`**, this **doesn't accept patterns** so it's **A LOT faster than [`string_utils.split`](#split)**.

**str** is the **string that is going to be split**.

**char** is the **character that determines where `str` is split** (this can't be an empty string or it will return an empty table).

```lua
-- Create a string that has some sort of text in it
local s = "f o o b a r"

-- Split s on every "o" character
local t1 = string_utils.split_by_char(s, "o")
-- Join t1 and put an "o" character between every value of it
local s1 = string_utils.join(t1, "o")

-- Prints the splitted string
print(textutils.serialise(t1))
-- Prints the joined table (it should be equal to s)
print(s1)
```

## compare_versions

This can be **used to see if the library is a newer [version](./info_module.md#ver-string) than the one supported by the program**.

*number* : **compare_versions**( *string* : **v1**, *string* : **v2** )

It **returns a number** that can be -1, 0 or 1, if it returns **-1** then **v1 is lower than v2**, if it's **0** they're the **same version** and if **v1 is newer than v2 it returns 1**.

```lua
-- Store the first compatible version of the library
local first_compatible_version = "1.12.1"

-- Check if compatible (basically info.ver < first_compatible_version)
if string_utils.compare_versions(info.ver, first_compatible_version) == -1 then
    printError("This version of YAGUI isn't compatible with this program.")
    return
end

-- WRITE YOUR PROGRAM
```

## escape_magic_characters

*string* : **escape_magic_characters**( *string* : **str** )

**Returns a [magic character](https://www.lua.org/pil/20.2.html) free version of `str`**.

**str** is the **string that contains lua's [magic characters](https://www.lua.org/pil/20.2.html)**.

```lua
-- Create a lua pattern
local pattern = "[^fobar]"
-- Create a string from pattern that hasn't got any magic character
local magic_free_pattern = string_utils.escape_magic_characters(pattern)

-- Replace pattern with ""
local str1 = "If you don't bait me I'll reply"
local s1 = str1:gsub(pattern, "")

-- Replace magic_free_pattern with ""
local str2 = "foo[^fobar]bar"
local s2 = str2:gsub(magic_free_pattern, "")

-- On str1 the characters that are chosen by the pattern are replaced with ""
print(s1)
-- On str2 pattern is replaced with ""
print(s2)
```

## get_extension

*string* : **get_extension**( *string* : **path** )

**Returns a string that is the extension of the file in `path`**.

**path** is the **path of the file** that you want to know its extension.

```lua
-- First file path
local f1 = "./foobar.txt"
-- Get extension of f1
local ext1 = string_utils.get_extension(f1)

-- Second file path
local f2 = "./foobar"
-- Get extension of f2
local ext2 = string_utils.get_extension(f2)

-- Should print "txt"
print(ext1)
-- Should print "" because f2 doesn't have any extension
print(ext2)
```

## format_number

*string* : **format_number**( *number* : **number**, *number* : **precision** )

**Returns a string that is `number` with `precision` decimal digits and truncated to the last significant digit**.

**number** is the **number to be formatted**.

**precision** is how many **decimal digits the returned string of `number` should have** (if not specified it's 0).

```lua
-- A number
local num = 1405.14008

-- Printing num formatted with 0 decimal digits
print(
    string_utils.format_number(num)
)
-- Printing num formatted with 4 decimal digits
print(
    string_utils.format_number(num, 4)
)
-- Printing num formatted with 5 decimal digits
print(
    string_utils.format_number(num, 5)
)
```

## trim

*string* : **trim**( *string* : **str** )

**Returns `str` without extra spaces from both sides of the string.**

**str** is the **string to be trimmed**.

```lua
-- A string
local str = "    I don't know how to write   , and I want this string to be trimmed !     "

-- Printing the trimmed string concatenated by another one to prove that there is no space between the two
print(
    string_utils.trim(str).." There should only be a space here."
)
```

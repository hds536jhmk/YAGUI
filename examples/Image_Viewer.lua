
-- AUTO-GENERATED with "YAGUI create"
local YAGUI_PATH = settings.get("YAGUI_PATH")
if not (type(YAGUI_PATH) == "string") then printError("YAGUI is not installed, please install it by opening it with argument \"setup\"."); return; end
if not fs.exists(YAGUI_PATH) then printError("Couldn't find YAGUI in path: \""..YAGUI_PATH.."\", Please reinstall it by opening it with argument \"setup\"."); return; end
local YAGUI = dofile(YAGUI_PATH)
-- End of AUTO-GENERATED code

local tArgs = {...}
local function print_usage()
    local lines = {
        { text = "Image_Viewer ...", foreground = colors.green , background = nil},
        { text = " 1. <PATH> (path to the image),", foreground = colors.blue  , background = nil},
        { text = " 2. <nfp/nft/yai> (image format),", foreground = colors.yellow, background = nil},
        { text = " 3. [binary] (read image in binary mode),", foreground = colors.green , background = nil},
        { text = " 4. [X] [Y] (origin of the image),", foreground = colors.blue  , background = nil},
        { text = " 5. [IMG_X] [IMG_Y] (crop origin),", foreground = colors.yellow, background = nil},
        { text = " 6. [IMG_WIDTH] [IMG_HEIGHT] (crop size)", foreground = colors.green , background = nil},
    }

    for key, line in next, lines do
        YAGUI.monitor_utils.better_print(term, line.foreground, line.background, line.text)
    end
end

if tArgs[1] == "help" or #tArgs == 0 then
    print_usage()
    return
end

if #tArgs < 2 then
    YAGUI.monitor_utils.better_print(term, colors.red, nil, "Not enough arguments: At least 2 must be provided.")
    print_usage()
    return
end

local path = tArgs[1]
if (not fs.exists(path)) or fs.isDir(path) then
    YAGUI.monitor_utils.better_print(term, colors.red, nil, "The file either doesn't exist or it's a directory.")
    print_usage()
    return
end
path = shell.resolve(path)

local mode = tArgs[2]:lower()
local draw_function
if mode == "nfp" then
    draw_function = YAGUI.screen_buffer.nfp_image
elseif mode == "nft" then
    draw_function = YAGUI.screen_buffer.nft_image
elseif mode == "yai" then
    draw_function = YAGUI.screen_buffer.yai_image
else
    YAGUI.monitor_utils.better_print(term, colors.red, nil, "File mode can only be nfp, nft or yai.")
    print_usage()
    return
end

local binary = tArgs[3]
binary = binary and binary:lower() == "binary"

local img = ""
if binary then
    local img_file = fs.open(path, "rb")
    local rows = {}
    local row = {}

    while true do
        local byte = img_file.read()
        if not byte then
            rows[#rows + 1] = table.concat(row)
            break
        end
        
        local char = string.char(byte)
        if char == "\n" then
            rows[#rows + 1] = table.concat(row)
            -- Trying to replace "\n\r" sequence with "\n"
            local next_byte = img_file.read()
            if next_byte then
                local next_char = string.char(next_byte)
                row = {next_char == "\r" and nil or next_char}
            else
                row = {}
            end
        else
            row[#row + 1] = char
        end
    end

    img = table.concat(rows, "\n")
    img_file.close()
else
    local img_file = fs.open(path, "r")
    img = img_file.readAll()
    img_file.close()
end

local x, y, img_x, img_y, width, height = tonumber(tArgs[4]) or 1, tonumber(tArgs[5]) or 1, tonumber(tArgs[6]), tonumber(tArgs[7]), tonumber(tArgs[8]), tonumber(tArgs[9])

local loop = YAGUI.Loop(20, 6)
loop.options.raw_mode = true
loop:set_callback(
    YAGUI.ONDRAW,
    function (self)
        draw_function(YAGUI.screen_buffer, x, y, img, img_x, img_y, width, height)
    end
)
loop:start()

YAGUI.monitor_utils.better_clear(term)

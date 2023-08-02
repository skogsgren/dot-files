-- from ChatGPT
local function toggle_pause_and_seek_back()
    mp.command("no-osd seek -1")
    mp.command("cycle pause")
end
mp.add_key_binding("h", "toggle_pause_and_seek_back", toggle_pause_and_seek_back)

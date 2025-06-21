--[[

     Steamburn Awesome WM theme 3.0
     github.com/lcpz

--]]

local gears                                     = require("gears")
local lain                                      = require("lain")
local awful                                     = require("awful")
local wibox                                     = require("wibox")
local dpi                                       = require("beautiful.xresources").apply_dpi

local os                                        = os
local my_table                                  = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/zero"
theme.wallpaper                                 = theme.dir .. "/Wallpapers/Space.jpg"
theme.font                                      = "Terminus 13"
theme.fg_normal                                 = "#e2ccb0"
theme.fg_focus                                  = "#d88166"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#140c0b"
theme.bg_focus                                  = "#140c0b"
theme.bg_urgent                                 = "#2a1f1e"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#302627"
theme.border_focus                              = "#c2745b"
theme.border_marked                             = "#CC9393"
theme.taglist_fg_focus                          = "#d88166"
theme.tasklist_bg_focus                         = "#140c0b"
theme.tasklist_fg_focus                         = "#d88166"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.menu_height                               = dpi(20)
theme.menu_width                                = dpi(140)
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[|]"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = dpi(2)
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.titlebar_close_button_normal              = theme.dir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.dir .. "/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.dir .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.dir .. "/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/titlebar/maximized_focus_active.png"

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup                                    = lain.util.markup
local gray                                      = "#94928F"

-- Textclock
local mytextclock                               = wibox.widget.textclock(" %H:%M ")
mytextclock.font                                = theme.font

-- Calendar
theme.cal                                       = lain.widget.cal({
  attach_to = { mytextclock },
  notification_preset = {
    font = "Terminus 13",
    fg   = theme.fg_normal,
    bg   = theme.bg_normal
  }
})

-- Mail IMAP check
--[[ to be set before use
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        mail  = ""
        count = ""

        if mailcount > 0 then
            mail = "Mail "
            count = mailcount .. " "
        end

        widget:set_markup(markup(gray, mail) .. count)
    end
})
--]]

-- MPD
theme.mpd = lain.widget.mpd({
  settings = function()
    artist = mpd_now.artist .. " "
    title  = mpd_now.title .. " "

    if mpd_now.state == "pause" then
      artist = "mpd "
      title  = "paused "
    elseif mpd_now.state == "stop" then
      artist = ""
      title  = ""
    end

    widget:set_markup(markup.font(theme.font, markup(gray, artist) .. title))
  end
})

-- CPU
local cpu = lain.widget.sysload({
  settings = function()
    widget:set_markup(markup.font(theme.font, markup(gray, " Cpu ") .. load_1 .. "%"))
  end
})

-- Coretemp (lain, average)
local temp = lain.widget.temp({
  settings = function()
    widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
  end
})
--]]
local tempicon = wibox.widget.imagebox(theme.widget_temp)

-- MEM
local mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup.font(theme.font, markup(gray, " Mem ") .. mem_now.used .. " "))
  end
})

-- /home fs
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    partition = "/home",
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10.5" },
})
--]]

-- Battery
local bat = lain.widget.bat({
  settings = function()
    local perc = bat_now.perc
    if bat_now.ac_status == 1 then perc = perc .. " Plug" end
    widget:set_markup(markup.font(theme.font, markup(gray, " Bat ") .. perc .. " "))
  end
})

-- Net checker
local net = lain.widget.net({
  settings = function()
    if net_now.state == "up" then
      net_state = "On"
    else
      net_state = "Off"
    end
    widget:set_markup(markup.font(theme.font, markup(gray, " Net ") .. net_state .. " "))
  end
})

-- ALSA volume
theme.volume = lain.widget.alsa({
  settings = function()
    header = " Vol "
    vlevel = volume_now.level

    if volume_now.status == "off" then
      vlevel = vlevel .. "M "
    else
      vlevel = vlevel .. " "
    end

    widget:set_markup(markup.font(theme.font, markup(gray, header) .. vlevel))
  end
})

-- Weather
--[[ to be set before use
theme.weather = lain.widget.weather({
    --APPID =
    city_id = 2643743, -- placeholder (London)
})
--]]

-- Separators
local separator = wibox.widget.textbox(markup.font("Terminus 22", "|"))
local space     = wibox.widget.textbox(markup.font("Terminus 22", " "))

local function update_txt_layoutbox(s)
  -- Writes a string representation of the current layout in a textbox widget
  local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
  s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
  -- Quake application
  s.quake = lain.util.quake({ app = awful.util.terminal })

  -- If wallpaper is a function, call it with the screen
  local wallpaper = theme.wallpaper
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  gears.wallpaper.maximized(wallpaper, s, true)

  -- Tags
  awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Textual layoutbox
  s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
  awful.tag.attached_connect_signal(s, "property::selected", function() update_txt_layoutbox(s) end)
  awful.tag.attached_connect_signal(s, "property::layout", function() update_txt_layoutbox(s) end)
  s.mytxtlayoutbox:buttons(my_table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(22) })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      space,
      separator,
      space,
      s.mytaglist,
      space,
      s.mytxtlayoutbox,
      space,
      s.mypromptbox,
      separator,
      space,
    },
    s.mytasklist, -- Middle widget
    {             -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      space,
      separator,
      --theme.mpd.widget,
      --theme.mail.widget,
      cpu.widget,
      temp.widget,
      separator,
      mem.widget,
      separator,
      --bat.widget,
      net.widget,
      separator,
      --theme.volume.widget,
      mytextclock,
      separator,
      space,
    },
  }
end

return theme

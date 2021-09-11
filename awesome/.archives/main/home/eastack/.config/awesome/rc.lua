local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- {{{ Variable definitions
modkey = "Mod4"
terminal = "alacritty"
editor = os.getenv("EDITOR") or "vi"
editor_cmd = terminal .. " -e " .. editor

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.wallpaper = "/home/eastack/pictures/wallpaper.jpg"
beautiful.border_width = 0
beautiful.useless_gap = 2

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
}

-- {{{ Wibar
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end)
)

local function set_wallpaper(s)
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.noempty,
        buttons = taglist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx(1) end,
              {description = "focus next by index", group = "client"}),
    awful.key({ modkey }, "d", function () awful.spawn("rofi -combi-modi window,drun -show combi -modi combi") end,
              {description = "rofi", group = "launcher"})
)

for i = 1, 10 do
	globalkeys = gears.table.join(globalkeys,
		awful.key(
			{ modkey }, "#" .. i + 9,
			function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			{description = "view tag #"..i, group = "tag"}
		)
	)
end

-- Set keys
root.keys(globalkeys)
-- }}}

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { focus = awful.client.focus.filter,
                     raise = true,
		     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },
}
-- }}}

-- {{{ Signals
-- Rounded rect
client.connect_signal("manage", function (c)
    c.shape = function(cr,w,h)
        gears.shape.rounded_rect(cr,w,h,5)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
-- }}}

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

awful.spawn.once("xset s 300 5")
awful.spawn.once("xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock")
awful.spawn.single_instance("fcitx5")
awful.spawn.single_instance("flameshot")

-- {{{ Variable definitions
modkey = "Mod4"
terminal = "alacritty"
editor = os.getenv("EDITOR") or "vi"
editor_cmd = terminal .. " -e " .. editor

beautiful.wallpaper = "/home/eastack/pictures/wallpaper.jpg"
beautiful.border_width = 0
beautiful.useless_gap = 10
beautiful.font = "Jetbrains Mono 9"

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
    s.mywibox = awful.wibar({
        position = "bottom",
        screen = s,
	opacity = 0.95,
})
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },{
            layout = wibox.layout.fixed.horizontal,
	},
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
	    wibox.widget{

	    },
	    wibox.widget.textclock('📆 %m月%e日 %H:%M'),
            wibox.widget.systray(),
        },
    }
end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
  awful.key({ modkey, "Shift" }, "m",
function (c)
  c.maximized = false
  c.maximized_vertical=false
  c.maximized_horizontal=false
  c:raise()
end ,
{description = "demaximize", group = "client"}),
    awful.key({ modkey }, "Print", 
	    function () awful.spawn("flameshot gui", false) end,
              {description = "Screenshot", group = "launcher"}),

    awful.key({ modkey }, "d", 
	    function () awful.spawn("rofi -combi-modi window,drun -show combi -modi combi") end,
              {description = "rofi", group = "launcher"}),
    awful.key({ modkey }, "Return", 
	    function () awful.spawn("alacritty") end,
              {description = "Alacritty terminal", group = "launcher"}),
    awful.key({ modkey }, "Escape", 
	    function () awful.spawn("chromeium") end,
              {description = "Chromeium browser", group = "launcher"}),

    awful.key({ modkey}, "h",
	function () awful.client.focus.bydirection ("left") end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key(
        { modkey}, "j",
         function () awful.client.focus.bydirection ("down") end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key(
        { modkey}, "k",
        function () awful.client.focus.bydirection ("up") end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key({ modkey}, "l",
        function () awful.client.focus.bydirection ("right") end,
        { description = "focus next by index", group = "client" }
    ),
    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.bydirection("down" )    end,
              {description = "swap with next client by direction", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.bydirection("up" )    end,
              {description = "swap with next client by direction", group = "client"}),
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.bydirection("left" )    end,
              {description = "swap with next client by direction", group = "client"}),
    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.bydirection("right" )    end,
              {description = "swap with next client by direction", group = "client"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"})
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
		     keys = clientkeys,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },
    { rule = { instance="chromium" },
          properties = { opacity = 1, maximized = false, floating = false } },
    }
-- }}}

-- {{{ Signals
-- Rounded rect
client.connect_signal("manage", function (c)
    c.shape = function(cr,w,h)
        gears.shape.rounded_rect(cr,w,h,10)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
-- }}}
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)


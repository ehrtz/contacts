/*
* Copyright (c) 2011-2017 Ferdinand Canta (https://github.com/ehrtz/contacts)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Author ehrtz2013@gmail.com
*/


public class Contacts.CustomHeaderBar : Gtk.Paned{
    private Gtk.HeaderBar left_header;
    private Gtk.HeaderBar right_header;



    public CustomHeaderBar(){


        left_header = new Gtk.HeaderBar();
        left_header.get_style_context().add_class("header_right");
        //left_header.get_style_context().add_class("details");

        var search_entry = new Gtk.SearchEntry ();
        search_entry.margin = 3;
        search_entry.margin_top = 8;
        search_entry.margin_bottom = 8;
        search_entry.set_size_request(244, 0);
        search_entry.width_chars = 30;
        search_entry.placeholder_text = ("Search\u2026");



        right_header = new Gtk.HeaderBar();
        right_header.get_style_context().add_class("header_left");
        left_header.show_close_button = true;
        right_header.show_close_button = true;
        right_header.pack_start (search_entry);

        //left_header.set_size_request(200, 0);
        Gtk.Settings.get_default().notify["gtk-decoration-layout"].connect(set_window_buttons);
		realize.connect(set_window_buttons);
		set_window_buttons();
        this.pack1(left_header, true, false);
		this.pack2(right_header, true, false);


        this.get_style_context().add_class("headerbar_pane");



        show_all();

    }

    private void set_window_buttons()
	{
		string[] buttons = Gtk.Settings.get_default().gtk_decoration_layout.split(":");
		if (buttons.length < 2) {
			buttons = {buttons[0], ""};
			//Logger.warning("gtk_decoration_layout in unexpected format");
		}

		left_header.set_decoration_layout(buttons[0] + ":");
		right_header.set_decoration_layout(":" + buttons[1]);
	}



}

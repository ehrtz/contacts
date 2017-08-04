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


public class Contacts.ContactDetails : Gtk.Box{
    private Granite.Widgets.Avatar avatar;
    //private Gtk.ToggleButton avatar_button;
    private Gtk.Grid layout_grid;
    public ContactDetails(){
        margin = 6;

        build_ui();
    }

    private void build_ui(){
        margin = 8;
        //get_style_context ().add_class ("details");
        layout_grid = new Gtk.Grid();
        layout_grid.column_spacing = 15;
        layout_grid.row_spacing = 8;

        avatar = new Granite.Widgets.Avatar.with_default_icon (72);

        avatar.hexpand = true;
        layout_grid.attach (avatar, 0, 0, 2, 1);


        var fullname = new Gtk.Label ( "Uzumaki Naruto" );
        fullname.get_style_context ().add_class ("h2");
        fullname.margin_start = 15;
        fullname.margin_end = 15;
        layout_grid.attach ( fullname, 0,1,2,1);

        var job = new Gtk.Label ( "Hokage" );
        fullname.get_style_context ().add_class ("h5");
        layout_grid.attach ( job, 0,2,2,1);


        var separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
        layout_grid.attach ( separator, 0,3,2,1);

        var label = new Gtk.Label ( "Phone" );
        label.halign = Gtk.Align.END;
        label.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);
        label.get_style_context ().add_class ("h3");
        layout_grid.attach ( label, 0,4,1,1);

        var details = new Gtk.Label ( "0919-1234567" );
        details.halign = Gtk.Align.START;
        details.get_style_context ().add_class ("h3");
        layout_grid.attach ( details, 1,4,1,1);

        label = new Gtk.Label ( "Home" );
        label.halign = Gtk.Align.END;
        label.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);
        label.get_style_context ().add_class ("h3");
        layout_grid.attach ( label, 0,5,1,1);

        details = new Gtk.Label ( "02-1234567" );
        details.halign = Gtk.Align.START;
        details.get_style_context ().add_class ("h3");
        layout_grid.attach ( details, 1,5,1,1);

        pack_start(layout_grid,true, true, 0);
        show_all ();

    }
}


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


public class Contacts.ContactEdit : Gtk.Box{
    private Gtk.Grid avatar_grid;
    private Granite.Widgets.Avatar avatar;

    public ContactEdit (){
        build_ui ();

        show_all ();
    }

    private void build_ui (){



        avatar_grid = new Gtk.Grid();
        pack_start(avatar_grid,true, true, 0);

        avatar_grid = new Gtk.Grid();
        avatar_grid.column_spacing = 15;
        avatar_grid.row_spacing = 8;

        avatar = new Granite.Widgets.Avatar.with_default_icon (72);

        avatar.hexpand = true;
        avatar.halign = Gtk.Align.CENTER;
        avatar_grid.attach (avatar, 0, 0, 1, 1);
        pack_start(avatar_grid,true, true, 0);
        show_all ();

    }
}

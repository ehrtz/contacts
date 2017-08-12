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


public class Contacts.ContactDetailsEdit : Gtk.Box{
    private Gtk.Grid avatar_grid;
    private Granite.Widgets.Avatar avatar;
    private Gtk.ListBox listbox;
    private Contacts.DetailsEntry entry;


    public ContactDetailsEdit (){
        build_ui ();

        show_all ();
    }

    private void build_ui (){
        orientation = Gtk.Orientation.VERTICAL;
        set_homogeneous ( false );
        listbox = new Gtk.ListBox ();
        listbox.vexpand = true;
        listbox.hexpand = true;
        listbox.valign = Gtk.Align.START;
        listbox.set_selection_mode (Gtk.SelectionMode.NONE);
        avatar_grid = new Gtk.Grid();
        //pack_start(avatar_grid,true, true, 0);

        avatar_grid = new Gtk.Grid();
        avatar_grid.column_spacing = 15;
        avatar_grid.row_spacing = 15;

        avatar = new Granite.Widgets.Avatar.with_default_icon (72);

        avatar.hexpand = true;
        avatar.halign = Gtk.Align.CENTER;
        avatar_grid.attach (avatar, 0, 0, 1, 1);
        var separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
        avatar_grid.attach ( separator, 0,1,1,1);

        entry = new Contacts.DetailsEntry ( Contacts.EntryType.PHONE );
        listbox.add ( entry );




        pack_start(avatar_grid,false, false, 0);
        pack_start(listbox,false, false, 0);




        show_all ();

    }
}

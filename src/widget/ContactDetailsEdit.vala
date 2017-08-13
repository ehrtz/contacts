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


public class Contacts.ContactDetailsEdit : Gtk.Grid{
    private Gtk.Grid avatar_grid;
    private Granite.Widgets.Avatar avatar;
    private Gtk.ListBox phone_listbox;
    private Gtk.ListBox email_listbox;
    private Gtk.ListBox address_listbox;
    private Contacts.DetailsEntry entry;


    public ContactDetailsEdit (){
        build_ui ();

        show_all ();
    }

    private void build_ui (){
        row_spacing = 24;
        orientation = Gtk.Orientation.VERTICAL;

        phone_listbox = new Gtk.ListBox ();
        //listbox.vexpand = true;
        //listbox.hexpand = true;
        //listbox.valign = Gtk.Align.START;
        phone_listbox.set_selection_mode (Gtk.SelectionMode.NONE);

        email_listbox = new Gtk.ListBox ();
        email_listbox.set_selection_mode (Gtk.SelectionMode.NONE);



        avatar_grid = new Gtk.Grid();
        //avatar_grid.column_spacing = 15;
        //avatar_grid.row_spacing = 15;

        avatar = new Granite.Widgets.Avatar.with_default_icon (72);

        avatar.hexpand = true;
        avatar.halign = Gtk.Align.CENTER;
        avatar_grid.attach (avatar, 0, 0, 1, 1);
        var separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
        avatar_grid.attach ( separator, 0,1,1,1);

        entry = new Contacts.DetailsEntry ( Contacts.EntryType.PHONE );
        phone_listbox.add ( entry );

        entry = new Contacts.DetailsEntry ( Contacts.EntryType.PHONE );
        email_listbox.add ( entry );




        attach ( avatar_grid, 0,0,1,1);
        attach ( phone_listbox, 0,1,1,1);
        attach ( email_listbox, 0,2,1,1);





        show_all ();

    }
}

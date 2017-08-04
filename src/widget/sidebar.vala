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


public class Contacts.Sidebar : Gtk.Grid {

     private Gtk.Label       taghdr_label;


        private Gtk.Label       status_label;
        private Gtk.ListBox ListBox;

        public signal void TagSelected();

    public Sidebar () {
        taghdr_label = new Gtk.Label ("Tags");
        taghdr_label.halign = Gtk.Align.START;
        taghdr_label.get_style_context ().add_class ("h4");



        var row_grid = new Gtk.Grid ();

        row_grid.margin_start = 3;
        row_grid.margin_end = 3;
        row_grid.column_spacing = 3;
        row_grid.set_row_homogeneous (false);


        var avatar = new Granite.Widgets.Avatar.with_default_icon (64);
            avatar.get_style_context ().add_class("avatar");
        var full_name_label = new Gtk.Label ("Juan Dela Cruz");
            full_name_label.halign = Gtk.Align.START;
            full_name_label.get_style_context ().add_class ("h3");

            status_label = new Gtk.Label ("Online");
            status_label.halign = Gtk.Align.START;
            status_label.margin_bottom = 15;


            status_label.use_markup = true;
            row_grid.attach (avatar, 0, 0, 1, 2);
            row_grid.attach (full_name_label, 1, 0, 1, 1);
            row_grid.attach (status_label, 1, 1, 1, 1);




          attach(row_grid,0,0,1,1);

        ListBox = new Gtk.ListBox();

        ListBox.row_selected.connect((row) => {
            TagSelected();
        });

        var scroll_box = new Gtk.ScrolledWindow(null, null);

        //attach(ListBox,0,1,1,1);
        attach(scroll_box,0,1,1,1);
        scroll_box.add(ListBox);
        ListBox.hexpand = true;
        ListBox.vexpand = true;
        ListBox.set_header_func (update_headers);


        add_listbox_row ("Contacts", 0,"internet-mail-symbolic");
        add_listbox_row ("Email Signature", 1,"credit-card-symbolic");
        add_listbox_row ("Business Card", 2,"office-calendar-symbolic");
        add_listbox_row ("Updates", 3,"channel-secure-symbolic");
        add_listbox_row ("No Email", 4, "folder-tag");
        add_listbox_row ("No Phone", 5, "folder-tag");
        add_listbox_row ("Ninja", 6, "folder-tag");
        add_listbox_row ("Friends", 7, "folder-tag");
        add_listbox_row ("Officemate", 8, "folder-tag");
        add_listbox_row ("Batch99", 9, "folder-tag");
        //add_listbox_row ( "Tag 5", 10 );
        //add_listbox_row ( "Tag 6", 11 );
        //add_listbox_row ( "Tag 7", 12 );



        show_all ();
    }

    public void update_headers (Gtk.ListBoxRow row, Gtk.ListBoxRow? before) {
                if (row == ListBox.get_row_at_index (4)){
                    row.set_header (taghdr_label);
                }
    }

    private void add_listbox_row ( string Label, int pos, string icon_name ){
        //Gtk.ListBoxRow row;
        Gtk.Label tag_label;
        Gtk.Grid row_grid;
        //row = new Gtk.ListBoxRow();
        var tag_icon = new Gtk.Image.from_icon_name (icon_name, Gtk.IconSize.MENU);
        tag_label = new Gtk.Label( Label );
        tag_label.get_style_context ().add_class ("h5");
        row_grid = new Gtk.Grid ();
        row_grid.margin = 3;
        row_grid.margin_start = 20;
        row_grid.margin_end = 6;
        row_grid.column_spacing = 5;
        row_grid.attach ( tag_icon, 0, 0, 1, 1 );
        row_grid.attach ( tag_label, 1, 0, 1, 1 );
        ListBox.insert( row_grid, pos );


    }




}

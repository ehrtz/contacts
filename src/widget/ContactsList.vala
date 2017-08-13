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


public class Contacts.ContactsList : Gtk.ScrolledWindow{
    private Gtk.ListBox ContactsListBox;
    private string last_tag;
    public signal void rows_selected( List <weak Gtk.ListBoxRow>? rows );

    public ContactsList(){
        last_tag = "";
        hexpand = true;
        vexpand = true;
        min_content_width = 250;
        window_placement_set = true;
        ContactsListBox = new Gtk.ListBox ();
        add ( ContactsListBox );
        ContactsListBox.set_header_func (update_headers);
        build_ui();


        ContactsListBox.selected_rows_changed.connect(() => {
            rows_selected (ContactsListBox.get_selected_rows());

        });

    }

    private void build_ui(){
        ContactsListBox.hexpand = true;
        ContactsListBox.vexpand = true;
        ContactsListBox.set_selection_mode (Gtk.SelectionMode.MULTIPLE);
        ContactsListBox.activate_on_single_click = false;

        ContactsListBox.set_sort_func ((row1, row2) => {
            string a = ((Contacts.ContactsItem) row1).fullname;
            string b = ((Contacts.ContactsItem) row2).fullname;

            if (a < b) return -1;
            if (b < a) return 1;

            return 0;
        });
        new_contact ( "Namikaze Minato","Hidden Leaf Village" );
        new_contact ( "Nara Shikamaru","Hidden Leaf Village" );
        new_contact ( "Haruno Sakura","Hidden Leaf Village" );
        new_contact ( "Gaara of the Sand","Hidden Village by Sand" );
        new_contact ( "Uzumaki Naruto","Hidden Leaf Village" );
        new_contact ( "Uzumaki Kushina","Hidden Leaf Village" );
        new_contact ( "Uzumaki Boruto","Hidden Leaf Village" );
        new_contact ( "Uzumaki Himawari","Hidden Leaf Village" );
        new_contact ( "Uzumaki Karin","Hidden Leaf Village" );


    }

    public void update_headers (Gtk.ListBoxRow row, Gtk.ListBoxRow? before) {
        //string header_tag;

        var header_label = new Gtk.Label("");
        header_label.halign = Gtk.Align.START;
        header_label.margin = 2;
        header_label.margin_start = 10;
        header_label.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);

        var header_grid = new Gtk.Box ( Gtk.Orientation.VERTICAL, 0 );
        header_grid.hexpand = true;
        header_grid.get_style_context ().add_class ("header");
        header_grid.pack_start ( header_label, true, false, 0);
        header_grid.show_all ();

        if ( row is Contacts.ContactsItem ) {
            var item = row as Contacts.ContactsItem;
            var header_tag = item.fullname.substring (0,1);

            if ( header_tag != last_tag ) {
                header_label.label = header_tag;
                row.set_header (header_grid);
            }

            last_tag = header_tag;

            var next_row = ContactsListBox.get_row_at_index (row.get_index() + 1);

            if (next_row != null ){
                var next_item = next_row as Contacts.ContactsItem;
                var tag = next_item.fullname.substring (0,1);

                if ( tag == header_tag) {
                    var childerns = row.get_children ();

                    foreach (Gtk.Widget child in childerns) {

                        if (child is Gtk.Grid) {
                            var grid = child as Gtk.Grid;

                            if ( grid.get_name() == "m_grid") {
                                var separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);

                                separator.hexpand = true;
                                grid.attach ( separator, 0,1,1,1);
                                grid.show_all();
                                return;
                            }
                        }
                    }
                }
            }
            else {
                var childerns = row.get_children ();

                foreach (Gtk.Widget child in childerns) {

                    if (child is Gtk.Grid) {
                        var grid = child as Gtk.Grid;

                        if ( grid.get_name() == "m_grid") {
                            var separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);

                            separator.hexpand = true;
                            grid.attach ( separator, 0,1,1,1);
                            grid.show_all();
                            return;
                        }
                    }
                }
            }

            //
        }

    }

    private void new_contact ( string fullname, string details ){

        var contact = new Contacts.ContactsItem ( fullname, details );
        ContactsListBox.add ( contact );

    }

}


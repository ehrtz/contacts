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




public class Contacts.DetailsEntry : Gtk.ListBoxRow {

    private Contacts.EntryType entry_type;
    private Gtk.ComboBoxText entry_label;
    private Gtk.Entry entry_value;
    private Gtk.Grid row_grid;
    private Gtk.ListStore list_store;

    private static string[] used_label={};

     const string phone_type[7] = {
        "home",
        "work",
        "moble",
        "main",
        "home fax",
        "work fax",
        "pager",
        "other",
      };


    public DetailsEntry ( Contacts.EntryType Entry ) {
        entry_type = Entry;
        build_ui ();
        show_all ();

    }

    private void build_ui () {
        margin = 3;
        hexpand = true;
        create_list ();
        if ( entry_type == Contacts.EntryType.PHONE ) {
            create_entry_phone ();
        }
        else if ( entry_type == Contacts.EntryType.EMAIL ) {
        }
        else if ( entry_type == Contacts.EntryType.ADDRESS ) {
        }
        this.show_all ();
    }

    private void create_list (){
        list_store = new Gtk.ListStore (1, typeof (string) );
        Gtk.TreeIter iter;

        list_store.append (out iter);
        list_store.set (iter, 0, "Home");
        list_store.append (out iter);
        list_store.set (iter, 0, "Personal");
        list_store.append (out iter);
        list_store.set (iter, 0, "Work");



    }

    private void create_entry_phone (){
        row_grid = new Gtk.Grid ();
        row_grid.column_spacing = 3;
        row_grid.margin_start = 15;
        row_grid.margin_end = 15;

        entry_label = new Gtk.ComboBoxText ();
        entry_label.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
        //entry_label.get_style_context ().remove_class ("entry");
        entry_label.append_text ("home");
		entry_label.append_text ("work");
		entry_label.append_text ("mobile");
		entry_label.append_text ("main");
		entry_label.append_text ("home fax");
		entry_label.append_text ("work fax");
		entry_label.append_text ("pager fax");
		entry_label.append_text ("other");

        //for (int i=0; i= G_N_ELEMENTS (phone_type); i++) {
        //}

        entry_label.active = 0;

        row_grid.attach ( entry_label, 0, 0, 1, 1 );

        var separator = new Gtk.Separator (Gtk.Orientation.VERTICAL);
        row_grid.attach ( separator, 1, 0, 1, 1 );
        entry_value = new Gtk.Entry ();
        entry_value.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
        //entry_value.get_style_context ().remove_class ("entry");
        entry_value.placeholder_text = ("Add phone");


        entry_value.focus_in_event.connect ( (event) => {
          var parent = this.get_parent();
          if (parent is Gtk.ListBox ){
              var listbox = parent as Gtk.ListBox;

              var next_row = listbox.get_row_at_index (this.get_index() + 1);
              if (next_row == null ){
                var new_entry = new DetailsEntry (Contacts.EntryType.PHONE);
                listbox.add (new_entry);
              }
          }
          //text_entry_got_focus();
        return false;
        });



        row_grid.attach ( entry_value, 2, 0, 1, 1 );

        separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
        row_grid.attach ( separator, 0, 1, 3, 1 );

        add ( row_grid );
        //entry_label =

    }

}

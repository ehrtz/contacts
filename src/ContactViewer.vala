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


public class Contacts.ContactViewer : Gtk.Overlay{

    private Contacts.ContactDetails Details;
    private Contacts.ContactEdit ContactEdit;
    private Contacts.ContactsViewRows ViewRows;
    private Gtk.Stack stack;

    public ContactViewer (){
        build_ui();
        show_all ();

    }

    private void build_ui(){
        Details = new Contacts.ContactDetails ();
        ContactEdit = new Contacts.ContactEdit ();
        ViewRows = new Contacts.ContactsViewRows();
        hexpand = true;
        vexpand = true;

        stack = new Gtk.Stack ();
        stack.add_named (Details, "Details");
        stack.add_named (ContactEdit, "ContactEdit");
        stack.add_named (ViewRows, "ViewRows");
        stack.set_transition_type (Gtk.StackTransitionType.SLIDE_LEFT_RIGHT);

        this.add (stack);
        this.show_all ();
    }


    public void set_view(string widget_name){
        if ( widget_name == "Details" ){
            stack.set_visible_child_name ("Details");
        }
        else{
            stack.set_visible_child_name ("ViewRows");
        }
    }
}

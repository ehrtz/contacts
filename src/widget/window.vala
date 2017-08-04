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




public class Contacts.Window : Gtk.ApplicationWindow {
    private Contacts.Sidebar sidebar;
    private Contacts.ContactViewer Viewer;
    private Contacts.ContactsList ContactsList;
    private Contacts.CustomHeaderBar headerbar;
    private Gtk.Paned SidebarPane;
    private Gtk.Paned ContactsPane;

    private const string EMBEDDED_CSS = """
        .headerbar_pane.pane-separator {
            border-radius: 0;
            border-width: 0 1px 1px 0;
        }
        .titlebar .pane-separator {
            background-color: shade (@base_color, 0.65);
            background-image: none;
        }
        .header_right {
            border-top-right-radius: 0;
            border-top-left-radius: 4;

        }
        .header_left {
            border-top-left-radius: 0;

        }
        .avatar {
            border-radius: 10%;
        }
        .header {
            background-color: shade (@base_color, 0.96);
            font-weight: bold;
        }
        .details {
            background-color: #FFF;
        }
    """;


    public Window (Gtk.Application app) {

         try {
            var css_provider = new Gtk.CssProvider();
            css_provider.load_from_data(EMBEDDED_CSS, EMBEDDED_CSS.length);
            weak Gdk.Display display = Gdk.Display.get_default();
		    weak Gdk.Screen screen = display.get_default_screen();
            Gtk.StyleContext.add_provider_for_screen(screen, css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        } catch (Error e) {
            critical(e.message);
        }

        ContactsList = new Contacts.ContactsList();
        //Details = new Contacts.ContactDetails ();
        Viewer = new Contacts.ContactViewer ();
        ContactsList.rows_selected.connect ( ( rows ) => {
            uint count = rows.length ();
            if (count < 2){
            }

        });

        resize(1000, 700);
        sidebar = new Contacts.Sidebar ();


        headerbar = new Contacts.CustomHeaderBar();
        set_titlebar (headerbar );


        SidebarPane = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        SidebarPane.get_style_context ().add_class ("details");
        ContactsPane = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);

        sidebar.TagSelected.connect (() => {

        });



        SidebarPane.pack1(sidebar, true, false);
        SidebarPane.pack2(ContactsPane, true, false);
        ContactsPane.pack1(ContactsList, false, false);
        ContactsPane.pack2(Viewer, true, false);

        ContactsList.rows_selected.connect ( ( rows ) => {

            if (rows.length () < 2)
                Viewer.set_view("Details");
            else
                Viewer.set_view("ContactEdit");

        });

        SidebarPane.set_size_request(200, 0);
        ContactsPane.position = (250);

        SidebarPane.notify["position"].connect(() => {



            if ( SidebarPane.get_position() < 200 ) {
                SidebarPane.position = 200;
            }
            headerbar.set_position(SidebarPane.get_position());
		});

        this.add (SidebarPane);
        this.show_all ();

    }
    public void show_app () {
        show ();
        present ();
    }
}


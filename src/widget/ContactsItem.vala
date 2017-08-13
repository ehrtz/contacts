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


public class Contacts.ContactsItem : Gtk.ListBoxRow{

    private Granite.Widgets.Avatar avatar;
    private Gtk.Label name_label;
    private Gtk.Label details_label;
    public string fullname;
    public string details_str;
    public bool has_separator;

    public ContactsItem ( string fullname, string details ) {
        this.fullname = fullname;
        this.details_str = details;
        build_ui();
        show_all ();
    }

    private void build_ui () {
        Gtk.Grid m_layout;
        Gtk.Grid m_grid;
        margin_start = 6;
        margin_end = 6;
        avatar = new Granite.Widgets.Avatar.with_default_icon (32);
        avatar.halign = Gtk.Align.START;

        name_label = new Gtk.Label( this.fullname );
        name_label.halign = Gtk.Align.START;
        name_label.get_style_context ().add_class ("h3");
        name_label.margin_top = 1;

        details_label = new Gtk.Label( this.details_str );
        details_label.halign = Gtk.Align.START;
        details_label.margin_left = 0;
        details_label.get_style_context ().add_class (Gtk.STYLE_CLASS_DIM_LABEL);

        m_layout = new Gtk.Grid ();
        m_grid = new Gtk.Grid ();
        this.add ( m_grid );


        //m_layout.margin = 3;
        m_layout.attach ( avatar, 0,0, 1, 2 );
        m_layout.attach ( name_label, 1,0, 1, 1 );
        m_layout.attach ( details_label, 1,1, 1, 1 );

        m_grid.set_name("m_grid");
        m_grid.attach ( m_layout, 0,0,1,1);


    }

}

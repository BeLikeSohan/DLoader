public class MyApp.Widgets.HeaderBar : Gtk.HeaderBar{
    public MyApp.Windows.MainWindow main_window {get; construct;}
    public HeaderBar(MyApp.Windows.MainWindow window){
        Object(
            main_window: window
        );
    }

    construct{
        title = "DLoader Alpha";
        subtitle = "Download PUBGLite.exe at 3.4MB/s";
        show_close_button = true;

        var stack_switcher = new Gtk.StackSwitcher();
        stack_switcher.stack = main_window.page_stack;

        set_custom_title(stack_switcher);

        var start_dl_btn = new Gtk.ModelButton();
        start_dl_btn.text = "New Download";

        var TestButton1 = new Gtk.ModelButton();
        TestButton1.text = "Test";

        var TestButton2 = new Gtk.ModelButton();
        TestButton2.text = "Test again";

        var menu_separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);
        menu_separator.margin_top = 7;

        var menu_grid = new Gtk.Grid ();
        menu_grid.margin_bottom = 3;
        menu_grid.orientation = Gtk.Orientation.VERTICAL;
        menu_grid.attach(start_dl_btn, 0, 0, 3, 1);
        menu_grid.attach(TestButton1, 0, 1, 3, 1);
        menu_grid.attach(menu_separator, 0, 2, 3, 1);
        menu_grid.attach(TestButton2, 0, 3, 3, 1);
        menu_grid.show_all ();

        var menu = new Gtk.Popover (null);
        menu.add (menu_grid);

        var app_menu = new Gtk.MenuButton ();
        app_menu.image = new Gtk.Image.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
        app_menu.popover = menu;
        pack_end(app_menu);

        var new_dl_btn = new Gtk.Button.from_icon_name ("list-add", Gtk.IconSize.LARGE_TOOLBAR);
        new_dl_btn.valign = Gtk.Align.CENTER;
        pack_end(new_dl_btn);
    }
}
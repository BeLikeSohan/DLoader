public class MyApp.Windows.MainWindow : Gtk.ApplicationWindow{
    public Gtk.Stack page_stack{get; set;}
    public MainWindow(Application app){
        Object(
            application: app
        );
    }

    construct{
        window_position = Gtk.WindowPosition.CENTER;
        set_default_size(900, 450);
        
        page_stack = new Gtk.Stack();
        page_stack.expand = true;

        var categorySideBar = new MyApp.Widgets.CategorySideBar();

        page_stack.add_titled(categorySideBar, "all_page", "All");
        page_stack.add_titled(new Gtk.Label("Running"), "running_page", "Running");
        page_stack.add_titled(new Gtk.Label("Paused"), "paused_page", "Paused");
        page_stack.add_titled(new Gtk.Label("Completed"), "completed_page", "Completed");

        add(page_stack);

        var headerBar = new MyApp.Widgets.HeaderBar(this);
        set_titlebar(headerBar);

        show_all();
    }
}
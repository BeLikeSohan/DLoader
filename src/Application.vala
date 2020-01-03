public class Application : Gtk.Application{
    public Application(){
        Object(
            application_id: "com.github.belikesohan.dloader",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate(){
        var window = new MyApp.Windows.MainWindow(this);
        add_window(window);
    }
}
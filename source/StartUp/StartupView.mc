using Toybox.WatchUi;

class StartupView extends WatchUi.View {

    function initialize() {
        View.initialize();

    }

    // Resources are loaded here
    function onLayout(dc) {
        setLayout(Rez.Layouts.StartupLayout(dc));
    }

    // onShow() is called when this View is brought to the foreground
    function onShow() {
    }

    // onUpdate() is called periodically to update the View
    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    // onHide() is called when this View is removed from the screen
    function onHide() {
    }

}
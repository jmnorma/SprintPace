using Toybox.WatchUi;

class SprintPaceDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new SprintPaceMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}
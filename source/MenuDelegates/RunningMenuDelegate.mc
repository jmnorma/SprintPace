using Toybox.WatchUi;
using Toybox.System;

class RunningMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :Running_item_1) {
            System.println("100 Meters");
            WatchUi.pushView( new ActivityView(100), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
        }
        else if (item == :Running_item_2) {
            System.println("200 Meters");
            WatchUi.pushView( new ActivityView(200), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
        }
        else if ( item == :Running_item_3){
            System.println("400 Meters");
            WatchUi.pushView( new ActivityView(400), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
        } 
        else if ( item == :Running_item_4){
            System.println("800 Meters");
            WatchUi.pushView( new ActivityView(800), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
        } 
    }

}
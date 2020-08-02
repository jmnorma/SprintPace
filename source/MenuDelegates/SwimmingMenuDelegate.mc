using Toybox.WatchUi;
using Toybox.System;

class SwimmingMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :Swimming_item_1) {
            System.println("25 Meters");
            WatchUi.pushView( new ActivityView(25), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
        }
        else if (item == :Swimming_item_2) {
            System.println("50 Meters");
            WatchUi.pushView( new ActivityView(50), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
        }
        else if ( item == :Swimming_item_3){
        	 System.println("75 Meters");
             WatchUi.pushView( new ActivityView(75), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
        } 
        else if ( item == :Swimming_item_4){
        	 System.println("100 Meters");
             WatchUi.pushView( new ActivityView(100), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
        } 
    }

}
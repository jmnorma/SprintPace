using Toybox.WatchUi;
using Toybox.System;

class SwimmingMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :Swimming_item_1) {
            System.println("25 Meters");
            // WatchUi.pushView( new RunningView(25), new trial1RunningLayoutDelegate(), WatchUi.SLIDE_BLINK);
        }
        else if (item == :Swimming_item_2) {
            System.println("50 Meters");
            // WatchUi.pushView( new RunningView(50), new trial1RunningLayoutDelegate(), WatchUi.SLIDE_BLINK);
        }
        else if ( item == :Swimming_item_3){
        	 System.println("75 Meters");
            //  WatchUi.pushView( new RunningView(75), new trial1RunningLayoutDelegate(), WatchUi.SLIDE_BLINK);
        } 
        else if ( item == :Swimming_item_4){
        	 System.println("100 Meters");
            //  WatchUi.pushView( new RunningView(100), new trial1RunningLayoutDelegate(), WatchUi.SLIDE_BLINK);
        } 
    }

}
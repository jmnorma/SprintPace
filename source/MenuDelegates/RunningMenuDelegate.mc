using Toybox.WatchUi;
using Toybox.System;

class RunningMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :Running_item_1) {
            System.println("100 Meters");
            // WatchUi.pushView( new RunningView(100), new trial1RunningLayoutDelegate(), WatchUi.SLIDE_BLINK);
        }
        else if (item == :Running_item_2) {
            System.println("200 Meters");
            // WatchUi.pushView( new RunningView(200), new trial1RunningLayoutDelegate(), WatchUi.SLIDE_BLINK);
        }
        else if ( item == :Running_item_3){
        	 System.println("400 Meters");
            //  WatchUi.pushView( new RunningView(400), new trial1RunningLayoutDelegate(), WatchUi.SLIDE_BLINK);
        } 
        else if ( item == :Running_item_4){
        	 System.println("800 Meters");
            //  WatchUi.pushView( new RunningView(800), new trial1RunningLayoutDelegate(), WatchUi.SLIDE_BLINK);
        } 
    }

}
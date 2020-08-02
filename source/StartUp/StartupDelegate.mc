using Toybox.WatchUi;
using Toybox.System;
using Toybox.Graphics;

class StartupDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onTap(clickEvent) {
        System.println(clickEvent.getCoordinates()); // e.g. [36, 40]
        System.println(clickEvent.getType());   // CLICK_TYPE_TAP = 0
        System.println(System.getDeviceSettings().screenHeight/2);

        if (clickEvent.getCoordinates()[1] < System.getDeviceSettings().screenHeight/2){
            System.println("Running");
            WatchUi.pushView(new Rez.Menus.RunningMenu(), new RunningMenuDelegate(), WatchUi.SLIDE_UP);
        }
        else{
            System.println("Swimming");
            WatchUi.pushView(new Rez.Menus.SwimmingMenu(), new SwimmingMenuDelegate(), WatchUi.SLIDE_UP);
        }

        return true;
    }

}
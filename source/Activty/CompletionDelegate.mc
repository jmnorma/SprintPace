using Toybox.WatchUi;
using Toybox.System;

class CompletionDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }
    
    function onTap(clickEvent){
        System.println("Complete");
        WatchUi.switchToView( new ActivityView(activity_distance), new ActivityDelegate(), WatchUi.SLIDE_BLINK);
    }


}
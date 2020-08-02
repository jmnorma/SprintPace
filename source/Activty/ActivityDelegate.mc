using Toybox.WatchUi;
using Toybox.System;

class ActivityDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }
    
    function onTap(clickEvent){
        System.println("Starting"); 
        startFromTap = true; 
    }


}
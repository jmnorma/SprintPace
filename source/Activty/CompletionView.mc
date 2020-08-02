using Toybox.WatchUi;
using Toybox.Timer;

//Global Variable
var activity_distance = null; // Interactions with Delegate for Restart

class CompletionView extends WatchUi.View {

    //Activity Data Field
    private var time = null; 

    //Timer 
    var altText = false; //Alternative Text 
    var timer1; // Time Object 

    function initialize( d, t ) {
        View.initialize();

        //Fill in Data 
        activity_distance = d; 
        time = t; 
    }

    function timerCallback(){
        altText = true; //Show Alternate Text 

        WatchUi.requestUpdate();

        timer1.stop(); // End Timer
    }

    // Resources are loaded here
    function onLayout(dc) {
        setLayout(Rez.Layouts.CompletionLayout(dc));

        //****** Layout Initalization *******
        findDrawableById("time").setText(time);
        findDrawableById("distance").setText(activity_distance.toString() +" M");

        //********   Timer  ************
        timer1 = new Timer.Timer();
        timer1.start(method(:timerCallback),3000, true); //3 Seconds
    }

    // onShow() is called when this View is brought to the foreground
    function onShow() {
    }

    // onUpdate() is called periodically to update the View
    function onUpdate(dc) {
        
        //Change the Text once Time is done 
        if(altText){ 
            findDrawableById("complete").setText("Tap to Repeat");    
        }
        
        View.onUpdate(dc);
    }

    // onHide() is called when this View is removed from the screen
    function onHide() {
    }

}
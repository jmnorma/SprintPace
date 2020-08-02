//Basic Imports 
using Toybox.WatchUi;
using Toybox.Graphics; 

//Library Imports 
using Toybox.ActivityMonitor; // Used for Distance gathering 
using Toybox.Timer; // Used to Time Activity 
using Toybox.Lang; //Used for String Formatting
using Toybox.Attention; //Used for Sounds and Vibration 

//Global Variable 
var startFromTap; //Start from interactions in Delegate 

class ActivityView extends WatchUi.View {

    //Distance Tracking 
    private var distance = null; //Goal Distance 
    private var distStart = null; // Distance at the Start of the Activty 
    private var distMiles = null; // Distance Traveled ( Current Distance - distStart)
    private var activityInfo = null; // Activity Monitioring Object 

    //Timer
    private var milliTimmer;	// The Timer Object 
    private var reset = false; 	// Reset Boolean Flag 
    
    private var elasped_m = 0;  // Milliseconds
    private var elasped_s = 0;  // Seconds
    private var elasped_mn = 0; // Minutes 
    
    //Countdown
    private var countdown; // Seconds of Countdown to give 
    private var countdown_bool; //Display Countdown ? 

    //Finish
    private var Finshed = false; // Activity Complete 

    function initialize(dist) {
        distance = dist; 
        View.initialize();
    }

	//This Function will keep track of the time of the activity until the distance is reached 
    function milliCallback(){

        //Zero the fields for a fresh start 
        if( !reset && startFromTap){ 
            reset = true; 
            
            elasped_s = 0;
            elasped_mn = 0;
            elasped_m = 0;  
            
            distMiles = countdown_bool ? countdown : 0; 
            
            activityInfo = ActivityMonitor.getInfo();
        	distStart =  activityInfo.distance.toFloat()/100;   
        }
        
        elasped_m += 5; 
        
        // Resets millTimmers Once 100 is reached 
        if(elasped_m == 100){
        	elasped_s += 1; 
        	elasped_m = 0; 

            if(startFromTap && countdown_bool){
                giveCountdown();
            }
        }
        
        // Resets Seconds Once 60 is reached 
        if( elasped_s == 60){
        	elasped_mn += 1; 
        	elasped_s = 0; 
        }

        if( startFromTap){

            //Updates the distance only when activity is running 
            if( !countdown_bool){
                activityInfo = ActivityMonitor.getInfo();
        	    distMiles = (activityInfo.distance.toFloat()/100) - distStart; 
            }
            
            //Stop Activity
            if(distMiles >= distance ){
            	milliTimmer.stop(); 
                Finshed= true; 
                WatchUi.requestUpdate();
            }
            else{
            	WatchUi.requestUpdate();
            }

        }
    }

    function giveCountdown(){
        countdown--; //Decrement Countdown 

        distMiles = countdown; 
        System.println(distMiles.toString());
        
        //*********** LAST SECOND ******************
        if(countdown == 0){ 
            
            reset=false; //Zero varibles 
            countdown_bool = false; //Stop Countdown 

            //******* Play a Sound ************
            if (Attention has :playTone) { 
                Attention.playTone(Attention.TONE_START);
            }

            //******* Vibrate the watch *******
            var vibeData = null;
            if (Attention has :vibrate) {  
                vibeData =
                [
                    new Attention.VibeProfile(50, 1000), //One second
                ];
            }
            Attention.vibrate(vibeData);
        }   
    }


    // Resources are loaded here
    function onLayout(dc) {
        setLayout(Rez.Layouts.ActivityLayout(dc));

        findDrawableById("distance").setText(distance.toString()+" M");

        startFromTap = false; 
        
        //***** Countdown *******
        countdown = 3; //Three Seconds
        countdown_bool = true; //Include a Countdown 

        //***** Timer ********
        milliTimmer = new Timer.Timer(); 
        milliTimmer.start(method(:milliCallback), 50, true);
    }

    // onShow() is called when this View is brought to the foreground
    function onShow() {
    }

    // onUpdate() is called periodically to update the View
    function onUpdate(dc) {
        
        if( startFromTap ){

            //***** Countdown *******
            if( countdown_bool){
                findDrawableById("start").setText("");
                findDrawableById("time").setText(distMiles.toString());
            }
            //*****  Timing  ******
            else{
                findDrawableById("start").setText(distMiles.format("%.1f"));

                var time = Lang.format( "$1$:$2$:$3$",[elasped_mn.format("%02d"), elasped_s.format("%02d"), elasped_m.format("%02d")]);
                findDrawableById("time").setText(time);
            }  
        }
        
        //************ ACTIVTY FINISHED **************
        if( Finshed){
            var time = Lang.format( "$1$:$2$:$3$",[elasped_mn.format("%02d"), elasped_s.format("%02d"), elasped_m.format("%02d")]); 
            // WatchUi.switchToView(new CompletionView(distance, time), new trial1CompletionLayoutDelegate(), WatchUi.SLIDE_UP);
        }

        View.onUpdate(dc);
    }

    // onHide() is called when this View is removed from the screen
    function onHide() {
    }



}

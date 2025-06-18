document.addEventListener("DOMContentLoaded", function (event) {
        
    var music = document.getElementById('music'); // id for audio element
    var duration; // Duration of audio clip, calculated here for embedding purposes
    var pButton = document.getElementById('pButton'); // play button
    var playhead = document.getElementById('playhead'); // playhead
    var timeline = document.getElementById('timeline'); // timeline
    
    //timeline width adjusted for playhead
    var timelineWidth = timeline.offsetWidth - playhead.offsetWidth;
    
    // play button event listener
    pButton.addEventListener("click", play);
        
    // move the head to match the progress through the clip
    music.addEventListener("timeupdate", timeUpdate, false);
    
    // makes timeline clickable
    timeline.addEventListener("click", function (event) {
            moveplayhead(event);
            music.currentTime = duration * clickPercent(event);
    }, false);

    // returns click as decimal fraction of the total timelineWidth
    function clickPercent(event) {
           return (event.clientX - getPosition(timeline)) / timelineWidth;
    }
    
    // makes playhead dragable
    playhead.addEventListener('mousedown', mouseDown, false);
    window.addEventListener('mouseup', mouseUp, false);
    
    // Boolean value so that audio position is updated only when the playhead is released
    var onplayhead = false;
    
    // mouseDown EventListener
    function mouseDown() {
        onplayhead = true;
        window.addEventListener('mousemove', moveplayhead, true);
         music.removeEventListener('timeupdate', timeUpdate, false);
    }
    
    // mouseUp EventListener
    // getting input from all mouse clicks
    function mouseUp(event) {
        if (onplayhead == true) {
        moveplayhead(event);
            
    window.removeEventListener('mousemove', moveplayhead, true);
            // change current time
            music.currentTime = duration * clickPercent(event);
            
    music.addEventListener('timeupdate', timeUpdate, false);
        }
        onplayhead = false;
    }
    
    // mousemove EventListener
    // moves playhead as user drags
    function moveplayhead(event) {
           var newMargLeft = event.clientX - getPosition(timeline);
           
                if (newMargLeft >= 0 && newMargLeft <= timelineWidth) {
                    playhead.style.marginLeft = newMargLeft + "px";
                }
                if (newMargLeft < 0) {
                    playhead.style.marginLeft = "0px";
                }
                if (newMargLeft > timelineWidth) {
                    playhead.style.marginLeft = timelineWidth + "px";
                }
       }
    
    //TimeUpdate
    // synchronises playhead position with current point in audio
    function timeUpdate() {
            var playPercent = timelineWidth * (music.currentTime / duration);
            playhead.style.marginLeft = playPercent + "px";
            if (music.currentTime == duration) {
                pButton.className = "";
                pButton.className = "play";
            }
    }
    
    
    //Play and Pause
    function play() {
        if (music.paused) {
                music.play();
            pButton.className = "";
            pButton.className = "pause";
        } else {
                music.pause();
            pButton.className = "";
            pButton.className = "play";
        }
    }
        
    // gets audio file duration    
    music.addEventListener("canplaythrough", function() {
                duration = music.duration;
    }, false);
       
       //getPosition
       // returns element's left position relative to top-left of viewport
       function getPosition(el) {
           return el.getBoundingClientRect().left;
       }
        
    /* DOMContenLoaded*/
    });
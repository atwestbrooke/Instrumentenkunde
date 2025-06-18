// Event listener for DOM
document.addEventListener("DOMContentLoaded", theDOMHasLoaded, false);

// externally set array of audio files (stored in a folder named further below) as below
// var listedaudiofiles = ["list.mp3",
  //           "of.mp3",
     //        "playback.mp3",
        //     "files.mp3"
          //   ];

///////////////////////////////////////////////
// Find and store audio info
///////////////////////////////////////////////

// array for AudioObjects
var audioList = [];
// components and the index for their AudioObject
var componentDict = {};
// store AudioObject that is currently playing
var playingAudio = null;
// store playhead id if one is being dragged
var onplayhead = null;

/* AudioObject Constructor */
function AudioObject(audio, duration) {
	this.audio = audio;
	this.id = audio.id;
	this.duration = duration;
}
/* bindAudioPlayer
 * Store audioplayer components in correct AudioObject
 * num identifes correct audioplayer
 */
AudioObject.prototype.bindAudioPlayer = function (num) {
	this.audioplayer = document.getElementById("audioplayer-" + num);
	this.playbutton = document.getElementById("playbutton-" + num);
	this.timeline = document.getElementById("timeline-" + num);
	this.playhead = document.getElementById("playhead-" + num);
	this.timelineWidth = this.timeline.offsetWidth - this.playhead.offsetWidth;;
}

/* addEventListeners() */
AudioObject.prototype.addEventListeners = function () {
	this.audio.addEventListener("timeupdate", AudioObject.prototype.timeUpdate, false);
    this.audio.addEventListener("timeupdate", AudioObject.prototype.pageTurn, true);
	this.audio.addEventListener("durationchange", AudioObject.prototype.durationChange, false);
	this.timeline.addEventListener("click", AudioObject.prototype.timelineClick, false);
	this.playbutton.addEventListener("click", AudioObject.prototype.pressPlay, false);
    this.playbutton.addEventListener("keydown", function(e) { if (32 == e.keyCode) { AudioObject.prototype.play();}});
	// Makes playhead draggable 
	this.playhead.addEventListener('mousedown', AudioObject.prototype.mouseDown, false);
	window.addEventListener('mouseup', mouseUp, false);
}

/* populateAudioList */
function populateAudioList() {
	var audioElements = document.getElementsByClassName("audio");
	for (i = 0; i < audioElements.length; i++) {
		audioList.push(
			new AudioObject(audioElements[i], 0)
		);
		audioList[i].bindAudioPlayer(i);
		audioList[i].addEventListeners();
	}
}

/* populateComponentDictionary() 
 * {key=element id : value=index of audioList} */
function populateComponentDictionary() {
	for (i = 0; i < audioList.length; i++) {
		componentDict[audioList[i].audio.id] = i;
		componentDict[audioList[i].playbutton.id] = i;
		componentDict[audioList[i].timeline.id] = i;
		componentDict[audioList[i].playhead.id] = i;
	}
}

///////////////////////////////////////////////
// Update Audio Player
///////////////////////////////////////////////

/* durationChange
 * set duration for AudioObject */
AudioObject.prototype.durationChange = function () {
	var ao = audioList[getAudioListIndex(this.id)];
	ao.duration = this.duration;
}

/* pressPlay() 
 * call play() for correct AudioObject
 */
AudioObject.prototype.pressPlay = function () {
	var index = getAudioListIndex(this.id);
	audioList[index].play(); 
}

/* play() 
 * play or pause selected audio, if there is a song playing pause i
 ;*/
AudioObject.prototype.play = function () {
	if (this == playingAudio) {
		playingAudio = null;
		this.audio.pause();
		changeClass(this.playbutton, "playbutton play");
	}
	// else check if playing audio exists and pause it, then start this
	else {
		if (playingAudio != null) {
			playingAudio.audio.pause();
			changeClass(playingAudio.playbutton, "playbutton play");
		}
		this.audio.play();
		playingAudio = this;
		changeClass(this.playbutton, "playbutton pause");
	}
}

/* timelineClick()
 * get timeline's AudioObject
 */
AudioObject.prototype.timelineClick = function (event) {
	var ao = audioList[getAudioListIndex(this.id)];
    var leftpoint = ao.timeline.getBoundingClientRect().left;
    var rightpoint = ao.timeline.getBoundingClientRect().right;
    ao.timelineFactor = 400/(rightpoint-leftpoint)
	ao.audio.currentTime = ao.audio.duration * clickPercent(event, ao.timeline, ao.timelineWidth)*ao.timelineFactor;
}

/* mouseDown */
AudioObject.prototype.mouseDown = function (event) {
	onplayhead = this.id;
	var ao = audioList[getAudioListIndex(this.id)];
	window.addEventListener('mousemove', AudioObject.prototype.moveplayhead, true);
	ao.audio.removeEventListener('timeupdate', AudioObject.prototype.timeUpdate, false);
}

/* mouseUp EventListener
 * getting input from all mouse clicks */
function mouseUp(e) {
	if (onplayhead != null) {
		var ao = audioList[getAudioListIndex(onplayhead)];
		window.removeEventListener('mousemove', AudioObject.prototype.moveplayhead, true);
		// change current time
		ao.audio.currentTime = ao.audio.duration * clickPercent(e, ao.timeline, ao.timelineWidth)*ao.timelineFactor;
		ao.audio.addEventListener('timeupdate', AudioObject.prototype.timeUpdate, false);
	}
	onplayhead = null;
}

/* mousemove EventListener
 * Moves playhead as user drags */
AudioObject.prototype.moveplayhead = function (e) {
	var ao = audioList[getAudioListIndex(onplayhead)];
    var leftpoint = ao.timeline.getBoundingClientRect().left;
    var rightpoint = ao.timeline.getBoundingClientRect().right;
    ao.timelineFactor = 400/(rightpoint-leftpoint)
	var newMargLeft = (e.clientX - getPosition(ao.timeline))*ao.timelineFactor;
    if (newMargLeft >= 0 && newMargLeft <= ao.timelineWidth) {
		document.getElementById(onplayhead).style.marginLeft = newMargLeft + "px";
	}
	if (newMargLeft < 0) {
		playhead.style.marginLeft = "0px";
	}
	if (newMargLeft > ao.timelineWidth) {
		playhead.style.marginLeft = ao.timelineWidth*ao.timelineFactor + "px";
	}
}

/* timeUpdate 
 * Synchronizes playhead position with current point in audio 
 * this is the html audio element
 */
AudioObject.prototype.timeUpdate = function () {
	// audio element's AudioObject
	var ao = audioList[getAudioListIndex(this.id)];
	var playPercent = ao.timelineWidth * (ao.audio.currentTime / ao.duration);
	ao.playhead.style.marginLeft = playPercent + "px";
	// If song is over
	if (ao.audio.currentTime == ao.duration) {
		changeClass(ao.playbutton, "playbutton play");
		ao.audio.currentTime = 0;
		ao.audio.pause();
		playingAudio = null;
	}
}

///////////////////////////////////////////////
// Update Score (turn page)
///////////////////////////////////////////////

/* initially just record the current audio position in seconds */

AudioObject.prototype.pageTurn = function () {
    var index = getAudioListIndex(this.id);
	var ao = audioList[getAudioListIndex(this.id)];
    var leftpoint = ao.timeline.getBoundingClientRect().left;
    var rightpoint = ao.timeline.getBoundingClientRect().right;
    document.getElementById("score-" + [index]).valueAsNumber = ao.audio.currentTime;
    document.getElementById("proxy-" + [index]).innerHTML = ao.audio.currentTime;
}

///////////////////////////////////////////////
// Utility Methods
///////////////////////////////////////////////

/* changeClass 
 * overwrites element's class names */
function changeClass(element, newClasses) {
	element.className = newClasses;
}

/* getAudioListIndex
 * Given an element's id, find the index in audioList for the correct AudioObject */
function getAudioListIndex(id) {
	return componentDict[id];
}

/* clickPercent()
 * returns click as decimal (fraction of the total timelineWidth */
function clickPercent(e, timeline, timelineWidth) {
   return (event.clientX - getPosition(timeline)) / timelineWidth;
}

// getPosition
// Returns elements left position relative to top-left of viewport
function getPosition(el) {
    return el.getBoundingClientRect().left;
}

////////////////////////////////////////////////////////
// GENERATE HTML FOR AUDIO ELEMENTS, PLAYERS AND SCORES
////////////////////////////////////////////////////////

/* createAudioElements
 * create audio elements for each file in files */
function createAudioElements() {
	for (f in listedaudiofiles) {
		var audioString = "<audio id=\"audio-" + f + "\" class=\"audio\" preload=\"true\"><source id=\"source-" + f + "\" src=\"" + listedaudiodirectory + listedaudiofiles[f] + "\"></audio>";
		$("#audio-player-" + f).append(audioString);
	}
}

/* createAudioPlayers
 * create audio players for each file in files */
function createAudioPlayers() {
	for (f in listedaudiofiles) {
		var playerString = "<div id=\"audioplayer-" + f + "\" class=\"audioplayer\"><button id=\"playbutton-" + f + "\" class=\"play playbutton\"></button><div id=\"timeline-" + f + "\" class=\"timeline\"><div id=\"playhead-" + f + "\" class=\"playhead\"></div></div></div>";
		$("#audio-player-" + f).append(playerString);
	}
}

/* createScoreListeners
 * create an object to capture the position within the current soundfile as a number */
function createScoreListeners() {
    for (f in listedaudiofiles) {
        var scoreString = "<input type=\"number\"  id=\"score" + f + "\" style=\"color:white\">";
        $("#score-" + f).append(scoreString);
    }
}

/* createScoreProxies
 * create an object to record the ScoreListener number as innerHTML; this fires the Listner function whenever the playPosition changes */
function createScoreProxies() {
    for (f in listedaudiofiles) {
        var proxyString = "<div id=\"proxy" + f + "\" style=\"color:white\">";
        $("#proxy-" + f).append(proxyString);
    }
}

/* theDOMHasLoaded()
 * Execute when DOM is loaded */
function theDOMHasLoaded(e) {
	// Generate HTML for audio elements and audio players
	createAudioElements();
	createAudioPlayers();
    createScoreListeners();
    createScoreProxies();
    

	// Populate Audio List
	populateAudioList();
	populateComponentDictionary();
}
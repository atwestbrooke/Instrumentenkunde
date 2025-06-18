var i = 0;
var vbButtonWidth = 48;
var vbButtons = document.getElementsByClassName("vbButton");
var ref = null;
var refid = null;
var refno = null;
var slideControls = [33,34,35,36,37,38,39,40,
                    72,74,75,76,77,78,79,80];

var buttonParams = function (num) {
    vbButtons[num].id = num + "vbButton";
    vbButtons[num].buttonWidth = vbButtonWidth;
    vbButtons[num].centreOffset = vbButtons[num].buttonWidth * 5 / 12; // Entfernung des Pfeilanfangs vom Zentrum der Schaltfläche
    vbButtons[num].borderOffset = vbButtons[num].buttonWidth / 5; // Entfernung der Pfeilspitze vom Schaltflächenrand
    vbButtons[num].arrowWidth = vbButtons[num].buttonWidth * 2 / 11; // Strichlänge der Pfeilspitze
    vbButtons[num].canvasLine = vbButtons[num].getContext("2d");
    vbButtons[num].width = vbButtons[num].buttonWidth;
    vbButtons[num].height = vbButtons[num].buttonWidth;
    vbButtons[num].style.backgroundColor = "rgba(191,186,155,0.4)";
    vbButtons[num].targetstatus = 0;
    containers = document.getElementsByClassName("container"); 
    vbButtons[num].screenfiller = document.getElementsByClassName("container")[num];
    containers[num].id = num + "-container";
};

var buttonStrokesA = function (num) {
    vbButtons[num].canvasLine.moveTo(vbButtons[num].centreOffset, vbButtons[num].centreOffset);
    vbButtons[num].canvasLine.lineTo(vbButtons[num].borderOffset, vbButtons[num].borderOffset);
    vbButtons[num].canvasLine.lineTo(vbButtons[num].borderOffset * 1.05, vbButtons[num].arrowWidth * 2);
    vbButtons[num].canvasLine.lineTo(vbButtons[num].borderOffset, vbButtons[num].borderOffset);
    vbButtons[num].canvasLine.lineTo(vbButtons[num].arrowWidth * 2, vbButtons[num].borderOffset * 1.05);
};

var buttonStrokesB = function (num) {
    vbButtons[num].canvasLine.moveTo(vbButtons[num].borderOffset * 0.9, vbButtons[num].borderOffset * 0.9);
    vbButtons[num].canvasLine.lineTo(vbButtons[num].centreOffset * 0.9, vbButtons[num].centreOffset * 0.9);
    vbButtons[num].canvasLine.lineTo(vbButtons[num].centreOffset * 0.95, vbButtons[num].centreOffset - vbButtons[num].arrowWidth * 0.9);
    vbButtons[num].canvasLine.moveTo(vbButtons[num].centreOffset * 0.9, vbButtons[num].centreOffset * 0.9);
    vbButtons[num].canvasLine.lineTo(vbButtons[num].centreOffset - vbButtons[num].arrowWidth * 0.9, vbButtons[num].centreOffset * 0.95);
};

var drawButton = function (num) {
        for (d = 0; d < 4; d++) {
            if (vbButtons[num].targetstatus === 0) {
                buttonStrokesA(num);
            } else {
                buttonStrokesB(num);
            }
            vbButtons[num].canvasLine.translate(vbButtons[num].buttonWidth, 0);
            vbButtons[num].canvasLine.rotate(Math.PI / 2);
            vbButtons[num].canvasLine.lineWidth = vbButtons[num].borderOffset / 3;
            vbButtons[num].canvasLine.strokeStyle = "#fef8e8";
            vbButtons[num].canvasLine.lineCap = 'round';
            vbButtons[num].canvasLine.lineJoin = 'round';
            vbButtons[num].canvasLine.stroke();
        }
    };

var mouseOver = function () {
    refno = parseFloat(event.target.id);
    event.target.buttonWidth = vbButtonWidth * 11 / 10;
    event.target.width = event.target.buttonWidth;
    event.target.height = event.target.buttonWidth;
    drawButton(refno);
    event.target.style.backgroundColor = "rgba(153,148,124,0.4)";
    event.target.style.borderRadius = event.target.buttonWidth / 4 + "px";
    event.target.style.bottom = event.target.buttonWidth * 2 / 11 + "px";
    event.target.style.right = event.target.buttonWidth * 2 / 11 + "px";
};

var mouseOut = function () {
    refno = parseFloat(event.target.id);
    event.target.buttonWidth = vbButtonWidth;
    event.target.width = event.target.buttonWidth;
    event.target.height = event.target.width;
    drawButton(refno);
    event.target.style.backgroundColor = "rgba(191,186,155,0.4)";
    event.target.style.borderRadius = event.target.buttonWidth / 4 + "px";
    event.target.style.bottom = event.target.buttonWidth / 4 + "px";
    event.target.style.right = event.target.buttonWidth / 4 + "px";
};

var buttonClick = function () {
    var refno = parseFloat(event.target.id);
    if (event.target.targetstatus === 0) {
        if (document.getElementById(refno + "-container").requestFullscreen) {
			document.getElementById(refno + "-container").requestFullscreen(); }
		else if (document.getElementById(refno + "-container").webkitRequestFullScreen) {
        document.getElementById(refno + "-container").webkitRequestFullScreen(); }
        event.target.targetstatus = 1;
        document.addEventListener("keydown", function(e) { if (slideControls.includes (e.keyCode)) { document.exitFullscreen();}} )
    } else {
		if (document.exitFullscreen) {
			document.exitFullscreen(); }
        else if (document.webkitExitFullscreen) {
				document.webkitExitFullscreen(); }
        event.target.targetstatus = 0;
    }
};

var exitHandler = function () {
    if (document.isFullScreen === false) {
        for (i = 0; i < vbButtons.length; i++) {
            vbButtons[i].targetstatus = 0;
            vbButtons[i].buttonWidth = vbButtonWidth;
            vbButtons[i].width = vbButtons[i].buttonWidth;
            vbButtons[i].height = vbButtons[i].width;
            drawButton(i);
            vbButtons[i].style.backgroundColor = "#ff0000";
            vbButtons[i].style.borderRadius = vbButtons[i].buttonWidth / 4 + "px";
            vbButtons[i].style.bottom = vbButtons[i].buttonWidth / 4 + "px";
            vbButtons[i].style.right = vbButtons[i].buttonWidth / 4 + "px";
        }
    } else 
    if (document.webkitIsFullScreen === false) {
        for (i = 0; i < vbButtons.length; i++) {
            vbButtons[i].targetstatus = 0;
            vbButtons[i].buttonWidth = vbButtonWidth;
            vbButtons[i].width = vbButtons[i].buttonWidth;
            vbButtons[i].height = vbButtons[i].width;
            drawButton(i);
            vbButtons[i].style.backgroundColor = "#ff0000";
            vbButtons[i].style.borderRadius = vbButtons[i].buttonWidth / 4 + "px";
            vbButtons[i].style.bottom = vbButtons[i].buttonWidth / 4 + "px";
            vbButtons[i].style.right = vbButtons[i].buttonWidth / 4 + "px";
        }
    } else if (document.mozFullScreen === false) {
        for (i = 0; i < vbButtons.length; i++) {
            vbButtons[i].targetstatus = 0;
            vbButtons[i].buttonWidth = vbButtonWidth;
            vbButtons[i].width = vbButtons[i].buttonWidth;
            vbButtons[i].height = vbButtons[i].width;
            drawButton(i);
            vbButtons[i].style.backgroundColor = "rgba(191,186,155,0.4)";
            vbButtons[i].style.borderRadius = vbButtons[i].buttonWidth / 4 + "px";
            vbButtons[i].style.bottom = vbButtons[i].buttonWidth / 4 + "px";
            vbButtons[i].style.right = vbButtons[i].buttonWidth / 4 + "px";
        }
    } else if (document.msFullscreenElement === false) {
        for (i = 0; i < vbButtons.length; i++) {
            vbButtons[i].targetstatus = 0;
            vbButtons[i].buttonWidth = vbButtonWidth;
            vbButtons[i].width = vbButtons[i].buttonWidth;
            vbButtons[i].height = vbButtons[i].width;
            drawButton(i);
            vbButtons[i].style.backgroundColor = "rgba(191,186,155,0.4)";
            vbButtons[i].style.borderRadius = vbButtons[i].buttonWidth / 4 + "px";
            vbButtons[i].style.bottom = vbButtons[i].buttonWidth / 4 + "px";
            vbButtons[i].style.right = vbButtons[i].buttonWidth / 4 + "px";
        }
    }
};

document.addEventListener('fullscreenchange', exitHandler, false);
document.addEventListener('mozfullscreenchange', exitHandler, false);
document.addEventListener('MSFullscreenChange', exitHandler, false);
document.addEventListener('webkitfullscreenchange', exitHandler, false);

var addVbButtonQualities = function (num) {
        drawButton(num);
        vbButtons[num].style.bottom = vbButtonWidth / 4 + "px";
        vbButtons[num].style.right = vbButtonWidth / 4 + "px";
        vbButtons[num].style.borderRadius = vbButtonWidth / 6 + "px";
    };

var addEventListeners = function (num) {
        vbButtons[num].addEventListener("mouseover", mouseOver, false);
        vbButtons[num].addEventListener("mouseout", mouseOut, false);
        vbButtons[num].addEventListener("click", buttonClick, false);
    };

var assembleButtons = function () {
    for (i = 0; i < vbButtons.length; i++) {
        buttonParams(i);
        addVbButtonQualities(i);
        addEventListeners(i);
    }
};

assembleButtons();

var ErsteKnote2 = document.getElementById("ErsteKnote-2");
var Knotenreihe2 = document.getElementById("Knotenreihe-2");
var ErsteKnote3 = document.getElementById("ErsteKnote-3");
var Knotenreihe3 = document.getElementById("Knotenreihe-3");
var ErsteKnote6 = document.getElementById("ErsteKnote-6");
var Knotenreihe6 = document.getElementById("Knotenreihe-6");

function addEventListeners() {
    ErsteKnote2.addEventListener('mouseover', mouseOverKnote2);
    ErsteKnote2.addEventListener('mouseout', mouseOutKnote2);
    ErsteKnote3.addEventListener('mouseover', mouseOverKnote3);
    ErsteKnote3.addEventListener('mouseout', mouseOutKnote3);
    ErsteKnote6.addEventListener('mouseover', mouseOverKnote6);
    ErsteKnote6.addEventListener('mouseout', mouseOutKnote6);
}
            
function mouseOverKnote2() {
    Knotenreihe2.classList.remove("flag-versteckt");
    Knotenreihe2.classList.add("flag-inaktiv");
}
function mouseOutKnote2() {
    Knotenreihe2.classList.remove("flag-inaktiv");
    Knotenreihe2.classList.add("flag-versteckt");
}
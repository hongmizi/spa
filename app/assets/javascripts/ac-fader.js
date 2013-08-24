var spot = 5000; // time slides stay visible for
var int = 1500 // time it takes for slides to transition
var randomizeAll = false; // change to true to have all faders display in random order

var faders = new Array;
function init() {
	$('.ac-fader').children().fadeTo(0,0);
	$('.ac-fader').each(function(i) {
        faders[i] = new makefader($(this),i);
    });
}
function makefader(obj,i) {
	if (obj.hasClass('ac-randomize') || randomizeAll == true) {
		this.imgs = makeslides(obj).sort(function(){ return Math.random()-0.5; });
	} else {
		this.imgs = makeslides(obj);
	}
	this.n = 0;
	$(this.imgs[this.n]).fadeTo(int,1);
	setTimeout(function(){t(i)},spot);
}
function t(i) {
	thisfader = faders[i];
	$(thisfader.imgs[thisfader.n]).stop().fadeTo(int,0);
	thisfader.n++;
	if (thisfader.n == thisfader.imgs.length) {
		thisfader.n = 0;
	}
	$(thisfader.imgs[thisfader.n]).stop().fadeTo(int,1);
	setTimeout(function(){t(i)},spot);
}
function makeslides(obj) {
	return obj.children();
}
$(document).ready(init);

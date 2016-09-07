
function loadImage(img) {
	if (document.images) {
		var oImg = new Image();
		oImg.src = img;
		return oImg;
	}
}

function preloadImages() {
	if (document.images)
		for (var i = 0; i < preloadImages.arguments.length; i++)
			eval("var oImagePreload"+i+"=loadImage(preloadImages.arguments[i]);");
}

function setImage( id, img ) {
    var o = document.getElementById( id );
    o.src = img;
}

function setHover( id, col ) {
    var o = document.getElementById( id );

    if ( col ) {
        o.style.background= col;
    } else {
        o.style.background= 'none';
    }
}
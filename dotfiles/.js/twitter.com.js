var garbage = new Array();

garbage.push(
  // document.getElementsByClassName('dashboard')[0],
  // document.getElementsByClassName('trends-inner')[0],
  document.getElementsByClassName('wtf-module')[0]
);
 
for (var i = 0; i < garbage.length; i++) {
  garbage[i].remove();
}

function fixThings() {
  var garbage = document.getElementsByClassName('promoted-tweet');
  for (var i=0; i < garbage.length; i++) {
    garbage[i].remove();
  }
}

window.setInterval(fixThings, 1000);
fixThings();

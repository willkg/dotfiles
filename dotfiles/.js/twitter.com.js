var garbage = Array.prototype.slice.call(
  document.getElementsByClassName('dashboard')
);
 
garbage.push(
  document.getElementsByClassName('trends-inner')[0],
  document.getElementsByClassName('wtf-module')[0]
);
 
 
for (var i = 0; i < garbage.length; i++) {
  garbage[i].remove();
}
 
document.getElementById('timeline').style.float = "none";

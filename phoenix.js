/* globals Phoenix, Window, Modal, Screen, _ */
'use strict';

var keys = [];
var meta = ['alt', 'shift'];
var margin = 5;

var grids = {
  'Full': {rows: 1, cols: 1},
  'Split': {rows: 1, cols: 2},
  'Grid': {rows: 2, cols: 2},
};
function grid(name) {
  var rows = grids[name].rows;
  var cols = grids[name].cols;
  return function applyGrid() {
    var windows = Window.visibleWindowsInOrder();
    windows.splice(Math.min(windows.length, cols*rows));
    var pre = windows.length;
    var sFrame = Screen.mainScreen().visibleFrameInRectangle();
    var width = Math.round(sFrame.width / cols - margin);
    var height = Math.round(sFrame.height / rows - margin);

    var x = sFrame.x;
    var y = sFrame.y;
    _.times(cols, function(col) {
      _.times(rows, function(row) {
        var n = col + (row*cols);
        var rect = {x: x + (col*width) + margin, y: y + (row*height) + margin, width: width - margin, height: height - margin};
        if (windows.length > n) {
          windows[n].setFrame(rect);
        }
      });
    });
  };
}

keys.push(Phoenix.bind('f', meta, grid('Full')));
keys.push(Phoenix.bind('j', meta, grid('Split')));
keys.push(Phoenix.bind('k', meta, grid('Grid')));

/* App launchers */
/*
keys.push(Phoenix.bind('c', meta, () {
  var app = App.launch('Google Chrome');
  app.focus();
}));
*/

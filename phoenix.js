'use strict';

var keys = [];
var altShift = [ 'alt', 'shift' ];
var controlAltShift = [ 'ctrl', 'alt', 'shift' ];
var margin = 0;
var increment = 0.1;

/* Position */

var Position = {
    central: function (frame, window) {
        return {
            x: frame.x + ((frame.width - window.width) / 2),
            y: frame.y + ((frame.height - window.height) / 2)
        };
    },

    top: function (frame, window) {
        return {
            x: window.x,
            y: frame.y
        };
    },

    bottom: function (frame, window) {
        return {
            x: window.x,
            y: (frame.y + frame.height) - window.height
        };
    },

    left: function (frame, window) {
        return {
            x: frame.x,
            y: window.y
        };
    },

    right: function (frame, window) {
        return {
            x: (frame.x + frame.width) - window.width,
            y: window.y
        };
    },

    topLeft: function (frame, window, margin) {
        return {

            x: Position.left(frame, window).x + margin,
            y: Position.top(frame, window).y + margin
        };
    },

    topRight: function (frame, window, margin) {
        return {

            x: Position.right(frame, window).x - margin,
            y: Position.top(frame, window).y + margin
        };
    },

    bottomLeft: function (frame, window, margin) {
        return {
            x: Position.left(frame, window).x + margin,
            y: Position.bottom(frame, window).y - margin
        };
    },

    bottomRight: function (frame, window, margin) {
        return {
            x: Position.right(frame, window).x - margin,
            y: Position.bottom(frame, window).y - margin
        };
    }
};

/* Grid */

var Frame = {

    width: 1,
    height: 1,

    half: {

        width: 0.5,
        height: 0.5

    }
};

/* Window Functions */

Window.prototype.to = function (position) {

    this.setTopLeft(position(this.screen().visibleFrameInRectangle(), this.frame(), margin));
}

Window.prototype.grid = function (x, y, reverse) {

    var frame = this.screen().visibleFrameInRectangle();

    var newWindowFrame = _(this.frame()).extend({

        width: (frame.width * x) - (2 * margin),
        height: (frame.height * y) - (2 * margin)

    });

    var position = reverse ? Position.topRight(frame, newWindowFrame, margin) :
                             Position.topLeft(frame, newWindowFrame, margin);

    this.setFrame(_(newWindowFrame).extend(position));
}

Window.prototype.reverseGrid = function (x, y) {

    this.grid(x, y, true);
}

Window.prototype.resize = function (multiplier) {

    var frame = this.screen().visibleFrameInRectangle();
    var newSize = this.size();

    if (multiplier.x) {
        newSize.width += frame.width * multiplier.x;
    }

    if (multiplier.y) {
        newSize.height += frame.height * multiplier.y;
    }

    this.setSize(newSize);
}

Window.prototype.increaseWidth = function () {

    this.resize({ x: increment });
}

Window.prototype.decreaseWidth = function () {

    this.resize({ x: -increment });
}

Window.prototype.increaseHeight = function () {

    this.resize({ y: increment });
}

Window.prototype.decreaseHeight = function () {

    this.resize({ y: -increment });
}

/* Position Bindings */

keys.push(Phoenix.bind('h', controlAltShift, function () {

    Window.focusedWindow() && Window.focusedWindow().to(Position.topLeft);
}));

keys.push(Phoenix.bind('j', controlAltShift, function () {

    Window.focusedWindow() && Window.focusedWindow().to(Position.bottomLeft);
}));

keys.push(Phoenix.bind('k', controlAltShift, function () {

    Window.focusedWindow() && Window.focusedWindow().to(Position.topRight);
}));

keys.push(Phoenix.bind('l', controlAltShift, function () {

    Window.focusedWindow() && Window.focusedWindow().to(Position.bottomRight);
}));

keys.push(Phoenix.bind('c', altShift, function () {

    Window.focusedWindow() && Window.focusedWindow().to(Position.central);
}));

/* Grid Bindings */
/* Change mode */

keys.push(Phoenix.bind('a', altShift, function () {

    Window.focusedWindow() && Window.focusedWindow().grid(Frame.half.width, Frame.height);
}));

keys.push(Phoenix.bind('s', altShift, function () {

    Window.focusedWindow() && Window.focusedWindow().grid(Frame.width, Frame.half.height);
}));

keys.push(Phoenix.bind('d', altShift, function () {

    Window.focusedWindow() && Window.focusedWindow().grid(Frame.half.width, Frame.half.height);
}));

keys.push(Phoenix.bind('f', altShift, function () {

    Window.focusedWindow() && Window.focusedWindow().grid(Frame.width, Frame.height);
}));


/* Resize Bindings */

keys.push(Phoenix.bind('.', altShift, function () {

    Window.focusedWindow() && Window.focusedWindow().increaseWidth();
}));

keys.push(Phoenix.bind(',', altShift, function () {

    Window.focusedWindow() && Window.focusedWindow().increaseHeight();
}));

keys.push(Phoenix.bind('.', controlAltShift, function () {

    Window.focusedWindow() && Window.focusedWindow().decreaseWidth();
}));

keys.push(Phoenix.bind(',', controlAltShift, function () {

    Window.focusedWindow() && Window.focusedWindow().decreaseHeight();
}));

var RemoteCommand = {

	// Store object of all registered callbacks
	handlers: {
		'command': []
	},

	/**
	 *  Enable or disable the different Remote Commands
	 *
	 *  Commands:
	 *  pause
	 *  play
	 *  stop
	 *  togglePlayPause
	 *  enableLanguageOption
	 *  disableLanguageOption
	 *  nextTrack
	 *  previousTrack
	 *  seekForward
	 *  seekBackward
	*/
	enabled: function (command, isEnabled) {
		cordova.exec(null, null, 'RemoteCommand', 'enabled', [command, isEnabled]);
	},

	/**
	 * Will start listening for commands and publishing them to the callback
	 * on('play', function () { console.log('event', event); });
	 */
	on: function (command, callback) {
		if (!RemoteCommand.handlers.hasOwnProperty(command)) {
        RemoteCommand.handlers[command] = [];
    }
		RemoteCommand.handlers[command].push(callback);
	},

	/**
	 * Will remove the current event listener
	 */
	off: function (command, callback) {
		// Remove all callbacks for a certain command
		if (RemoteCommand.handlers.hasOwnProperty(command) && !callback) {
      RemoteCommand.handlers[command] = [];
      return;
    }

    // Remove single callback
    if (RemoteCommand.handlers.hasOwnProperty(command) && callback) {
    	RemoteCommand.handlers[command].splice(RemoteCommand.handlers[command].indexOf(callback), 1);
    }
	}
};

// The recieving event handler
RemoteCommand.onCommand = function () {
	var args = Array.prototype.slice.call(arguments);
  var command = args.shift();

	if (!RemoteCommand.handlers.hasOwnProperty(command)) {
		return;
  }

  for (var i = 0, length = RemoteCommand.handlers[command].length; i < length; i++) {
    RemoteCommand.handlers[command][i].apply(undefined, args);
  }

  // The catch all event that calls with the event name also
  for (var i = 0, length = RemoteCommand.handlers['command'].length; i < length; i++) {
    RemoteCommand.handlers['command'][i].apply(undefined, args.unshift(command));
  }
};

// Initialize event and start listening
cordova.exec(RemoteCommand.onCommand, null, 'RemoteCommand', 'init');

module.exports = RemoteCommand;

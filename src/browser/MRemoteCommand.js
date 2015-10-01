var RemoteCommand = {
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
		console.log('RemoteCommand enabled:', command, isEnabled);
	},

	/**
	 * Will start listening for commands and publishing them to the callback
	 * !!! There can be only one event listener per app
	 * addEventListener(function (event) { console.log('event', event); });
	 */
	on: function (command, callback) {
		console.log('RemoteCommand on', command);
	},

	/**
	 * Will remove the current event listener
	 */
	off: function (command, callback) {
		console.log('RemoteCommand off', command);
	}
};

module.exports = RemoteCommand;

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
	addEventListener: function (callback) {
		console.log('RemoteCommand addEventListener');
	},

	/**
	 * Will remove the current event listener
	 */
	removeEventListener: function () {
		console.log('RemoteCommand removeEventListener');
	}
};

module.exports = RemoteCommand;

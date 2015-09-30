var argscheck = require('cordova/argscheck'),

var RemoteCommand = {
	/**
	 *  Enable or disable the different Remote Commands
	 *
	 *  Commands:
	 *	pause
	 *	play
	 *	stop
	 *	togglePlayPause
	 *	enableLanguageOption
	 *	disableLanguageOption
	 *	nextTrack
	 *	previousTrack
	 *	seekForward
	 *	seekBackward
	*/
	enabled: function (command, isEnabled) {
		argscheck.checkArgs('sb', 'RemoteCommand', arguments);
		cordova.exec(success, fail, 'RemoteCommand', 'enabled', [command, isEnabled]);
	},

	onCommand: function (onCommandFunction) {
		cordova.exec(onCommandFunction, null, 'RemoteCommand', 'onCommand');
	}
};

module.exports = RemoteCommand;

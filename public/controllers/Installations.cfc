component extends="Controller"
{
	/*
		Installer

		Several Checks needed, and various initial errors to catch;
		1) Any model call to a non existant datasource will error
		2) Settings won't be loaded into application scope
		3) Any error emails without a smtp handler will error out
		4) Any missing plugins will create a problem (this shouldn't be an issue in 2.x)
		5) If DB exists, but is at "0" this will also throw errors
		6) key [CURRENT] doesn't exist: language onRequestStart

		So we need to:

		1) Check the datasource exists;
		2) Run the DB migrations -> Latest to populate the Database
		3) Create an initial sysadmin user
		4) Test for SMTP?

		NB, when moving to wheels 2.x, all instances
		of application.wheels.dbmigrate will need to change
		to wheels.dbmigrate

	*/
	function init() {
		// Shouldn't go via central permissions, so we don't call super.init
		usesLayout("/common/static");
		filters(through="abortifinstalled");
	}

	function new(){}
}
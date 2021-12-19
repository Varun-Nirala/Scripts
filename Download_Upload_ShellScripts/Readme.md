1. How to use DownloadFromJenkinsAndUploadToFTP.sh
--------------------------------------------------
	Steps :
		1. Run script by sh DownloadFromJenkinsAndUploadToFTP.sh
		2. When it prompt for Build Number, provide it Jenkins build number from where it has to download the build.
		3. It will do some processing and after that it will ask for path to upload whole build to specified path and also upload required binaries and path/binaries
		
	Example :
		Suppose you want to upload jenkins build : http://buildnmg.aristocrat.com:8080/job/BuildGame/28656 then
		BuildNumber 											: 28656
		Pre-configured FTP serve is 							: productmadness@cdnstorage.productmadness.com
		Suppose you wan to upload it to location[on same FTP] 	: venus/newmedia/Varun/IR_Android
																	then provide "venus/newmedia/Varun/IR_Android" as path to upload
																	NOTE : here you should have folder named "venus/newmedia/Varun/IR_Android/binaries"
																	
After script it done you will have 3 items at FTP server
			"venus/newmedia/Varun/IR_Android/binaries/libAndroidHostExtension32.so"		//This will be used by NMG Build Pipeline
			"venus/newmedia/Varun/IR_Android/binaries/libAndroidHostExtension64.so"		//This will be used by NMG Build Pipeline
			"venus/newmedia/Varun/IR_Android/$BUILD_NAME.zip"							//The assets inside it will be used by AssetRepacker
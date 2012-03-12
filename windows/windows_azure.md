# Windows Azure

## Node.js on Windows Azure

- Install SDK: ("Windows Azure SDK for Node.js")
- Tutorial for SDK installation: <http://www.windowsazure.com/en-us/develop/nodejs/tutorials/getting-started/>
- Getting started tutorial: <http://channel9.msdn.com/Blogs/Windows-Azure-Developer-Experience-Videos/Nodejs-Windows-Azure-Introduction>

Open "Windows Azure PowerShell for Node.js" (remember to run as admin or otherwise set priviledges):

	New-AzureService helloworld
	Add-AzureNodeWebRole

This is optional for now:

	npm install azure

Check out what your server looks like:

	cd WebRole1
	notepad server.js

Run it in emulator (inside WebRole1 folder!):

	Start-AzureEmulator -launch

Launch-option opens the app in your browser (did you guess it?).

It doesn't work:

- PowerShell says `Role is running at http://127.0.0.1:81` and `Started`
- Browser says connection was aborted
- Windows Azure Compute Emulator console says `[fabrik] Role state Busy` (also `Unknown` and `Busy`)

OK, I don't have to to hack with this right now. Perhaps I get back to this later on.

Rolling back:

	Stop-AzureEmulator

### Node.js + MongoDB

See: <https://www.windowsazure.com/en-us/develop/nodejs/tutorials/web-app-with-mongodb/>

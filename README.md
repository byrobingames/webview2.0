## Stencyl Webview (in-app browser) Extension (Openfl)

For Stencyl 3.4 and above

Stencyl extension for "Webview" on iOS and Android. This extension allows you to easily integrate Webview (in-ap browser) on your Stencyl game / application. (http://www.stencyl.com)

### IMPORTENT

This Extension Required the Toolset Extension Manager [https://byrobingames.github.io](https://byrobingames.github.io)

![webviewtoolset](https://byrobingames.github.io/img/webview/webviewtoolset.png)

## Main Features

- Full-screen and Popup mode.
- Popup mode has a close button on the top-left corner
- Whitelist validation (the webview will close if the user goes to a non-whitelisted URL).
- Blacklist validation (the webview will close if the user goes to a blacklisted URL).
- 64-bit support to iOS
- Tested with iPhone 5 IOS 9, Ipad IOS 9 and Samgsung Note 3 5

## How to Install

To install this Engine Extension, go to the toolset (byRobin Extension Mananger) in the Extension menu of your game inside Stencyl.<br/>
![toolsetextensionlocation](https://byrobingames.github.io/img/toolset/toolsetextensionlocation.png)<br/>
Select the Extension from the menu and click on "Download"

If you not have byRobin Extension Mananger installed, install this first.<br/>
Go to: [https://byrobingames.github.io](https://byrobingames.github.io)

### IMPORTENT

Because of App Transport Security (ATS) in IOS9, HTTP will not loads in IOS9.

To get it work on IOS9 you have to Download, Install and Enable "<a href="http://byrobin.nl/store/product/byrobin-extension-manager-stencylopenfl/">byRobin Extension Manager</a>"
 
## Documentation and Block Examples

Just put the block under a  button, fill in the block and the webview will open.

**Open WebView**<br/>
Open webview in a popup or in fullscreen.

![webviewblock](https://byrobingames.github.io/img/webview/webviewblock.png)

**Inputs**<br/>
- website url(as Text) start with http://<br/>
- popup or fullscreen(as choise) (no close with fullscreen)<br/>
- Whitelist (as Code(array))<br/>
- Blacklist (as Code(array))<br/>

**Example 1: Without whitelist and blacklist**<br/>
![webviewblocknormal](https://byrobingames.github.io/img/webview/webviewblocknormal.png)<br/>

-url = http://www.google.com<br/>
-popup<br/>
-whitelist= null<br/>
-blacklist= null

**Example 2: With whitelist**<br/>
![webviewblockwhitelist](https://byrobingames.github.io/img/webview/webviewblockwhitelist.png)

-url = https://github.com<br/>
-popup<br/>
-whitelist = [“(http|https)://(.`*`)github.com(.`*`)”]<br/>
-blacklist = null<br/>

This means that the user can browse only on github.com, if they enter another url, the webview will close.

**Example 3: With blacklist**<br/>
![webviewblockblacklist](https://byrobingames.github.io/img/webview/webviewblockblacklist.png)

-url = http://www.google.com<br/>
-popup<br/>
-whitelist = null<br/>
-blacklist = [“(http|https)://(.`*`)github.com(.`*`)”]<br/>

This means the user can browse on every website, exept on github.com, if the user browse to github.com, the webview will close.

**How to add more website toe whitelist and blacklist.**<br/>
Because the whitelist and blacklist is a array, you can add more website to these lists.<br/>
Just before the close Bracket “]”, you putt **,”http://website.com”** (comma-Quotation mark-url-Quotation mark)<br/>
Like this: [“(http|https)://(.`*`)github.com(.`*`)”,”http://website.com”] 

**Legend for whitelist and blacklist**<br/>
[ ] = between open close brackets, you put code.<br/>
" " = between the 2 Quotation mark you put the website you wanna add to the list.<br/>
, = between more websites you enter a comma.<br/>
(http|https) = looks if the website is http or https<br/>
(.`*`) = can be everything,  if  the website have submaps.<br/>

## Version History

- (2.0)  new release
- (2.1) Enabled Javascript for Android (IOS enabled by default)
- (2.2) Update info.txt file.
- (2.3) Add icon on block
- 2017-03-21(2.4) Added Android Gradle Support for openfl4 and added open webview with HTML Code block
- 2017-05-16(2.4.1) Tested for Stencyl 3.5, Required byRobin Toolset Extension Manager
- 2017-05-18(2.4.2) FIX: Single/Double quotes not accepted

## Submitting a Pull Request

This software is opensource.<br/>
If you want to contribute you can make a pull request

Repository: [https://github.com/byrobingames/webview2.0](https://github.com/byrobingames/webview2.0)

Need help with a pull request?<br/>
[https://help.github.com/articles/creating-a-pull-request/](https://help.github.com/articles/creating-a-pull-request/)

## ANY ISSUES?

Add the issue on GitHub<br/>
Repository: [https://github.com/byrobingames/webview2.0/issues](https://github.com/byrobingames/webview2.0/issues)

Need help with creating a issue?<br/>
[https://help.github.com/articles/creating-an-issue/](https://help.github.com/articles/creating-an-issue/)


## Donate

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HKLGFCAGKBMFL)<br />

## License

build For OpenFl.<br/>
The MIT License (MIT)

Copyright &copy; 2013 SempaiGames (http://www.sempaigames.com)

Author: Federico Bricker

Make it work for Stencyl Game Engine:<br/>
Copyright © 2014 byRobinGames (http://www.byrobingames.com)

Author: Robin Schaafsma

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Stencyl Webview (in-app browser) Extension (Openfl)

For Stencyl 3.3 and above

Stencyl extension for "Webview" on iOS and Android. This extension allows you to easily integrate Webview (in-ap browser) on your Stencyl game / application. (http://www.stencyl.com)

## Main Features

- Full-screen and Popup mode.
- Popup mode has a close button on the top-left corner
- Whitelist validation (the webview will close if the user goes to a non-whitelisted URL).
- Blacklist validation (the webview will close if the user goes to a blacklisted URL).
- 64-bit support to iOS
- Tested with iPhone 5 IOS 9, Ipad IOS 9 and Samgsung Note 3 5


## How to Install

Go to: http://byrobin.nl/store/product/webview2-0-for-ios-andrid-stencylopenfl/

Add the extension to the cart en proceed with checkout. After you successfully placed the order, you will get an e-mail with the download link or go to “My Account” section where you can also find the download link.

Or

Use the "Download Zip" from this page.

Free Extension is named “master.zip” when you download.

Install the zip file: Go to : http://community.stencyl.com/index.php/topic,30432.0.html


###IMPORTENT

Because of App Transport Security (ATS) in IOS9, HTTP will not loads in IOS9.

To get it work on IOS9 you have to Download, Install and Enable "<a href="http://byrobin.nl/store/product/byrobin-extension-manager-stencylopenfl/">byRobin Extension Manager</a>"
 
## Documentation and Block Examples

Just put the block under a  button, fill in the block and the webview will open.

**Open WebView**<br/>
Open webview in a popup or in fullscreen.

![webviewblock](http://www.byrobin.nl/stencyl/webview/webviewblock.png)

**Inputs**<br/>
- website url(as Text) start with http://<br/>
- popup or fullscreen(as choise) (no close with fullscreen)<br/>
- Whitelist (as Code(array))<br/>
- Blacklist (as Code(array))<br/>

**Example 1: Without whitelist and blacklist**<br/>
![webviewblocknormal](http://www.byrobin.nl/stencyl/webview/webviewblocknormal.png)<br/>

-url = http://www.google.com<br/>
-popup<br/>
-whitelist= null<br/>
-blacklist= null

**Example 2: With whitelist**<br/>
![webviewblockwhitelist](http://www.byrobin.nl/stencyl/webview/webviewblockwhitelist.png)

-url = https://github.com<br/>
-popup<br/>
-whitelist = [“(http|https)://(.`*`)github.com(.`*`)”]<br/>
-blacklist = null<br/>

This means that the user can browse only on github.com, if they enter another url, the webview will close.

**Example 3: With blacklist**<br/>
![webviewblockblacklist](http://www.byrobin.nl/stencyl/webview/webviewblockblacklist.png)

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

## Donate

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HKLGFCAGKBMFL)<br />

## License

build For OpenFl.<br/>
The MIT License (MIT) - [LICENSE.md](LICENSE.md)

Copyright &copy; 2013 SempaiGames (http://www.sempaigames.com)

Author: Federico Bricker

Make it work for Stencyl Game Engine:<br/>
Copyright © 2014 byRobinGames (http://www.byrobingames.com)

Author: Robin Schaafsma

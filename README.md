# rn-qwsdk

React native wrapper for QWSdk

### Getting Started

``` sh
  npm i git+https://git@github.com/monideeps99/rn-qwsdk.git --save
```
### Manual Installation
##### iOS
1. In XCode, in the project navigator, Click on your Project then under <code>Build Phases</code> tab, expand <code>Link Binary With Libraries </code> and click the Plus icon to add libRNQWSdk.a .
![](https://i.imgur.com/lecJXSf.png)
2. Edit info.plist file and add the following permissions
```
    <key>NSCameraUsageDescription</key>
    <string>Need camera access for scanning QR Code</string>
```
2. Now edit your app.js file and add the following lines
  ```js
    const RNQWSdk = require('rn-qwsdk');
    
    // Test your integration
    // It will log "Hello {name} to the debugger console"
    // RNQWSdk.test("Foo Bar");
    
    const data = {
      env: "test",
      mobile: "XXXXXXXXXX",
      partnerid:"TEST_PARTNERID",
      signature: "YOUR SIGNATURE"
    }
    
    // Initialize QWSdk
    RNQWSdk.init(data);
    
    // Subscribe to the sdk events and pass your callback function 
    RNQWSdk.subscribe( (data) => console.log(`DATA: ${data}`) );
    
    // Don't forget to unsubscribe, typically in componentWillUnmount
    // RNQWSdk.unsuscribe();
    ```

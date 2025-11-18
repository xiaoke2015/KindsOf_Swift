
### Info.plist 配置

- 网络配置 App Transport Security Settings
```
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
```

- 出口许可配置 App Uses Non-Exempt Encryption 设置 NO
```
    <key>ITSAppUsesNonExemptEncryption</key>
    <false/>
```


- 主题设置 Appearance 设置 Light
```
    <key>UIUserInterfaceStyle</key>
    <string>Light</string>
```

- 自定义字体设置 Fonts provided by application

```
    <key>UIAppFonts</key>
    <array>
        <string>BebasNeue-Regular.ttf</string>
    </array>
```

- UIDesignRequiresCompatibility
```
    <key>UIDesignRequiresCompatibility</key> <true/>
```
iOS 26 Tabbar
如果不想兼容，可以在InfoPlist加入新的Key
在 infoPlist 加入 UIDesignRequiresCompatibility 值为 true，就可以在ios26使用兼容模式显示传统UI风格


- LSApplicationQueriesSchemes
白名单
```
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <!-- 微信的 URL Scheme -->
        <string>weixin</string>
        <string>wechat</string>
        
        <!-- 支付宝的 URL Scheme -->
        <string>alipay</string>
        <string>alipays</string>
    </array>
```

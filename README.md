
## Xcode 创建项目

### 利用 cocoapods 管理第三方库

```
pod init
pod install
pod install --no-repo-update --verbose
```

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

- 白名单

- 隐私

### PrivacyInfo 配置

从 2024 年 5 月 1 日开始，如果新 App 或更新 App 使用了包含在常用第三方 SDK 列表中的新增第三方 SDK，它们需要具备以下所有内容，才能在 App Store Connect 中提交。[新闻](https://developer.apple.com/cn/news/?id=pvszzano)

### InfoPlist.strings 配置

新建一个 InfoPlist.strings 文件

```
"CFBundleDisplayName" = "抖音";
```

### Build Settings 配置

- User Script Sandboxing 设置为 NO

    User Script Sandboxing 设置为 NO 。这个设置控制了 Xcode 脚本的沙盒限制，默认情况下，Xcode 会将脚本放入沙盒环境中，限制其访问文件系统的权限，尤其是对某些目录（例如项目文件夹之外的文件）进行修改时，会出现权限问题。



## PrivacyInfo 开源库

- [Kingfisher](https://github.com/onevcat/Kingfisher.git)
- [RealmSwift](https://github.com/realm/realm-swift.git)
- [Alamofire](https://github.com/Alamofire/Alamofire.git)
- [SnapKit](https://github.com/SnapKit/SnapKit.git)
- [IQKeyboardManagerSwift]()

## 相关链接

- [cnswift](https://www.cnswift.org/)
- [cocoapods](https://cocoapods.org/)
- [git](https://git-scm.com/)
- [苹果开发者](https://developer.apple.com/cn/)
- [七麦数据](https://www.qimai.cn/?qm_query=1)
- [蒲公英内测](https://www.pgyer.com/)
- [bugly](https://bugly.qq.com/)
- [极光](https://www.jiguang.cn/)
- [友盟](https://www.umeng.com/)
- [微信SDK](https://developers.weixin.qq.com/doc/oplatform/Mobile_App/Access_Guide/iOS.html)
- [支付宝SDK](https://opendocs.alipay.com/open/00dn76)
- [穿山甲](https://www.csjplatform.com/)
- [腾讯云即时通讯](https://cloud.tencent.com/document/product/269)
- [融云即时通讯](https://doc.rongcloud.cn/im/Android/5.X/ui/quick_integration)
- [网易云信即时通讯](https://doc.yunxin.163.com/)
- [leancloud](https://www.leancloud.cn/)
- [flutter](https://docs.flutter.cn/)
- [python](https://www.runoob.com/python/python-tutorial.html)



## Xcode 创建项目

### [Info.plist](./docs/InfoPlist.md)

Info.plist（Information Property List）是苹果平台（iOS/macOS/watchOS/tvOS）App 的核心配置文件，以 XML 格式存储 App 身份标识、功能权限、兼容性、隐私声明等关键信息，是 Xcode 编译、设备运行、App Store 审核的必备文件。其配置直接影响 App 启动、功能可用性及审核通过率，是 iOS 开发的基础核心。
* NSAppTransportSecurity
* ITSAppUsesNonExemptEncryption
* UIUserInterfaceStyle
* UIAppFonts
* UIDesignRequiresCompatibility
* LSApplicationQueriesSchemes
* UIApplicationSceneManifest
* NSCameraUsageDescription
* NSPhotoLibraryUsageDescription
* NSPhotoLibraryAddUsageDescription
* NSLocationWhenInUseUsageDescription
* NSLocationAlwaysAndWhenInUseUsageDescription
* NSMicrophoneUsageDescription
* NSUserNotificationUsageDescription
* NSContactsUsageDescription
* NSHealthShareUsageDescription
* NSBluetoothAlwaysUsageDescription

### [PrivacyInfo.xcprivacy](https://developer.apple.com/cn/support/third-party-SDK-requirements/)

PrivacyInfo.xcprivacy 是苹果在 iOS 15+/macOS 12+/watchOS 8+/tvOS 15+ 推出的隐私配置文件，用于替代旧版 Info.plist 中的隐私描述键。其核心作用是：向 App Store 和用户声明 App/SDK 收集的隐私数据类型、用途及数据处理方式，是 2024 年 5 月 1 日 App Store 隐私清单要求的核心文件（尤其针对第三方 SDK 和敏感 API 使用）

### [InfoPlist.strings](./KindsOf_Swift/InfoPlist.strings)

InfoPlist.strings 是 iOS/macOS 等苹果平台的本地化字符串文件，核心作用是为 Info.plist 中的关键配置（如隐私权限描述、App 名称、功能说明等）提供多语言支持，避免硬编码文本，同时满足 App Store 审核对「权限说明透明度」的要求（尤其隐私相关描述是必配项）

### [Build Settings](./KindsOf_Swift.xcodeproj)

Xcode 的 Build Settings（构建设置）是控制 App 编译、链接、打包、签名等全流程的核心配置面板，涵盖目标设备、编译选项、代码优化、隐私合规、打包输出等关键参数。合理配置可解决编译报错、签名失败、包体积过大、性能瓶颈等问题，是 iOS/macOS 开发的必备技能。

- User Script Sandboxing 设置为 NO

User Script Sandboxing 设置为 NO 。这个设置控制了 Xcode 脚本的沙盒限制，默认情况下，Xcode 会将脚本放入沙盒环境中，限制其访问文件系统的权限，尤其是对某些目录（例如项目文件夹之外的文件）进行修改时，会出现权限问题。
    
### [APP 备案](https://dsj.hainan.gov.cn/zcfg/zybs/202308/t20230822_3479317.html)
2023 年 8 月工信部启动 APP 备案，2023 年 9 月至 2024 年 3 月为存量 APP 备案期，2024 年 7 月起进入常态化管理。境内从事互联网信息服务的 APP 主办者须备案，材料齐全 20 个工作日内办结，未备案不得提供服务，旨在规范行业、保障网络安全。

参考：
* [腾讯云备案](https://cloud.tencent.com/document/product/243/97789)
* [阿里云备案](https://help.aliyun.com/zh/icp-filing/basic-icp-service/getting-started/quick-sta-rt-for-icp-filing-for-personal-app?spm=a2c4g.11186623.help-menu-2621160.d_1_1.62682600tuoLAa&scm=20140722.H_2841908._.OR_help-T_cn~zh-V_1)


## 新闻

### [App Store Mini App Partner Program 隆重推出](https://developer.apple.com/cn/news/?id=xcz1s7cz)
2025 年 11 月 13 日，苹果推出 App Store 小程序伙伴计划，支持 HTML5/JS 开发的小程序 / 小游戏，符合条件的内购抽成降至 15%。同时更新审核指南，新增多项规则，含内容分级、品牌保护、数据隐私等要求。

### [提醒：适用于 App 提交的隐私要求将从 5 月 1 日开始实施](https://developer.apple.com/cn/news/?id=pvszzano)
2024 年 4 月 26 日 App Store 公告，5 月 1 日起，使用常用列表中新增第三方 SDK 的新 App 或更新 App 提交时，须有列出 API 的使用原因、隐私清单及对应有效签名，不达标将不被批准。未来该声明要求还将扩大至整个 App 二进制文件，以此保障用户隐私。


## 相关技术

### [CocoaPods](https://cocoapods.org/)
CocoaPods 是 Swift 和 Objective-C Cocoa 项目的依赖管理器。它拥有超过 10.5 万个库，在 300 多万个应用程序中使用。CocoaPods 可以帮助您优雅地扩展项目。

常用命令:
```shell
# 初始化
pod init
# pod 安装
pod install --verbose --no-repo-update
```

### [Swift Package Manager](https://docs.swift.org/swiftpm/documentation/packagemanagerdocs//)
Swift Package Manager（SPM）是苹果公司为Swift语言开发的官方依赖管理工具，支持跨平台开发（iOS、macOS、Linux等），可自动化处理包的依赖关系、构建、测试和版本管理。

参考：
* [史上最全 Swift Package manager 介绍和使用](https://juejin.cn/post/7436934215834566691?searchId=20251018104523F391DB6C4F0D03C7CFC8#heading-30)

常用命令:
```shell
# 命令用于解析和获取 Package.swift 中声明的所有依赖项
swift package resolve
```

*由于 swfit package manager 陆续完善，后续将逐步淘汰 cocoapod*

### [Widget Extension]() 

Widget Extension（小组件扩展）是苹果 iOS 14+/iPadOS 14 + 推出的 App 扩展功能，允许开发者在用户的主屏幕、锁屏（iOS 16+）或今日视图中，嵌入轻量型 App 功能模块，无需打开 App 即可快速展示关键信息或完成简单操作。

参考:
* [iOS小组件开发全面总结](https://juejin.cn/post/7408931981848068096?searchId=202510201102474EDAE47657224BBA89BE)


### [Universal Links]()
Universal Links（通用链接）是苹果 iOS 9 + 推出的深层链接技术，能让用户直接通过 HTTP/HTTPS 链接打开 App，无需跳转 Safari。

参考：
* [微信 Universal Link 配置](https://developers.weixin.qq.com/miniprogram/dev/platform-capabilities/miniapp/handbook/web/universal-link-guide.html)

### [Apple App Clip](https://developer.apple.com/cn/design/human-interface-guidelines/app-clips)
App Clip 是苹果公司在2020年WWDC全球开发者大会上宣布推出的轻量化小程序，作为iOS 14系统核心特性之一。该小程序允许用户无需下载完整应用即可快速访问特定服务，最大容量限制为10MB，支持通过专用二维码、NFC标签、Safari链接等七种方式触发。其技术架构基于原生应用开发框架SwiftUI/UIKit，与主应用共享代码库但独立运行，整合Apple Pay支付系统和Apple ID登录功能

### [Apple Web Clip]()
Apple Web Clip 是 iOS 和 macOS 系统中的一种功能，允许用户将网页内容保存为主屏幕或仪表盘的快捷方式，支持动态更新和自定义设置。
- 制作工具: [apple-configurator](https://apps.apple.com/cn/app/apple-configurator/id1037126344?mt=12) 

### [HealthKit]()
HealthKit 是 iOS 8 中用于健康数据管理的框架，允许应用读取和写入用户的健康信息

参考:
* [iOS 开发之 HealthKit 的使用](https://juejin.cn/post/7154177634707406855?searchId=20251024134457696612F8613C22709724)

### [3D Touch]()
3D Touch 是苹果在 iPhone 6s/6s Plus 至 iPhone X（iOS 9 - iOS 13）期间支持的硬件级交互技术，核心是通过屏幕感知用户按压的「压力强度」，触发不同层级的交互反馈，无需复杂操作即可快速访问功能。

⚠️ 重要说明：

苹果在 iPhone 11 及后续机型 中取消了 3D Touch 硬件，改用「Haptic Touch」（触感触控）—— 本质是 “长按 + 震动反馈”，无压力感应，交互逻辑简化，但部分 3D Touch 原有功能（如快捷操作）可通过 Haptic Touch 替代。

### [In-App Purchase](https://developer.apple.com/cn/documentation/storekit/in-app_purchase/)
通过 In-App Purchas API，您可以为客户提供在您的应用程序中购买数字内容和服务的机会。客户可以在您的应用程序中进行购买，并在 App Store 上找到您的促销产品。

[StoreKit2](https://developer.apple.com/cn/storekit/) 是苹果在 iOS 15+、macOS 12+ 等系统推出的新一代内购框架，作为 StoreKit 1 的升级替代，以 Swift 原生、声明式 API、异步非阻塞、本地验证 为核心优势，大幅简化内购开发流程，同时强化隐私与安全性。

参考:

* [iOS内购详解](https://juejin.cn/post/7029252038252822564?searchId=2025112012384334761057A22547D0FB04)
* [iOS StoreKit 2 新特性解析](https://juejin.cn/post/7096063372159877150?searchId=202511201249355DDF744141896CC94D97)


### [git](https://git-scm.com/)
Git 是一个免费开源的分布式版本控制系统，旨在快速高效地处理从小型到大型的所有项目。

常用命令:
```shell
# 分支管理
git branch -D
git remote add origin
git remote remove origin

# 切换分支
git checkout

# 分支基变
git rebase -i

# 合并分支
git merge

# 分支状态
git status

git rm --cached 文件名

```

## [常用开源库](./docs/open_source_library.md)

- [✋Kingfisher](https://github.com/onevcat/Kingfisher.git)
- [✋Alamofire](https://github.com/Alamofire/Alamofire.git)
- [✋SnapKit](https://github.com/SnapKit/SnapKit.git)
- [✋IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager.git) 7.1.0
- [✋RealmSwift](https://github.com/realm/realm-swift.git)
- [✋Lottie](https://github.com/airbnb/lottie.git)
- [✋Charts](https://github.com/ChartsOrg/Charts.git)
- [DropDown](https://github.com/AssistoLab/DropDown.git)
- [PullToRefreshKit](https://github.com/LeoMobileDeveloper/PullToRefreshKit.git)
- [HXPHPicker](https://github.com/SilenceLove/HXPHPicker.git)
- [Lantern](https://github.com/fcbox/lantern.git)

✋*官方需要隐私清单和签名的 SDK*

## 相关链接

- [SwiftOldDriver](https://github.com/SwiftOldDriver/iOS-Weekly/)
- [cnswift](https://www.cnswift.org/)
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


## 相关法律

- [网络数据安全管理条例](https://www.cac.gov.cn/2024-09/30/c_1729384452307680.htm)
- [网络安全法](https://www.cac.gov.cn/2016-11/07/c_1119867116.htm)
- [数据安全法](https://www.cac.gov.cn/2021-06/11/c_1624994566919140.htm)
- [个人信息保护法](http://www.npc.gov.cn/npc/c2/c30834/202108/t20210820_313088.html)


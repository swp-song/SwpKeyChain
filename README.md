# SwpKeyChain

[![Xcode](https://img.shields.io/badge/Xcode-9.3-25B1F6.svg)](https://developer.apple.com/xcode)
[![iOS](https://img.shields.io/badge/iOS-8.0+-1C75AF.svg)](https://developer.apple.com/xcode)
[![CI Status](https://img.shields.io/travis/swp-song/SwpKeyChain.svg?style=flat)](https://travis-ci.org/swp-song/SwpKeyChain)
[![Version](https://img.shields.io/cocoapods/v/SwpKeyChain.svg?style=flat)](https://cocoapods.org/pods/SwpKeyChain)
[![License](https://img.shields.io/cocoapods/l/SwpKeyChain.svg?style=flat)](https://cocoapods.org/pods/SwpKeyChain)
[![Platform](https://img.shields.io/cocoapods/p/SwpKeyChain.svg?style=flat)](https://cocoapods.org/pods/SwpKeyChain)


-------


### KeyChain

> * iOS 提供的 KeyChain 中，并且删除应用后，数据不会删除。
> * 下载安装还能使用。iOS系统提供了一些方法，进行一些简单的封装之后，就可以很方便的使用。

-------

### 导入

> * 手动导入：
>
>> * **SwpKeyChain** 文件夹导入项目中。
>> * **`#import "SwpKeyChain.h`**
>>
> -------


> * CocoaPods 导入:
>
>> * **pod search SwpKeyChain**
>> * **pod 'SwpKeyChain'**
>> * **`#import <SwpKeyChain/SwpKeyChain.h>`**
>>
> -------

-------



### 代码示例:

```Objective-C
//  存入数据
SwpKeyChainSetData(key3, value3);
SwpKeyChain.swpKeyChainSetData(key, value);
[SwpKeyChain swpKeyChainSetData:key value:value];

//  读取数据
[SwpKeyChain swpKeyChainGetData:key];
SwpKeyChainGetData(key);

//  删除数据
SwpKeyChainDelete(key);
[SwpKeyChain swpKeyChainDelete:key];
SwpKeyChain.swpKeyChainDelete(key);
```

-------


### 版本记录

> * 版本版本：1.0.2
> * 更新时间：2018-05-17 18:42:25
> * 更新内容：
>>  *  更新一些备注，pod 替换

>> -------

> * 版本版本：1.0.1
> * 更新时间：2018-05-17 17:35:43
> * 更新内容：
>>  *  修改 .md 文件。

>> -------



-------

### 备注

> * 持续更新, 如果喜欢, 欢迎 Star

-------

### 声明

 > * **著作权归 ©swp_song，如需转载请标明出处**

-------



# SwpKeyChain

[![Xcode](https://img.shields.io/badge/Xcode-9.3-25B1F6.svg)](https://developer.apple.com/xcode)
[![iOS](https://img.shields.io/badge/iOS-8.0+-1C75AF.svg)](https://developer.apple.com/xcode)
[![CI Status](https://img.shields.io/travis/swp-song/SwpKeyChain.svg?style=flat)](https://travis-ci.org/swp-song/SwpKeyChain)
[![Version](https://img.shields.io/cocoapods/v/SwpKeyChain.svg?style=flat)](https://cocoapods.org/pods/SwpKeyChain)
[![License](https://img.shields.io/cocoapods/l/SwpKeyChain.svg?style=flat)](https://cocoapods.org/pods/SwpKeyChain)
[![Platform](https://img.shields.io/cocoapods/p/SwpKeyChain.svg?style=flat)](https://cocoapods.org/pods/SwpKeyChain)
[![SwpKeyChainAPI](https://img.shields.io/badge/SwpKeyChainAPI-v1.1.0-44E0D3.svg)](https://swp-song.com/docs/SwpKeyChain/)

---

### KeyChain

> - iOS 提供的 KeyChain 中，并且删除应用后，数据不会删除。
> > - 下载安装还能使用。iOS系统提供了一些方法，进行一些简单的封装之后，就可以很方便的使用。

---

### 导入

> - 手动导入：
> 
> > - **SwpKeyChain** 文件夹导入项目中。
> > > > - **`#import "SwpKeyChain.h`**
> > 
> > ---
> 
> - CocoaPods 导入:
> 
> > - **pod search SwpKeyChain**
> > > > - **pod 'SwpKeyChain'**
> > > > - **`#import <SwpKeyChain/SwpKeyChain.h>`**
> > 
> > ---

---

### 代码示例

```Objective
//  存入数据
SwpKeyChainSetObject(value,key);
SwpKeyChain.swpKeyChainSetObject(value, key);
[SwpKeyChain swpKeyChainSetObject:value key:key];

//  读取数据
SwpKeyChainGetObject(key);
[SwpKeyChain swpKeyChainGetObject:key];


//  删除数据
SwpKeyChainDeleteObject(key);
SwpKeyChain.swpKeyChainDeleteObject(key);
[SwpKeyChain swpKeyChainDeleteObject:key];
```

---

### SwpKeyChain 文档

> - [SwpKeyChain 文档](https://swp-song.com/docs/SwpKeyChain/)

---

### 版本记录



> - 版本版本：1.2.0
> 
> - 更新时间：2018-05-18 13:56:43
> 
> - 更新内容：
>   
>   > - 修改方法名称。
> 
> > ---

> - 版本版本：1.1.0
> > - 更新时间：2018-05-18 10:08:37
> > - 更新内容：
>   
>   > - 新增版本的资源，Api 文档
> 
> > ---

---

### 备注

> - 持续更新, 如果喜欢, 欢迎 Star

---

### 声明

> - **著作权归 ©swp_song，如需转载请标明出处**

---



//
//  SwpKeyChain.m
//  swp_song
//
//  Created by swp_song on 2018/5/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpKeyChain.h"

@implementation SwpKeyChain

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainInfo ( 获取 SwpKeyChain 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpKeyChainInfo {
    return [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpKeyChain.bundle/SwpKeyChain.plist" ofType:nil]].copy;
}

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainVersion  ( 获取 SwpKeyChain 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpKeyChainVersion {
    return [self swpKeyChainInfo][@"Version"];
}


/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainSetObject    ( KeyChain 存入数据 )
 */
+ (SwpKeyChain * _Nonnull (^)(id _Nonnull, NSString * _Nonnull))swpKeyChainSetObject {
    return ^(id value, NSString *key) {
        [self.class swpKeyChainSetObject:value key:key];
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainSetObject:value: ( KeyChain 存入数据 )
 *
 *  @param  value   value
 *
 *  @param  key     key
 */
+ (void)swpKeyChainSetObject:(id)value key:(NSString *)key {
    SwpKeyChainSetObject(value, key);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainSetObject    ( KeyChain 存入数据 )
 *
 *  @param  value   value
 *
 *  @param  key     key
 */
void SwpKeyChainSetObject(id value, NSString *key) {
    NSMutableDictionary *object = [NSMutableDictionary dictionary];
    [object setObject:value forKey:key];
    _SaveKeyChain(object, key);
}


/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainGetObject:   ( KeyChain 获取数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
+ (id)swpKeyChainGetObject:(NSString *)key {
    return SwpKeyChainGetObject(key);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainGetObject    ( KeyChain 获取数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
id SwpKeyChainGetObject(NSString *key) {
    NSMutableDictionary *datas = (NSMutableDictionary *)_GetKeyChain(key);
    return datas[key];
}

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainDeleteObject ( KeyChain 移除 )
 */
+ (SwpKeyChain * _Nonnull (^)(NSString * _Nonnull))swpKeyChainDeleteObject {
    return ^(NSString *key) {
        [self.class swpKeyChainDeleteObject:key];
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainDeleteObject ( KeyChain 移除 )
 *
 *  @param  key key
 */
+ (void)swpKeyChainDeleteObject:(NSString *)key {
    SwpKeyChainDeleteObject(key);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainDeleteObject ( KeyChain 移除 )
 *
 *  @param  key key
 */
void SwpKeyChainDeleteObject(NSString *key) {
    _DeleteService(key);
}




#pragma mark - Private Methods

// 根据 key 保存 KeyChain 数据
FOUNDATION_STATIC_INLINE void _SaveKeyChain(id value, NSString *service) {
    
    
    //
    NSMutableDictionary *keyChainQuery  = _KeyChainQuery(service).mutableCopy;
    
    // Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keyChainQuery);
    
    // Add new object to search dictionary(Attention:the data format)
    [keyChainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:value] forKey:(id)kSecValueData];
    
    // Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keyChainQuery, NULL);
    
}

// 根据 key 获取 KeyChain 数据
FOUNDATION_STATIC_INLINE id _GetKeyChain(NSString *service) {
    id datas = nil;
    NSMutableDictionary *keyChainQuery = _KeyChainQuery(service).mutableCopy;
    
    //  Configure the search setting
    //  Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keyChainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keyChainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    
    if (SecItemCopyMatching((CFDictionaryRef)keyChainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            datas = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *exception) {
            NSLog(@"Unarchive of %@ failed: %@", service, exception);
        }
    }
    if (keyData) CFRelease(keyData);
    return datas;
}

// 根据 key 删除 KeyChain
FOUNDATION_STATIC_INLINE void _DeleteService(NSString *service) {
    NSMutableDictionary *keyChainQuery = _KeyChainQuery(service).mutableCopy;
    SecItemDelete((CFDictionaryRef)keyChainQuery);
}

// 获取查询字典
FOUNDATION_STATIC_INLINE NSDictionary * _KeyChainQuery(NSString *service) {
    
    NSMutableDictionary *keys = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 (id)kSecClassGenericPassword,
                                 (id)kSecClass,       service,
                                 (id)kSecAttrService, service,
                                 (id)kSecAttrAccount,
                                 (id)kSecAttrAccessibleAfterFirstUnlock,
                                 (id)kSecAttrAccessible,
                                 nil];
    return keys.copy;
}




@end

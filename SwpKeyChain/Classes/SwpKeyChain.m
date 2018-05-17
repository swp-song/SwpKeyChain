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
 *  @brief  swpKeyChainSetData  ( KeyChain 存入数据 )
 */
+ (SwpKeyChain * _Nonnull (^)(NSString * _Nonnull, id _Nonnull))swpKeyChainSetData {
    return ^(NSString *key, id value) {
        [self.class swpKeyChainSetData:key value:value];
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainSetData:value:   ( KeyChain 存入数据 )
 *
 *  @param  key     key
 *
 *  @param  value   value
 */
+ (void)swpKeyChainSetData:(NSString *)key value:(id)value {
    SwpKeyChainSetData(key, value);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainSetData  ( KeyChain 存入数据 )
 *
 *  @param  key     key
 *
 *  @param  value   value
 */
void SwpKeyChainSetData(NSString *key, id value) {
    NSMutableDictionary *datas = [NSMutableDictionary dictionary];
    [datas setObject:value forKey:key];
    _SaveKeyChain(key, datas);
}


/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainGetData: ( KeyChain 获取数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
+ (id)swpKeyChainGetData:(NSString *)key {
    return SwpKeyChainGetData(key);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainGetData  ( KeyChain 获取数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
id SwpKeyChainGetData(NSString *key) {
    NSMutableDictionary *datas = (NSMutableDictionary *)_GetKeyChain(key);
    return datas[key];
}

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainDelete   ( KeyChain 移除 )
 */
+ (SwpKeyChain * _Nonnull (^)(NSString * _Nonnull))swpKeyChainDelete {
    return ^(NSString *key) {
        [self.class swpKeyChainDelete:key];
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainDelete   ( KeyChain 移除 )
 *
 *  @param  key key
 */
+ (void)swpKeyChainDelete:(NSString *)key {
    SwpKeyChainDelete(key);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainDelete   ( KeyChain 移除 )
 *
 *  @param  key key
 */
void SwpKeyChainDelete(NSString *key) {
    _DeleteService(key);
}


#pragma mark - Private Methods

// 根据 key 保存 KeyChain 数据
FOUNDATION_STATIC_INLINE void _SaveKeyChain(NSString *service, id value) {
    
    
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

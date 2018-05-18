//
//  SwpKeyChain.h
//  swp_song
//
//  Created by swp_song on 2018/5/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpKeyChain : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainInfo ( 获取 SwpKeyChain 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpKeyChainInfo;

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainVersion  ( 获取 SwpKeyChain 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpKeyChainVersion;

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainSetObject    ( KeyChain 存入数据 )
 */
+ (SwpKeyChain * _Nonnull (^)(id _Nonnull, NSString * _Nonnull))swpKeyChainSetObject;

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainSetObject:value: ( KeyChain 存入数据 )
 *
 *  @param  value   value
 *
 *  @param  key     key
 */
+ (void)swpKeyChainSetObject:(id)value key:(NSString *)key;

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainSetObject    ( KeyChain 存入数据 )
 *
 *  @param  value   value
 *
 *  @param  key     key
 */
void SwpKeyChainSetObject(id value, NSString *key);

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainGetObject:   ( KeyChain 获取数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
+ (id)swpKeyChainGetObject:(NSString *)key;

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainGetObject    ( KeyChain 获取数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
id SwpKeyChainGetObject(NSString *key);

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainDeleteObject ( KeyChain 移除 )
 */
+ (SwpKeyChain * _Nonnull (^)(NSString * _Nonnull))swpKeyChainDeleteObject;

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainDeleteObject ( KeyChain 移除 )
 *
 *  @param  key key
 */
+ (void)swpKeyChainDeleteObject:(NSString *)key;

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainDeleteObject ( KeyChain 移除 )
 *
 *  @param  key key
 */
void SwpKeyChainDeleteObject(NSString *key);

@end
NS_ASSUME_NONNULL_END

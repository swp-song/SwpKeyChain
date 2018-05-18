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
 *  @brief  swpKeyChainSetData  ( KeyChain 存入数据 )
 */
+ (SwpKeyChain * _Nonnull (^)(NSString * _Nonnull, id _Nonnull))swpKeyChainSetData;

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainSetData:value:   ( KeyChain 存入数据 )
 *
 *  @param  key     key
 *
 *  @param  value   value
 */
+ (void)swpKeyChainSetData:(NSString *)key value:(id)value;

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainSetData  ( KeyChain 存入数据 )
 *
 *  @param  key     key
 *
 *  @param  value   value
 */
void SwpKeyChainSetData(NSString *key, id value);

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainGetData: ( KeyChain 获取数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
+ (id)swpKeyChainGetData:(NSString *)key;

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainGetData  ( KeyChain 获取数据 )
 *
 *  @param  key key
 *
 *  @return id
 */
id SwpKeyChainGetData(NSString *key);

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainDelete   ( KeyChain 移除 )
 */
+ (SwpKeyChain * _Nonnull (^)(NSString * _Nonnull))swpKeyChainDelete;

/**
 *  @author swp_song
 *
 *  @brief  swpKeyChainDelete   ( KeyChain 移除 )
 *
 *  @param  key key
 */
+ (void)swpKeyChainDelete:(NSString *)key;

/**
 *  @author swp_song
 *
 *  @brief  SwpKeyChainDelete   ( KeyChain 移除 )
 *
 *  @param  key key
 */
void SwpKeyChainDelete(NSString *key);

@end
NS_ASSUME_NONNULL_END

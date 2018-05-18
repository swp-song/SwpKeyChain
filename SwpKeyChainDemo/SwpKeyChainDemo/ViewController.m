//
//  ViewController.m
//  SwpKeyChainDemo
//
//  Created by swp_song on 2018/5/17.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "ViewController.h"

#import <SwpKeyChain/SwpKeyChain.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"SwpKeyChainInfo     = %@", [SwpKeyChain swpKeyChainInfo]);
    NSLog(@"SwpKeyChainVersion  = %@", [SwpKeyChain swpKeyChainVersion]);
    
    NSString *bundleIdentifier = [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleIdentifier"];

    NSString *key1      = [NSString stringWithFormat:@"%@.NSString", bundleIdentifier];
    NSString *value1    = @"NSString";
    [SwpKeyChain swpKeyChainSetObject:value1 key:key1];
    NSLog(@"key1 = %@", [SwpKeyChain swpKeyChainGetObject:key1]);
    
    NSString     *key2   = [NSString stringWithFormat:@"%@.NSDictionary", bundleIdentifier];
    NSDictionary *value2 = @{@"key1" : @"value1", @"key2" : @"value2", @"key3" : @"value3",};
    SwpKeyChain.swpKeyChainSetObject(value2, key2);
    NSLog(@"key2 = %@", [SwpKeyChain swpKeyChainGetObject:key2]);
    
    
    NSString    *key3   = [NSString stringWithFormat:@"%@.NSArray", bundleIdentifier];
    NSArray     *value3 = @[value1, value2, @[@(1), @(2)], @(1), @(0.5)];
    SwpKeyChainSetObject(value3, key3);
    NSLog(@"key3 = %@", SwpKeyChainGetObject(key3));

    NSString *key       = [NSString stringWithFormat:@"%@", bundleIdentifier];
    NSString *value     = @"Delegate";
    [SwpKeyChain swpKeyChainSetObject:value key:key];
    NSLog(@"key = %@", SwpKeyChainGetObject(key));
    SwpKeyChainDeleteObject(key);
//    SwpKeyChain.swpKeyChainDeleteObject(key);
//    [SwpKeyChain swpKeyChainDeleteObject:key];
    NSLog(@"key = %@", [SwpKeyChain swpKeyChainGetObject:key]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

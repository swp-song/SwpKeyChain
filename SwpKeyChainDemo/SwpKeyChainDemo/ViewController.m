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
    
    NSString *bundleIdentifier = [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleIdentifier"];

    NSString *key1      = [NSString stringWithFormat:@"%@.NSString", bundleIdentifier];
    NSString *value1    = @"NSString";
    [SwpKeyChain swpKeyChainSetData:key1 value:value1];
    NSLog(@"key1 = %@", [SwpKeyChain swpKeyChainGetData:key1]);
    
    NSString     *key2   = [NSString stringWithFormat:@"%@.NSDictionary", bundleIdentifier];
    NSDictionary *value2 = @{@"key1" : @"value1", @"key2" : @"value2", @"key3" : @"value3",};
    SwpKeyChain.swpKeyChainSetData(key2, value2);
    NSLog(@"key2 = %@", [SwpKeyChain swpKeyChainGetData:key2]);
    
    
    NSString    *key3   = [NSString stringWithFormat:@"%@.NSArray", bundleIdentifier];
    NSArray     *value3 = @[value1, value2, @[@(1), @(2)], @(1), @(0.5)];
    SwpKeyChainSetData(key3, value3);
    NSLog(@"key3 = %@", SwpKeyChainGetData(key3));

    
    NSString *key   = [NSString stringWithFormat:@"%@", bundleIdentifier];
    NSString *value = @"Delegate";
    [SwpKeyChain swpKeyChainSetData:key value:value];
    NSLog(@"key = %@", SwpKeyChainGetData(key));
    SwpKeyChainDelete(key);
    NSLog(@"key = %@", [SwpKeyChain swpKeyChainGetData:key]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

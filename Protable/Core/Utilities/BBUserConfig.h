//
//  BAUserConfig.h
//  PregnancyTracking
//
//  Created by hou zhenyong on 13-10-10.
//  Copyright (c) 2013年 hou zhenyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBUserConfig : NSObject

+ (BBUserConfig*)sharedInstance;

- (void)registerDefaults;

- (void)saveImmediately;

@property (nonatomic, strong) NSString *currentSkinName;

@property (nonatomic, strong) NSString *serverVersion;

@property (nonatomic, strong) NSDictionary *lastUpdateTipForNewVersion;

/**
 上次展示新手引导scrollView页的版本
 */
@property (nonatomic, strong) NSString *introVersion;

/**
 上一次评价的版本
 */
@property (nonatomic, strong) NSDictionary *lastVersionForPraise;

@property (nonatomic, strong) NSString *deviceToken;

@end

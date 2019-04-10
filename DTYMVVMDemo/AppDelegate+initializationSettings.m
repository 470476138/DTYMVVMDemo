//
//  AppDelegate+initializationSettings.m
//  DTYMVVMDemo
//
//  Created by 董天燚 on 2019/4/10.
//  Copyright © 2019 董天燚. All rights reserved.
//

#import "AppDelegate+initializationSettings.h"
#import <YTKNetwork.h>

@implementation AppDelegate (initializationSettings)

- (void)YTKNWSetting{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = @"https://api.weibo.com/";
    
    [SDWebImageDownloader.sharedDownloader setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
forHTTPHeaderField:@"Accept"];
}
@end

//
//  YCXTabBar.h
//  自定义 tabbar
//
//  Created by 李旭杰 on 2017/7/11.
//  Copyright © 2017年 李旭杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YCXTabBarDelegate <NSObject>

- (void)didSelectedStartButtonOpreation;

@end

@interface YCXTabBar : UITabBar

/**
 tabbar 的代理对象
 */

@property (nonatomic, weak) id<YCXTabBarDelegate> delegate;

@end

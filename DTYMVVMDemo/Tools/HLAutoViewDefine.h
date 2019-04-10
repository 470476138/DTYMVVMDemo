//
//  HLAutoViewDefine.h
//  AutoSizeView
//
//  Created by 易海 on 16/4/1.
//  Copyright © 2016年 易海. All rights reserved.
//

#ifndef HLAutoViewDefine_h
#define HLAutoViewDefine_h

#import "HLAutoViewUntil.h"
#import "UIView+HLUntil.h"


#define iphone6Width    375.0f
#define iphone6Height   667.0f
//#define kNavigationHeight 44.f
//#define kStatusBarHeight    20.f
//#define kTabBarHeight       49.f


#define HLWINSIZE [UIScreen mainScreen].bounds.size

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define HOME_INDICATOR_HEIGHT (kDevice_Is_iPhoneX?34.0f: 0.0f)

#define Height_NavContentBar 44.0f

#define Height_StatusBar (kDevice_Is_iPhoneX?44.0f: 20.0f)

#define Height_DifferenceX (kDevice_Is_iPhoneX?24.0f: 0.0f)

#define Height_NavBar (kDevice_Is_iPhoneX?88.0f: 64.0f)

#define Height_TabBar (kDevice_Is_iPhoneX?83.0f: 49.0f)


#define rectToString(arg)   [HLAutoViewUntil rectToString:arg]
#define stringToRect(arg)   [HLAutoViewUntil stringToRect:arg]
#define piontToString(arg)  [HLAutoViewUntil piontToString:arg]
#define stringToPoint(arg)  [HLAutoViewUntil stringToPoint:arg]
#define sizeToString(arg)   [HLAutoViewUntil sizeToString:arg]
#define stringToSize(arg)   [HLAutoViewUntil stringToSize:arg]
#define noEmptyString(arg)  arg && arg.length > 0
//拼接车系图片的地址
#define HLImageURLString(string) [HLAutoViewUntil ImageAppendString:string]

#define hly_scaleW(arg, base) arg * (HLWINSIZE.width / base)
#define hly_scaleH(arg, base) arg * (HLWINSIZE.height / base)

#define ksProportionWidth   (HLWINSIZE.width/iphone6Width)
#define ksProportionHeight      (HLWINSIZE.height/iphone6Height)

//badge提示点颜色
#define badgeColor colorWithHexString(@"#feab34ff")
#define badgeWidth 6.0f

#define colorWithHexString(arg)    [HLAutoViewUntil colorWithHexString:arg]
#define hly_autoFontSize(arg)      [HLAutoViewUntil autoFontSize:arg]
#define hly_autoFontSizeWith4S(arg) [HLAutoViewUntil autoFontSizeWith4S:arg]

#define rgb(r, g, b) \
        [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1]

#define rgba(r, g, b, a) \
        [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:((float) a / 255.0f)]

#endif /* HLAutoViewDefine_h */

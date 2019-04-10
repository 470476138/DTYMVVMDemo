//
//  YCXRootTabBarControllerViewController.m
//  YunCheXing
//
//  Created by 马佳 on 2019/4/2.
//  Copyright © 2019 马佳. All rights reserved.
//

#import "YCXRootTabBarControllerViewController.h"
#import "DTYNavigationController.h"
#import "YCXTabBar.h"

@interface YCXRootTabBarControllerViewController ()<YCXTabBarDelegate,UITabBarDelegate,UITabBarControllerDelegate>

@end
// 控制器的类名
static NSString *const kClassKey    = @"rootVCClassString";
// 控制器的XIB名称
static NSString *const kXibKey    = @"rootVCXibString";
// 控制器的标题
static NSString *const kTitleKey    = @"title";
// 控制器的未选中的图片
static NSString *const kImgKey      = @"imageName";
// 控制器的选中的图片
static NSString *const kSelImgKey   = @"selectedImageName";
@implementation YCXRootTabBarControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self setupTabbarUI];
}
#pragma mark -delegate
- (BOOL)shouldAutorotate{
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}
#pragma mark - 设置tabbar的界面
- (void) setupTabbarUI{//首页 发现 /云车行/ 消息 我的
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"DTYHomeController",
                                   kXibKey: @"DTYHomeController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"home",
                                   kSelImgKey : @"home_active"},

                                 @{kClassKey  : @"DTYHomeController",
                                   kXibKey: @"DTYHomeController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"home",
                                   kSelImgKey : @"home_active"},

                                 @{kClassKey  : @"DTYHomeController",
                                   kXibKey: @"DTYHomeController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"home",
                                   kSelImgKey : @"home_active"},

                                 @{kClassKey  : @"DTYHomeController",
                                   kXibKey: @"DTYHomeController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"home",
                                   kSelImgKey : @"home_active"}
                                 ];

    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {

        UIViewController *rootVC = [[NSClassFromString(dict[kClassKey]) alloc] init] ;

        DTYNavigationController *nav = [[DTYNavigationController alloc] initWithRootViewController:rootVC];

        nav.tabBarController.delegate = self;
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : colorWithHexString(@"0xABABABff"),NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
//        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : colorWithHexString(@"0x45A4F7ff"),NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
        item.tag = 1000+idx;
        rootVC.title = dict[kTitleKey];
        [self addChildViewController:nav];
    }];
    self.selectedIndex = 0;
//    // 设置自定义的 tabbar
//    YCXTabBar *ycxTabBar = [[YCXTabBar alloc] init];
//    ycxTabBar.backgroundColor = colorWithHexString(@"0xFAFAFAFF");
//    ycxTabBar.delegate = self;
//    [self setValue:ycxTabBar forKey:@"tabBar"];
}

#pragma mark - YCXTabBarDelegate 上浮摁扭的点击事件开始行程
- (void)didSelectedStartButtonOpreation{
    
}

@end

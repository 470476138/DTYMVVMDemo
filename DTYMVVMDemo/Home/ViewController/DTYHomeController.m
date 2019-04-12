//
//  DTYHomeController.m
//  DTYMVVMDemo
//
//  Created by 董天燚 on 2019/4/10.
//  Copyright © 2019 董天燚. All rights reserved.
//

#import "DTYHomeController.h"
#import "PublicTableViewController.h"

@interface DTYHomeController ()

@end

@implementation DTYHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];
}

- (void)createView{
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(130, 100, 150, 21)];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:colorWithHexString(@"666666ff") forState:UIControlStateNormal] ;
    [button setTitle:@"查看公共微博" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushWB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)pushWB{
    PublicTableViewController * vc = [[PublicTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

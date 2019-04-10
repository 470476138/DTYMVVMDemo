//
//  PublicCell.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "PublicCell.h"

@interface PublicCell ()

@property (strong, nonatomic) UILabel *userName;
@property (strong, nonatomic) UILabel *date;
@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UITextView *weiboText;

@end

@implementation PublicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 头像
        self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
        [self.contentView addSubview:self.headImageView];
        
        // 昵称
        self.userName = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 150, 21)];
        self.userName.font = [UIFont systemFontOfSize:hly_autoFontSize(13)];
        [self.contentView addSubview:self.userName];
        
        // 时间
        self.date = [[UILabel alloc] initWithFrame:CGRectMake(5, 120, 200, 21)];
        self.date.font = [UIFont systemFontOfSize:hly_autoFontSize(13)];
        [self.contentView addSubview:self.date];
        
        // 正文
        self.weiboText = [[UITextView alloc] initWithFrame:CGRectMake(120, 41, 240, 200)];
        self.weiboText.font = [UIFont systemFontOfSize:hly_autoFontSize(12)];
        [self.contentView addSubview:self.weiboText];
        
    }
    
    return self;
}

- (void)bindCellViewModel:(PublicCellModel *) cellViewModel; {
    _userName.text = cellViewModel.userName;
    _date.text = cellViewModel.date;
    _weiboText.text = cellViewModel.text;
    [_headImageView sd_setImageWithURL:cellViewModel.imageUrl];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

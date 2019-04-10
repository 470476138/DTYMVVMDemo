//
//  PublicCellItem.m
//  MVVMTest
//
//  Created by lizelu on 2018/3/25.
//  Copyright © 2018年 李泽鲁. All rights reserved.
//

#import "PublicCellModel.h"

@implementation PublicCellModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        //设置时间
        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
        
        //必须设置，否则无法解析
        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSDate *date=[iosDateFormater dateFromString:self.date];
        
        //目的格式
        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        self.date = [resultFormatter stringFromDate:dic[CREATETIME]];
        self.userName = dic[USER][USERNAME];
        self.text = dic[WEIBOTEXT];
        self.imageUrl = [NSURL URLWithString:dic[USER][HEADIMAGEURL]];
        self.userId = dic[USER][UID];
        self.weiboId = dic[WEIBOID];
        self.cellHeight = [Tools countTextHeight:self.text width:80 font:14] + 150;
    }
    return self;
}

///**
// 获取到正确的数据，对正确的数据进行处理
// 
// @param returnValue 返回成功后的值
// */
//-(void)fetchValueSuccessWithDic: (NSDictionary *) returnValue {
//    //对从后台获取的数据进行处理，然后传给ViewController层进行显示
//    
//    NSArray *statuses = returnValue[STATUSES];
//    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
//    
//    for (int i = 0; i < statuses.count; i ++) {
//        
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end

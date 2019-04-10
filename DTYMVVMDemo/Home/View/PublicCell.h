//
//  PublicCell.h
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicCellModel.h"

@interface PublicCell : UITableViewCell

- (void)bindCellViewModel:(PublicCellModel *) cellViewModel;

@end

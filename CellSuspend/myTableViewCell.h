//
//  myTableViewCell.h
//  CellSuspend
//
//  Created by liudonghuan on 15/7/9.
//  Copyright (c) 2015年 liudonghuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *title;
@property BOOL ifSuspend;
@property float height;
@end

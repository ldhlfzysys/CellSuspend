//
//  ImageTableViewCell.h
//  CellSuspend
//
//  Created by liudonghuan on 15/7/10.
//  Copyright (c) 2015年 liudonghuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBTableViewCell.h"
@interface ImageTableViewCell : WBTableViewCell
@property(nonatomic,strong)UIImageView *iconImage;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *myButton;
@end

//
//  MyTableViewCell.h
//  CellSuspend
//
//  Created by liudonghuan on 15/7/10.
//  Copyright (c) 2015年 liudonghuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBCard;

@interface WBTableViewCell : UITableViewCell

- (void)setCell:(WBCard *)card;
@end

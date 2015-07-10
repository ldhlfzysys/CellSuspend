//
//  TitleCell+UI.m
//  CellSuspend
//
//  Created by liudonghuan on 15/7/10.
//  Copyright (c) 2015年 liudonghuan. All rights reserved.
//

#import "WBCard+UI.h"
#import "TitleTableViewCell.h"
@implementation WBCard (UI)

+ (Class)tableViewCellClass{
    return [WBTableViewCell class];
}

@end

@implementation TitleCard (UI)

+ (Class)tableViewCellClass{
    return [TitleTableViewCell class];
}

@end
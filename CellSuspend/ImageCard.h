//
//  ImageCard.h
//  CellSuspend
//
//  Created by liudonghuan on 15/7/10.
//  Copyright (c) 2015年 liudonghuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBCard.h"
@interface ImageCard : WBCard
@property(nonatomic,strong)NSData *imageData;
@property(nonatomic,strong)NSString *title;
@end

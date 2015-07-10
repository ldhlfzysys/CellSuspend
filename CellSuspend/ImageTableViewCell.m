//
//  ImageTableViewCell.m
//  CellSuspend
//
//  Created by liudonghuan on 15/7/10.
//  Copyright (c) 2015年 liudonghuan. All rights reserved.
//

#import "ImageTableViewCell.h"
#import "ImageCard.h"
@implementation ImageTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 50, 50)];
        [self addSubview:_iconImage];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, 200, 50)];
        [self addSubview:_titleLabel];
        
        _myButton = [[UIButton alloc]initWithFrame:CGRectMake(260, 15, 50, 20)];
        [_myButton setTitle:@"按钮" forState:UIControlStateNormal];
        [_myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:_myButton];
    }
    return self;
}


- (void)setCell:(WBCard *)card{
    ImageCard *myCard = (ImageCard *)card;
    _iconImage.image = [UIImage imageWithData:myCard.imageData];
    _titleLabel.text = myCard.title;
}
@end

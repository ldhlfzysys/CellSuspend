//
//  ViewController.m
//  CellSuspend
//
//  Created by liudonghuan on 15/7/9.
//  Copyright (c) 2015年 liudonghuan. All rights reserved.
//

#import "ViewController.h"
#import "WBCard+UI.h"
#import "WBTableViewCell.h"
@interface ViewController ()
@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)UIView *suspendView;
@property(nonatomic,strong)NSMutableArray *cards;//装载不同的card
@property(nonatomic,strong)NSMutableArray *suspends;//需要悬停的cell集合,目前支持1个
@end

@implementation ViewController

- (instancetype)init{
    if (self = [super init]) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [self.view addSubview:_mainTableView];
        _suspendView = [[UIView alloc]initWithFrame:CGRectMake(0, -64, 320, 40)];
        _suspendView.hidden = YES;
        [self.view addSubview:_suspendView];
        
        _suspends = [@[] mutableCopy];
        //模拟数据
        _cards = [@[] mutableCopy];
        for (int i = 0; i<3; i++) {
            TitleCard *card = [[TitleCard alloc]init];
            card.type = @"TitleCard";
            card.title = [NSString stringWithFormat:@"Cell - %d",i];
            card.height = 40 + 1 * i;
            [_cards addObject:card];
        }
        for (int i = 0; i<2; i++) {
            ImageCard *card = [[ImageCard alloc]init];
            card.type = @"ImageCard";
            UIImage *img = [UIImage imageNamed:@"imageIcon.jpg"];
            card.imageData = UIImageJPEGRepresentation(img, 1.0);
            card.height = 50;
            card.title = @"imageTitle";
            [_cards addObject:card];
            if (i == 1) {
                card.isSuspend = YES;
            }
        }
        for (int i = 0; i<10; i++) {
            TitleCard *card = [[TitleCard alloc]init];
            card.type = @"TitleCard";
            card.title = [NSString stringWithFormat:@"Cell - %d",i];
            card.height = 40 + 1 * i;
            [_cards addObject:card];
        }
        
        
        
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cards.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    WBCard *card = nil;
    card = [_cards objectAtIndex:indexPath.row];
    WBTableViewCell *cell = [[[[card class] tableViewCellClass] alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    if (card.isSuspend == YES) {
        [_suspends addObject:cell];
    }
    [cell setCell:card];
    return cell;
}

- (NSIndexPath *)indexPathInTableView:(WBTableViewCell *)cell{
    NSIndexPath * index = [_mainTableView indexPathForCell:cell];
    return index;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WBCard *card = [_cards objectAtIndex:indexPath.row];
    return card.height;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //目标cell对于tableview的高度
    if (_suspends.count > 0) {
        CGRect rectInTableView = [_mainTableView rectForRowAtIndexPath:[self indexPathInTableView:_suspends[0]]];
        
        
        //目标cell对于某个view的高度
        CGRect rectInSuperview = [_mainTableView convertRect:rectInTableView toView:_mainTableView];
        //获取需要悬停的cell
        UITableViewCell *cell = [_mainTableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:3 inSection:0]];
        UITableViewCell *cellCopy = [self duplicate:cell];
        
        
        if ((scrollView.contentOffset.y - rectInTableView.origin.y) > -60 && (scrollView.contentOffset.y - rectInTableView.origin.y)!= 0){
            
            [_suspendView addSubview:cellCopy];
            if (_suspendView.hidden == YES) {
                _suspendView.hidden = NO;
            }
            
            
        }
        if ((scrollView.contentOffset.y - rectInTableView.origin.y) < -60){
            if (_suspendView.hidden == NO) {
                _suspendView.hidden = YES;
                [cellCopy removeFromSuperview];
            }
        }
    }
}

- (UIView*)duplicate:(UIView*)view
{
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

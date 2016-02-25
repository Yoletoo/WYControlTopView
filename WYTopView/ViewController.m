//
//  ViewController.m
//  WYTopView
//
//  Created by 拒收 on 16/2/25.
//  Copyright © 2016年 大屁和小屁的故事. All rights reserved.
//

#import "ViewController.h"
#import "WYTopView.h"
@interface ViewController ()<WYTopViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationItem.title = @"水平菜单栏";

    WYTopView* wyTopView = [[WYTopView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 45)];
    wyTopView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:wyTopView];
    NSArray* menuTitle = [NSArray arrayWithObjects:@"鸡腿",@"鸡翅",@"鸡头",@"鸡脖", nil];
    [wyTopView setNameWithArray:menuTitle];
    wyTopView.wyDelegate = self;
}
-(void)getTag:(NSInteger)tag{
    self.navigationItem.title = [NSString stringWithFormat:@"菜单%ld",tag];
}

@end

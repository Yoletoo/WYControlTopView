//
//  WYTopView.m
//  WYTopView
//
//  Created by 拒收 on 16/2/25.
//  Copyright © 2016年 大屁和小屁的故事. All rights reserved.
//

#import "WYTopView.h"
@interface WYTopView()
{
    CGFloat _space;
}
@end
@implementation WYTopView

-(void)setNameWithArray:(NSArray *)menuArray{
    _menuArray = menuArray;
    
    //设置间隔
    _space = self.frame.size.width/[_menuArray count];
    for (int i=0; i<[menuArray count]; i++) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(_space*i, 0, _space, self.frame.size.height);
        btn.tag = i;
        if (btn.tag == 0) {
            btn.enabled = NO;
        }
        NSMutableAttributedString* str1 = [[NSMutableAttributedString alloc]initWithString:[menuArray objectAtIndex:i]];
        [str1 addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor grayColor]} range:NSMakeRange(0, str1.length)];
        [btn setAttributedTitle:str1 forState:UIControlStateNormal];
        
        NSMutableAttributedString* str2 = [[NSMutableAttributedString alloc]initWithString:[menuArray objectAtIndex:i]];
        [str2 addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(0, str2.length)];
        [btn setAttributedTitle:str2 forState:UIControlStateDisabled];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //分割线
        if (i>0 && self.frame.size.height>16) {
            UIView* line = [[UIView alloc]initWithFrame:CGRectMake(_space*i, 8, 1, self.frame.size.height)];
            line.backgroundColor = [UIColor blackColor];
            [self addSubview:line];
        }
    }
    //底部划线
    UIView* line = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-2.5, self.frame.size.width, 1.5)];
    line.backgroundColor = [UIColor blackColor];
    [self addSubview:line];
    
    //标示当选被选中下划线
    UIView* markLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-4, _space+1, 3)];
    markLine.backgroundColor = [UIColor orangeColor];
    markLine.tag = 999;
    [self addSubview:markLine];
}
-(void)btnClick:(UIButton*)sender{
    for (UIView* subView in self.subviews) {
        UIButton* subBtn = (UIButton*)subView;
        if (subBtn.tag == sender.tag) {
            [subBtn setEnabled:NO];
        }else{
            [subBtn setEnabled:YES];
        }
    }
    //按钮间隔
    UIView* markView = [self viewWithTag:999];
    [UIView animateWithDuration:0.2f animations:^{
        CGRect markFrame = markView.frame;
        markFrame.origin.x = sender.tag*_space;
        markView.frame = markFrame;
    }];
    if ([self.wyDelegate respondsToSelector:@selector(getTag:)]) {
        [self.wyDelegate getTag:sender.tag];
    }
}









@end

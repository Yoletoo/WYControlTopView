//
//  WYTopView.h
//  WYTopView
//
//  Created by 拒收 on 16/2/25.
//  Copyright © 2016年 大屁和小屁的故事. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WYTopView;
@protocol WYTopViewDelegate<NSObject>
@required
-(void)getTag:(NSInteger)tag;
@end
@interface WYTopView : UIView
{
    NSArray* _menuArray;
}
-(void)setNameWithArray:(NSArray*)menuArray;
@property(nonatomic,assign)id<WYTopViewDelegate>wyDelegate;
@end

//
//  UIView+KVBadge.h
//  KVBadge
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KVBadge)
@property(nonatomic,strong)UIButton *badgeButton;
-(void)showBadgeButtonWithNumber:(NSInteger) num;
-(void)clearBadge;


@property(nonatomic,strong)UIButton *redSpotButton;
-(void)showRedSpotButtonWithPoint:(CGPoint)point;
-(void)clearRedSpot;
@end

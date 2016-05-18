//
//  UIView+KVBadge.m
//  KVBadge
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "UIView+KVBadge.h"
#import <objc/runtime.h>


static const char *KVBadgeViewKey = "KVBadgeViewKey";
static const char *KVRedSpotKey = "KVRedSpotKey";
@implementation UIView (KVBadge)

#pragma mark - badge
-(void)showBadgeButtonWithNumber:(NSInteger)num{
    [self badgeInit];
    [self.badgeButton setTitle:[NSString stringWithFormat:@"%ld",(long)num] forState:UIControlStateNormal];
    [self.badgeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.badgeButton.backgroundColor = [UIColor redColor];
    self.badgeButton.titleLabel.font = [UIFont systemFontOfSize:8];
    self.badgeButton.userInteractionEnabled = NO;
    self.badgeButton.hidden = NO;
    
    if (num>=99) {
        [self.badgeButton setTitle:@"99+" forState:UIControlStateNormal];
    }else if (num==0){
        self.badgeButton.hidden = YES;
    }
}

-(void)clearBadge{
    self.badgeButton.hidden = YES;
}

- (void)badgeInit
{
    
    if (nil == self.badgeButton) {
        CGFloat buttonWith = 20;
        CGRect frm = CGRectMake(CGRectGetWidth(self.frame)-buttonWith/2, -buttonWith/2, buttonWith, buttonWith);
        self.badgeButton = [[UIButton alloc]initWithFrame:frm];
        self.badgeButton.layer.cornerRadius = buttonWith/2;
        self.badgeButton.layer.masksToBounds = YES;
        [self addSubview:self.badgeButton];
        [self bringSubviewToFront:self.badgeButton];
    }
}

-(UIButton*)badgeButton{
    return objc_getAssociatedObject(self, KVBadgeViewKey);
}


-(void)setBadgeButton:(UIButton *)badgeButton{
    objc_setAssociatedObject(self, KVBadgeViewKey, badgeButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - redSpot
-(void)showRedSpotButtonWithPoint:(CGPoint)point setValue:(NSInteger)num{
    [self redSpotInitWithPoint:point];
    self.redSpotButton.backgroundColor = [UIColor redColor];
    self.redSpotButton.hidden = NO;
    self.redSpotButton.titleLabel.font = [UIFont systemFontOfSize:8];
    [self.redSpotButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NSString *titleStr;
    if (num>=99) {
        titleStr = @"99+";
    }else{
        titleStr = [NSString stringWithFormat:@"%ld",(long)num];
    }
    
    [self.redSpotButton setTitle:titleStr forState:UIControlStateNormal];
    
}

-(void)clearRedSpot{
    self.redSpotButton.hidden = YES;
}
-(void)redSpotInitWithPoint:(CGPoint)point{
    if (nil==self.redSpotButton) {
        CGFloat buttonWith = 30;
        CGRect frm = CGRectMake(point.x, point.y-buttonWith/2, buttonWith, buttonWith);
        self.redSpotButton = [[UIButton alloc]initWithFrame:frm];
        self.redSpotButton.layer.cornerRadius = buttonWith/2;
        self.redSpotButton.layer.masksToBounds = YES;
        [self addSubview:self.redSpotButton];
        [self bringSubviewToFront:self.redSpotButton];
    }
}

-(UIButton*)redSpotButton{
    return objc_getAssociatedObject(self, KVRedSpotKey);
}

-(void)setRedSpotButton:(UIButton *)redSpotButton{
    objc_setAssociatedObject(self, KVRedSpotKey, redSpotButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

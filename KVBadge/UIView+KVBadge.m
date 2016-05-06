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

@implementation UIView (KVBadge)

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
@end

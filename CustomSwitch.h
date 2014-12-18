//
//  CustomSwitch.h
//  iBus
//
//  Created by aibang on 14-6-30.
//  Copyright (c) 2014年 aibang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomSwitch;

@protocol  CustomSwitchDelegate <NSObject>

- (void)customSwitchClick:(CustomSwitch *)customSwitch;

@end

@interface CustomSwitch : UIControl

{
    UIImageView *_onImageView;
    UIImageView *_offImageView;
    BOOL _isOn;
}

@property(assign, nonatomic) id<CustomSwitchDelegate>delegate;

- (BOOL)getIsOn;
- (void)setSwitchOn:(BOOL)isOn animation:(BOOL)animation;
@end

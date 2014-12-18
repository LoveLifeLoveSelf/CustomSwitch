//
//  CustomSwitch.m
//  iBus
//
//  Created by aibang on 14-6-30.
//  Copyright (c) 2014年 aibang.com. All rights reserved.
//

#import "CustomSwitch.h"

#define _ORIGN_DISTANCE 35

@implementation CustomSwitch

- (void)dealloc
{
    [_onImageView release];
    [_offImageView release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        _isOn = NO;
        self.layer.cornerRadius = 2.0;
        self.clipsToBounds = YES;
        [self createImageVIews:frame];
        [self addTarget:self action:@selector(clickEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)createImageVIews:(CGRect)frame
{
    _onImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    _onImageView.backgroundColor = [UIColor greenColor];
    _onImageView.image = [UIImage imageNamed:@"在线"];
    [self addSubview:_onImageView];
    
    _offImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_ORIGN_DISTANCE, 0, frame.size.width, frame.size.height)];
    _offImageView.backgroundColor = [UIColor grayColor];
    _offImageView.image = [UIImage imageNamed:@"离线"];
    [self addSubview:_offImageView];
    //[self bringSubviewToFront:_onImageView];
}

- (void)clickEvent
{
    [self change:_isOn];
  //  _isOn = !_isOn;
    if ([self.delegate respondsToSelector:@selector(customSwitchClick:)]) {
        [self.delegate customSwitchClick:self];
    }
}

- (void)change:(BOOL)isOn
{
    if (isOn) {
        _isOn = NO;
        [UIView animateWithDuration:0.25 animations:^{
            _offImageView.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            //[self bringSubviewToFront:_onImageView];
        }];
        
    }
    else
    {
        _isOn = YES;
        //[self bringSubviewToFront:_offImageView];
        [UIView animateWithDuration:0.25 animations:^{
            _offImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

- (BOOL)getIsOn
{
    return _isOn;
}

- (void)setSwitchOn:(BOOL)isOn animation:(BOOL)animation
{
    if (animation) {
        [self change:isOn];
    }
    else{
        if (isOn) {
            _isOn = NO;
            _offImageView.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        }
        else
        {
            _isOn = YES;
            _offImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        }
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

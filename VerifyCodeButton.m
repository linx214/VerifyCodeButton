//
//  VerifyCodeButton.m
//  AutoCellHeight
//
//  Created by linx on 2016/11/20.
//  Copyright © 2016年 linx. All rights reserved.
//

#import "VerifyCodeButton.h"

@interface VerifyCodeButton ()
@property (nonatomic, strong) NSTimer* timer;

@end

@implementation VerifyCodeButton

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)buttonClicked {
    if (self.actionBlock && !self.timer) {
        self.actionBlock();
        
        if (self.timeCounter > 0) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timeout) userInfo:nil repeats:YES];            
        }
    }
}

- (void)timeout {
    NSLog(@"timeout");
    if (self.delegate && [self.delegate respondsToSelector:@selector(verifyCodeButtonTimeout:timeCounter:)]) {
        if (self.timeCounter > 0) {
            [self.delegate verifyCodeButtonTimeout:self timeCounter:self.timeCounter--];            
        } else if (self.timeCounter == 0) {
            [self.timer invalidate];
            self.timer = nil;
            if ([self.delegate respondsToSelector:@selector(verifyCodeButtonEndTimer:)]) {
                [self.delegate verifyCodeButtonEndTimer:self];
            }
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

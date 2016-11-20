//
//  VerifyCodeButton.h
//  AutoCellHeight
//
//  Created by linx on 2016/11/20.
//  Copyright © 2016年 linx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VerifyCodeButton;
@protocol VerifyCodeButtonDelegate <NSObject>

- (void)verifyCodeButtonTimeout:(VerifyCodeButton*)verifyCodeButton timeCounter:(NSUInteger)timeCounter;
- (void)verifyCodeButtonEndTimer:(VerifyCodeButton*)verifyCodeButton;

@end

@interface VerifyCodeButton : UIButton

@property (nonatomic, assign) NSUInteger timeCounter;
@property (nonatomic, copy) void (^actionBlock)();
@property (nonatomic, weak) id<VerifyCodeButtonDelegate> delegate;

@end

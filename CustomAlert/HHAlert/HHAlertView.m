//
//  HHAlertView.m
//  CustomAlert
//
//  Created by 黄董 on 16/1/11.
//  Copyright © 2016年 huangxinyu. All rights reserved.
//

#import "HHAlertView.h"
#import "HHAlertManager.h"
#import "HHAlertViewController.h"

@interface HHAlertView ()

@end

@implementation HHAlertView

- (void)setup {
    @throw [NSException exceptionWithName:@"子类实现" reason:@"not implementation" userInfo:nil];
}

- (void)show {
    //先添加到栈中
    [[HHAlertManager sharedManager].alertStack addObject:self];
    [self showAlert];
}

- (void)showAlert {
    NSInteger count = [HHAlertManager sharedManager].alertStack.count;
    HHAlertView *previousAlert = nil;
    if (count > 1) {
        NSInteger index = [[HHAlertManager sharedManager].alertStack indexOfObject:self];
        previousAlert = [HHAlertManager sharedManager].alertStack[index - 1];
    }
    
    if (previousAlert && previousAlert.vc) {
        if (previousAlert.isAlertReady) {
            [previousAlert.vc hideAlertWithCompletion:^{
                [self showAlertHandle];
            }];
        } else {
            [self showAlertHandle];
        }
    } else {
        [self showAlertHandle];
    }
}

- (void)showAlertHandle {
    
}



@end

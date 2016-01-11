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

@interface HHAlertView ()<HHAlertViewControllerDelegate>

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
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    if (keywindow != [HHAlertManager sharedManager].alertWindow) {
        [HHAlertManager sharedManager].originWindow = [UIApplication sharedApplication].keyWindow;
    }
    
    HHAlertViewController *vc = [[HHAlertViewController alloc] init];
    vc.delegate = self;
    vc.alertView = self;
    self.vc = vc;
    
    [HHAlertManager sharedManager].alertWindow.frame = [UIScreen mainScreen].bounds;
    [[HHAlertManager sharedManager].alertWindow makeKeyAndVisible];
    [HHAlertManager sharedManager].alertWindow.rootViewController = self.vc;
    
    [self.vc showAlert];
}

- (void)coverViewTouched {
    
    if (self.isDismissWhenTouchBackground) {
        [self dismissAlertWithCompletion:nil];
    }
}

- (void)dismissAlertWithCompletion:(void(^)(void))completion{
    [self.vc hideAlertWithCompletion:^{
        [self stackHandle];
        
        if (completion) {
            completion();
        }
        
        NSInteger count = [HHAlertManager sharedManager].alertStack.count;
        if (count > 0) {
            HHAlertView *lastAlert = [HHAlertManager sharedManager].alertStack.lastObject;
            [lastAlert showAlert];
        }
    }];
}

- (void)stackHandle{
    [[HHAlertManager sharedManager].alertStack removeObject:self];
    
    NSInteger count = [HHAlertManager sharedManager].alertStack.count;
    if (count == 0) {
        [self toggleKeyWindow];
    }
}

- (void)toggleKeyWindow{
    [[HHAlertManager sharedManager].originWindow makeKeyAndVisible];
    [HHAlertManager sharedManager].alertWindow.rootViewController = nil;
    [HHAlertManager sharedManager].alertWindow.frame = CGRectZero;
}


@end

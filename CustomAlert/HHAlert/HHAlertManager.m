//
//  HHAlertManager.m
//  CustomAlert
//
//  Created by 黄董 on 16/1/11.
//  Copyright © 2016年 huangxinyu. All rights reserved.
//

#import "HHAlertManager.h"

@interface HHAlertManager ()

@property (nonatomic, strong) UIWindow *alertWindow;
@property (nonatomic, weak) UIWindow *originWindow;

@end

@implementation HHAlertManager

static HHAlertManager *manager;
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HHAlertManager alloc] init];
    });
    return manager;
}

- (UIWindow *)alertWindow {
    if (nil == _alertWindow) {
        _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _alertWindow.windowLevel = UIWindowLevelStatusBar - 1;
    }
    return _alertWindow;
}

- (NSMutableArray *)alertStack {
    if (nil == _alertStack) {
        _alertStack = [NSMutableArray new];
    }
    return _alertStack;
}

@end

//
//  HHAlertManager.h
//  CustomAlert
//
//  Created by 黄董 on 16/1/11.
//  Copyright © 2016年 huangxinyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHAlertManager : NSObject

@property (nonatomic, strong) UIWindow *alertWindow;
@property (nonatomic, weak) UIWindow *originWindow;
@property (nonatomic, strong) NSMutableArray *alertStack;

+ (instancetype)sharedManager;

@end

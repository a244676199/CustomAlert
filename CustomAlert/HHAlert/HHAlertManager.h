//
//  HHAlertManager.h
//  CustomAlert
//
//  Created by 黄董 on 16/1/11.
//  Copyright © 2016年 huangxinyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHAlertManager : NSObject

@property (nonatomic, strong) NSMutableArray *alertStack;

+ (instancetype)sharedManager;

@end

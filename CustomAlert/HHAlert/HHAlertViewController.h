//
//  HHAlertViewController.h
//  CustomAlert
//
//  Created by 黄董 on 16/1/11.
//  Copyright © 2016年 huangxinyu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHAlertView;

/**
 *  JCViewControllerDelegate
 */
@protocol HHAlertViewControllerDelegate <NSObject>
@optional
- (void)coverViewTouched;

@end

/**
 *  HHAlertViewController
 */
@interface HHAlertViewController : UIViewController

@property (nonatomic, strong) UIImageView *screenShotView;
@property (nonatomic, strong) UIButton *coverView;
@property (nonatomic, weak) HHAlertView *alertView;
@property (nonatomic, weak) id <HHAlertViewControllerDelegate> delegate;

- (void)hideAlertWithCompletion:(void(^)(void))completion;
- (void)showAlert;

@end


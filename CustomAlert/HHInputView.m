//
//  HHInputView.m
//  CustomAlert
//
//  Created by hxy on 16/1/11.
//  Copyright © 2016年 huangxinyu. All rights reserved.
//

#import "HHInputView.h"
#import <Masonry.h>

@interface HHInputView ()

@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation HHInputView

+ (instancetype)inputView {
    HHInputView *v = [[HHInputView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    return v;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //[self setup];
    }
    return self;
}

- (void)setup {
    self.dismissWhenTouchBackground = YES;
    self.alertView = [UIView new];
    self.alertView.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.alertView];
    
    self.textView = [UITextView new];
    [self addSubview:self.textView];
    
    [self makeConstraints];
}

- (void)makeConstraints {
    
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(300, 200));
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.alertView).mas_equalTo(10);
        make.right.mas_equalTo(self.alertView).offset(-10);
        make.height.mas_equalTo(30);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

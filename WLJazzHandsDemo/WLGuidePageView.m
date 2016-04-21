//
//  WLGuidePageView.m
//  WLJazzHandsDemo
//
//  Created by Lane on 16/4/21.
//  Copyright © 2016年 lane128. All rights reserved.
//

#import "WLGuidePageView.h"

@interface WLGuidePageView ()

@end

@implementation WLGuidePageView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.mainView = [[UIView alloc] init];
    self.mainView.backgroundColor = [UIColor whiteColor];
    self.subView = [[UIView alloc] init];
    self.subView.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:self.mainView];
    [self addSubview:self.subView];
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(40);
        make.left.equalTo(self).offset(40);
        make.right.equalTo(self).offset(-40);
        make.bottom.equalTo(self).offset(-150);
    }];
}

@end

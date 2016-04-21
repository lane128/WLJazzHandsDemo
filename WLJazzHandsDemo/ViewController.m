//
//  ViewController.m
//  WLJazzHandsDemo
//
//  Created by Lane on 16/4/21.
//  Copyright © 2016年 lane128. All rights reserved.
//

#import "ViewController.h"
#import "WLGuidePageView.h"

@interface ViewController ()

@property (nonatomic, strong) WLGuidePageView *pageOne;
@property (nonatomic, strong) WLGuidePageView *pageTwo;
@property (nonatomic, strong) WLGuidePageView *pageThree;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollView];
    [self addAnimationForPageViews];
}

- (NSUInteger)numberOfPages {
    return 3;
}

- (CGFloat)pageWidth {
    return VERTICAL_SCREEN_WIDTH;
}

- (void)setupScrollView {
    self.scrollView.bounces = NO;
    
    WLGuidePageView *pageOne = [[WLGuidePageView alloc] init];
    self.pageOne = pageOne;
    pageOne.backgroundColor = [UIColor redColor];
    [pageOne.subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(50);
        make.centerX.equalTo(pageOne);
        make.top.equalTo(pageOne.mainView.mas_bottom).offset(50);
    }];
    
    WLGuidePageView *pageTwo = [[WLGuidePageView alloc] init];
    self.pageTwo = pageTwo;
    pageTwo.backgroundColor = [UIColor greenColor];
    [pageTwo.subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(50);
        make.left.equalTo(pageTwo.mas_right);
        make.top.equalTo(pageTwo.mainView.mas_bottom).offset(50);
    }];
    
    WLGuidePageView *pageThree = [[WLGuidePageView alloc] init];
    self.pageThree = pageThree;
    pageThree.backgroundColor = [UIColor blueColor];
    [pageThree.subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(50);
        make.left.equalTo(pageThree.mas_right);
        make.top.equalTo(pageThree.mainView.mas_bottom).offset(50);
    }];
    
    [self.contentView addSubview:pageOne];
    [self.contentView addSubview:pageTwo];
    [self.contentView addSubview:pageThree];
    
    [pageOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(VERTICAL_SCREEN_WIDTH);
        make.top.bottom.equalTo(self.view);
        make.left.equalTo(self.contentView);
    }];
    
    [pageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(VERTICAL_SCREEN_WIDTH);
        make.left.equalTo(pageOne.mas_right);
        make.top.bottom.equalTo(self.view);
    }];
    
    [pageThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(VERTICAL_SCREEN_WIDTH);
        make.top.bottom.equalTo(self.view);
        make.left.equalTo(pageTwo.mas_right);
    }];
}

- (void)addAnimationForPageViews {
    IFTTTTranslationAnimation *pageOneTranslation = [IFTTTTranslationAnimation animationWithView:self.pageTwo.subView];
    [pageOneTranslation addKeyframeForTime:0 translation:CGPointZero];
    CGFloat offsetX = (VERTICAL_SCREEN_WIDTH - 150)/2.0 + 150;
    [pageOneTranslation addKeyframeForTime:1 translation:CGPointMake(-offsetX, 0)];
    [self.animator addAnimation:pageOneTranslation];
}

@end

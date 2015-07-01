//
//  BBWhearController.m
//  customPan
//
//  Created by T on 15/7/1.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBWhearController.h"

@interface BBWhearController ()
@property (nonatomic, weak) UIButton *coverBtn;
@end

@implementation BBWhearController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.bounds = CGRectMake(0, 0, 100, 44);
    titleLab.text = @"天气";
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLab;
    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    
    UIButton *button = [[UIButton alloc] init];
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:@"homepage_leftitem"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"homepage_leftitem_press"] forState:UIControlStateHighlighted];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moveBtn) name:BBTransformViewNoti object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)moveBtn{
    [self coverBtnClick:self.coverBtn];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)swipeRight{
    [self leftButtonClick];
}

- (void)leftButtonClick{
    [UIView animateWithDuration:0.4 animations:^{
        self.tabBarController.view.transform = CGAffineTransformMakeTranslation(kScreenW * 0.7, 0);
    } completion:^(BOOL finished) {
        UIButton *coverBtn = [[UIButton alloc] init];
        coverBtn.frame = self.tabBarController.view.bounds;
        [self.tabBarController.view addSubview:coverBtn];
        self.coverBtn = coverBtn;
        [coverBtn addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
}

- (void)coverBtnClick:(UIButton *)btn{
    BBLog(@"coverBtnClick");
    
    [UIView animateWithDuration:0.4 animations:^{
        self.tabBarController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [btn removeFromSuperview];
    }];
}

@end

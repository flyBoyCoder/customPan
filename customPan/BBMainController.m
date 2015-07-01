//
//  BBMainController.m
//  customPan
//
//  Created by T on 15/7/1.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBMainController.h"
#import "BBLeftController.h"
#import "BBTabbarController.h"
CGFloat const scale = 0.8;
CGFloat const animationDurationTime = 0.5;
@interface BBMainController ()
@property (nonatomic, weak) BBLeftController *leftVC;
@property (nonatomic, weak) BBTabbarController *tabVC;
@property (nonatomic, weak) UIButton *coverBtn;
@end


@implementation BBMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BBLeftController *leftVC = [[BBLeftController alloc] init];
//    leftVC.view.backgroundColor = BBColor(22, 51, 73, 0.5);
    leftVC.view.frame = CGRectMake(-kScreenW * scale, 0, kScreenW * scale, kScreenH);
    [self.view addSubview:leftVC.view];
    [self addChildViewController:leftVC];
    self.leftVC = leftVC;
    
    BBTabbarController *tabVC = [[BBTabbarController alloc] init];
    tabVC.view.backgroundColor = [UIColor orangeColor];
    tabVC.view.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    [self.view addSubview:tabVC.view];
    [self addChildViewController:tabVC];
    self.tabVC = tabVC;
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tabVC.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.tabVC.view addGestureRecognizer:swipeLeft];
}

- (void)swipeRight{
    BBLog(@"swipeRight");
    [UIView animateWithDuration:animationDurationTime animations:^{
        self.leftVC.view.transform = CGAffineTransformMakeTranslation(kScreenW * scale, 0);
        self.tabVC.view.transform = CGAffineTransformMakeTranslation(kScreenW * scale, 0);
    }completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }];
}

- (void)swipeLeft{
    BBLog(@"swipeLeft");
    [UIView animateWithDuration:animationDurationTime animations:^{
        self.leftVC.view.transform = CGAffineTransformIdentity;
        self.tabVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }];
}

@end

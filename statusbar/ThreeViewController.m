//
//  ThreeViewController.m
//  statusbar
//
//  Created by Product Division 1 on 15/9/11.
//  Copyright (c) 2015年 Product Division 1. All rights reserved.
//

#import "FirstNavigationController.h"
#import "UINavigationController+Tracking.h"
#import "ThreeViewController.h"


@interface ThreeViewController()<PHNavigationControllerDelegate>

@end

@implementation ThreeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"Three";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"Pop" forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 90, 60, 40);
    [btn addTarget:self action:@selector(popBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)popBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"OK");
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(BOOL)navigationControllerShouldPopWhenSystemBackBtnSelected:(UINavigationController *)navigationController
{
    return NO;
}

@end

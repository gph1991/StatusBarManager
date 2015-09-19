//
//  SecondNavigationController.m
//  statusbar
//
//  Created by Product Division 1 on 15/9/11.
//  Copyright (c) 2015年 Product Division 1. All rights reserved.
//

#import "SecondNavigationController.h"


@interface SecondNavigationController()<UIGestureRecognizerDelegate>

@end

@implementation SecondNavigationController

-(void)viewDidLoad
{
    [super viewDidLoad];
    id target = self.interactivePopGestureRecognizer.delegate;

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
}







-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.childViewControllers.count == 1) {
        return NO;
    }

    return YES;
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return self.topViewController.preferredStatusBarStyle;;
}

-(BOOL)prefersStatusBarHidden
{
    return self.topViewController.prefersStatusBarHidden;
}


@end

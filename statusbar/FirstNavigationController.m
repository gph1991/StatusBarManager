//
//  FirstNavigationController.m
//  statusbar
//
//  Created by Product Division 1 on 15/9/11.
//  Copyright (c) 2015年 Product Division 1. All rights reserved.
//

#import "FirstNavigationController.h"
@interface UINavigationController (PHNavigationController)
-(BOOL)navigationBar:(UINavigationBar*)navigationBar shouldPopItem:(UINavigationItem *)item;
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementatio"

@implementation UINavigationController (PHNavigationController)


@end

#pragma clang diagnostic pop


@interface FirstNavigationController()<UIGestureRecognizerDelegate,UINavigationBarDelegate>

@end

@implementation FirstNavigationController


-(void)viewDidLoad
{
    [super viewDidLoad];
//    id target = self.interactivePopGestureRecognizer.delegate;
//    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
//    pan.delegate = self;
//    [self.view addGestureRecognizer:pan];
//    self.interactivePopGestureRecognizer.enabled = NO;
}






//
//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    if (self.childViewControllers.count == 1) {
//        return NO;
//    }
//    
//    return YES;
//}
//
//
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return self.topViewController.preferredStatusBarStyle;
//}
//
//-(BOOL)prefersStatusBarHidden
//{
//    return self.topViewController.prefersStatusBarHidden;
//}

-(BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    UIViewController *vc = self.topViewController;
    
    if (item != vc.navigationItem) {
        //说明是Pop方法
        return [super navigationBar:navigationBar shouldPopItem:item];
    }
    
    if ([vc conformsToProtocol:@protocol(PHNavigationControllerDelegate) ])
    {
        if ([(id<PHNavigationControllerDelegate>)vc navigationControllerShouldPopWhenSystemBackBtnSelected:self])
        {
            //不拦截就返回默认
            return [super navigationBar:navigationBar shouldPopItem:item];
        }
    
        return NO;
    }
    else
    {
        //未继承就返回默认
        return [super navigationBar:navigationBar shouldPopItem:item];
    }
}

//- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item
//{
//    UIViewController *vc = self.topViewController;
//    return YES;
//}
//
//- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item
//{
//    UIViewController *vc = self.topViewController;
//}
//
//- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item
//{
//    UIViewController *vc = self.topViewController; 
//}


@end

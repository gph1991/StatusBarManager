//
//  UINavigationController+Tracking.m
//  statusbar
//
//  Created by Product Division 1 on 15/9/17.
//  Copyright (c) 2015年 GPH. All rights reserved.
//
#import "FirstNavigationController.h"
#import <objc/runtime.h>
#import "UINavigationController+Tracking.h"


static NSString *const kOriginDeleaget  = @"kOriginDelegate";

@implementation UINavigationController (Tracking)

/*
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(navigationBar:shouldPopItem:);
        SEL swizzledSelector = @selector(phNavigationbar:shouldPopItem:);
        
//        Method originMethod = class_getClassMethod(class, originalSelector);
        Method originMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }
        else
        {
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
    });
}
*/

-(void)yy_viewDidLoad
{
    [self yy_viewDidLoad];
    objc_setAssociatedObject(self, [kOriginDeleaget UTF8String], self.interactivePopGestureRecognizer.delegate, OBJC_ASSOCIATION_ASSIGN);
    NSLog(@"%@",self.interactivePopGestureRecognizer.delegate);
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

-(BOOL)phNavigationbar:(UINavigationBar*)navigationBar shouldPopItem:(UINavigationItem*)item
{
    UIViewController *vc = self.topViewController;
    
    if(item != vc.navigationItem)
    {
        return YES;
    }
    if ([vc conformsToProtocol:@protocol(PHNavigationControllerDelegate) ])
    {
        if ([(id<PHNavigationControllerDelegate>)vc navigationControllerShouldPopWhenSystemBackBtnSelected:self])
        {
            return [self phNavigationbar:navigationBar shouldPopItem:item];
        }
        
        
        return NO;
    }
    else
    {
        return [self phNavigationbar:navigationBar shouldPopItem:item];
    }
    
    return YES;
}



-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        UIViewController *vc = self.topViewController;
    
        if ([vc conformsToProtocol:@protocol(PHNavigationControllerDelegate) ])
        {
            if (![(id<PHNavigationControllerDelegate>)vc navigationControllerShouldPopWhenSystemBackBtnSelected:self])
            {
                return NO;
            }
        }

        id<UIGestureRecognizerDelegate> originDelegate = objc_getAssociatedObject(self, [kOriginDeleaget UTF8String]);
        return [originDelegate gestureRecognizerShouldBegin:gestureRecognizer];
    }
    
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        id<UIGestureRecognizerDelegate> originDelegate = objc_getAssociatedObject(self, [kOriginDeleaget UTF8String]);
        return [originDelegate gestureRecognizerShouldBegin:gestureRecognizer];
    }
    
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        id<UIGestureRecognizerDelegate> originDelegate = objc_getAssociatedObject(self, [kOriginDeleaget UTF8String]);
        return [originDelegate gestureRecognizerShouldBegin:gestureRecognizer];
    }
    
    return YES;
}



@end

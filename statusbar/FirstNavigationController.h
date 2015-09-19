//
//  FirstNavigationController.h
//  statusbar
//
//  Created by Product Division 1 on 15/9/11.
//  Copyright (c) 2015年 Product Division 1. All rights reserved.
//

#import <UIKit/UIKit.h>



@class FirstNavigationController;
@protocol PHNavigationControllerDelegate <NSObject>

@optional
-(BOOL)navigationControllerShouldPopWhenSystemBackBtnSelected:(UINavigationController*)navigationController;
-(BOOL)navigationControllerShouldStartInteractivePopGestureRecognizer:(UINavigationController*)navigationController;
@end

@interface FirstNavigationController : UINavigationController

@end





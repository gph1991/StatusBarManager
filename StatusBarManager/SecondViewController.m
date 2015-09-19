//
//  SecondViewController.m
//  StatusBarManager
//
//  Created by GPH on 9/19/15.
//  Copyright © 2015 GPH. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    //白底黑字
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    //不隐藏
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

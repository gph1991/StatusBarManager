//
//  ViewController.m
//  StatusBarManager
//
//  Created by GPH on 9/19/15.
//  Copyright © 2015 GPH. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    pushBtn.frame = CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width-100, 40);
    [pushBtn addTarget:self action:@selector(pushBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
}

-(void)pushBtnDown
{
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondVC animated:YES];
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    //黑底白字
    return UIStatusBarStyleLightContent;
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

@end

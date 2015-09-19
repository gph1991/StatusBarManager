//
//  ViewController.m
//  statusbar
//
//  Created by Product Division 1 on 15/9/11.
//  Copyright (c) 2015年 Product Division 1. All rights reserved.
//

#import "ThreeViewController.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance]setTintColor:[UIColor redColor]];
    self.view.backgroundColor = [UIColor blueColor];
    self.view.layer.allowsEdgeAntialiasing;
    
    
    NSInteger uu;
    NSNumber *no = @-10;
    self.testLabel.text = [NSString stringWithFormat:@"%u",[no unsignedIntegerValue]];

    
    UIImage *image = [UIImage imageNamed:@"iTunesArtwork"];
    
//    [image imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    [[UINavigationBar appearance]setBackIndicatorImage:nil];
//    [[UINavigationBar appearance]setBackIndicatorTransitionMaskImage:nil];
//    CGFloat cost = image.size.height * image.size.width * image.scale;
//    NSLog(@"%f",cost);
    
//    [NSTimer scheduledTimerWithTimeInterval:0.5 invocation:nil repeats:YES];
//    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(pushto:) userInfo:nil repeats:YES];
//    [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(pushto:) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    UINavigationItem *nav = self.navigationItem.backBarButtonItem;
    [super viewDidAppear:animated];
    NSLog(@"OK");
}

- (IBAction)pushto:(id)sender {
    
    ThreeViewController *vc = [[ThreeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}



@end

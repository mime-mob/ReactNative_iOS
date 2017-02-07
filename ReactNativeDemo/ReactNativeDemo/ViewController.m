//
//  ViewController.m
//  ReactNativeDemo
//
//  Created by Mime97 on 2017/1/22.
//  Copyright © 2017年 Mime. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *heightScoreButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.heightScoreButton];
}

- (UIButton *)heightScoreButton {
    if (!_heightScoreButton) {
        _heightScoreButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 100, 50)];
        [_heightScoreButton setTitle:@"HeightScore" forState:UIControlStateNormal];
        [_heightScoreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_heightScoreButton addTarget:self action:@selector(heightScoreButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _heightScoreButton;
}

- (void)heightScoreButtonPressed {
    NSLog(@"High Score Button Pressed");
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios"];
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                         moduleName        : @"RNHighScores"
                         initialProperties :
     @{
       @"scores" : @[
               @{
                   @"name" : @"Alex",
                   @"value": @"42"
                   },
               @{
                   @"name" : @"Joel",
                   @"value": @"10"
                   }
               ]
       }
                          launchOptions    : nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

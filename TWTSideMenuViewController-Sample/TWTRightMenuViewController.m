//
// Created by Kris Baker on 3/8/14.
// Copyright (c) 2014 Two Toasters. All rights reserved.
//

#import "TWTRightMenuViewController.h"
#import "TWTMainViewController.h"
#import "TWTMainViewController.h"
#import "TWTSideMenuViewController.h"

@interface TWTRightMenuViewController ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation TWTRightMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];



    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy"]];
    self.backgroundImageView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, -CGRectGetWidth(self.view.bounds), 0);
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;

    CGRect imageViewRect = [[UIScreen mainScreen] bounds];
    imageViewRect.size.width += 589;
    self.backgroundImageView.frame = imageViewRect;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.backgroundImageView];

    NSDictionary *viewDictionary = @{ @"imageView" : self.backgroundImageView };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]" options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]" options:0 metrics:nil views:viewDictionary]];

    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    closeButton.frame = CGRectMake(110.0f, 100.0f, 200.0f, 44.0f);
    [closeButton setBackgroundColor:[UIColor whiteColor]];
    [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [closeButton setTitle:@"Close Right" forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];

    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    changeButton.frame = CGRectMake(110.0f, 200.0f, 200.0f, 44.0f);
    [changeButton setTitle:@"Swap Right" forState:UIControlStateNormal];
    [changeButton setBackgroundColor:[UIColor greenColor]];
    [changeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(changeButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
}

- (void)changeButtonPressed
{
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:[TWTMainViewController new]];
    [self.sideMenuViewController setMainViewController:controller animated:YES closeMenu:YES];
}

- (void)closeButtonPressed
{
    [self.sideMenuViewController closeRightMenuAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
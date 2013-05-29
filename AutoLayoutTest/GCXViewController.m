//
//  GCXViewController.m
//  AutoLayoutTest
//
//  Created by David Linsin on 05/27/13.
//  Copyright (c) 2013 grandcentrix GmbH. All rights reserved.
//

#import "GCXViewController.h"

@interface GCXViewController ()

@end

@implementation GCXViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    [button2 setTranslatesAutoresizingMaskIntoConstraints:NO];

    UIView *customView = [[UIView alloc] init];
    [customView setTranslatesAutoresizingMaskIntoConstraints:NO];
    customView.backgroundColor = [UIColor lightGrayColor];

    UILabel *label = [[UILabel alloc] init];
    label.text = @"Hello Auto-Layout";
    label.backgroundColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    label.textColor = [UIColor blackColor];

    [customView addSubview:label];


    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:customView];

    NSDictionary *metrics = @{@"buttonSpace" : @50.0, @"topSpace" : @20.0};

    UIView *superview = customView;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(button1, button2, customView, label, superview);

    //Create the constraints using the visual language format
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-buttonSpace-[button1(button2)]-buttonSpace-[button2]-buttonSpace-|"
                                                                      options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:metrics views:viewsDictionary]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[customView]|"
                                                                      options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:metrics views:viewsDictionary]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpace-[button1]-topSpace-[customView]|"
                                                                      options:0 metrics:metrics views:viewsDictionary]];

    [customView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[superview]-(<=1)-[label]"
                                                                      options:NSLayoutFormatAlignAllCenterX metrics:metrics views:viewsDictionary]];
    [customView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[superview]-(<=1)-[label]"
                                                                      options:NSLayoutFormatAlignAllCenterY metrics:metrics views:viewsDictionary]];
}

@end
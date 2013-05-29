//
//  GCXAppDelegate.h
//  AutoLayoutTest
//
//  Created by David Linsin on 05/27/13.
//  Copyright (c) 2013 grandcentrix GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCXViewController;

@interface GCXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) GCXViewController *viewController;

@end
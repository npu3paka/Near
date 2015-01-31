//
//  AppDelegate.m
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {

@private __strong UIView *statusBg;

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    statusBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    
    //Add the view behind the status bar
    [self.window.rootViewController.view addSubview:statusBg];
    
    //set the constraints to auto-resize
    statusBg.translatesAutoresizingMaskIntoConstraints = NO;
    [statusBg.superview addConstraint:[NSLayoutConstraint constraintWithItem:statusBg attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:statusBg.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [statusBg.superview addConstraint:[NSLayoutConstraint constraintWithItem:statusBg attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:statusBg.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [statusBg.superview addConstraint:[NSLayoutConstraint constraintWithItem:statusBg attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:statusBg.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [statusBg.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[statusBg(==20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(statusBg)]];
    [statusBg.superview setNeedsUpdateConstraints];

    [self _initializeVersionWindow];
    
    return YES;
}

- (void)_initializeVersionWindow
{
    // Ensure the version window is above the status bar.
    [self.window setWindowLevel:UIWindowLevelStatusBar + 1.0];
    
    NSLog(@"level stats bar: %f", UIWindowLevelStatusBar);
    // Ensure the version window is not hidden.
    [self.window setHidden:NO];
    
    // Disabe all user interaction with the version window.
    [self.window setUserInteractionEnabled:NO];
    
    // Enable autoresizing of the version window's subviews so the labels are correctly resized when the device's orientation changes.
    [self.window setAutoresizesSubviews:YES];
    
    // Reposition the window so it is above the status bar.
    //[self _repositionWindowToMatchStatusBar];
    
    // Create a label to display the version number.
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *versionNumber = [info objectForKey:@"CFBundleShortVersionString"];
    
    UILabel *versionLabel = [[UILabel alloc] init];
    versionLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
    | UIViewAutoresizingFlexibleRightMargin;
    versionLabel.backgroundColor = [UIColor clearColor];
    versionLabel.textColor = [UIColor greenColor];
    versionLabel.font = [UIFont boldSystemFontOfSize: 10.0f];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.text = [NSString stringWithFormat:@"v%@", versionNumber];
    [versionLabel sizeToFit];
    
    // Create a label to display the build number.
    NSString *buildNumber = [info objectForKey:@"CFBundleVersion"];
    
    UILabel *buildLabel = [[UILabel alloc] init];
    buildLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
    | UIViewAutoresizingFlexibleRightMargin;
    buildLabel.backgroundColor = versionLabel.backgroundColor;
    buildLabel.textColor = versionLabel.textColor;
    buildLabel.font = versionLabel.font;
    buildLabel.textAlignment = NSTextAlignmentCenter;
    buildLabel.text = [NSString stringWithFormat:@"Build %@", buildNumber];
    [buildLabel sizeToFit];
    
    // Position the version and build labels so they are on either side of the clock in the status bar.
    CGRect versionLabelFrame = versionLabel.frame;
    CGRect buildLabelFrame = buildLabel.frame;
    
    versionLabelFrame.size.height = statusBg.bounds.size.height;
    buildLabelFrame.size.height = statusBg.bounds.size.height;
    
    versionLabelFrame.origin.x = floorf(statusBg.bounds.size.width / 3.0f) - (versionLabelFrame.size.width / 2.0f);
    buildLabelFrame.origin.x = floorf(statusBg.bounds.size.width / 3.0f * 2.0f) - (buildLabelFrame.size.width / 2.0f);
    
    versionLabel.frame = versionLabelFrame;
    buildLabel.frame = buildLabelFrame;
    
    [statusBg addSubview: versionLabel];
    [statusBg addSubview: buildLabel];
    
    // Listen for changes to the status bar frame because the version window will need to be repositioned each time the status bar changes.
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(_repositionWindowToMatchStatusBar)
                                                 name: UIApplicationDidChangeStatusBarFrameNotification
                                               object: nil];
}

- (void)_repositionWindowToMatchStatusBar
{
    UIApplication *sharedApplication = [UIApplication sharedApplication];
    
    // Rotate the version window so that it is the same orientation as the status bar.
    CGFloat angle = 0.0f;
    switch(sharedApplication.statusBarOrientation)
    {
        case UIInterfaceOrientationPortrait:
        {
            angle =  0.0f;
            
            break;
        }
            
        case UIInterfaceOrientationLandscapeLeft:
        {
            angle = -0;
            
            break;
        }
            
        case UIInterfaceOrientationLandscapeRight:
        {
            angle =  0;
            
            break;
        }
            
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            angle =  M_PI;
            
            break;
        }
    }
    
    statusBg.transform = CGAffineTransformMakeRotation(angle);
    
    // Resize the version window so it will sit just above the status bar.
    statusBg.frame = sharedApplication.statusBarFrame;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  LoginView.h
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginDelegate

- (void) tryingToSignInWithData:(NSDictionary *)data;
- (void) tryingToSignUpWithData:(NSDictionary *)data;
@end

@interface LoginView : UIView
//===========================================================

#pragma mark -
#pragma mark Properties
#pragma mark -

//===========================================================
@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *retypePassField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;

@property (nonatomic, retain) id<LoginDelegate> delegate;
-(void) drawView;
@end

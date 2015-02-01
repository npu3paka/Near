//
//  LoginView.m
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

//===========================================================

#pragma mark -
#pragma mark Properties
#pragma mark -

//===========================================================
@synthesize usernameField = _usernameField, passwordField = _passwordField, retypePassField = _retypePassField, loginButton = _loginButton, registerButton = _registerButton;

-(instancetype)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(void) drawView {
    
    _usernameField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.width, 40.0f)];
    
    _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(0, _usernameField.bottom + 10.0f, self.width, 40.0f)];
    
    _retypePassField = [[UITextField alloc] initWithFrame:CGRectMake(0, _passwordField.bottom + 10.0f, self.width, 40.0f)];
    
    _usernameField.placeholder = @"Username";
    _passwordField.placeholder = @"Password";
    _retypePassField.placeholder = @"Retype Password";
    
    _usernameField.textAlignment = NSTextAlignmentCenter;
    _passwordField.textAlignment = NSTextAlignmentCenter;
    _retypePassField.textAlignment = NSTextAlignmentCenter;
    
    _usernameField.layer.borderWidth = 2;
    _passwordField.layer.borderWidth = 2;
    _retypePassField.layer.borderWidth = 2;
   
    [self addSubview:_usernameField];
    [self addSubview:_passwordField];
    [self addSubview:_retypePassField];
    
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, _retypePassField.bottom + 10.0f, self.width, 40.0f)];
    _registerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, _loginButton.bottom + 10.0f, self.width, 40.0f)];
    
    _loginButton.titleLabel.text = @"Login";
    _registerButton.titleLabel.text = @"Register";
    
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    
    [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_loginButton addTarget:self action:@selector(loginPressed) forControlEvents:UIControlEventTouchUpInside];
    [_registerButton addTarget:self action:@selector(registerPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self addSubview:_loginButton];
    [self addSubview:_registerButton];
    
}

-(void) loginPressed {
    
    NSDictionary *data = @{ @"username" : _usernameField.text,
                            @"password" : _passwordField.text
                            };
    [_delegate tryingToSignInWithData:data];
}

- (void) registerPressed {
    NSDictionary *data = @{ @"username" : _usernameField.text,
                            @"password" : _passwordField.text,
                            @"repassword" : _retypePassField.text
                            };
    [_delegate tryingToSignUpWithData:data];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

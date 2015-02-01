//
//  LoginViewController.m
//  Near
//
//  Created by 158ltd Developer on 1/31/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController () <LoginDelegate>

@property (nonatomic) MyManager *manager;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [MyManager sharedManager];
    LoginView *vi = [[LoginView alloc]init];
    
    vi.delegate = self;
    
    vi.frame = CGRectMake(20, 100, 320, 300);
    
    [vi drawView];
    
    [self.view addSubview:vi];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tryingToSignInWithData:(NSDictionary *)data {
    NSString *username = [data objectForKey:@"username"];
    NSString *passwrod = [data objectForKey:@"password"];
    
    if (!_manager.meteor.websocketReady) {
        UIAlertView *notConnectedAlert = [[UIAlertView alloc] initWithTitle:@"Connection Error"
                                                                    message:@"Can't find the Todo server, try again"
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
        [notConnectedAlert show];
        return;
    }
    [_manager.meteor logonWithUsername:username password:passwrod responseCallback:^(NSDictionary *response, NSError *error) {
        if (error) {
            [self handleFailedAuth:error];
            return;
        }
        [self handleSuccessfulAuth];
    }];
    
    NSLog(@"data: %@", data);
    
}

-(void)tryingToSignUpWithData:(NSDictionary *)data {
    NSString *username = [data objectForKey:@"username"];
    NSString *passwrod = [data objectForKey:@"password"];
    
    [_manager.meteor signupWithUsername:username password:passwrod fullname:@"" responseCallback:^(NSDictionary *response, NSError *error) {
        if (error) {
            [self handleFailedAuth:error];
            return;
        }
        [self handleSuccessfulAuth];
    }];
}
#pragma mark - Internal

- (void)handleSuccessfulAuth {
    
    NSLog(@"success");
//    ListViewController *controller = [[ListViewController alloc] initWithNibName:@"ListViewController"
//                                                                          bundle:nil
//                                                                          meteor:self.meteor];
//    controller.userId = self.meteor.userId;
//    [self.navigationController pushViewController:controller animated:YES];
}

- (void)handleFailedAuth:(NSError *)error {
    [[[UIAlertView alloc] initWithTitle:@"Meteor Todos" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Try Again" otherButtonTitles:nil] show];
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

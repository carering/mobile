//
//  RegistrationViewController.m
//  CareRingProfile
//
//  Created by James Stiehl on 1/11/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import "RegistrationViewController.h"


@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Registration View Loaded");

    self.view.backgroundColor = [UIColor colorWithRed:0.29 green:0.53 blue:0.91 alpha:1.0];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataReceived:) name:@"httpDataReceived" object:nil];

    
    //Adding a tap gesture recognizer so if someone taps the screen, it will hide the keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    //Set the number of taps required to initiate the action.
    tap.numberOfTapsRequired = 1;
    
    //Add this gesture recognizer to our views list of recognizers.
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButton:(id)sender {
    
    email = self.emailField.text;
    password = self.passwordField.text;
    address = self.addressField.text;
    phone = self.phoneField.text;
    firstName = self.firstNameField.text;
    lastName = self.lastNameField.text;
    //Need to add some sort of validation to the text field entries add an alert if anything is blank?
    
    json = [NSDictionary dictionaryWithObjectsAndKeys:email,@"email",password, @"password", firstName, @"firstName", lastName, @"lastName", address, @"address", phone, @"phone", nil];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json
                                                           options:NSJSONWritingPrettyPrinted error:&error];
    
    self.myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.myAppDelegate.request httpRequest:@"http://carering.herokuapp.com/register" requestMethod:@"POST" reqData:jsonData];
    
}


-(void)dataReceived :(NSNotification *)notification{
    json = [notification object];
    NSLog(@"%@", json);
    self.myAppDelegate.user = [NSUserDefaults standardUserDefaults];
    NSInteger uid = [[json objectForKey:@"insertId"] integerValue];
    [self.myAppDelegate.user setInteger:uid forKey:@"uid"];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *firstView = [storyboard instantiateViewControllerWithIdentifier:@"ringsView"];
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0] makeKeyAndVisible];
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0] setRootViewController:firstView];
    [self dismissViewControllerAnimated:TRUE completion:nil];
//    [myAppDelegate.window.rootViewController presentViewController:firstView animated:FALSE completion:^{
//        
//    }];
    
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:FALSE completion:nil];
}

-(void)hideKeyboard {
    
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.confirmField resignFirstResponder];
    [self.firstNameField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    [self.phoneField resignFirstResponder];
    [self.addressField resignFirstResponder];
    
    //[self hideKeyboard];
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

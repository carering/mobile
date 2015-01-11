//
//  LoginScreen.m
//  CareRingProfile
//
//  Created by James Stiehl on 1/11/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import "LoginScreen.h"

@implementation LoginScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.29 green:0.53 blue:0.91 alpha:1.0];
    //check for NSUserDefaults for login here.  If nil then I can launch the login screen.
    // Do any additional setup after loading the view, typically from a nib.
    
    //Adding a tap gesture recognizer so if someone taps the screen, it will hide the keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    //Set the number of taps required to initiate the action.
    tap.numberOfTapsRequired = 1;
    
    //Add this gesture recognizer to our views list of recognizers.
    [self.view addGestureRecognizer:tap];
    
}


- (IBAction)loginButton:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(void)hideKeyboard {
    NSLog(@"here");
   [self.emailTextField resignFirstResponder];
   [self.passwordTextField resignFirstResponder];
    //[self hideKeyboard];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyboard];
    NSLog(@"here also");
    
    //Needs a return value to know if a return should be inserted in the textfield.
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self hideKeyboard];
}



@end

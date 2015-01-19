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
    self.emailTextField.enablesReturnKeyAutomatically = YES;
    self.emailTextField.text = nil;
    self.passwordTextField.text = nil;
    
}


- (IBAction)loginButton:(id)sender {
    
    if([self.emailTextField.text isEqual:@""] || [self.passwordTextField.text isEqual:@""]){
        //prompt to enter details
        NSLog(@"must have both email and password!");
    } else {
        [self dismissViewControllerAnimated:TRUE completion:nil];
        
    }

}
- (IBAction)registrationButton:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegistrationViewController *registration = [storyboard instantiateViewControllerWithIdentifier:@"registrationView"];
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0] makeKeyAndVisible];
    
    [self presentViewController:registration animated:TRUE completion:^{
        
    }];
    
}

-(void)hideKeyboard {

   [self.emailTextField resignFirstResponder];
   [self.passwordTextField resignFirstResponder];
    //[self hideKeyboard];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyboard];
    
    //Needs a return value to know if a return should be inserted in the textfield.
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self hideKeyboard];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"should begin");
    if (textField == self.emailTextField) {
        NSLog(@"yeeeeeppp!!!");

    }
    return TRUE;
}



@end

//
//  RegistrationViewController.h
//  CareRingProfile
//
//  Created by James Stiehl on 1/11/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "AppDelegate.h"

@interface RegistrationViewController : UIViewController{
    NSDictionary *json;
    NSDictionary *registrationInfo;
    NSString *email;
    NSString *password;
    NSString *firstName;
    NSString *lastName;
    NSString *phone;
    NSString *address;
    //probably need to add address to this
}

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property AppDelegate *myAppDelegate;
@end

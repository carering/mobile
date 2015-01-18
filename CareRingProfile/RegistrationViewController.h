//
//  RegistrationViewController.h
//  CareRingProfile
//
//  Created by James Stiehl on 1/11/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface RegistrationViewController : UIViewController<NSURLConnectionDelegate>{
    NSDictionary *json;
    NSDictionary *registrationInfo;
    NSString *email;
    NSString *password;
    //probably need to add address to this
}

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmField;

@end

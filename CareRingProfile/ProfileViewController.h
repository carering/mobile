//
//  ProfileViewController.h
//  CareRingProfile
//
//  Created by James Stiehl on 1/10/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

@property (weak, nonatomic) IBOutlet UITableView *profileTableView;
@property NSDictionary *json;
@property NSArray *fields;
@property NSArray *profile;
@property (weak, nonatomic) IBOutlet UILabel *profileLabel;

@end

//
//  ProfileViewController.m
//  CareRingProfile
//
//  Created by James Stiehl on 1/10/15.
//  Copyright (c) 2015 James Stiehl. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataReceived:) name:@"httpDataReceived" object:nil];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:0.29 green:0.53 blue:0.91 alpha:1.0];
    self.profileTableView.scrollEnabled = NO;
    [self.profileTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.profileTableView.backgroundColor = [UIColor colorWithRed:0.29 green:0.53 blue:0.91 alpha:1.0];
    self.profileLabel.backgroundColor = [UIColor colorWithRed:0.10 green:0.41 blue:0.91 alpha:1.0];
    self.profileImage.image = [UIImage imageNamed:@"apple.png"];
    
    // Do any additional setup after loading the view.
    self.fields = [NSArray arrayWithObjects:@"Name",@"Email",@"Phone Number", @"Address",@"Brownies", nil];
    
    
    [myAppDelegate.request httpRequest:@"http://carering.herokuapp.com/profile/11" requestMethod:nil reqData:nil];
    
}


-(void)dataReceived: (NSNotification *)notification {
    
    self.json = [notification object];
    NSLog(@"Data looks like %@",[notification object]);
    NSString *firstName = [self.json objectForKey:@"first_name"];
    NSString *lastName = [self.json objectForKey:@"last_name"];
    
    NSString *fullName = [NSString stringWithFormat:@"%@ %@",firstName, lastName];
    
    NSString *profileName = fullName;
    NSString *emailAddress = [self.json objectForKey:@"email"];
    NSString *phone = [self.json objectForKey:@"phone"];
    NSString *address = [self.json objectForKey:@"address"];
    NSString *brownies = @"12";
    self.profile = [NSArray arrayWithObjects:profileName, emailAddress,phone,address,brownies, nil];
    
    [self.profileTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma -mark
#pragma TableView datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //returns the number of sections you need.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //how many rows are in each of the above sections (Total number of cells needing to be displayed).
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //This sets the size of the cell at any given index.
    return 66;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //The actual code to return each cell, configured with the data you want to display.
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    cell.textLabel.text = [self.fields objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:22.0];
    cell.backgroundColor = [UIColor colorWithRed:0.29 green:0.53 blue:0.91 alpha:1.0];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Arial" size:18.0];


    if(indexPath.row == 0){
      //cell.imageView.image = [UIImage imageNamed:@"apple.png"];
    }
    //If tableview cell is initialized with UITableViewCellStyleSubtitle, then we can use this.
    if (!self.json) {
      cell.detailTextLabel.text = @"Loading...";
    }else {
      cell.detailTextLabel.text = [self.profile objectAtIndex:indexPath.row];
    }
    
    return cell;
    
}

#pragma -mark
#pragma TableView delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //This delegate method gets call when a user taps a TableView cell. This method sends the index of the tapped cell in the indexpath argument.
    
    //Show an animated deselection of the selected cell.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
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

//
//  GIGMasterViewController.m
//  masterDetail
//
//  Created by Rishabh Alaap Singh on 12/1/13.
//  Copyright (c) 2013 singh.rishabhalaap. All rights reserved.
//

#import "GIGConsumerMasterViewController.h"
#import "GIGConsumerDetailViewController.h"
#import "AADViewController.h"
#import "GIGLogInViewController.h"
#import "GIGSignUpViewController.h"

static const CGFloat kHPTButtonHeight = 44.0;
static const CGFloat kHPTButtonMargin = 20.0;
static const CGFloat kHPTButtonBottomOffset = 35.0;
static const CGFloat kHPTLabelTopOffset = 100.0;


@interface GIGConsumerMasterViewController () {
    NSMutableArray *_objects;
}
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *signupButton;
@property (nonatomic, strong) UIView *darkOverlayView;

@end

@implementation GIGConsumerMasterViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"GIGConsumerCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"GIGConsumerCell" bundle:nil]
         forCellReuseIdentifier:@"FormCell"];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
}


// Login Page

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if (![PFUser currentUser]) { // No user logged in
        
        // Instantiate our custom log in view controller
        GIGLogInViewController *logInViewController = [[GIGLogInViewController alloc] init];
        [logInViewController setDelegate:self];
        [logInViewController setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil]];
        [logInViewController setFields:PFLogInFieldsUsernameAndPassword
         | PFLogInFieldsLogInButton
         | PFLogInFieldsSignUpButton
         | PFLogInFieldsDismissButton];
        
        // Instantiate our custom sign up view controller
        GIGSignUpViewController *signUpViewController = [[GIGSignUpViewController alloc] init];
        [signUpViewController setDelegate:self];
        [signUpViewController setFields:PFSignUpFieldsDefault];
        
        // Link the sign up view controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
        
        //        // Create the log in view controller
        //        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        //        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        //
        //        // Create the sign up view controller
        //        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        //        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        //
        //        // Assign our sign up controller to be displayed from the login controller
        //        [logInViewController setSignUpController:signUpViewController];
        //
        //        // Present the log in view controller
        //        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    
//    // Create a new PFObject to represent this To-Do item.
//    PFObject *service = [PFObject objectWithClassName:@"Services"];
//    [service setObject:@"Wale" forKey:@"ServiceTitle"];
//    [service setObject:@"Escort" forKey:@"ServiceSubtitle"];
//    [service setObject:@"Special ;)" forKey:@"ServiceDescription"];
//    [service setObject:[PFUser currentUser] forKey:@"User"];
//    [service save];
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"OMG");
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GIGConsumerCell" forIndexPath:indexPath];
    //
    //    NSDate *object = _objects[indexPath.row];
    //    cell.textLabel.text = [object description];
    //    return cell;
    
    //    ---ATTEMPTING DEV.APPLE IMPL ---
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
//    TODO: make everything dict-wise
//    NSDictionary *item = (NSDictionary *)[self.content objectAtIndex:indexPath.row];
//    cell.textLabel.text = [item objectForKey:@"mainTitleKey"];
//    cell.detailTextLabel.text = [item objectForKey:@"secondaryTitleKey"];
//    NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
//    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
//    cell.imageView.image = theImage;
    
    cell.textLabel.text = @"Cell_Title";
    cell.detailTextLabel.text = @"Cell_Subtitle";
    UIImage *theImage = [UIImage imageNamed:@"bench.png"];
    cell.imageView.image = theImage;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}


#pragma Login/Signup Protocols

// Login Protocols

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password
{
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}


// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}

//Sign Up Protocols

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL]; // Dismiss the PFSignUpViewController
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}


@end

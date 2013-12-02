//
//  GIGSignUpViewController.m
//  Gig
//
//  Created by Wale Desalu on 12/1/13.
//  Copyright (c) 2013 desalu.adewale. All rights reserved.
//

#import "GIGSignUpViewController.h"

UIImageView *fieldsBackground;

@interface GIGSignUpViewController ()

@property (nonatomic, strong)UIImageView *fieldsBackground;

@end

@implementation GIGSignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bench.png"]]];
    
    // Add login field background
    self.fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"black.png"]];
    [self.signUpView insertSubview:self.fieldsBackground atIndex:1];
    
    // Remove text shadow
    CALayer *layer = self.signUpView.usernameField.layer;
    layer.shadowOpacity = 0.0;
    layer = self.signUpView.passwordField.layer;
    layer.shadowOpacity = 0.0;
    
    // Set field text color
    [self.signUpView.usernameField setTextColor:[UIColor colorWithRed:44.0f/255.0f green:62.0f/255.0f blue:80.0f/255.0f alpha:1.0]];
    [self.signUpView.passwordField setTextColor:[UIColor colorWithRed:44.0f/255.0f green:62.0f/255.0f blue:80.0f/255.0f alpha:1.0]];
    [self.signUpView.emailField setTextColor:[UIColor colorWithRed:44.0f/255.0f green:62.0f/255.0f blue:80.0f/255.0f alpha:1.0]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Move all fields down on smaller screen sizes
    float yOffset = [UIScreen mainScreen].bounds.size.height <= 480.0f ? 30.0f : 0.0f;
    
    CGRect fieldFrame = self.signUpView.usernameField.frame;
    
    [self.signUpView.dismissButton setFrame:CGRectMake(10.0f, 10.0f, 87.5f, 45.5f)];
    [self.signUpView.logo setFrame:CGRectMake(66.5f, 100.0f, 187.0f, 58.5f)];
    [self.signUpView.signUpButton setFrame:CGRectMake(35.0f, 385.0f, 250.0f, 40.0f)];
    [self.fieldsBackground setFrame:CGRectMake(35.0f, fieldFrame.origin.y + yOffset, 250.0f, 130.0f)];
    
    [self.signUpView.usernameField setFrame:CGRectMake(fieldFrame.origin.x + 5.0f,
                                                       fieldFrame.origin.y + yOffset,
                                                       fieldFrame.size.width - 10.0f,
                                                       fieldFrame.size.height)];
    yOffset += fieldFrame.size.height;
    
    [self.signUpView.passwordField setFrame:CGRectMake(fieldFrame.origin.x + 5.0f,
                                                       fieldFrame.origin.y + yOffset,
                                                       fieldFrame.size.width - 10.0f,
                                                       fieldFrame.size.height)];
    yOffset += fieldFrame.size.height;
    
    [self.signUpView.emailField setFrame:CGRectMake(fieldFrame.origin.x + 5.0f,
                                                    fieldFrame.origin.y + yOffset,
                                                    fieldFrame.size.width - 10.0f,
                                                    fieldFrame.size.height)];
    yOffset += fieldFrame.size.height;
    
    [self.signUpView.additionalField setFrame:CGRectMake(fieldFrame.origin.x + 5.0f,
                                                         fieldFrame.origin.y + yOffset,
                                                         fieldFrame.size.width - 10.0f,
                                                         fieldFrame.size.height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

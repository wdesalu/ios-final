//
//  GIGFormViewController.m
//  Gig
//
//  Created by Wale Desalu on 12/2/13.
//  Copyright (c) 2013 desalu.adewale. All rights reserved.
//

#import "GIGFormViewController.h"

@interface GIGFormViewController ()

@end

@implementation GIGFormViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButton:(id)sender {
    NSString *title= self.titleField.text;
    NSString *subtitle= self.subtitleField.text;
    NSString *description= self.descriptionField.text;
    NSString *rate= self.rateField.text;
    if ([title length] == 0) {
        // Do nothing if the text field is empty.
        return;
    }
    
    
    // Create a new PFObject to represent this To-Do item.
    PFObject *service = [PFObject objectWithClassName:@"Services"];
    [service setObject:title forKey:@"ServiceTitle"];
    [service setObject:subtitle forKey:@"ServiceSubtitle"];
    [service setObject:description forKey:@"ServiceDescription"];
    [service setObject:rate forKey:@"ServiceRate"];
    [service setObject:[PFUser currentUser] forKey:@"User"];
    [service save];
}
@end

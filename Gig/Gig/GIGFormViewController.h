//
//  GIGFormViewController.h
//  Gig
//
//  Created by Wale Desalu on 12/2/13.
//  Copyright (c) 2013 desalu.adewale. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>

@interface GIGFormViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextField *subtitleField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionField;
@property (strong, nonatomic) IBOutlet UITextField *rateField;
- (IBAction)submitButton:(id)sender;

@end

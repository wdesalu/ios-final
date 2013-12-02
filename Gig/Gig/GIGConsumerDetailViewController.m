//
//  GIGConsumerDetailViewController.m
//  masterDetail
//
//  Created by Rishabh Alaap Singh on 12/1/13.
//  Copyright (c) 2013 singh.rishabhalaap. All rights reserved.
//

#import "GIGConsumerDetailViewController.h"

@interface GIGConsumerDetailViewController ()
- (void)configureView;
@end

@implementation GIGConsumerDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


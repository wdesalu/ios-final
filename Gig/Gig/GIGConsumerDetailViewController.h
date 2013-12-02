//
//  GIGConsumerDetailViewController.h
//  tabIntoTables
//
//  Created by Rishabh Alaap Singh on 12/1/13.
//  Copyright (c) 2013 singh.rishabhalaap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GIGConsumerDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
//
//  HHMasterViewController.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/4/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHEditClientViewController.h"

@class HHDetailViewController;

@interface HHMasterViewController : UITableViewController <HHEditClientViewControllerDelegate>

@property (strong, nonatomic) HHDetailViewController *detailViewController;

@end

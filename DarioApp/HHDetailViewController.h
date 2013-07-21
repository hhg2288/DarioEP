//
//  HHDetailViewController.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/4/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Backbeam/Backbeam.h>
#import "HHEditClientViewController.h"

@interface HHDetailViewController : UIViewController <UISplitViewControllerDelegate, HHEditClientViewControllerDelegate>

@property (strong, nonatomic) BBObject *client;

@property (weak, nonatomic) IBOutlet UILabel *clientFirstName;
@property (weak, nonatomic) IBOutlet UILabel *clientLastName;
@property (weak, nonatomic) IBOutlet UILabel *clientEmail;
@property (weak, nonatomic) IBOutlet UILabel *clientPendingSessions;
@property (weak, nonatomic) IBOutlet UIButton *editBTN;
@property (weak, nonatomic) IBOutlet UIButton *sessionBTN;

@end

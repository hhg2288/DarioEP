//
//  HHDetailViewController.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/4/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHEditClientViewController.h"
#import "HHSessionViewController.h"
#import "HHClient.h"

@interface HHDetailViewController : UIViewController <UISplitViewControllerDelegate, HHEditClientViewControllerDelegate, HHSessionViewControllerDelegate>

@property (weak, nonatomic) HHClient *client;

@property (weak, nonatomic) IBOutlet UILabel *clientFirstName;
@property (weak, nonatomic) IBOutlet UILabel *clientLastName;
@property (weak, nonatomic) IBOutlet UILabel *clientEmail;
@property (weak, nonatomic) IBOutlet UILabel *clientPendingSessions;
@property (weak, nonatomic) IBOutlet UIButton *editBTN;
@property (weak, nonatomic) IBOutlet UIButton *sessionBTN;

@end

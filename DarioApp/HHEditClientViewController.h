//
//  HHEditClientViewController.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/20/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Backbeam/Backbeam.h>

@class HHEditClientViewController;

@protocol HHEditClientViewControllerDelegate <NSObject>

- (void)editClientViewControllerDidSave:(HHEditClientViewController *)controller;
- (void)edidClientViewControllerDidCancel:(HHEditClientViewController *)controller;

@end

@interface HHEditClientViewController : UIViewController

@property (nonatomic, weak) id <HHEditClientViewControllerDelegate> delegate;
@property (nonatomic, strong) BBObject *clientInEdition;

@property (weak, nonatomic) IBOutlet UITextField *inputFirstName;
@property (weak, nonatomic) IBOutlet UITextField *inputLastName;
@property (weak, nonatomic) IBOutlet UITextField *inputEmail;
@property (weak, nonatomic) IBOutlet UITextField *inputPendingSessions;

- (void)populateViewWithClient;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

//
//  HHSessionViewController.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/23/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Backbeam/Backbeam.h>

@class HHSessionViewController;

@protocol HHSessionViewControllerDelegate <NSObject>

- (void)sessionClientViewControllerDidSave:(HHSessionViewController *)controller;
- (void)sessionClientViewControllerDidCancel:(HHSessionViewController *)controller;

@end



@interface HHSessionViewController : UIViewController

@property (nonatomic, weak) id <HHSessionViewControllerDelegate> delegate;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end

//
//  HHDetailViewController.m
//  DarioApp
//
//  Created by Horacio Herrera on 7/4/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import "HHDetailViewController.h"
#import "HHSessionViewController.h"
#import <Backbeam/Backbeam.h>

@interface HHDetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;


@end

@implementation HHDetailViewController

#pragma mark - Managing the detail item

- (void)setClient:(BBObject *)newClient
{
    if (_client != newClient) {
        _client = newClient;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.client) {
        [self enableClientActions];
        self.clientFirstName.text = [_client stringForField:@"firstname"];
        self.clientLastName.text = [_client stringForField:@"lastname"];
        self.clientEmail.text = [_client stringForField:@"email"];
        self.clientPendingSessions.text = [NSString stringWithFormat:@"%@", [_client numberForField:@"pendingsessions"]];
    } else {
        //NSLog(@"no hay objeto!");
        [self disableClientActions];
    }
}

#pragma mark - Managing the detail item

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

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - HHEditClientVC Delegate Methods

- (void)editClientViewControllerDidSave:(HHEditClientViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)edidClientViewControllerDidCancel:(HHEditClientViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - HHSessionClientVC Delegate Methods

- (void)sessionClientViewControllerDidSave:(HHSessionViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sessionClientViewControllerDidCancel:(HHSessionViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - PrepareForSeque

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"edit"])
    {
        //set  it as delegate to close it later
        HHEditClientViewController *cdvc = segue.destinationViewController;
        cdvc.delegate = self;
        
        //set de data Client
        cdvc.clientInEdition = _client;
        
    } else if ([segue.identifier isEqualToString:@"SessionClient"])
    {
        HHSessionViewController *modalcontroller = segue.destinationViewController;
        modalcontroller.delegate = self;
    }
    
}

#pragma mark - Enable/Disable Client Action BTNs

- (void) enableClientActions
{
    self.editBTN.enabled = YES;
    self.sessionBTN.enabled = YES;
}

- (void) disableClientActions
{
    self.editBTN.enabled = NO;
    self.sessionBTN.enabled = NO;
}










@end

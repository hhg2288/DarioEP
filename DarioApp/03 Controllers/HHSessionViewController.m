//
//  HHSessionViewController.m
//  DarioApp
//
//  Created by Horacio Herrera on 7/23/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import "HHSessionViewController.h"

@interface HHSessionViewController ()

@end

@implementation HHSessionViewController

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

- (IBAction)save:(id)sender
{
    [self.delegate sessionClientViewControllerDidSave:self];
}

- (IBAction)cancel:(id)sender
{
    [self.delegate sessionClientViewControllerDidCancel:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

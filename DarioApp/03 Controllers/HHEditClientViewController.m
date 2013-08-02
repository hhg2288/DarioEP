//
//  HHEditClientViewController.m
//  DarioApp
//
//  Created by Horacio Herrera on 7/20/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import "HHEditClientViewController.h"

@interface HHEditClientViewController ()

@end

@implementation HHEditClientViewController

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
    [self populateViewWithClient];
}

- (void)populateViewWithClient
{
    if (!_clientInEdition)
    {
        //NSLog(@"crear el objeto porque no existe");
        _clientInEdition = [Backbeam emptyObjectForEntity:@"client"];
    }
    else {
        //se rellenan los campos con los datos del user
        self.inputFirstName.text = [_clientInEdition stringForField:@"firstname"];
        self.inputLastName.text = [_clientInEdition stringForField:@"lastname"];
        self.inputEmail.text = [_clientInEdition stringForField:@"email"];
        self.inputPendingSessions.text = [NSString stringWithFormat:@"%@", [_clientInEdition numberForField:@"pendingsessions"]];
    }
}

- (IBAction)save:(id)sender
{
    [self.delegate editClientViewControllerDidSave:self];
    [self saveClient];
}

- (IBAction)cancel:(id)sender
{
    [self.delegate edidClientViewControllerDidCancel:self];
}

- (void)saveClient
{
      [_clientInEdition setString:self.inputFirstName.text forField:@"firstname"];
      [_clientInEdition setString:self.inputLastName.text forField:@"lastname"];
      [_clientInEdition setString:self.inputEmail.text forField:@"email"];
      [_clientInEdition setNumber:[NSNumber numberWithFloat:[self.inputPendingSessions.text floatValue]] forField:@"pendingsessions"];
      [_clientInEdition save:^(BBObject* obj) {
          
          
      } failure:^(BBObject* obj, NSError* error) {
          // Something went wrong
          //NSLog(@"got error: %@", error);
      }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

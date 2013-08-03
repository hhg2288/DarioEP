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
        _clientInEdition = [[HHClient alloc] init];
    }
    else {
        //se rellenan los campos con los datos del user
        self.inputFirstName.text = [_clientInEdition firstName];
        self.inputLastName.text = [_clientInEdition lastName];
        self.inputEmail.text = [_clientInEdition email];
        self.inputPendingSessions.text = [NSString stringWithFormat:@"%@", [_clientInEdition paidSessions]];
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
    //METODO DEL DELEGADO DEL MODELO PARA GUARDAR DATOS DE UN CLIENTE MAS
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

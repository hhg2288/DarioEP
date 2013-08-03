//
//  HHMasterViewController.m
//  DarioApp
//
//  Created by Horacio Herrera on 7/4/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import "HHMasterViewController.h"
#import "HHDetailViewController.h"
#import "HHClientCell.h"
#import "HHClient.h"
#import "HHDataSetup.h"


@interface UITableView (reloadCategory)

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

@end

@implementation UITableView (reloadCategory)

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    if ([self.dataSource numberOfSectionsInTableView:self] <= indexPath.section) {
        return;
    }
    if ([self.dataSource tableView:self numberOfRowsInSection:indexPath.section] <= indexPath.row) {
        return;
    }
    [self reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:animation];
}

@end


@interface HHMasterViewController () {
    NSMutableArray *theClients;
}

@end

@implementation HHMasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.detailViewController = (HHDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    HHDataSetup *data = [[HHDataSetup alloc] initWithDataFromService];
    theClients = [data theData];
    
    [self setupRefreshControl];
}

- (void)updateClients
{
    [self.refreshControl endRefreshing];
}

- (void)setupRefreshControl
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    [refreshControl addTarget:self action:@selector(updateClients) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)CreateNewClient:(BBObject *)client
{
    if (!theClients) {
        theClients = [[NSMutableArray alloc] init];
    }
    //modal para crear nuevo cliente
    [theClients insertObject:client atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return theClients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHClientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    HHClient *client = [theClients objectAtIndex:indexPath.row];
    cell.firstName.text = [client firstName];
    cell.lastName.text = [client lastName];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //pasar los datos del cliente al otro viewController
    //NSDate *object = theClients[indexPath.row];
    //self.detailViewController.detailItem = object;
    
    BBObject *clientSelected = theClients[indexPath.row];
    self.detailViewController.client = clientSelected;
}

- (BOOL)isClientLoad
{
    if (theClients)
    {
        return YES;
    }
    return NO;
}


#pragma mark - HHEditClientVC Delegate Methods

- (void)editClientViewControllerDidSave:(HHEditClientViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self CreateNewClient:controller.clientInEdition];
}

- (void)edidClientViewControllerDidCancel:(HHEditClientViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - PrepareForSeque

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ModalNewClient"])
    {
        //set  it as delegate to close it later
        HHEditClientViewController *cdvc = segue.destinationViewController;
        cdvc.delegate = self;
        
    }
}




@end

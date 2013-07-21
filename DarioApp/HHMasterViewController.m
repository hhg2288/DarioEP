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
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.detailViewController = (HHDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    BBQuery* query = [Backbeam queryForEntity:@"client"];
    // optional: you can set a fetch policy
    [query setFetchPolicy:BBFetchPolicyLocalAndRemote];
    [query fetch:100 offset:0 success:^(NSArray* clients, NSInteger totalCount, BOOL fromCache) {
        
        // do something with these objects
        theClients = [NSMutableArray arrayWithArray:clients];
        [self.tableView reloadData];
        //NSLog(@"%@", clients);
        
    } failure:^(NSError* error) {
        // something went wrong
    }];
    
    
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
    BBObject *client = [theClients objectAtIndex:indexPath.row];
    cell.firstName.text = [client stringForField:@"firstname"];
    cell.lastName.text = [client stringForField:@"lastname"];
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
    
    if ([segue.identifier isEqualToString:@"NewClient"])
    {
        //set  it as delegate to close it later
        HHEditClientViewController *cdvc = segue.destinationViewController;
        cdvc.delegate = self;
        
    }
    
}




@end

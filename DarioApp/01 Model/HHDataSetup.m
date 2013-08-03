//
//  HHDataSetup.m
//  DarioApp
//
//  Created by Horacio Herrera on 7/27/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import "HHDataSetup.h"
#import "HHClient.h"
#import <Backbeam/Backbeam.h>

@implementation HHDataSetup

- (id)initWithDataFromService
{
    self = [super init];
    if (self) {
        BBQuery* query = [Backbeam queryForEntity:@"client"];
        [query setQuery:@"join avatar"];
        // optional: you can set a fetch policy
        [query setFetchPolicy:BBFetchPolicyLocalAndRemote];
        [query fetch:100 offset:0 success:^(NSArray* clients, NSInteger totalCount, BOOL fromCache) {
            NSLog(@"%@", clients);
            
            [self serializeDataFromArray:clients];
            
            
        } failure:^(NSError* error) {
            // something went wrong
        }];
    }
    return self;
}

- (void)serializeDataFromArray:(NSArray *)arrayFromFetch
{
    NSMutableArray *arrayPreviousSorting = [[NSMutableArray alloc] init];
    
    for (id client in arrayFromFetch)
    {
        HHClient *tempClient = [[HHClient alloc] initWithFirstName:[client stringForField:@"firstname"] lastName:[client stringForField:@"lastname"] email:[client stringForField:@"email"] birthDate:nil paidSessions:[NSString stringWithFormat:@"%@", [client numberForField:@"pendingsessions"]] usedSessions:nil];
        [arrayPreviousSorting addObject:tempClient];
    }
    
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    NSArray *sortDescriptors = @[ sorter ];
    _theData = [NSMutableArray arrayWithArray:[arrayPreviousSorting sortedArrayUsingDescriptors:sortDescriptors]];
}

- (void)save
{
    
}

- (void)update
{
    
}

- (BOOL)isEmpty
{
    if (_theData) {
        return NO;
    }
    return YES;
}

- (void)addClientToService:(HHClient *)client 
{
    // IMPLEMENT DELEGATE PROTOCOL TO SAVE DATA. PARA SUSTITUIR 'SELF' POR CONTROLLER
    
//    [client setString:self.inputFirstName.text forField:@"firstname"];
//    [client setString:self.inputLastName.text forField:@"lastname"];
//    [client setString:self.inputEmail.text forField:@"email"];
//    [client setNumber:[NSNumber numberWithFloat:[self.inputPendingSessions.text floatValue]] forField:@"pendingsessions"];
//    [client save:^(BBObject* obj) {
//        
//        
//    } failure:^(BBObject* obj, NSError* error) {
//        // Something went wrong
//        //NSLog(@"got error: %@", error);
//    }];
}


@end

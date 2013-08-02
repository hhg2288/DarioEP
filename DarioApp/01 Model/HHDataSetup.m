//
//  HHDataSetup.m
//  DarioApp
//
//  Created by Horacio Herrera on 7/27/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import "HHDataSetup.h"
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
            
            _theData = [NSMutableArray arrayWithArray:clients];
            
        } failure:^(NSError* error) {
            // something went wrong
        }];
    }
    return self;
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


@end

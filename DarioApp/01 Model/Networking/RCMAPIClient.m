//
//  RCMAPIClient.m
//  DarioApp
//
//  Created by Ricardo Caballero on 26/01/14.
//  Copyright (c) 2014 Horacio Herrera. All rights reserved.
//

#import "RCMAPIClient.h"

#import "User.h"
#import "Session.h"

#import <Backbeam/Backbeam.h>

@implementation RCMAPIClient

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static RCMAPIClient *sharedInstance;
    dispatch_once(&onceToken, ^ {
        sharedInstance = [[RCMAPIClient alloc] init];
    });
    return sharedInstance;
}

- (void)GETUsers:(RCMRequestCompletionBlock)completionBlock
{
    BBQuery* query = [Backbeam queryForEntity:@"client"];
    // optional: you can set a fetch policy
    [query setFetchPolicy:BBFetchPolicyLocalAndRemote];
    [query fetch:100 offset:0 success:^(NSArray* objects, NSInteger totalCount, BOOL fromCache) {
        
        NSMutableArray *usersArray = [NSMutableArray array];
        
        for (id user in objects) {
            [usersArray addObject:[User objectForAPIResponse:user]];
        }
        
        completionBlock(usersArray, nil);
        
    } failure:^(NSError* error) {
        completionBlock(nil, error);
    }];
}

- (void)GETSessions:(RCMRequestCompletionBlock)completionBlock
{
    BBQuery* query = [Backbeam queryForEntity:@"session"];
    // optional: you can set a fetch policy
    [query setFetchPolicy:BBFetchPolicyLocalAndRemote];
    [query fetch:100 offset:0 success:^(NSArray* objects, NSInteger totalCount, BOOL fromCache) {
        
        NSMutableArray *sessionsArray = [NSMutableArray array];
        
        for (id user in objects) {
            [sessionsArray addObject:[Session objectForAPIResponse:user]];
        }
        
        completionBlock(sessionsArray, nil);
        
    } failure:^(NSError* error) {
        completionBlock(nil, error);
    }];
}

@end

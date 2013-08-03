//
//  HHDataSetup.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/27/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHClient.h"

@interface HHDataSetup : NSObject 

@property (nonatomic, strong) NSMutableArray *theData;
@property (nonatomic, strong) NSDate *lastTimeSaved;

- (id)initWithDataFromService;
- (void)save;
- (void)update;
- (BOOL)isEmpty;
- (void)addClientToService:(HHClient *)client;

@end

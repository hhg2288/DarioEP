//
//  WOOManagedObject.h
//  DarioApp
//
//  Created by Ricardo Caballero on 31/10/13.
//  Copyright (c) 2013 Ricardo Caballero. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "RCMAPIResponseCoreDataMappingProtocol.h"


@interface RCMManagedObject : NSManagedObject <RCMAPIResponseCoreDataMappingProtocol>

@end

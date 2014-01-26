//
//  RCMAPIResponseCoreDataMappingProtocol.h
//  DarioApp
//
//  Created by Ricardo Caballero on 26/01/14.
//  Copyright (c) 2014 Horacio Herrera. All rights reserved.
//

@protocol RCMAPIResponseCoreDataMappingProtocol <NSObject>

@required
+ (NSManagedObject *)objectForAPIResponse:(id)response;

@end

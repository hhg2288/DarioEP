//
//  WOOManagedObject.m
//  DarioApp
//
//  Created by Ricardo Caballero on 31/10/13.
//  Copyright (c) 2013 Ricardo Caballero. All rights reserved.
//

#import "RCMManagedObject.h"

@implementation RCMManagedObject

- (void)awakeFromInsert
{
    if ([self respondsToSelector:@selector(setCreatedAt:)]) {
        [self setValue:[NSDate date] forKey:@"createdAt"];
    }
}

+ (NSManagedObject *)objectForAPIResponse:(id)response
{
    NSAssert(YES, @"You should implement this method");
    
    return nil;
}

@end

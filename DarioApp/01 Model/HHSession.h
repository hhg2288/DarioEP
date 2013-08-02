//
//  HHSession.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/27/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHSession : NSObject

@property (nonatomic, strong) NSDate *dateUsed;
@property (nonatomic, strong) NSData *signature;
@property (nonatomic, strong) NSString *note;

@end

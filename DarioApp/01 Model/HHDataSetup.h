//
//  HHDataSetup.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/27/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHDataSetup : NSObject {
    NSMutableDictionary *theData;
}

- (void)fetchData;
- (void)saveData;
- (void)updateData;
- (BOOL)isEmpty;
- (NSDate *)lastTimePushed;

@end

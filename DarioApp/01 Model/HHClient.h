//
//  HHClient.h
//  
//
//  Created by Horacio Herrera on 7/27/13.
//
//

#import <Foundation/Foundation.h>

@interface HHClient : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSDate *birthDate;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSNumber *paidSessions;
@property (nonatomic, strong) NSDictionary *usedSessions;

- (id)initWithFirstName:(NSString *)firstname lastName:(NSString *)lastname email: (NSString *)email birthDate:(NSDate *)birthdate paidSessions:(NSNumber *)paidsessions usedSessions:(NSDictionary *)usedSessions;
- (NSString *)description;

@end

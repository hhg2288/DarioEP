//
//  HHClient.m
//  
//
//  Created by Horacio Herrera on 7/27/13.
//
//

#import "HHClient.h"

@implementation HHClient

- (id)initWithFirstName:(NSString *)firstname lastName:(NSString *)lastname email: (NSString *)email birthDate:(NSDate *)birthdate paidSessions:(NSNumber *)paidsessions usedSessions:(NSDictionary *)usedSessions
{
    self = [super init];
    if (self) {
        _firstName = firstname;
        _lastName = lastname;
        _email = email;
        _birthDate = birthdate;
        _paidSessions = paidsessions;
        _usedSessions = usedSessions;
    }
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"Client FirstName: %@; /n LastName: %@", _firstName, _lastName];
}


@end

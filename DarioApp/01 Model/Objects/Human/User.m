#import "User.h"

#import <Backbeam/Backbeam.h>

@interface User ()

// Private interface goes here.

@end


@implementation User

+ (User *)userWithEmail:(NSString *)email
{
    User *user = [[User findAllWithPredicate:[NSPredicate predicateWithFormat:@"email == %@", email]] lastObject];
    
    if (!user) {
        user = [User createInContext:[NSManagedObjectContext contextForCurrentThread]];
        user.email = email;
    }
    
    return user;
}

// Custom logic goes here.
+ (NSManagedObject *)objectForAPIResponse:(id)response
{
    BBObject *backbeamObject = (BBObject *)response;
    
    User *user = [User userWithEmail:[backbeamObject stringForField:@"email"]];
    
    // Update object
    user.name               = [backbeamObject stringForField:@"name"];
    user.surname            = [backbeamObject stringForField:@"surname"];
    user.pendingsessions    = [backbeamObject numberForField:@"pendingsessions"];
    
    [[NSManagedObjectContext contextForCurrentThread] saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if (error) NSLog(@"error saving session: %@", error);
    }];
    
    return user;

}

@end

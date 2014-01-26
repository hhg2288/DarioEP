#import "Session.h"

#import "User.h"

#import <Backbeam/Backbeam.h>

@interface Session ()

// Private interface goes here.

@end


@implementation Session

+ (Session *)sessionWithIdentifier:(NSString *)identifier
{
    Session *session = [[Session findAllWithPredicate:[NSPredicate predicateWithFormat:@"backbeamIdentifier == %@", identifier]] lastObject];
    
    if (!session) {
        session = [Session createInContext:[NSManagedObjectContext contextForCurrentThread]];
        session.backbeamIdentifier = identifier;
    }
    
    return session;
}

// Custom logic goes here.
+ (NSManagedObject *)objectForAPIResponse:(id)response
{
    BBObject *backbeamObject = (BBObject *)response;
    
    Session *session = [Session sessionWithIdentifier:backbeamObject.identifier];
    
    // Update object
    session.createdAt               = [backbeamObject dateForField:@"date"];
    session.note                    = [backbeamObject stringForField:@"note"];
    
    // Relationship
    session.user = [User userWithEmail:[[backbeamObject objectForField:@"client"] stringForField:@"email"]];
    
    
    [[NSManagedObjectContext contextForCurrentThread] saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if (error) NSLog(@"error saving session: %@", error);
    }];
    
    return session;
    
}


@end

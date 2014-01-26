// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Session.h instead.

#import <CoreData/CoreData.h>
#import "RCMManagedObject.h"

extern const struct SessionAttributes {
	__unsafe_unretained NSString *created_at;
} SessionAttributes;

extern const struct SessionRelationships {
	__unsafe_unretained NSString *user;
} SessionRelationships;

extern const struct SessionFetchedProperties {
} SessionFetchedProperties;

@class User;



@interface SessionID : NSManagedObjectID {}
@end

@interface _Session : RCMManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SessionID*)objectID;





@property (nonatomic, strong) NSDate* created_at;



//- (BOOL)validateCreated_at:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _Session (CoreDataGeneratedAccessors)

@end

@interface _Session (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreated_at;
- (void)setPrimitiveCreated_at:(NSDate*)value;





- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;


@end

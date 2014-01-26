// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>
#import "RCMManagedObject.h"

extern const struct UserAttributes {
	__unsafe_unretained NSString *birthDate;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *surname;
} UserAttributes;

extern const struct UserRelationships {
	__unsafe_unretained NSString *sessions;
} UserRelationships;

extern const struct UserFetchedProperties {
} UserFetchedProperties;

@class Session;





@interface UserID : NSManagedObjectID {}
@end

@interface _User : RCMManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UserID*)objectID;





@property (nonatomic, strong) NSDate* birthDate;



//- (BOOL)validateBirthDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* surname;



//- (BOOL)validateSurname:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *sessions;

- (NSMutableSet*)sessionsSet;





@end

@interface _User (CoreDataGeneratedAccessors)

- (void)addSessions:(NSSet*)value_;
- (void)removeSessions:(NSSet*)value_;
- (void)addSessionsObject:(Session*)value_;
- (void)removeSessionsObject:(Session*)value_;

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveBirthDate;
- (void)setPrimitiveBirthDate:(NSDate*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveSurname;
- (void)setPrimitiveSurname:(NSString*)value;





- (NSMutableSet*)primitiveSessions;
- (void)setPrimitiveSessions:(NSMutableSet*)value;


@end

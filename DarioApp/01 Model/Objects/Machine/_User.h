// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>
#import "RCMManagedObject.h"

extern const struct UserAttributes {
	__unsafe_unretained NSString *avatar;
	__unsafe_unretained NSString *birthDate;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *pendingsessions;
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





@property (nonatomic, strong) NSString* avatar;



//- (BOOL)validateAvatar:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* birthDate;



//- (BOOL)validateBirthDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* pendingsessions;



@property int16_t pendingsessionsValue;
- (int16_t)pendingsessionsValue;
- (void)setPendingsessionsValue:(int16_t)value_;

//- (BOOL)validatePendingsessions:(id*)value_ error:(NSError**)error_;





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


- (NSString*)primitiveAvatar;
- (void)setPrimitiveAvatar:(NSString*)value;




- (NSDate*)primitiveBirthDate;
- (void)setPrimitiveBirthDate:(NSDate*)value;




- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitivePendingsessions;
- (void)setPrimitivePendingsessions:(NSNumber*)value;

- (int16_t)primitivePendingsessionsValue;
- (void)setPrimitivePendingsessionsValue:(int16_t)value_;




- (NSString*)primitiveSurname;
- (void)setPrimitiveSurname:(NSString*)value;





- (NSMutableSet*)primitiveSessions;
- (void)setPrimitiveSessions:(NSMutableSet*)value;


@end

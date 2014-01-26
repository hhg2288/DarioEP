// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.m instead.

#import "_User.h"

const struct UserAttributes UserAttributes = {
	.avatar = @"avatar",
	.birthDate = @"birthDate",
	.email = @"email",
	.name = @"name",
	.pendingsessions = @"pendingsessions",
	.surname = @"surname",
};

const struct UserRelationships UserRelationships = {
	.sessions = @"sessions",
};

const struct UserFetchedProperties UserFetchedProperties = {
};

@implementation UserID
@end

@implementation _User

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (UserID*)objectID {
	return (UserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"pendingsessionsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pendingsessions"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic avatar;






@dynamic birthDate;






@dynamic email;






@dynamic name;






@dynamic pendingsessions;



- (int16_t)pendingsessionsValue {
	NSNumber *result = [self pendingsessions];
	return [result shortValue];
}

- (void)setPendingsessionsValue:(int16_t)value_ {
	[self setPendingsessions:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePendingsessionsValue {
	NSNumber *result = [self primitivePendingsessions];
	return [result shortValue];
}

- (void)setPrimitivePendingsessionsValue:(int16_t)value_ {
	[self setPrimitivePendingsessions:[NSNumber numberWithShort:value_]];
}





@dynamic surname;






@dynamic sessions;

	
- (NSMutableSet*)sessionsSet {
	[self willAccessValueForKey:@"sessions"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"sessions"];
  
	[self didAccessValueForKey:@"sessions"];
	return result;
}
	






@end

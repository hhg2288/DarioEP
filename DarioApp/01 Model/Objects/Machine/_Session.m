// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Session.m instead.

#import "_Session.h"

const struct SessionAttributes SessionAttributes = {
	.created_at = @"created_at",
	.note = @"note",
};

const struct SessionRelationships SessionRelationships = {
	.user = @"user",
};

const struct SessionFetchedProperties SessionFetchedProperties = {
};

@implementation SessionID
@end

@implementation _Session

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Session" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Session";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Session" inManagedObjectContext:moc_];
}

- (SessionID*)objectID {
	return (SessionID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic created_at;






@dynamic note;






@dynamic user;

	






@end

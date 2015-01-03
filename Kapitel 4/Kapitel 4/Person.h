//
//  Person.h
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Buch;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *buecher;
@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addBuecherObject:(Buch *)value;
- (void)removeBuecherObject:(Buch *)value;
- (void)addBuecher:(NSSet *)values;
- (void)removeBuecher:(NSSet *)values;

@end

//
//  Buch.h
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Buch : NSManagedObject

@property (nonatomic, retain) NSString * titel;
@property (nonatomic, retain) Person *person;

@end

//
//  Robot.m
//  lesson06
//
//  Created by yakov on 25.01.2024.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

@implementation Robot

- (instancetype)initWithName:(NSString *)name xCoordinate:(float)x yCoordinate:(float)y {
    self = [super init];
    if (self) {
        _name = [name copy]; // Use copy for NSString to prevent mutability issues
        _xCoordinate = x;
        _yCoordinate = y;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if ((self = [super init])) {
        _name = [coder decodeObjectOfClass:[NSString class] forKey:@"name"];
        _xCoordinate = [coder decodeDoubleForKey:@"xCoordinate"];
        _yCoordinate = [coder decodeDoubleForKey:@"yCoordinate"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeDouble:_xCoordinate forKey:@"xCoordinate"];
    [coder encodeDouble:_yCoordinate forKey:@"yCoordinate"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

//
//  Robot.m
//  lesson04
//
//  Created by yakov on 23.01.2024.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

@implementation Robot

- (instancetype)init {
    self = [super init];
    if (self) {
        _x = 0;
        _y = 0;
    }
    return self;
}

- (void)run:(DirectionBlock)directionBlock {
    NSString *direction = directionBlock();
    if ([direction isEqualToString:@"up"]) {
        self.y += 1;
    } else if ([direction isEqualToString:@"down"]) {
        self.y -= 1;
    } else if ([direction isEqualToString:@"left"]) {
        self.x -= 1;
    } else if ([direction isEqualToString:@"right"]) {
        self.x += 1;
    }
}

@end

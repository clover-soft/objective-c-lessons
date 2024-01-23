//
//  Robot.h
//  lesson04
//
//  Created by yakov on 23.01.2024.
//

#ifndef Robot_h
#define Robot_h

#import <Foundation/Foundation.h>

typedef NSString * (^DirectionBlock)(void);

@interface Robot : NSObject

@property (assign, nonatomic) NSInteger x;
@property (assign, nonatomic) NSInteger y;

- (void)run:(DirectionBlock)directionBlock;

@end


#endif /* Robot_h */

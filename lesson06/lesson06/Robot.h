//
//  Robot.h
//  lesson06
//
//  Created by yakov on 25.01.2024.
//

#ifndef Robot_h
#define Robot_h

@interface Robot : NSObject <NSCoding, NSSecureCoding>

@property (nonatomic, readonly) float xCoordinate;
@property (nonatomic, readonly) float yCoordinate;
@property (nonatomic, copy, readonly) NSString *name;


- (instancetype)initWithName:(NSString *)name xCoordinate:(float)x yCoordinate:(float)y;

@end

#endif /* Robot_h */

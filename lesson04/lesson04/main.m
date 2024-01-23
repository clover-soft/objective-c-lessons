//
//  main.m
//  lesson04
//
//  Created by yakov on 23.01.2024.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Robot *robot = [[Robot alloc] init];
        NSLog(@"Начальная позиция: (%ld, %ld)", (long)robot.x, (long)robot.y);
        
        // Двигаемся вверх
        [robot run:^NSString *{
            return @"up";
        }];
        NSLog(@"Позиция после перемещения вверх: (%ld, %ld)", (long)robot.x, (long)robot.y);
        
        // Двигаемся вниз
        [robot run:^NSString *{
            return @"down";
        }];
        NSLog(@"Позиция после перемещения вниз: (%ld, %ld)", (long)robot.x, (long)robot.y);
        
        // Двигаемся вправо
        [robot run:^NSString *{
            return @"right";
        }];
        NSLog(@"Позиция после перемещения вправо: (%ld, %ld)", (long)robot.x, (long)robot.y);
        
        // Двигаемся влево
        [robot run:^NSString *{
            return @"left";
        }];
        NSLog(@"Позиция после перемещения влево: (%ld, %ld)", (long)robot.x, (long)robot.y);
        
    }
    return 0;
}

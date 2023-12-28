#ifndef rectangle_h
#define rectangle_h
#import <Foundation/Foundation.h>
#import "figure.h"
// Класс Rectangle (прямоугольник)
@interface Rectangle : Figure

@property (nonatomic, assign) double width; // Ширина
@property (nonatomic, assign) double height; // Высота

@end

@implementation Rectangle

- (double)calculateArea {
    return self.width * self.height; // Формула для вычисления площади прямоугольника
}

- (double)calculatePerimeter {
    return 2 * (self.width + self.height); // Формула для вычисления периметра прямоугольника
}

- (void)printInfo {
    NSLog(@"Прямоугольник: ширина=%.2f, высота=%.2f, площадь=%.2f, периметр=%.2f",
          self.width, self.height, [self calculateArea], [self calculatePerimeter]);
}

@end


#endif /* rectangle_h */

#ifndef triangle_h
#define triangle_h
#import <Foundation/Foundation.h>
#import "figure.h"
// Класс Triangle (треугольник)
@interface Triangle : Figure

@property (nonatomic, assign) double side1; // Сторона 1
@property (nonatomic, assign) double side2; // Сторона 2
@property (nonatomic, assign) double side3; // Сторона 3

@end

@implementation Triangle

- (double)calculateArea {
    double p = [self calculatePerimeter] / 2;
    return sqrt(p * (p - self.side1) * (p - self.side2) * (p - self.side3)); // Формула для вычисления площади треугольника (формула Герона)
}

- (double)calculatePerimeter {
    return self.side1 + self.side2 + self.side3; // Формула для вычисления периметра треугольника
}

- (void)printInfo {
    NSLog(@"Треугольник: сторона 1=%.2f, сторона 2=%.2f, сторона 3=%.2f, площадь=%.2f, периметр=%.2f",
          self.side1, self.side2, self.side3, [self calculateArea], [self calculatePerimeter]);
}

@end
#endif /* triangle_h */

#ifndef circle_h
#define circle_h
#import <Foundation/Foundation.h>
#import "figure.h"
// Класс Circle (круг)
@interface Circle : Figure

@property (nonatomic, assign) double radius; // Радиус

@end

@implementation Circle

- (double)calculateArea {
    return M_PI * self.radius * self.radius; // Формула для вычисления площади круга
}

- (double)calculatePerimeter {
    return 2 * M_PI * self.radius; // Формула для вычисления периметра круга
}

- (void)printInfo {
    NSLog(@"Круг: радиус=%.2f, площадь=%.2f, периметр=%.2f",
          self.radius, [self calculateArea], [self calculatePerimeter]);
}

@end
#endif /* circle_h */

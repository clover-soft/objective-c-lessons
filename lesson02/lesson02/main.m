
#import <Foundation/Foundation.h>
#import "rectangle.h"
#import "triangle.h"
#import "circle.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создание массива n-фигур
        NSMutableArray *figures = [NSMutableArray array];
        
        // Создание прямоугольника
        Rectangle *rectangle = [[Rectangle alloc] init];
        rectangle.width = 5;
        rectangle.height = 3;
        [figures addObject:rectangle];
        
        // Создание круга
        Circle *circle = [[Circle alloc] init];
        circle.radius = 4;
        [figures addObject:circle];
        
        // Создание треугольника
        Triangle *triangle = [[Triangle alloc] init];
        triangle.side1 = 3;
        triangle.side2 = 4;
        triangle.side3 = 5;
        [figures addObject:triangle];
        
        // Вывод информации о каждой фигуре
        for (Figure *figure in figures) {
            [figure printInfo];
        }
    }
    return 0;
}

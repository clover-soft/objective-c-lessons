#ifndef figure_h
#define figure_h

#import <Foundation/Foundation.h>

// Абстрактный класс Figure
@interface Figure : NSObject

- (double)calculateArea; // Вычисление площади
- (double)calculatePerimeter; // Вычисление периметра
- (void)printInfo; // Вывод информации о фигуре

@end

@implementation Figure

- (double)calculateArea {
    // Абстрактный метод, должен быть переопределен в подклассах
    return 0;
}

- (double)calculatePerimeter {
    // Абстрактный метод, должен быть переопределен в подклассах
    return 0;
}

- (void)printInfo {
    // Абстрактный метод, должен быть переопределен в подклассах
}

@end


#endif /* figure_h */

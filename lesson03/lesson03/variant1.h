//
//  variant1.h
//  lesson03
//
//  Created by yakov on 29.12.2023.
//

#ifndef variant1_h
#define variant1_h

#import <Foundation/Foundation.h>

// Протокол делегата для взаимодействия между доктором и пациентом
@protocol Patient1Delegate <NSObject>

- (void)patientTakePill; // Метод, вызываемый пациентом для выполнения действия "выпить пилюлю"

@end

// Класс Doctor (Доктор)
@interface Doctor1 : NSObject

@property (nonatomic, weak) id<Patient1Delegate> delegate; // Делегат пациента

// * Cвойство delegate объявлено с модификатором weak. Это означает, что связь между доктором и пациентом является слабой ссылкой, и нет циклической зависимости между ними.

- (void)prescribeMedicine; // Метод, вызываемый доктором для назначения лекарства

@end

@implementation Doctor1

- (void)prescribeMedicine {
    // Назначение лекарства
    NSLog(@"Доктор1: Назначено лекарство, выпейте пилюлю.");
    
    // Уведомление пациента о необходимости выпить пилюлю
    if ([self.delegate respondsToSelector:@selector(patientTakePill)]) {
        [self.delegate patientTakePill];
    }
}

@end

// Класс Patient (Пациент)
@interface Patient1 : NSObject <Patient1Delegate>

@end

@implementation Patient1

- (void)patientTakePill {
    // Выпить пилюлю
    NSLog(@"Пациент1: Пью пилюлю.");
}

@end


#endif /* variant1_h */

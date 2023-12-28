#import <Foundation/Foundation.h>

// Протокол делегата для взаимодействия между доктором и пациентом
@protocol PatientDelegate <NSObject>

- (void)patientTakePill; // Метод, вызываемый пациентом для выполнения действия "выпить пилюлю"

@end

// Класс Doctor (Доктор)
@interface Doctor : NSObject

@property (nonatomic, weak) id<PatientDelegate> delegate; // Делегат пациента

// * Cвойство delegate объявлено с модификатором weak. Это означает, что связь между доктором и пациентом является слабой ссылкой, и нет циклической зависимости между ними.

- (void)prescribeMedicine; // Метод, вызываемый доктором для назначения лекарства

@end

@implementation Doctor

- (void)prescribeMedicine {
    // Назначение лекарства
    NSLog(@"Доктор: Назначено лекарство, выпейте пилюлю.");
    
    // Уведомление пациента о необходимости выпить пилюлю
    if ([self.delegate respondsToSelector:@selector(patientTakePill)]) {
        [self.delegate patientTakePill];
    }
}

@end

// Класс Patient (Пациент)
@interface Patient : NSObject <PatientDelegate>

@end

@implementation Patient

- (void)patientTakePill {
    // Выпить пилюлю
    NSLog(@"Пациент: Пью пилюлю.");
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создание экземпляров доктора и пациента
        Doctor *doctor = [[Doctor alloc] init];
        Patient *patient = [[Patient alloc] init];
        
        // Установка пациента в качестве делегата доктора
        doctor.delegate = patient;
        
        // Доктор назначает лекарство
        [doctor prescribeMedicine];
    }
    return 0;
}

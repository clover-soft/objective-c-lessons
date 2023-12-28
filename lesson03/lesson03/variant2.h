#ifndef variant2_h
#define variant2_h
#import <Foundation/Foundation.h>

// Определяем протокол DoctorDelegate, который должен реализовать каждый пациент
@protocol Doctor2Delegate <NSObject>
- (void)takePill;
@end

// Класс Doctor, который будет выписывать пилюлю
@interface Doctor2 : NSObject
// Метод для запуска процесса выписывания пилюли
- (void)givePrescriptionToPatient:(id<Doctor2Delegate>)patient;
@end

@implementation Doctor2

- (void)givePrescriptionToPatient:(id<Doctor2Delegate>)patient {
    NSLog(@"Доктор2: Выписываю пилюлю пациенту.");
    // Доктор говорит пациенту выпить пилюлю
    [patient takePill];
}

@end

// Класс Patient, который будет выпивать пилюлю
@interface Patient2 : NSObject <Doctor2Delegate>
// Метод для запроса пилюли у доктора
- (void)requestMedicineFromDoctor:(Doctor2 *)doctor;
@end

@implementation Patient2

- (void)requestMedicineFromDoctor:(Doctor2 *)doctor {
    NSLog(@"Пациент2: Прошу выписать мне пилюлю.");
    // Пациент обращается к доктору за пилюлей
    [doctor givePrescriptionToPatient:self];
}

// Реализация метода протокола DoctorDelegate
- (void)takePill {
    NSLog(@"Пациент2: Выпиваю пилюлю, которую выписал доктор.");
}

@end

#endif /* variant1_h */

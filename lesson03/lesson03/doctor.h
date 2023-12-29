#ifndef doctor_h
#define doctor_h

#import <Foundation/Foundation.h>

// Протокол, который должен реализовать пациент, чтобы выпить пилюлю
@protocol DoctorDelegate <NSObject>
- (void)takePill;
@end

// Класс Doctor, который выдаёт пилюли
@interface Doctor : NSObject
// Метод, через который доктор выдаёт пилюлю пациенту
- (void)givePillToPatient:(id<DoctorDelegate>)patient;
@end

@implementation Doctor

- (void)givePillToPatient:(id<DoctorDelegate>)patient {
    NSLog(@"Доктор2: Вот ваша пилюля.");
    // Доктор говорит пациенту выпить пилюлю
    [patient takePill];
}

@end

#endif /* doctor_h */

#ifndef patient_h
#define patient_h

// Класс Patient2, который будет выпивать пилюлю
@interface Patient : NSObject <DoctorDelegate>
// Метод для подписания под делегат и получения пилюли
- (void)registerWithDoctor:(Doctor *)doctor;
@end

@implementation Patient

// Пациент подписывается под делегат и просит доктора выдать пилюлю
- (void)registerWithDoctor:(Doctor *)doctor {
    // Пациент подписывается под делегат
    [doctor givePillToPatient:self];
}

// Реализация метода протокола DoctorDelegate
- (void)takePill {
    NSLog(@"Пациент2: Принимаю пилюлю, выданную доктором.");
}

@end


#endif /* patient_h */

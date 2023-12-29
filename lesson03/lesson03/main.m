#import <Foundation/Foundation.h>
#import "doctor.h"
#import "patient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создаем доктора и пациентов
        Doctor *doctor = [[Doctor alloc] init];
        Patient *patient1 = [[Patient alloc] init];
        Patient *patient2 = [[Patient alloc] init];
        // ... можно создать ещё пациентов

        // Пациенты подписываются под делегат доктора и выполняют его указания
        [patient1 registerWithDoctor:doctor];
        [patient2 registerWithDoctor:doctor];
        // ... каждый пациент подписывается отдельно

    }
    return 0;
}

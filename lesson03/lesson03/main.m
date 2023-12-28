#import <Foundation/Foundation.h>
#import "variant1.h"
#import "variant2.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Создание экземпляров доктора и пациента
        Doctor1 *doctor1 = [[Doctor1 alloc] init];
        Patient1 *patient1 = [[Patient1 alloc] init];
        
        // Установка пациента в качестве делегата доктора
        doctor1.delegate = patient1;
        
        // Доктор назначает лекарство
        [doctor1 prescribeMedicine];
        
        //  Вариант 2, пациент сам приходит за назначением
        // Создаем доктора и пациента
        Doctor2 *doctor = [[Doctor2 alloc] init];
        Patient2 *patient = [[Patient2 alloc] init];
        
        // Пациент запрашивает у доктора лекарство
        [patient requestMedicineFromDoctor:doctor];
        
        
    }
    return 0;
}

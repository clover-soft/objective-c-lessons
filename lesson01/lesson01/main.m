#import <Foundation/Foundation.h>
#import "solveQuadraticEquation.h"
#import "findMaxNumber.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        solveQuadraticEquation(1, -8, 12);
        solveQuadraticEquation(12, -4, 2);
        solveQuadraticEquation(1, -100, -2);
        
        int a = 10;
        int b = 5;
        int c = 8;
        int maxNumber = findMaxNumber(a, b, c);
        NSLog(@"The maximum number is: %d", maxNumber);
        
    }
    return 0;
}

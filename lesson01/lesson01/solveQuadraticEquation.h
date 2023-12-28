#ifndef solveQuadraticEquation_h
#define solveQuadraticEquation_h

void solveQuadraticEquation(double a, double b, double c) {
    // Вычисление дискриминанта
    double discriminant = b * b - 4 * a * c;
    if (discriminant > 0) {
        // Если дискриминант больше нуля, уравнение имеет два различных действительных корня
        double root1 = (-b + sqrt(discriminant)) / (2 * a);
        double root2 = (-b - sqrt(discriminant)) / (2 * a);
        NSLog(@"Корни являются действительными и различными: %.2f и %.2f", root1, root2);
    } else if (discriminant == 0) {
        // Если дискриминант равен нулю, уравнение имеет два одинаковых действительных корня
        double root = -b / (2 * a);
        NSLog(@"Корни являются действительными и одинаковыми: %.2f", root);
    } else {
        // Если дискриминант меньше нуля, уравнение имеет два комплексных корня
        NSLog(@"Корни являются комплексными и различными");
    }
}

#endif /* solveQuadraticEquation_h */

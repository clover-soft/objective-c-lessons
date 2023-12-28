#ifndef findMaxNumber_h
#define findMaxNumber_h

int findMaxNumber(int a, int b, int c) {
    int max = a;
    if (b > max) {
        max = b;
    }
    if (c > max) {
        max = c;
    }
    return max;
}

#endif /* findMaxNumber_h */

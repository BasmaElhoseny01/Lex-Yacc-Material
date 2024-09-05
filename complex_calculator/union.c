// Simple Code to Show idea of union in C
#include <stdio.h>

// Define a union to hold either an integer or a float
union IntOrFloat {
    int intValue;
    float floatValue;
};

int main() {
    // Declare a variable of type IntOrFloat
    union IntOrFloat value;

    // Assign an integer value
    value.intValue = 42;
    printf("Integer value: %d\n", value.intValue);

    // Now assign a floating-point value
    value.floatValue = 3.14;
    printf("Float value: %f\n", value.floatValue);

    // Accessing the integer value after assigning a float
    printf("Integer value after assigning float: %d\n", value.intValue);

    return 0;
}

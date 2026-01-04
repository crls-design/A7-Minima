#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <math.h>

int main(void)
{
    FILE *file;

    file = fopen("sin.txt", "w");
    for (int i = 0; i < 256; i++)
    {
        uint8_t lut_value = (uint8_t)(sin((double)i / 255.0 * 2 * M_PI) * 127.5 + 128.0);
        fprintf(file, "8'd%d: VALUE = 8'd%d;\n", i, lut_value);
    }
    fclose(file);

    file = fopen("cos.txt", "w");
    for (int i = 0; i < 256; i++)
    {
        uint8_t lut_value = (uint8_t)(cos((double)i / 255.0 * 2 * M_PI) * 127.5 + 128.0);
        fprintf(file, "8'd%d: VALUE = 8'd%d;\n", i, lut_value);
    }
    fclose(file);

    return 0;
}
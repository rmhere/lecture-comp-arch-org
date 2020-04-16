#!/bin/ash
as template.as -o template.o && ld template.o -o template && rm template.o && ./template

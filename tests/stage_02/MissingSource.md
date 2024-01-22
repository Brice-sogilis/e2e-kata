# Wunderbar header

The following snippet refers to a missing source file:

```c source=definitely_not_a_file.c lines=1-3
int main(unsigned int argc, const char** argv) {
    return -1;
}
```

The following snippet refers to a source file discoverable if sources-root is 'subfolder':

```c source=hidden.c lines=1-3
int main(unsigned int argc, const char** argv) {
    printf("Hello there !\n");
}
```

The following snippet refers to a source file discoverable if sources-root is the current folder:


```c source=subfolder/hidden.c lines=1-3
int main(unsigned int argc, const char** argv) {
    printf("Hello there !\n");
}
```

The following snippet should be ignored as it is a not a sourced snippet:


```c
int main(unsigned int argc, const char** argv) {
    return -1;
}
```
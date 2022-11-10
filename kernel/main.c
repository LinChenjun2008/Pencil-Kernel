int f();

int kernel_main()
{
    return f();
}

int f()
{
    return 0x777;
}
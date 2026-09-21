int main()
{
    volatile int a = 10;
    volatile int b;
    b = a;
    return b;
}
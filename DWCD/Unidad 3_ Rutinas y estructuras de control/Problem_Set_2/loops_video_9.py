Loop 1

    n = any positive integer
    i = 0
    while i <= n:
        i = i + 1
Loop 2

    n = any positive integer
    i = 1
    while True:
        i = i * 2
        n = n + 1
        if i > n:
            break
Loop 3

    n = any positive integer
    while n != 1:
        if n % 2 == 0: #n is even
            n = n/2
        else:
            n = 3 * n + 1
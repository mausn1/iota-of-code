def fun(n:int):
    if n == 0:
        return 2
    elif n == 1:
        return 1
    else:
        return (fun(n-1)+fun(n-2))
for i in range(1,6):
    print(fun(i))



def first(left, right):
    if left < right:
        left, right = right, left
    while left > right:
        value = second(left, right)
        left, right = right, int(right/2)
    return value

def second(check, balance):
    if check > 0:
        return balance
    else:
        return 0

def main():
    final = first(3, 5)
    print(3, 5, final)

if __name__ == '__main__':
    main()

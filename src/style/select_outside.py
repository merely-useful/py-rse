def select_outside(low, high, *values):
    result = []
    for v in values:
        if (v < low) or (v > high):
            result.append(v)
    return result

print(select_outside(0, 1.0, 0.3, -0.2, -0.5, 0.4, 1.7))

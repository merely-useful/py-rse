def count_words(text):
    words = text.split()
    result = {}
    for w in words:
        result[w] = result.get(w, 0) + 1
    return result

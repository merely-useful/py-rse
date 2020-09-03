# Get title and author information from a Project Gutenberg eBook.
# Usage: bash book_summary.sh /path/to/file.txt
head -n 10 $1 | tail -n 1
head -n 12 $1 | tail -n 1
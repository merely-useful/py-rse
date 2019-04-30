import datetime

DAYS_PER_WEEK = 7

TESTING_DATE = None
def weeks_since_01(start):
    current = TESTING_DATE
    if current is None:
        current = datetime.date.today()
    return round((current - start).days / DAYS_PER_WEEK)

def weeks_since_02(start):
    current = weeks_since_02.testing_date
    if current is None:
        current = datetime.date.today()
    return round((current - start).days / DAYS_PER_WEEK)
weeks_since_02.testing_date = None

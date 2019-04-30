import datetime
import wrappers

print('current', wrappers.weeks_since_01(datetime.date(2018, 8, 1)))
wrappers.TESTING_DATE = datetime.date(2018, 8, 30)
print('fixed', wrappers.weeks_since_01(datetime.date(2018, 8, 1)))

#--------------------

print('current', wrappers.weeks_since_02(datetime.date(2018, 8, 1)))
wrappers.weeks_since_02.testing_date = datetime.date(2018, 8, 30)
print('fixed', wrappers.weeks_since_02(datetime.date(2018, 8, 1)))

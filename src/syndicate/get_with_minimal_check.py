import requests

def annual_mean_temp(country):
    '''Get the annual mean temperature for a country given its 3-letter ISO code (such as "CAN").'''
    url = 'http://climatedataapi.worldbank.org/climateweb/rest/v1/country/cru/tas/year/' + country + '.csv'
    print('url used is', url)
    response = requests.get(url)
    print('response code:', response.status_code)
    print('length of data:', len(response.text))
    if response.status_code != 200:
        print('Failed to get data:', response.status_code)
    else:
        wrapper = csv.reader(response.text.strip().split('\n'))
        results = []
        for record in wrapper:
            if record[0] != 'year':
                year = int(record[0])
                value = float(record[1])
                results.append([year, value])
        return results

latveria = annual_mean_temp('LTV')
print('number of records for Latveria:', len(latveria))

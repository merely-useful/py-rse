import request

def annual_mean_temp(country):
    '''
    Get the annual mean temperature for a country given its 3-letter ISO code (such as "CAN").
    Returns an empty list if the country code is invalid.
    '''
    url = 'http://climatedataapi.worldbank.org/climateweb/rest/v1/country/cru/tas/year/' + country + '.csv'
    response = requests.get(url)
    results = []
    if len(response.text) > 0:
        wrapper = csv.reader(response.text.strip().split('\n'))
        for record in wrapper:
            if record[0] != 'year':
                year = int(record[0])
                value = float(record[1])
                results.append([year, value])
    return results


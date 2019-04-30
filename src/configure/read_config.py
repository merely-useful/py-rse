import yaml

with open('config.yml', 'r') as reader:
    config = yaml.load(reader)
print(config)

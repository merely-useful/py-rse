The final directory tree for the py-rse volume looks as follows,
with [notes] to indicate when each file is introduced.

The `zipf/` directory contains the final version of all the files.

```
├── .gitignore   [git-cmdline]
├── CONDUCT.md   [teams]
├── KhanVirtanen2020.md   [provenance]
├── LICENSE.md   [teams]
├── Makefile   [automate]
├── README.rst   [starts as .md in git-cmdline and changes to .rst in packaging]
├── environment.yml   [provenance]
├── requirements.txt   [packaging]
├── requirements_docs.txt   [packaging]
├── setup.py   [packaging]
├── bin   [changes name from bin to zipf in packaging]
│   ├── book_summary.sh   [bash-advanced]
│   ├── collate.py   [scripting]
│   ├── countwords.py   [scripting]
│   ├── plotcounts.py   [scripting]
│   ├── plotparams.yml   [configuration]
│   ├── test_zipfs.py   [testing]
│   └── utilities.py   [scripting]
├── data
│   ├── README.md   [introduction]
│   ├── dracula.txt   [introduction]
│   ├── frankenstein.txt   [introduction]
│   ├── jane_eyre.txt   [introduction]
│   ├── moby_dick.txt   [introduction]
│   ├── sense_and_sensibility.txt   [introduction]
│   ├── sherlock_holmes.txt   [introduction]
│   └── time_machine.txt   [introduction]
├── docs
│   ├── Makefile   [packaging]
│   ├── conf.py   [packaging]
│   ├── index.rst   [packaging]
│   └── source
│   │   ├── collate.rst   [packaging]
│   │   ├── countwords.rst   [packaging]
│   │   ├── modules.rst   [packaging]
│   │   ├── plotcounts.rst   [packaging]
│   │   ├── test_zipfs.rst   [packaging]
│   │   └── utilities.rst   [packaging]
├── results
│   ├── collated.csv   [automate]
│   ├── collated.png   [automate]
│   ├── dracula.csv   [scripting]
│   ├── dracula.png   [git-cmdline]
│   ├── frankenstein.csv   [automate]
│   ├── jane_eyre.csv   [scripting]
│   ├── jane_eyre.png   [scripting]
│   ├── moby_dick.csv   [scripting]
│   ├── sense_and_sensibility.csv   [automate]
│   ├── sherlock_holmes.csv   [automate]
│   └── time_machine.csv   [automate]
└── test_data
    ├── random_words.txt   [testing]
    └── risk.txt   [testing]
```
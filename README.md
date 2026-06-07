# Bash Backup Script

A simple Bash script that creates backups of `/home` and `~/Documents`.

## Features

- Creates `/backup` directory if it doesn't already exist
- Names the backup with a timestamp. "backup_$TIMESTAMP.tar.gz"
- Writes a logfile with archive name, sources, and destination
- Compresses the folders backed up into tarballs
- Checks that each command is completed as intended else it prints and error message if it fails


## Notes

This project was developed with AI assistance. I reviewed, tested, and modified the generated code to ensure it behaves as expected for the intended use case.

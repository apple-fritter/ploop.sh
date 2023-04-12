# ploop
This bash script is designed to loop through a tab-separated value (TSV) file and pass columns of data to an external program. It takes four arguments: the name of the external program, the path to the TSV file, the number of columns in the TSV file, and an optional list of columns to process. The script's ability to process TSV files and pass specific columns to an external program makes it a useful tool for a wide range of data processing and analysis tasks.

The script checks that it has been passed the correct number of arguments (at least three). If not, it prints a usage message and exits with an error code.

The script then sets some variables, including the name of the external program, the path to the TSV file, the number of columns in the TSV file, and an optional list of columns to process. It also generates a timestamp for the log file name based on the current date and time.

The script then loops through the TSV file, skipping any rows that start with '#' (comments). It processes the specified columns if they have been provided, concatenating them and passing them to the external program. If no columns have been specified, the script passes all columns to the external program.

The script also records the start and end times of the loop and calculates the duration. It writes a log file containing the script's arguments and the start and end times and duration of the loop.

Overall, this script is useful for processing data in a TSV file and passing it to an external program, while also recording a log file for later analysis.

## Usage
Suppose you have a TSV file named `data.tsv` with 4 columns, and you want to pass the values in columns `2` and `4` to an external program named `myprogram`. You can run the script like this:

```
./ploop.sh myprogram data.tsv 4 2 4
```

Here, `myprogram` is the name of the external program you want to pass the data to, `data.tsv` is the path to the TSV file you want to process, `4` is the number of columns in the TSV file, `2` and `4` are the indices of the columns you want to process.

If you want to process all columns in the TSV file, you can omit the last argument:

```
./ploop.sh myprogram data.tsv 4
```

This will pass all columns of the TSV file to myprogram.

The script will write a log file named `data.<timestamp>.log` in the same directory as the TSV file. The log file will contain information about the script's arguments, start and end times, and duration.

The timestamp format used in the bash script is `+%Y%m%d_%H%M%S`, which generates a timestamp in the format of `YYYYMMDD_HHMMSS`, where:

* `%Y`: represents the year in four digits (e.g., 2023).
* `%m`: represents the month in two digits (e.g., 04 for April).
* `%d`: represents the day in two digits (e.g., 12).
* `%H`: represents the hour in 24-hour format (e.g., 13 for 1:00 PM).
* `%M`: represents the minute in two digits (e.g., 25).
* `%S`: represents the second in two digits (e.g., 59).

This timestamp format is commonly used in log files and other applications that require a unique timestamp for each instance. The format is useful because it is human-readable and easily sortable. It also includes the date and time with a high level of detail, making it easy to identify when a particular instance occurred.

## Some possible uses of this script could include:

* Data pre-processing: The script could be used to pre-process data in TSV format before passing it to a machine learning model or other data processing tool.

* Data analysis: The script could be used to process TSV files containing large datasets, allowing users to extract and analyze specific columns of interest.

* Data integration: The script could be used to merge data from multiple TSV files, allowing users to process and analyze the combined data.

* Automation: The script could be incorporated into a larger automation pipeline, allowing users to process TSV files automatically and integrate them into a larger workflow.

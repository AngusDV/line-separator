# JSON File Splitter

This is a Bash script that splits a JSON file into multiple smaller JSON files based on the specified number of records per file.

## Prerequisites

- Bash should be installed on your system.

## Usage

1. Clone or download the repository.
2. Open a terminal and navigate to the directory where the script is located.
3. Run the script by executing the following command:
```bash json_splitter.sh <input_file> <records_per_file>```
Replace `<input_file>` with the path to your JSON file and `<records_per_file>` with the desired number of records per output file.

**Note**: Make sure you have write permissions in the directory where the script is located.

## Example

Suppose you have a JSON file named `data.json` with 1000 records, and you want to split it into files with 100 records each. You can run the script with the following command:
```bash json_splitter.sh data.json 100```
This will split the `data.json` file into 10 output files, each containing 100 records.

## Output

The script will create multiple output files in the same directory as the input file. The files will be named in the format `<input_file_prefix>XXX.json`, where `XXX` represents a three-digit sequential number starting from 000.

## Contributing

Contributions are welcome! If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

## License

This script is released under the [MIT License](LICENSE).

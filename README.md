```bash
                        ───▐──▌───────▐──▌───
                        ───▐▌─█───────█─▐▌───
                        ──▄█──▀▀▄▌▄▐▄▀▀──█▄──
                        ─▐█─▄█▀▄█████▄▀█▄─█▌─
                        ──▀▀─▄▄▄█████▄▄▄─▀▀──
                        ───▄█▀─▄▀███▀▄─▀█▄───
                        ─▄█──▄▀──███──▀▄──█▄─
                        ▐█───█───▐█▌───█───█▌
                        ─█────█───▀───█────█─
                        ─▀█───█───────█───█▀─
                        ──█────█─────█────█──
                        ───█───█─────█───█───
                        ────▌───▌───▐───▐────

 .|'''.|                         '||                  '||''|.              .           
 ||..  '  ... ...  .... ...    .. ||    ....  ... ..   ||   ||  .... ... .||.    ....  
  ''|||.   ||'  ||  '|.  |   .'  '||  .|...||  ||' ''  ||'''|.   '|.  |   ||   .|...|| 
.     '||  ||    |   '|.|    |.   ||  ||       ||      ||    ||   '|.|    ||   ||      
|'....|'   ||...'     '|     '|..'||.  '|...' .||.    .||...|'     '|     '|.'  '|...' 
           ||      .. |                                         .. |                   
          ''''      ''                                           ''                    


          
```
# Spyderbyte

Spyderbyte is a file permission auditing tool written in Bash. It allows you to scan a directory and identify files with insecure permissions. The tool generates a report that highlights files with potentially risky permissions, helping you ensure the security of your file system.

## Features

- Scans a specified directory for files with insecure permissions.
- Generates a report with detailed information about each file, including its path, permissions, and security status.
- Provides recommendations on how to improve the security of files with insecure permissions.
- Estimates the remaining time for the audit process.

## Usage

1. Clone the repository or download the `spyderbyte.sh` file.

2. Make the script executable:
   ```bash
   chmod +x ./spyderbyte.sh
    ```
Follow the on-screen prompts to enter the directory you want to scan.

Sit back and wait for the audit to complete. The script will display progress and estimated remaining time.

Once the audit is finished, a report file named permissions_report.txt will be generated in the current directory.

## Report Format
The generated report file (permissions_report.txt) contains information about each file with insecure permissions. The format of each entry is as follows:

```yaml
File: [file_path]
Permissions: [permissions]
Security Status: Insecure
Advice: [recommendations]
```

## Contributing
Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License
This tool is licensed under the MIT License.

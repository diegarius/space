# Space bash script

Gets the overall use of the partition of the directory (current directory by default), the biggest folders (5 by default) and the biggest files (5 by default).

## 🛠️ Requirements

Bash
Standard GNU coreutils (installed by default on most Linux distributions)

## 📖 Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/diegarius/space.git
   cd space

2. Make the script executable:
   ```bash
    chmod +x space.sh

3. Run the script:
   ```bash
    ./space.sh

## ❔ Help

Usage:   
```bash
./space.sh [OPTIONS] [PATH]
```
Analyze disk usage: shows partition usage, and the largest directories and files.

Options:  
  -d <number>    Number of largest directories to show (default: 5)  
  -f <number>    Number of largest files to show (default: 5)  
  -h             Show this help message

Arguments:  
  PATH           Path to analyze. Defaults to current directory if omitted.

Example:
```bash
  ./space.sh -d 10 -f 20 /var/log
```

## 💡 Tips

You can disable directory or file searches by setting the -d or -f options to 0.  
Create a shell alias to run the script more conveniently.

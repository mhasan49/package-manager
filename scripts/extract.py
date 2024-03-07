def extract_packages(file_path):
    with open(file_path, 'r') as file:
        content = file.readlines()
        
    packages = {}
    current_section = None
    
    for line in content:
        line = line.strip()
        if line.startswith('#'):
            current_section = line[1:].strip()
            packages[current_section] = []
        elif line:
            packages[current_section].append(line)
    
    return packages

def write_packages_to_files(packages):
    for section, contents in packages.items():
        # Remove dashes from section name for filename
        filename = section.lower().replace(' ', '_').replace('-', '') + '.txt'
        with open(filename, 'w') as file:
            file.write('\n'.join(contents))

def main():
    file_path = '../packages.txt'
    packages = extract_packages(file_path)
    write_packages_to_files(packages)
    print("Packages extracted and written to separate files.")

if __name__ == "__main__":
    main()

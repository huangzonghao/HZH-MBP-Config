import sys, json

config_file = "config_list.json"
general_key = "general"
specific_key = sys.argv[1]

general_temp_file = "temp_general_list"
config_temp_file = "temp_config_list"


def main():
    jdata =  open(config_file)
    data = json.load(jdata)
    textfile = open(general_temp_file, 'w')
    for i in data[general_key]:
        textfile.write(i + "\n")
    textfile.close()

    if specific_key in data.keys():
        textfile = open(config_temp_file, 'w')
        for i in data[specific_key]:
            textfile.write(i + "\n")
        textfile.close()
if __name__ == "__main__":
    main()


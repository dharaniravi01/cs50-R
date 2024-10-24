import sys, csv, tabulate


def main():
    #get one command line prompt
    if len(sys.argv) == 2 and sys.argv[1].endswith(".csv"):
        file_name = sys.argv[1]

        try:
            #read and open csv
            with open(file_name) as file:
                menus = csv.DictReader(file)

                #add the menus to a list
                tabulate_menu = []
                for row in menus:

                    tabulate_menu.append({"pizza": row.get("Regular Pizza") or row.get("Sicilian Pizza"), "small_price": "Small", "large_price": "Large"})

                #print out the tabulated menu
                print(tabulate.tabulate(tabulate_menu, headers= "firstrow", tablefmt = "grid"))


        except FileNotFoundError:
            sys.exit("File does not exist")

    elif len(sys.argv) < 2:
        sys.exit("Too few command-line arguments")
    elif len(sys.argv) > 2:
        sys.exit("Too many command-line arguments")
    else:
        sys.exit("Not a CSV file")












main()

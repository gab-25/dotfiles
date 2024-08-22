import sys
import requests
from bs4 import BeautifulSoup


def main():
    html = requests.get("https://repo.anaconda.com/archive/")
    soap = BeautifulSoup(html.text, "html.parser")
    rows = soap.find_all("tr")
    for row in rows:
        if row.find("td") is not None:
            filename = str(row.find("td").find("a").contents[0])
            if "Linux" in filename:
                sys.stdout.write(filename)
                sys.exit(0)


if __name__ == "__main__":
    main()

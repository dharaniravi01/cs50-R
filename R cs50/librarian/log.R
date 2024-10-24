#read and store the books csv
books <- read.csv("books.csv")
authors <- read.csv("authors.csv")

#find mia morgan in the author column
author_mia <- subset(books, author == "Mia Morgan")
#find the book
writer <- author_mia$title


#find music in topic column & find 1613 in year column
year_1613 <- subset(books, topic == "Music" & year == 1613)
#find the book
musician <- year_1613$title


#find 1775 in year column
year_1775 <- subset(books, year == 1775)
#find the book
traveler <- year_1775$title


#filter to 200-300 pages & art in topic
pages <- subset(books, pages > 200 & pages < 300 & topic == "Art" & (year == 1990 | year == 1992)& year != 1991)
#find the book
painter <- pages$title


#find quantum mechanics in title column
quantum <- grep("Quantum Mechanics", books$title)
#find the book
scientist <- books$title[quantum]


#find zenthia in town column in author.csv
town <- subset(authors, hometown == "Zenthia")
names <-town$author
#find authors in books csv and year 1700s in year column and education in topic column
titles <-subset(books, author %in% names & year >= 1700 & year < 1800 & topic == "Education")
teacher <- titles$title


#make a list to add the titles
all_titles <- c(writer, musician, traveler, painter, scientist, teacher)

#open a new column to add the titles in the answers
answers <- read.table("answers.txt", header = FALSE)

answers$V6 <- all_titles
write.table(answers, "answers.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)




datas <-read.table("tests.tsv", sep= "\t", header = TRUE)

datas$gender <- factor(datas$gender, labels = c("Unanswered", "Male", "Female", "Other" ))

extro <- round((datas[, "E1"] + datas[,"E2"] + datas[,"E3"]) /15, 2)
neuro <- round((datas[,"N1"] + datas[,"N2"] + datas[,"N3"]) /15, 2)
agree <- round((datas[,"A1"] + datas[,"A2"] + datas[,"A3"]) /15, 2)
consc <- round((datas[,"C1"] + datas[,"C2"] + datas[,"C3"]) /15, 2)
openn <- round((datas[,"O1"] + datas[,"O2"] + datas[,"O3"]) /15, 2)

datas$extroversion <- extro
datas$neuroticism <- neuro
datas$agreeableness <- agree
datas$conscientiousness <- consc
datas$openness <- openn

write.csv(datas, file = "analysis.csv")
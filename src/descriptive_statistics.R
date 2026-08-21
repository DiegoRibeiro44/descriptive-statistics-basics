source("packages.R")

dir.create("outputs", showWarnings = FALSE, recursive = TRUE)

data_path <- file.path("data", "raw", "descriptive_statistics_tables.xlsx")
base <- readxl::read_excel(data_path, sheet = "Tabela 1.1")
names(base) <- tolower(gsub("_+", "_", gsub("[^[:alnum:]]+", "_", iconv(names(base), to = "ASCII//TRANSLIT"))))

frequency_table <- function(x) {
  counts <- table(x, useNA = "ifany")
  data.frame(
    category = names(counts),
    count = as.integer(counts),
    percentage = round(as.numeric(prop.table(counts)) * 100, 2)
  )
}

write.csv(frequency_table(base$estado_civil), file.path("outputs", "estado_civil_frequency.csv"), row.names = FALSE)
write.csv(frequency_table(base$grau_de_instrucao), file.path("outputs", "grau_instrucao_frequency.csv"), row.names = FALSE)
write.csv(frequency_table(base$regiao_de_procedencia), file.path("outputs", "regiao_procedencia_frequency.csv"), row.names = FALSE)
write.csv(frequency_table(base$n_de_filhos), file.path("outputs", "numero_filhos_frequency.csv"), row.names = FALSE)

numeric_summary <- data.frame(
  metric = c("idade", "salario", "numero_filhos"),
  mean = c(mean(base$idade, na.rm = TRUE), mean(base$salario, na.rm = TRUE), mean(base$n_de_filhos, na.rm = TRUE)),
  median = c(median(base$idade, na.rm = TRUE), median(base$salario, na.rm = TRUE), median(base$n_de_filhos, na.rm = TRUE)),
  variance = c(var(base$idade, na.rm = TRUE), var(base$salario, na.rm = TRUE), var(base$n_de_filhos, na.rm = TRUE)),
  sd = c(sd(base$idade, na.rm = TRUE), sd(base$salario, na.rm = TRUE), sd(base$n_de_filhos, na.rm = TRUE))
)

write.csv(numeric_summary, file.path("outputs", "numeric_summary.csv"), row.names = FALSE)

png(file.path("outputs", "estado_civil_barplot.png"), width = 1200, height = 800)
barplot(table(base$estado_civil), main = "Estado Civil", col = "steelblue")
dev.off()

png(file.path("outputs", "idade_histogram.png"), width = 1200, height = 800)
hist(base$idade, main = "Distribuicao de Idade", xlab = "Idade", col = "gray80", border = "white")
dev.off()

png(file.path("outputs", "salario_boxplot.png"), width = 1200, height = 800)
boxplot(base$salario, main = "Boxplot de Salario", col = "tomato")
dev.off()

cat("Analise descritiva concluida. Resultados salvos em outputs/.\n")

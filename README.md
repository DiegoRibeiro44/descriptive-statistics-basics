# Descriptive Statistics Basics

Projeto introdutório em **R** para exploração estatística de uma base tabular com variáveis categóricas e numéricas. Transforma uma planilha bruta em um conjunto mínimo de indicadores descritivos e visualizações iniciais.

## Problema resolvido

Mostra como partir de uma planilha e chegar rapidamente a tabelas de frequência, um resumo numérico e gráficos básicos que permitem entender a base antes de qualquer modelagem.

## O que o script entrega

- tabelas de frequência para variáveis categóricas (estado civil, grau de instrução, região, número de filhos);
- resumo numérico com média, mediana, variância e desvio padrão (idade, salário, número de filhos);
- gráficos de apoio: barras, histograma e boxplot.

## Stack

- R (>= 4.0)
- readxl

## Estrutura

```text
descriptive-statistics-basics/
├── README.md
├── packages.R
├── data/
│   └── raw/
│       ├── descriptive_statistics_tables.xlsx   # base de entrada (aba "Tabela 1.1")
│       └── excel_formulas.txt                   # anotações de fórmulas de apoio
├── outputs/                                     # resultados gerados
└── src/
    └── descriptive_statistics.R
```

## Dados

A base de entrada (`data/raw/descriptive_statistics_tables.xlsx`, aba `Tabela 1.1`) já
acompanha o projeto e é versionada — não é necessário baixar nada. O script normaliza
os nomes das colunas automaticamente ao carregar.

## Como executar

Execute a partir da **raiz do projeto** (o script resolve `packages.R`, `data/` e `outputs/`
por caminho relativo):

```bash
Rscript src/descriptive_statistics.R
```

O `packages.R` instala automaticamente os pacotes ausentes (`readxl`) a partir do CRAN.

## Resultado esperado

Arquivos gerados em `outputs/`:

- `estado_civil_frequency.csv`, `grau_instrucao_frequency.csv`, `regiao_procedencia_frequency.csv`, `numero_filhos_frequency.csv` — tabelas de frequência;
- `numeric_summary.csv` — resumo numérico;
- `estado_civil_barplot.png`, `idade_histogram.png`, `salario_boxplot.png` — gráficos.

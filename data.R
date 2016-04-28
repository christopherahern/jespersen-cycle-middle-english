library(dplyr, warn.conflicts = F)
library(stringr, warn.conflicts = F)

# Read in the output of the corpus search queries
df <- read.delim('coding.cod.ooo', header = FALSE, sep=':')
colnames(df) <- c("century", "decade", "unityear", "exclude","ne",
		 "not", "clausetype", "never.posn", "finite", "id")
# Use columns to add year 
df$year <- (1000 + 100 * as.numeric(as.character(df$century)) +
                10 * as.numeric(as.character(df$decade)) +
                as.numeric(as.character(df$unityear)))
df$century <- df$decade <- df$unityear <- NULL
# Add column with document IDs
df$document <- str_replace(df$id, ",.*", "")
# Determine stage for each token: 
# (1) pre-verbal
# (2) bipartite
# (3) post-verbal
df$has.ne <- as.logical(df$ne == "ne")
df$has.not <- as.logical(df$not %in% c("preverbal","postverbal"))
df$has.both <- as.logical(df$has.ne & df$has.not)
df$stage = ifelse(df$has.both, 2, ifelse(df$has.ne, 1, 3))
df$has.ne <- df$has.not <- df$has.both <- NULL

# Write data to csv
write.csv(df, file = "neg-data.csv", row.names = FALSE)
# Summarize document dates and write to csv
document.dates <- df %>% group_by(document, year) %>% summarize()
write.csv(document.dates, file = "document-dates.csv", row.names = FALSE)

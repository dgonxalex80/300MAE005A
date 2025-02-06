# 02-elimina_duplicados.R
# identificar duplicados y eliminarlos
df <- as.data.frame(df)
duplicados <- df[duplicated(df),]

table(df$category)

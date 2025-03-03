
library(ggraph)
library(igraph)
library(ggplot2)

# Definir los nodos y las conexiones del árbol
nodes <- data.frame(
  name = c("Autos", "R", "E", "M", "G",
           "A|R", "A'|R", "A|E", "A'|E",
           "A|M", "A'|M", "A|G", "A'|G")
)

edges <- data.frame(
  from = c("Autos", "Autos", "Autos", "Autos",
           "R", "R", "E", "E", "M", "M", "G", "G"),
  to = c("R", "E", "M", "G",
         "A|R", "A'|R", "A|E", "A'|E",
         "A|M", "A'|M", "A|G", "A'|G"),
  label = c("P(R) = 0.27", "P(E) = 0.17", "P(M) = 0.35", "P(G) = 0.21",
            "P(A|R) = 0.03", "P(A'|R) = 0.97", "P(A|E) = 0.04", "P(A'|E) = 0.96",
            "P(A|M) = 0.05", "P(A'|M) = 0.95", "P(A|G) = 0.06", "P(A'|G) = 0.94")
)

# Crear el grafo con igraph
graph <- graph_from_data_frame(edges, vertices = nodes, directed = TRUE)

# Graficar el árbol con ggraph
ggraph(graph, layout = "dendrogram") +
  geom_edge_link(aes(label = label), angle_calc = 'along', hjust = 1, vjust = 1,
                 color = "gray", arrow = arrow(length = unit(4, 'mm'))) +
  geom_node_point(color = "lightblue", size = 8) +
  geom_node_text(aes(label = name), vjust = 1, size = 5, fontface = "bold") +  # Etiquetas sobre los nodos
  ggtitle("Diagrama de Árbol de Probabilidades") +
  theme_void()

# Shortest Path Algorithms Analyzer

This repository contains OCaml implementations of popular shortest path algorithms such as Dijkstra's, Bellman-Ford, Floyd-Warshall, and A\*. The code is organized into separate modules for each algorithm, allowing for easy testing and comparison of their performance.

## Description

This repository serves as a learning resource for understanding and comparing the efficiency of different shortest path algorithms. It allows users to experiment with various graph sizes and densities and observe how different algorithms perform under different conditions.

## Usage

### Compilation

To compile the program, make sure you have OCaml installed on your system. Then, use the following command:

```bash
ocamlc -o shortest_path_analyzer graph.ml dijkstra.ml bellman_ford.ml floyd_warshall.ml a_star.ml performance_analyzer.ml main.ml
```

### Running

After compilation, execute the program with:

```bash
./shortest_path_analyzer
```

The program will prompt you to enter the number of nodes in the graph and the density of the graph (between 0 and 1). It will then generate a random graph based on the input and analyze the execution time of each algorithm on the generated graph. Loading messages will be displayed to indicate when each algorithm is being executed.

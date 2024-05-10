(* main.ml *)

open Performance_analyzer.PerformanceAnalyzer
open Graph

let () =
  (* Prompt user for graph size and density *)
  print_endline "Enter the number of nodes in the graph (between 0 and 500):";
  let num_nodes = read_int () in
  print_endline "Enter the density of the graph (between 0 and 1):";
  let density = read_float () in
  
  (* Generate a random graph *)
  let graph = Graph.generate_random_graph num_nodes density in
  
  (* Analyze shortest path algorithm performance *)
  analyze_shortest_path_algorithms graph
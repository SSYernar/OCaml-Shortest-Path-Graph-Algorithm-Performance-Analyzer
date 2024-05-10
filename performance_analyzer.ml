(* performance_analyzer.ml *)

module PerformanceAnalyzer = struct
  open Graph
  open Dijkstra
  open Bellman_ford
  open Floyd_warshall
  open A_star

  (* Analyze shortest path algorithms *)
  let analyze_shortest_path_algorithms graph =
    let dijkstra_time = Sys.time () in
    let _ = dijkstra graph in
    let dijkstra_exec_time = Sys.time () -. dijkstra_time in

    let bellman_ford_time = Sys.time () in
    let _ = bellman_ford graph in
    let bellman_ford_exec_time = Sys.time () -. bellman_ford_time in

    let floyd_warshall_time = Sys.time () in
    let _ = floyd_warshall graph in
    let floyd_warshall_exec_time = Sys.time () -. floyd_warshall_time in

    let a_star_time = Sys.time () in
    let _ = a_star graph in
    let a_star_exec_time = Sys.time () -. a_star_time in

    (* Print execution times *)
    Printf.printf "\027[31mExecution time for Dijkstra's algorithm: %.6f seconds\n\027[0m" dijkstra_exec_time;
    Printf.printf "\027[32mExecution time for Bellman-Ford algorithm: %.6f seconds\n\027[0m" bellman_ford_exec_time;
    Printf.printf "\027[33mExecution time for Floyd-Warshall algorithm: %.6f seconds\n\027[0m" floyd_warshall_exec_time;
    Printf.printf "\027[34mExecution time for A* algorithm: %.6f seconds\n\027[0m" a_star_exec_time;

    (* Print the best execution time *)
    let best_time = min (min dijkstra_exec_time bellman_ford_exec_time) (min floyd_warshall_exec_time a_star_exec_time) in
    if best_time = dijkstra_exec_time then
      print_endline "\027[31mDijkstra's algorithm is the fastest\027[0m"
    else if best_time = bellman_ford_exec_time then
      print_endline "\027[32mBellman-Ford algorithm is the fastest\027[0m"
    else if best_time = floyd_warshall_exec_time then
      print_endline "\027[33mFloyd-Warshall algorithm is the fastest\027[0m"
    else
      print_endline "\027[34mA* algorithm is the fastest\027[0m"
end

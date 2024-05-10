(* dijkstra.ml *)

open Graph

(* Implementation of Dijkstra's algorithm *)
let dijkstra graph =
  print_endline "Loading Dijkstra's algorithm...";
  let num_nodes = List.fold_left (fun acc (source, destination, _) ->
      max acc (max source destination)
  ) 0 graph + 1 in
  let infinity = max_float in
  let dist = Array.make num_nodes infinity in
  let visited = Array.make num_nodes false in
  let prev = Array.make num_nodes (-1) in
  
  let rec find_min_distance_node dist visited =
    let min_dist = ref infinity in
    let min_node = ref (-1) in
    for i = 0 to num_nodes - 1 do
      if not visited.(i) && dist.(i) < !min_dist then (
        min_dist := dist.(i);
        min_node := i
      )
    done;
    !min_node
  in
  
  dist.(0) <- 0.0;
  
  for _ = 0 to num_nodes - 1 do
    let u = find_min_distance_node dist visited in
    visited.(u) <- true;
    
    List.iter (fun (source, destination, weight) ->
      if source = u && not visited.(destination) then (
        let alt = dist.(u) +. weight in
        if alt < dist.(destination) then (
          dist.(destination) <- alt;
          prev.(destination) <- u
        )
      )
    ) graph
  done;
  
  let rec reconstruct_path prev node acc =
    if node = -1 then acc
    else reconstruct_path prev prev.(node) (node :: acc)
  in
  
  let shortest_paths = Array.init num_nodes (fun i -> reconstruct_path prev i []) in
  shortest_paths

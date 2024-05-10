(* bellman_ford.ml *)

open Graph

(* Implementation of Bellman-Ford algorithm *)
let bellman_ford graph =
  print_endline "Loading Bellman-Ford algorithm...";
  let num_nodes = List.fold_left (fun acc (source, destination, _) ->
      max acc (max source destination)
  ) 0 graph + 1 in
  let infinity = max_float in
  let dist = Array.make num_nodes infinity in
  let prev = Array.make num_nodes (-1) in
  
  dist.(0) <- 0.0;
  
  for _ = 1 to num_nodes - 1 do
    List.iter (fun (source, destination, weight) ->
      let alt = dist.(source) +. weight in
      if alt < dist.(destination) then (
        dist.(destination) <- alt;
        prev.(destination) <- source
      )
    ) graph
  done;
  
  let negative_cycle = ref false in
  List.iter (fun (source, destination, weight) ->
    let alt = dist.(source) +. weight in
    if alt < dist.(destination) then (
      negative_cycle := true;
      prev.(destination) <- source
    )
  ) graph;
  
  if !negative_cycle then
    failwith "Graph contains a negative cycle"
  else
    Array.sub prev 1 (num_nodes - 1)

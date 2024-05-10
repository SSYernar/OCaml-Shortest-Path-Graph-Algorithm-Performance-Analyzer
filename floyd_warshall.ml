(* floyd_warshall.ml *)

open Graph

(* Implementation of Floyd-Warshall algorithm *)
let floyd_warshall graph =
  print_endline "Loading Floyd-Warshall algorithm...";
  let num_nodes = List.fold_left (fun acc (source, destination, _) ->
      max acc (max source destination)
  ) 0 graph + 1 in
  let infinity = max_float in
  let dist = Array.make_matrix num_nodes num_nodes infinity in
  let next = Array.make_matrix num_nodes num_nodes (-1) in
  
  List.iter (fun (source, destination, weight) ->
    dist.(source).(destination) <- weight;
    next.(source).(destination) <- destination
  ) graph;
  
  for k = 0 to num_nodes - 1 do
    for i = 0 to num_nodes - 1 do
      for j = 0 to num_nodes - 1 do
        let alt = dist.(i).(k) +. dist.(k).(j) in
        if alt < dist.(i).(j) then (
          dist.(i).(j) <- alt;
          next.(i).(j) <- next.(i).(k)
        )
      done
    done
  done;
  
  let reconstruct_path next i j =
    let rec aux acc k visited =
      if k = -1 || List.mem k visited then acc
      else aux (k :: acc) next.(i).(k) (k :: visited)
    in
    aux [i] next.(i).(j) [i]
  in
  
  let shortest_paths = Array.make_matrix num_nodes num_nodes [] in
  for i = 0 to num_nodes - 1 do
    for j = 0 to num_nodes - 1 do
      shortest_paths.(i).(j) <- reconstruct_path next i j
    done
  done;
  
  shortest_paths

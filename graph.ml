(* graph.ml *)

module Graph = struct
  type node = int
  type edge = node * node * float
  type graph = edge list
  
  (* Generate a random graph with given number of nodes and density *)
  let generate_random_graph num_nodes density =
    let num_possible_edges = num_nodes * (num_nodes - 1) in
    let num_edges = int_of_float (density *. float_of_int num_possible_edges) in
    let rec generate_edges acc remaining_edges =
      if remaining_edges <= 0 then acc
      else
        let source = Random.int num_nodes in
        let destination = Random.int num_nodes in
        let weight = Random.float 100.0 in
        if source <> destination then
          generate_edges ((source, destination, weight) :: acc) (remaining_edges - 1)
        else
          generate_edges acc remaining_edges
    in
    generate_edges [] num_edges
end

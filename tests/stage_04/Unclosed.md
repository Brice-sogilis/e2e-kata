You'd better closed this block of code =>

```ocaml source=Source.ml lines=1-4
let () =
  let x = 40 and y = 2 in
  print_endline @@ Printf.sprintf "The answer is: %d" (x + y)


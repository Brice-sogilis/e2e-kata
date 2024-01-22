Indentation is freedom

```ocaml source=Source.ml lines=1-3
        let () =
          let x = 40 and y = 2 in
     print_endline @@ Printf.sprintf "The answer is: %d" (x + y)
```

But internal spacing is no joke:
```ocaml source=Source.ml lines=1-2
let()=
```

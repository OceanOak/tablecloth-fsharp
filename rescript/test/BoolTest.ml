open Tablecloth
open AlcoJest

let suite =
  suite "Bool" (fun () ->
      let open Bool in
      describe "fromInt" (fun () ->
          test "converts zero to Some(false)" (fun () ->
              expect (fromInt 0)
              |> toEqual
                   (let open Eq in
                   option bool)
                   (Some false) ) ;
          test "converts one to Some(true)" (fun () ->
              expect (fromInt 1)
              |> toEqual
                   (let open Eq in
                   option bool)
                   (Some true) ) ;
          testAll
            "converts everything else to None"
            [ Int.minimumValue; -2; -1; 2; Int.maximumValue ]
            (fun int ->
              expect (fromInt int)
              |> toEqual
                   (let open Eq in
                   option bool)
                   None ) ) ;
      describe "fromString" (fun () ->
          test "converts string to Some(true)" (fun () ->
              expect (fromString "true")
              |> toEqual
                   (let open Eq in
                   option bool)
                   (Some true) ) ;
          test "converts string to Some(false)" (fun () ->
              expect (fromString "false")
              |> toEqual
                   (let open Eq in
                   option bool)
                   (Some false) ) ;
          test "capital True returns None" (fun () ->
              expect (fromString "True")
              |> toEqual
                   (let open Eq in
                   option bool)
                   None ) ;
          test "non-string returns None" (fun () ->
              expect (fromString "1")
              |> toEqual
                   (let open Eq in
                   option bool)
                   None ) ) ;

      describe "xor" (fun () ->
          test
            "Returns [true] for xor of args true true"
            (fun () -> expect (xor true true) |> toEqual Eq.bool false) ;
          test
            "Returns [true] for xor of args true false]"
            (fun () -> expect (xor true false) |> toEqual Eq.bool true) ;
          test
            "Returns [true] for xor of args false true"
            (fun () -> expect (xor false true) |> toEqual Eq.bool true) ;
          test
            "Returns [false] for xor of args false false"
            (fun () -> expect (xor false false) |> toEqual Eq.bool false) ) ;

      describe "not" (fun () ->
          test "Returns negation of true, returns false" (fun () ->
              expect (not true) |> toEqual Eq.bool false ) ;
          test "Returns negation of false, returns true" (fun () ->
              expect (not false) |> toEqual Eq.bool true ) ) ;

      describe "toString" (fun () ->
          test "Returns string of true bool" (fun () ->
              expect (toString true) |> toEqual Eq.string "true" ) ;
          test "Returns string of false bool" (fun () ->
              expect (toString false) |> toEqual Eq.string "false" ) ) ;

      describe "toInt" (fun () ->
          test "Returns 1 for true or 0 for false" (fun () ->
              expect (toInt true) |> toEqual Eq.int 1 ) ;
          test "Returns 1 for true or 0 for false" (fun () ->
              expect (toInt false) |> toEqual Eq.int 0 ) ) ;
      describe "equal" (fun () ->
          test
            "Returns true if bools are equal or false is they are not"
            (fun () -> expect (equal true true) |> toEqual Eq.bool true) ;
          test "Returns 1 for true or 0 for false" (fun () ->
              expect (equal false false) |> toEqual Eq.bool true ) ;
          test "Returns 1 for true or 0 for false" (fun () ->
              expect (equal true false) |> toEqual Eq.bool false ) ) ;

      describe "compare" (fun () ->
          test
            "Returns int 1, 0, or -1 to describe comparison of 2 bools"
            (fun () -> expect (compare true true) |> toEqual Eq.int 0) ;
          test
            "Returns int 1, 0, or -1 to describe comparison of 2 bools"
            (fun () -> expect (compare true false) |> toEqual Eq.int 1) ;
          test
            "Returns int 1, 0, or -1 to describe comparison of 2 bools"
            (fun () -> expect (compare false true) |> toEqual Eq.int (-1)) ;
          test
            "Returns int 1, 0, or -1 to describe comparison of 2 bools"
            (fun () -> expect (compare false false) |> toEqual Eq.int 0) ) )

#    Actividad 3.3 Practicando los lenguajes libres de contexto
#    BNF y EBNF
#
#    Fernanda Osorio, Emilia Salazar e Ian Holender
#    2022_05_20

 @doc """
  BNF

  ## Modules
    <module> ::= <defmodule> | <defmodule> <defmodules>
    <defmodule> ::= defmodule <module_name> do \n\t<body>\n end
    <body> ::= <function> | <function> <body>
    <body>
    <defmodules> ::= <defmodule> | <defmodule> <defmodules>


## Functions
    <functions> ::= <function> | <function> <functions>
    <function> ::= <function_name> <function_body>
    <function> ::= def <function_name> <function_arguments> do <statements> end


  """

 @doc """
  EBNF

  ## Modules
   MODULE ::= DEFMODULE ( <defmodules> )?
   <defmodule> ::= "defmodule" <module_name> "do" "\n\t" <body> "\n" "end"
   <body> ::= <function> ( <function> )*
   <defmodules> ::= <defmodule> ( <defmodules> )*


## Functions
    <functions> ::= <function> | <function> <functions>
    <function> ::= <function_name> <function_body>
    <function> ::= def <function_name> <function_arguments> do <statements> end


  """

  defmodule Modulos do

    def modulos do
      "Module" ++ " " ++ "Name" ++ " " ++ "Functions" ++ " " ++ "End"
    end

    defp modulopriv do
      "Private Module" ++ " " ++ "Name" ++ " " ++ "Functions" ++ " " ++ "End"
    end

    def moduleshort,  do: "Module" ++ " " ++ "Name" ++ " " ++ "Functions" ++ " " ++ "End"

    defp moduleshortpriv, do: "Private Module" ++ " " ++ "Name" ++ "Functions" ++ " " ++ "End"


  end

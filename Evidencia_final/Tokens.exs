# # El lenguaje utilizado será python,los tokens serán los siguientes:
# 1. Palabras reservadas -> if, else, while, for, print, return, import, def, class, try, except,
# 2. identificador (variable, función, clase, módulo u otro objeto) -> A-Z o a-z) o un guion bajo (_) seguido de cero o más letras, guiones bajos y dígitos (0-9).
# 3. Operador aritmetico -> (+, -, *, /, %, **, //)
# 4. operadores de asignación (=, +=, -=, *=, /=, etc.)
# 5. operadores de comparación (==, !=, <, >, <=, >=)
# 6. operadores lógicos (and, or, not)
# 7. int 0 - 9
# 8. float 0 - 9 . 0 - 9
# 9. string " ..... "
# 10. comentarios #
# 11. espacios
# 12. listas []
# 13. tuplas ()
# 14. diccionarios

defmodule Resaltador_syntaxys do

  def resaltador(file_path) do
    python_code =
      file_path
      |> File.read!()

    IO.puts("Python Code:")
    IO.puts(python_code)
    IO.puts("Code Length: #{String.length(python_code)}")


    python_code
    |> String.graphemes()
    |> do_resaltador([])
    |> Enum.reverse()
  end


# Una vez que ya haya recorrido todo el archivo y la lista de graphmemes este vacía, va a entregar los tokens que lleva acumulados
  defp do_resaltador([], tokens), do: tokens

# Función para saltar los espacios
  defp do_resaltador([" " | rest], tokens), do: do_resaltador(rest, tokens)

  defp do_resaltador(["\n" | rest], tokens), do: do_resaltador(rest, tokens)

# Función cuando se encuentra el inicio del string, en esta función se ve si el elemento de la lista es una comilla o una comilla doble lo cual significa que hay un string, por lo que llama a la función privada string maker para extraer el string completo.
  defp do_resaltador(list = ["\"" | _], tokens) do
    {string, rest} = string_make(list, [])
    IO.puts("String Token:")
    IO.inspect(Enum.join(string))
    do_resaltador(rest, [{Enum.join(string), "string"} | tokens])
  end

  # Busca paréntesis
  defp do_resaltador(["(" | rest], tokens), do: do_resaltador(rest, [{"(", "open_parenthesis"} | tokens])
  defp do_resaltador([")" | rest], tokens), do: do_resaltador(rest, [{")", "close_parenthesis"} | tokens])

  defp do_resaltador([":" | rest], tokens), do: do_resaltador(rest, [{":", "colon"} | tokens])

  defp do_resaltador(["," | rest], tokens), do: do_resaltador(rest, [{",", "comma"} | tokens])

 #Busca los operadores que son aritméticos
  defp do_resaltador(["+" | rest], tokens), do: do_resaltador(rest, [{"+", "arithmetic_operator"} | tokens])
  defp do_resaltador(["-" | rest], tokens), do: do_resaltador(rest, [{"-", "arithmetic_operator"} | tokens])
  defp do_resaltador(["*" | rest], tokens), do: do_resaltador(rest, [{"*", "arithmetic_operator"} | tokens])
  defp do_resaltador(["/" | rest], tokens), do: do_resaltador(rest, [{"/", "arithmetic_operator"} | tokens])
  defp do_resaltador(["=" | rest], tokens), do: do_resaltador(rest, [{"=", "arithmetic_operator"} | tokens])
  defp do_resaltador(["%" | rest], tokens), do: do_resaltador(rest, [{"%", "arithmetic_operator"} | tokens])

  #Busca los operadores que comparan expresiones
  defp do_resaltador(["<" | rest], tokens), do: do_resaltador(rest, [{"<", "comparative_operator"} | tokens])
  defp do_resaltador([">" | rest], tokens), do: do_resaltador(rest, [{">", "comparative_operator"} | tokens])
  # defp do_resaltador(["=" , "=" | rest], tokens), do: do_resaltador(rest, [{"==", "comparative_operator"} | tokens])
  # defp do_resaltador(["<" , "=" | rest], tokens), do: do_resaltador(rest, [{"<=", "comparative_operator"} | tokens])
  # defp do_resaltador([">" , "=" | rest], tokens), do: do_resaltador(rest, [{">=", "comparative_operator"} | tokens])
  # defp do_resaltador(["!" , "=" | rest], tokens), do: do_resaltador(rest, [{"!=", "comparative_operator"} | tokens])


  #Busca operadores asignativos
  # defp do_resaltador(["+" , "=" | rest], tokens), do: do_resaltador(rest, [{"+=", "assignative_operator"} | tokens])

  # defp do_resaltador(["-" , "=" | rest], tokens), do: do_resaltador(rest, [{"-=", "assignative_operator"} | tokens])

  # defp do_resaltador(["*" , "=" | rest], tokens), do: do_resaltador(rest, [{"*=", "assignative_operator"} | tokens])

  # defp do_resaltador(["/" , "=" | rest], tokens), do: do_resaltador(rest, [{"/=", "assignative_operator"} | tokens])

  defp do_resaltador(list, tokens) do
    case word_make(list) do
      {[], _rest} ->
        {token, rest} = number_make(list)
        do_resaltador(rest, [{Enum.join(token), "number"} | tokens])
      {word, rest} ->
        type = if Enum.join(word) in ~w(and or not or if or else or elif or when or switch or for or while or true or false or True or False or print or return or def or import or break), do: "reserved_word", else: "identifier"
        do_resaltador(rest, [{Enum.join(word), type} | tokens])
    end
  end
#
  #Esta función lo que hace es que cuando encuentra unas comillas iguales a las que abrieron el string regresa el string. Va pasando por cada elemento en la lista si es que es diferente a las comillas, finalmente regresa el string concatenando la comilla inicial, las palabras y la comilla inicial, con el resto de la lista de elementos que no pertenecieron a ese token.
  defp string_make([comillas | rest],tokens) when comillas in ~w(' ") do
    case Enum.split_while(rest, &(&1 != comillas)) do
      {string, [^comillas | rest]} -> {tokens ++ [comillas | string] ++ [comillas], rest}
    end
  end

  defp word_make(list) do
    list
    |> Enum.split_while(&(&1 =~ ~r/[a-zA-Z_]/))
  end


  defp number_make(list) do
    list
    |> Enum.split_while(&(&1 =~ ~r/[0-9.]/))
  end








end

tokens = Resaltador_syntaxys.resaltador("./funciones.py")
IO.inspect(tokens)

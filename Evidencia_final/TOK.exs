defmodule Resaltador_syntaxys do
  def resaltador(file_path) do
    File.write("./Tokens.html", "")
    File.write("./Tokens.html", """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="tokens.css">
    </head>
    <body>
    """)


    file_path
      |> File.stream!()
      |> Stream.map(&process_line/1)
      |> Enum.to_list()


  end

  defp process_line(line) do
    token_finder(line, [])
    File.write("./Tokens.html", "<br>", [:append])

  end

  defp token_finder("", tokens), do: Enum.reverse(tokens)

  defp token_finder(line, tokens) do

      {line, tokens} = reserved_word(line, tokens)
      {line, tokens} = punctuator(line, tokens)
      {line, tokens} = logical_operator(line, tokens)
      {line, tokens} = comment(line, tokens)
      {line, tokens} = identifier(line, tokens)
      {line, tokens} = number(line, tokens)
      {line, tokens} = assignment_operator(line, tokens)
      {line, tokens} = comparison_operator(line, tokens)
      {line, tokens} = arithmetic_operator(line, tokens)
      {line, tokens} = space(line, tokens)
      {line, tokens} = string(line, tokens)


      if line == "", do: Enum.reverse(tokens), else: token_finder(line, tokens)
    end


  defp reserved_word(line, tokens) do
    case Regex.run(~r/(^if|^else|^elif|^while|^for|^print|^return|^len|^str|^def|^import|^class|^try|^except|^break)\b/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "reserved_word", [{token_match, "reserved word"} | tokens])}
    end
  end

  defp space(line, tokens) do
    case Regex.run(~r/(^\s)/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "space", [{token_match, "space"} | tokens])}
    end
  end

  defp logical_operator(line, tokens) do
    case Regex.run(~r/(^and|^or|^not)\b/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "logical_operator", [{token_match, "logical_operator"} | tokens])}
    end
  end

  defp identifier(line, tokens) do
    case Regex.run(~r/^[A-Za-z_][A-Za-z_0-9]*/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "identifier", [{token_match, "identifier"} | tokens])}
    end
  end

  defp number(line, tokens) do
    case Regex.run(~r/^\b\d+\.?\d*\b/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "number", [{token_match, "number"} | tokens])}
    end
  end

  defp arithmetic_operator(line, tokens) do
    case Regex.run(~r/^\+|^-|^\*|^\/|^%|^\*\*|^\/\//, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "arithmetic_operator", [{token_match, "arithmetic_operator"} | tokens])}
    end
  end

  defp comparison_operator(line, tokens) do
    case Regex.run(~r/^==|^!=|^>|^<|^>=|^<=/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "comparison_operator", [{token_match, "comparison_operator"} | tokens])}
    end
  end

  defp assignment_operator(line, tokens) do
    case Regex.run(~r/^\+=|^-=|^\*=|^\/=|^%=|^\*\*=|^=/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "assigment_operator", [{token_match, "assigment_operator"} | tokens])}
    end
  end

  defp comment(line, tokens) do
    case Regex.run(~r/^#.*$/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "comment", [{token_match, "comment"} | tokens])}
    end
  end

  defp string(line, tokens) do
    case Regex.run(~r/(['"])(?:(?!\1).)*\1/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "string", [{token_match, "string"} | tokens])}
    end
  end


  defp punctuator(line, tokens) do
    case Regex.run(~r/^[\[\](){}:,\]]/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "punctuator", [{token_match, "punctuator"} | tokens])}
    end
  end



  defp html(token, token_type, tokens) do
    token_html = "<span class=\"#{token_type}\">#{token}</span>\n"
    File.write("./Tokens.html", token_html, [:append])
    tokens
  end





end


tokens = Resaltador_syntaxys.resaltador("./funciones.py")
File.write("./Tokens.html", "</body></html>\n" , [:append])
IO.inspect(tokens)

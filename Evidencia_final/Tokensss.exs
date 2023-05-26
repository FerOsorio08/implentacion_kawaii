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
      {line, tokens} = open_par(line, tokens)
      {line, tokens} = open_key(line, tokens)
      {line, tokens} = open_bra(line, tokens)
      {line, tokens} = comment(line, tokens)
      {line, tokens} = identifier(line, tokens)
      {line, tokens} = number(line, tokens)
      {line, tokens} = arithmetic_operator(line, tokens)
      {line, tokens} = logical_operator(line, tokens)
      {line, tokens} = assignment_operator(line, tokens)
      {line, tokens} = comparison_operator(line, tokens)
      {line, tokens} = close_bra(line, tokens)
      {line, tokens} = close_key(line, tokens)
      {line, tokens} = close_par(line, tokens)

      line = Regex.replace(~r/^\s*\W?\s*/, line, "", global: false)

      if line == "", do: Enum.reverse(tokens), else: token_finder(line, tokens)
    end


  defp reserved_word(line, tokens) do
    case Regex.run(~r/(if|else|elif|while|for|print|return|def|import|class|try|except|break)\b/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "reserved_word", [{token_match, "reserved word"} | tokens])}
    end
  end

  defp logical_operator(line, tokens) do
    case Regex.run(~r/(and|or|not)\b/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "logical_operator", [{token_match, "logical_operator"} | tokens])}
    end
  end

  defp identifier(line, tokens) do
    case Regex.run(~r/[A-Za-z_][A-Za-z_0-9]*/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "identifier", [{token_match, "identifier"} | tokens])}
    end
  end

  defp number(line, tokens) do
    case Regex.run(~r/\b\d+\.?\d*\b/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "number", [{token_match, "number"} | tokens])}
    end
  end

  defp arithmetic_operator(line, tokens) do
    case Regex.run(~r/\+|-|\*|\/|%|\*\*|\/\//, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "arithmetic_operator", [{token_match, "arithmetic_operator"} | tokens])}
    end
  end

  defp comparison_operator(line, tokens) do
    case Regex.run(~r/==|!=|>|<|>=|<=/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "comparison_operator", [{token_match, "comparison_operator"} | tokens])}
    end
  end

  defp assignment_operator(line, tokens) do
    case Regex.run(~r/\+=|-=|:|\*=|\/=|%=|\*\*=|=/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "assigment_operator", [{token_match, "assigment_operator"} | tokens])}
    end
  end

  defp comment(line, tokens) do
    case Regex.run(~r/(^#.*$)/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "comment", [{token_match, "comment"} | tokens])}
    end
  end

  defp open_bra(line, tokens) do
    case Regex.run(~r/\[/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "open_bra", [{token_match, "open_bra"} | tokens])}
    end
  end

  defp close_bra(line, tokens) do
    case Regex.run(~r/\]/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "close_bra", [{token_match, "close_bra"} | tokens])}
    end
  end


  defp open_key(line, tokens) do
    case Regex.run(~r/\{/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "open_key", [{token_match, "open_key"} | tokens])}
    end
  end

  defp close_key(line, tokens) do
    case Regex.run(~r/\}/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "close_key", [{token_match, "close_key"} | tokens])}
    end
  end

  defp open_par(line, tokens) do
    case Regex.run(~r/\(/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "open_par", [{token_match, "open_par"} | tokens])}
    end
  end

  defp close_par(line, tokens) do
    case Regex.run(~r/\)/, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, "close_par", [{token_match, "close_par"} | tokens])}
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

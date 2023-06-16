defmodule Resaltador_syntaxys do
  # This function takes python file path as parameter and is used to highlight various tokens of provided file in html format.

  def resaltador(file_path, html_file) do
    # Write header to file
    write_header(html_file)

    # Process the file and write the tokens to the file
    file_path
    |> File.stream!()
    |> Enum.map(&String.trim_trailing/1)
    |> Stream.map(&process_line/1)
    |> Enum.each(fn html_tokens ->
      Enum.each(html_tokens, fn html ->
        File.write(html_file, html, [:append])
      end)
      File.write(html_file, "<br>", [:append])
    end)

    # Write footer to file
    write_footer(html_file)
  end

  # This function writes the header content to the file.
  defp write_header(html_file) do
    File.write(html_file, """
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
      <link rel="stylesheet" type="text/css" href="Tokens.css">
    </head>
    <body>
    <div class = "dropdown"> <div class="butt_container"><button class = "button">TOKEN MENU</button></div>
      <div class="dropdown-content">
        <span class="string">String</span><br>
        <span class="reserved_word">reserved_word</span><br>
        <span class="logical_operator">logical_operator</span><br>
        <span class="comment">comment</span><br>
        <span class="python_methods">python_methods</span><br>
        <span class="boolean">boolean</span><br>
        <span class="identifier">identifier</span><br>
        <span class="number">number</span><br>
        <span class="assigment_operator">assigment_operator</span><br>
        <span class="comparison_operator">comparison_operator</span><br>
        <span class="arithmetic_operator">arithmetic_operator</span><br>
        <span class="punctuator">punctuator</span><br>
      </div>
    </div>
    <script>
    // JavaScript code to handle the dropdown functionality
    var dropdown = document.getElementsByClassName("dropdown")[0];
    dropdown.addEventListener("mouseenter", function() {
      this.getElementsByClassName("dropdown-content")[0].style.display = "block";
    });
    dropdown.addEventListener("mouseleave", function() {
      this.getElementsByClassName("dropdown-content")[0].style.display = "none";
    });
    </script>
    <pre>
    """)
  end

  # This function writes the footer content to the file.
  defp write_footer(html_file) do
    File.write(html_file, "</pre></body></html>\n", [:append])
  end

  # This function takes a line of text as input, finds any tokens (words or symbols) in it and appends them to an empty list.
  # defp process_line(line) do
  #   token_finder(line, [])
  #   File.write("./Tokens.html", "<br>", [:append])
  # end
  defp process_line(line) do
    token_finder(line, [])
  end

  defp token_finder("", tokens), do: Enum.reverse(tokens)

  # This is a private helper function, which is used to tokenize different types of tokens in provided line.
  defp token_finder(line, tokens) do
    {line, tokens} =
      tokenize(
        line,
        tokens,
        ~r/(^if|^else|^elif|^while|^for|^print|^return|^len|^str|^def|^import|^class|^try|^except|^break)\b/,
        "reserved_word"
      )

    {line, tokens} = tokenize(line, tokens, ~r/(^\s+)/, "space")
    {line, tokens} = tokenize(line, tokens, ~r/(^and|^or|^not)\b/, "logical_operator")
    {line, tokens} = tokenize(line, tokens, ~r/^#.*$/, "comment")

    {line, tokens} =
      tokenize(
        line,
        tokens,
        ~r/^abs|^all|^any|^ascii|^bin|^bool|^callable|^chr|^classmethod|^compile|^delattr|^dir|^divmod|^enumerate|^eval|^exec|^filter|^float|^format|^getattr|^hasattr|^hash|^help|^hex|^id|^input|^int|^isinstance|^issubclass|^iter|^len|^list|^map|^max|^min|^next|^object|^oct|^open|^ord|^pow|^print|^property|^range|^repr|^reversed|^round|^set|^setattr|^slice|^sorted|^staticmethod|^str|^sum|^super|^tuple|^type|^vars|^zip|^append|^pop/,
        "python_methods"
      )

    {line, tokens} = tokenize(line, tokens, ~r/^[A-Za-z_][A-Za-z_0-9]*/, "identifier")
    {line, tokens} = tokenize(line, tokens, ~r/^True|^False\b/, "boolean")
    {line, tokens} = tokenize(line, tokens, ~r/^\b\d+\.?\d*\b/, "number")
    {line, tokens} = tokenize(line, tokens, ~r/^==|^!=|^>=|^<=|^>|^</, "comparison_operator")

    {line, tokens} =
      tokenize(line, tokens, ~r/^\+=|^-=|^\*=|^\/=|^%=|^\*\*=|^=/, "assigment_operator")

    {line, tokens} =
      tokenize(line, tokens, ~r/^\+|^-|^\*|^\/|^%|^\*\*|^\/\//, "arithmetic_operator")

    {line, tokens} = tokenize(line, tokens, ~r/^[\[\](){}:,.&\]]/, "punctuator")
    {line, tokens} = tokenize(line, tokens, ~r/(^['"])(?:(?!\1).)*\1/, "string")

    if line == "", do: Enum.reverse(tokens), else: token_finder(line, tokens)
  end

  defp tokenize(line, tokens, regex, token_type) do
    case Regex.run(regex, line) do
      nil ->
        {line, tokens}

      [token_match | _] ->
        html_string = html(token_match, token_type)
        new_line = String.replace(line, token_match, "", global: false)
        new_tokens = [html_string | tokens]

        {new_line, new_tokens}
    end
  end

  # This is a private helper function which converts the given token into its HTML representation with span class 'token_type'.
  defp html(token, token_type) do
    "<span class=\"#{token_type}\">#{token}</span>"
  end




end


# # SELECCIÓ DE LENGUAJE
tokens = Resaltador_syntaxys.resaltador("./funciones.py", "./Tokens.html")
IO.inspect(tokens)

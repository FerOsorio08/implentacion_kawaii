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



    file_path
      |> File.stream!()
      # Remove trailing
      |>Enum.map(&String.trim_trailing/1)
      |> Stream.map(&process_line/1)
      |> Enum.to_list()


  end

  defp process_line(line) do
    token_finder(line, [])
    File.write("./Tokens.html", "<br>", [:append])

  end

  defp token_finder("", tokens), do: Enum.reverse(tokens)

  defp token_finder(line, tokens) do
      {line, tokens} = tokenize(line, tokens, ~r/(^if|^else|^elif|^while|^for|^print|^return|^len|^str|^def|^import|^class|^try|^except|^break)\b/, "reserved_word")
      {line, tokens} = tokenize(line, tokens, ~r/(^\s+)/, "space")
      {line, tokens} = tokenize(line, tokens, ~r/(^and|^or|^not)\b/, "logical_operator")
      {line, tokens} = tokenize(line, tokens, ~r/^#.*$/, "comment")
      {line, tokens} = tokenize(line, tokens, ~r/^abs|^all|^any|^ascii|^bin|^bool|^callable|^chr|^classmethod|^compile|^delattr|^dir|^divmod|^enumerate|^eval|^exec|^filter|^float|^format|^getattr|^hasattr|^hash|^help|^hex|^id|^input|^int|^isinstance|^issubclass|^iter|^len|^list|^map|^max|^min|^next|^object|^oct|^open|^ord|^pow|^print|^property|^range|^repr|^reversed|^round|^set|^setattr|^slice|^sorted|^staticmethod|^str|^sum|^super|^tuple|^type|^vars|^zip|^append|^pop/, "python_methods")
      {line, tokens} = tokenize(line, tokens, ~r/^[A-Za-z_][A-Za-z_0-9]*/, "identifier")
      {line, tokens} = tokenize(line, tokens, ~r/^True|^False\b/, "boolean")
      {line, tokens} = tokenize(line, tokens, ~r/^\b\d+\.?\d*\b/, "number")
      {line, tokens} = tokenize(line, tokens, ~r/^==|^!=|^>=|^<=|^>|^</, "comparison_operator")
      {line, tokens} = tokenize(line, tokens, ~r/^\+=|^-=|^\*=|^\/=|^%=|^\*\*=|^=/, "assigment_operator")
      {line, tokens} = tokenize(line, tokens, ~r/^\+|^-|^\*|^\/|^%|^\*\*|^\/\//, "arithmetic_operator")
      {line, tokens} = tokenize(line, tokens, ~r/^[\[\](){}:,.\]]/, "punctuator")
      {line, tokens} = tokenize(line, tokens, ~r/(^['"])(?:(?!\1).)*\1/, "string")




      if line == "", do: Enum.reverse(tokens), else: token_finder(line, tokens)
    end

  defp tokenize(line, tokens, regex, token_type) do
    case Regex.run(regex, line) do
      nil -> {line, tokens}
      [token_match | _] ->
        {String.replace(line, token_match, "", global: false),
        html(token_match, token_type, [{token_match, token_type} | tokens])}
    end
  end

  defp html(token, token_type, tokens) do
    token_html = "<span class=\"#{token_type}\">#{token}</span>"
    File.write("./Tokens.html", token_html, [:append])
    tokens
  end





end


tokens = Resaltador_syntaxys.resaltador("./funciones.py")
File.write("./Tokens.html", "</pre></body></html>\n" , [:append])
IO.inspect(tokens)

defmodule Syntaxhighlighter do
  def highlight(file) do
    expanded_path = Path.expand(file)

    IO.puts("Reading file: #{expanded_path}")

    case File.read(expanded_path) do
      {:ok, text} ->
        highlighted_text = highlight_text(text)
        html_content = build_html_content(highlighted_text)
        File.write("./Tokens.html", html_content)

      {:error, reason} ->
        IO.puts("Error: #{reason}")
    end
  end

  defp highlight_text(text) do
    text
    |> String.split("\n")
    |> Enum.map(&highlight_line/1)
    |> Enum.join("\n")
  end

  defp highlight_line(line) do

     # String "" and ''
     line = highlight_regex(~r/("[^"\\](?:\\.[^"\\])*")/, line, "<span class=\"string\">\\1</span>")
     line = highlight_regex(~r/('[^'\\](?:\\.[^'\\])*')/, line, "<span class=\"string\">\\1</span>")

    # <, >, /,=
     line = Regex.replace(~r/(\<|\>|=|\/)/, line, "<span class=\"operator\">\\1</span>")

     #HTML
     line = Regex.replace(~r/(\<|\>|=|\/)/, line, "<span class=\"operator\">\\1</span>")

    # Variables
    # line = highlight_regex(~r/\b[a-zA-Z_]\w*\b/, line, "<span >L \\1</span>")
    # "<span class=\"variable\">\\1</span>"
    # "<span class= variable>\.\\1</span>"

    # String "" and ''
    line = highlight_regex(~r/^("[^"\\](?:\\.[^"\\])*")/, line, "<span class=\"string\">\\1</span>")
    line = highlight_regex(~r/^('[^'\\](?:\\.[^'\\])*')/, line, "<span class=\"string\">\\1</span>")

    # Comments
    line = highlight_regex(~r/^#(.*)$/, line, "<span class=\"comment\">#\\1</span>")

    # Numbers
    line = Regex.replace(~r/(\d+)/, line, "<span class=\"number\">\\1</span>")

    # Operators
    line = highlight_regex(~r/(\+|-|\*)/, line, "<span class=\"operator\">\\1</span>")

    #Punctuation
    line = highlight_regex(~r/(\.|;|:|\,)/, line, "<span class=\"punctuation\">\\1</span>")

    # Keywords
    line = highlight_regex(~r/\b(def|if|else|elif|for|while|in|return|try|import|break|except|print)\b/, line, "<span class=\"keyword\">\\1</span>")

    # Boolean
    line = highlight_regex(~r/\b(True|False)\b/, line, "<span class=\"boolean\">\\1</span>")

    # Functions
    line = highlight_regex(~r/\b(\w+)\(/, line, "<span class=\"function\">\\1</span>(")

    # Parenthesis
    line = highlight_regex(~r/(\(|\))/, line, "<span class=\"parenthesis\">\\1</span>")

    # Keys
    line = highlight_regex(~r/(\{|\})/, line, "<span class=\"keys\">\\1</span>")

    # Brackets
    line = highlight_regex(~r/(\[|\])/, line, "<span class=\"parenthesis\">\\1</span>")

    # Methods
    line = highlight_regex(~r/\.(?!\d)\w+/, line, ".<span class=\"method\">\\0</span>")

    # @...
    line = highlight_regex(~r/@(\w+)/, line, "@<span class=\"decorator\">\\1</span>")

    # Logical operators
    line = highlight_regex(~r/\b(and|or|not|\/)\b/, line, "<span class=\"logicaloperator\">\\1</span>")

    line
  end

  defp highlight_regex(regex, line, replacement) do
    Regex.replace(regex, line, replacement, global: true)
  end

  defp build_html_content(highlighted_text) do
    """
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="/syntax.css" type="text/css" rel="stylesheet">
      <title>Syntax Highlighter</title>
    </head>
    <body>
      <pre>
        #{highlighted_text}
      </pre>
    </body>
    </html>
    """
  end

end

Syntaxhighlighter.highlight("./funciones.py")

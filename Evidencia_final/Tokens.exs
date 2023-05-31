# defmodule Resaltador_syntaxys do
#   def resaltador(file_path) do
#     header = """
#     <!DOCTYPE html>
#     <html lang="en">
#     <head>
#         <meta charset="UTF-8">
#         <meta http-equiv="X-UA-Compatible" content="IE=edge">
#         <meta name="viewport" content="width=device-width, initial-scale=1.0">
#         <title>Document</title>
#         <link rel="stylesheet" type="text/css" href="tokens.css">
#     </head>
#     <body>
#     """
#     footer = """
#     </body>
#     </html>
#     """
#     File.write("./Tokens.html", header)

#     File.stream!(file_path)
#     |> Stream.map(&process_line/1)
#     |> Stream.into(File.stream!("./Tokens.html", [:append]))
#     |> Stream.run()

#     File.write("./Tokens.html", footer, [:append])
#   end

#   defp process_line(line) do
#     line = replace_token(line, ~r/#.*$/, "comment")
#     line = replace_token(line, ~r/\+=|-=|:|,|\*=|\/=|%=|\*\*=|=/, "assignment_operator")
#     line = replace_token(line, ~r/==|!=|>|<|>=|<=/, "comparison_operator")
#     line = replace_token(line, ~r/\+|-|\*|\/|%|\*\*|\/\//, "arithmetic_operator")
#     line = replace_token(line, ~r/\b\d+\.?\d*\b/, "number")
#     line = replace_token(line, ~r/[A-Za-z_][A-Za-z_0-9]*\b(?<!reserved_word)(?<!logical_operator)/, "identifier")
#     line = replace_token(line, ~r/(and|or|not)\b/, "logical_operator")
#     line = replace_token(line, ~r/(if|else|elif|while|for|print|return|def|import|class|try|except|break)\b/, "reserved_word")
#     line = replace_token(line, ~r/[\[\](){}:,\]]/, "punctuator")



#     line <> "<br>\n"
#   end


#   defp replace_token(line, regex, token_class) do
#     Regex.replace(regex, line, "<span class=\"#{token_class}\">\\0</span>\n")
#   end

# end

# tokens = Resaltador_syntaxys.resaltador("./funciones.py")
# IO.inspect(tokens)
defmodule Resaltador_syntaxys do
  def resaltador(file_path) do
    header = """
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
    """
    footer = """
    </body>
    </html>
    """

    File.write("./Tokens.html", header)

    File.stream!(file_path)
    |> Enum.each(&process_line/1)

    File.write("./Tokens.html", footer, [:append])
  end



  defp process_line(line) do
    line = replace_token(line, ~r/#.*$/, "comment")
    line = replace_token(line, ~r/\+=|-=|:|,|\*=|\/=|%=|\*\*=|==|!=|>|<|>=|<=|\+|-|\*|\/|%|\*\*|\//, "operator")
    line = replace_token(line, ~r/\b\d+\.?\d*\b/, "number")
    line = replace_token(line, ~r/(['"])(?:(?!\1).)*\1/, "string")
    # line = replace_token(line, ~r/[A-Za-z_][A-Za-z_0-9]*\b(?<!reserved_word)(?<!logical_operator)/, "identifier")
    line = replace_token(line, ~r/(if|else|elif|while|for|print|return|def|import|class|try|except|break|and|or|not)\b/, "reserved_word")
    line = replace_token(line, ~r/[\[\](){}:,\]]/, "punctuator")


    File.write("./Tokens.html", line, [:append])
  end

  defp replace_token(line, regex, token_class) do
    Regex.replace(regex, line, token_class)
  end
end

Resaltador_syntaxys.resaltador("./funciones.py")
IO.puts("HTML file generation completed.")

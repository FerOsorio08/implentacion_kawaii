#Código de Emilia Salazar, Fernanda Osorio e Ian Holender
defmodule Resaltador_syntaxys do

# Esta primera función lo que hace es una vez que recibe los archivos de python, separa el archivo para tomar como
# argumento el nombre del archivo antes del .py y posteriormente crea un archivo que se llama de la misma manera pero es html.
# Después llama la función de proccess_file pasando los parámetros de las direcciones de los dos archivos.
  def resaltador(file_path) do
    base_name = Path.basename(file_path, ".py")
    html_file_path = "./#{base_name}.html"
    process_file(file_path, html_file_path)
  end

  # Process file lo que hace es escribir en el html el texto que va hasta el principio,
  # después lee el archivo de python y llama a la función de process line y posteriormente los tokens que se vayan encontrando
  # a lo largo de la función los escribe en el archivo de html. Dinalmente termina el documento de html con los closing tags.
  defp process_file(file_path, html_file) do
    write_header(html_file)
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

    write_footer(html_file)
  end

#Esta función inicia el contenido de html
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

#Esta función escribe los closing tags del html
  defp write_footer(html_file) do
    File.write(html_file, "</pre></body></html>\n", [:append])
  end

#Esta función pasa cada línea del codigo a token finder para que la procese y encuentre los tokens
  defp process_line(line) do
    token_finder(line, [])
  end


# Esta función buca los tokens al inicio de la linea y se llama de manera recursiva hasta que ya no haya más tokens en la línea.
# Finalmente regresa una tupla con la token encontrada y el tipo de token que es.
  defp token_finder("", tokens), do: Enum.reverse(tokens)
  defp token_finder(line, tokens) do
    {line, tokens} = tokenize(line,tokens,~r/(^if|^else|^elif|^while|^for|^print|^return|^len|^str|^def|^import|^class|^try|^except|^break)\b/,"reserved_word")
    {line, tokens} = tokenize(line, tokens, ~r/(^\s+)/, "space")
    {line, tokens} = tokenize(line, tokens, ~r/(^and|^or|^not)\b/, "logical_operator")
    {line, tokens} = tokenize(line, tokens, ~r/^#.*$/, "comment")
    {line, tokens} = tokenize(line,tokens,~r/^abs|^all|^any|^ascii|^bin|^bool|^callable|^chr|^classmethod|^compile|^delattr|^dir|^divmod|^enumerate|^eval|^exec|^filter|^float|^format|^getattr|^hasattr|^hash|^help|^hex|^id|^input|^int|^isinstance|^issubclass|^iter|^len|^list|^map|^max|^min|^next|^object|^oct|^open|^ord|^pow|^print|^property|^range|^repr|^reversed|^round|^set|^setattr|^slice|^sorted|^staticmethod|^str|^sum|^super|^tuple|^type|^vars|^zip|^append|^pop/,"python_methods")
    {line, tokens} = tokenize(line, tokens, ~r/^[A-Za-z_][A-Za-z_0-9]*/, "identifier")
    {line, tokens} = tokenize(line, tokens, ~r/^True|^False\b/, "boolean")
    {line, tokens} = tokenize(line, tokens, ~r/^\b\d+\.?\d*\b/, "number")
    {line, tokens} = tokenize(line, tokens, ~r/^==|^!=|^>=|^<=|^>|^</, "comparison_operator")
    {line, tokens} = tokenize(line, tokens, ~r/^\+=|^-=|^\*=|^\/=|^%=|^\*\*=|^=/, "assigment_operator")
    {line, tokens} =tokenize(line, tokens, ~r/^\+|^-|^\*|^\/|^%|^\*\*|^\/\//, "arithmetic_operator")
    {line, tokens} = tokenize(line, tokens, ~r/^[\[\](){}:,.&\]]/, "punctuator")
    {line, tokens} = tokenize(line, tokens, ~r/(^['"])(?:(?!\1).)*\1/, "string")
    if line == "", do: Enum.reverse(tokens), else: token_finder(line, tokens)
  end


# Esta función recibe la línea que se está leyendo, la expresión regular y el tipo de tokens y lo que hace es llamar a
# la función html con cada token encontrado para que se escriba correctamente en el documento.
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


#Esta función escribe la token como debe de estar en el html
  defp html(token, token_type) do
    "<span class=\"#{token_type}\">#{token}</span>"
  end

#Esta función recibe muchos archivos para ser inspeccionados y crea un thread para cada uno para que se haga el resaltador de syntaxys en cada archivo
  def resaltador_multiple_files(file_paths) do
    tasks = Enum.map(file_paths, fn file_path ->
      Task.async(fn -> resaltador(file_path) end)
    end)

    Enum.map(tasks, &Task.await/1)
  end

# Esta función recibe la dirección de el folder donde están los archivos de python a inspeccionar y busca todos los que terminen
# con .py y los manda a resaltador multiple para que se tokenizen todos.
  def resaltador_directory(dir_path) do
    file_paths = Path.wildcard("#{dir_path}/*.py")
    resaltador_multiple_files(file_paths)
  end

end

Resaltador_syntaxys.resaltador_directory("./Funciones")

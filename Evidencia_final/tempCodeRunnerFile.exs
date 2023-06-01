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
<!DOCTYPE html>
<html>
  <head>
    <title>Tank Debugger</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <script type="application/javascript" src="tanks.js"></script>
    <script type="application/javascript" src="jstanks.js"></script>
    <style type="text/css">
      body {
        max-width: 100%;
      }
      #preview {
        float: left;
      }
      #config {
        float: left;
      }
      #sensors input {
        width: 5em;
      }
      #code {
        float: left;
      }
      #submit {
        width: 40em;
      }
      textarea {
        min-width: 50em;
        min-height: 20em;
      }
      td {
        text-align: left;
      }
    </style>
    <script type="application/javascript" src="designer.js"></script>
    <script type="application/javascript">
      window.onload = function() { design(); update(); }
    </script>
  </head>
  <body style="background: #222; color: #bbb;">
    <h1>Tank Debugger</h1>
    <div id="game_box"><canvas id="battlefield" style="border: 2px solid green;" width="450" height="450"></canvas></div>
    <form action="designer.cgi" method="post">
    <p>
      <input type="button" onclick="resetTanks();" value="Run"> (Remember to submit (below) when you're done!)
    </p>
    <p id="debug"></p>
    <div id="stuff">
    <div id="code">
       <textarea id="program" name="program" rows="20" cols="80">get-turret 12 + set-turret!         ( Rotate turret )
37 40 set-speed!                    ( Go in circles )
0 sensor? { fire! } if              ( Fire if turret sensor triggered )
1 sensor? { -50 50 set-speed! } if  ( Turn if collision sensor triggered )
      </textarea><br>
      <fieldset id="submit">
        <p><input type="submit" value="Submit"></p>

    <p>
      Before you can get going with a tank, you need a password.  If you
      need a password, just ask one of the dirtbags.
    </p>

        <legend>Information</legend>
        <table>
          <tr>
            <td>Password:</td>
            <td><input name="token" type="password"></td>
          </tr>
          <tr>
            <td>Tank name:</td>
            <td><input name="name"></td>
          </tr>
          <tr>
            <td>Author:</td>
            <td><input name="author"> (eg. Joe Cool
              &lt;joe@cool.cc&gt;)</td>
          </tr>
        </table>
      </fieldset>
    </div>
    <div id="preview"><canvas id="design"></canvas><p id="debug"></p></div>
    <div id="config">
      <fieldset id="metadata">
        <legend>Information</legend>
        <table>
          <tr>
            <td>Color:</td>
            <td><input name="color" type="color" value="#c0c0c0"
                       onchange="update();"> (eg. #c7e148)</td>
          </tr>
        </table>
      </fieldset>

      <fieldset id="sensors">
        <legend>Sensors</legend>
        <table>
          <thead>
            <tr>
              <td>#</td>
              <td>Range</td>
              <td>Angle</td>
              <td>Width</td>
              <td>Turret?</td>
            </tr>
          </thead>
          <tbody>

            <tr>
              <td>0</td>
              <td><input name="s0r" type="number" min="0" max="100" onchange="update();" value="50"></td>
              <td><input name="s0a" type="number" min="-360" max="360" onchange="update();" value="0"></td>
              <td><input name="s0w" type="number" min="-360" max="360" onchange="update();" value="7"></td>
              <td><input name="s0t" type="checkbox" onchange="update();" checked="1"></td>
            </tr>

            <tr>
              <td>1</td>
              <td><input name="s1r" type="number" min="0" max="100" onchange="update();" value="30"></td>
              <td><input name="s1a" type="number" min="-360" max="360" onchange="update();" value="0"></td>
              <td><input name="s1w" type="number" min="-360" max="360" onchange="update();" value="90"></td>
              <td><input name="s1t" type="checkbox" onchange="update();"></td>
            </tr>

            <tr>
              <td>2</td>
              <td><input name="s2r" type="number" min="0" max="100" onchange="update();"></td>
              <td><input name="s2a" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s2w" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s2t" type="checkbox" onchange="update();"></td>
            </tr>

            <tr>
              <td>3</td>
              <td><input name="s3r" type="number" min="0" max="100" onchange="update();"></td>
              <td><input name="s3a" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s3w" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s3t" type="checkbox" onchange="update();"></td>
            </tr>

            <tr>
              <td>4</td>
              <td><input name="s4r" type="number" min="0" max="100" onchange="update();"></td>
              <td><input name="s4a" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s4w" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s4t" type="checkbox" onchange="update();"></td>
            </tr>

            <tr>
              <td>5</td>
              <td><input name="s5r" type="number" min="0" max="100" onchange="update();"></td>
              <td><input name="s5a" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s5w" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s5t" type="checkbox" onchange="update();"></td>
            </tr>

            <tr>
              <td>6</td>
              <td><input name="s6r" type="number" min="0" max="100" onchange="update();"></td>
              <td><input name="s6a" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s6w" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s6t" type="checkbox" onchange="update();"></td>
            </tr>

            <tr>
              <td>7</td>
              <td><input name="s7r" type="number" min="0" max="100" onchange="update();"></td>
              <td><input name="s7a" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s7w" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s7t" type="checkbox" onchange="update();"></td>
            </tr>

            <tr>
              <td>8</td>
              <td><input name="s8r" type="number" min="0" max="100" onchange="update();"></td>
              <td><input name="s8a" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s8w" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s8t" type="checkbox" onchange="update();"></td>
            </tr>

            <tr>
              <td>9</td>
              <td><input name="s9r" type="number" min="0" max="100" onchange="update();"></td>
              <td><input name="s9a" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s9w" type="number" min="-360" max="360" onchange="update();"></td>
              <td><input name="s9t" type="checkbox" onchange="update();"></td>
            </tr>

          </tbody>
        </table>
      </fieldset>
    </div>
    </div>
    </form>
include(nav.html.inc)
  </body>
</html>

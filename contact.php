<HTML>
  <head>
    <title>Contact - Catayo Bubble Tea Shop</title>
    <link rel="stylesheet"
          type="text/css"
          href="css/styles.css">
  </head>
  <body>
      <div id="header">
        <div id="nav">
          <a href="index.html" class="stuff">
            <img src="images/catayo_logo.png" alt="Catayo Icon" width="80" height="74" align="left"/></a>
          <ul>
            <li><a href="index.html" class="stuff">Home</a></li>
            <li><a href="about.html" class="stuff">About</a></li>
            <li><a href="menu.html" class="stuff">Menu</a></li>
            <li><a href="order.html" class="stuff">Order</a></li>
            <li><a href="contact.php" class="stuff">Contact</a></li>
            <li><a href="feedbacks.php" class="stuff">Feedbacks</a></li>
            <a href="https://www.facebook.com/COMEBUYTaiwan/?ref=page_internal" class="stuff">
              <img src="images/facebook_icon.png" alt="Face Book Icon" width="30" height="30" /></a>
            <a href="https://www.instagram.com/twtigersugar/" class="stuff">
              <img src="images/instagram_icon.png" alt="Instagram Icon" width="30" height="30"/></a>
            <a href="https://twitter.com/muni_gurume/status/1114475232733962240" class="stuff">
              <img src="images/twitter_icon.png" alt="Twitter Icon" width="30" height="30"/></a>
            <a href="https://www.youtube.com/watch?v=CQHD917D8zM" class="stuff">
              <img src="images/youtube_icon.png" alt="YouTube Icon" width="30" height="30"/></a>
            <input type="surch" value="Search" />
            <input type="submit" value="Search" />
          </ul>
        </div>
      </div>
      <div id="content">
        <div class="article contact1">
          <h1>We'd like to hear your voice!</h1>
          <h3>Please leave your comment or send a letter to our email.
              Feedbacks, suggestions, and criticisms are all welcome!</h3>
        </div>
        <div class="article contact2">
          <form name="customer_form" method="post" action="contact2.php">
          <br />
          <br />
          <br />
          <br />
          <label for="customer_name" id="customer_name"><u>N</u>ame:</label>
      		<input type="text" name="customer_name" accesskey="n" id="name" autofocus required><br/><br/>
          <label for="email" id="email"><u>E</u>mail:</label>
      		<input type="text" name="email" accesskey="e" id="email" autocomplete="off" required><br/><br/>
          <label for="favorite_tea" id="favorite_tea"><u>F</u>avorite tea:</label>
      		<input type="text" name="favorite_tea" accesskey="t" id="favorite_tea" autofocus required><br/><br/>
          <label><input type="radio" name="rating" value="1" id="rating" />1</label>
          <label><input type="radio" name="rating" value="2" id="rating" />2</label>
          <label><input type="radio" name="rating" value="3" id="rating" />3</label>
          <label><input type="radio" name="rating" value="4" id="rating" />4</label>
          <label><input type="radio" name="rating" value="5" id="rating" />5</label><br/><br/>
          <textarea name="comments"
            cols="40" rows="10">Please enter comments here...
          </textarea>
          <br />
          <br />
          <input type="submit" value="Submit Comment" />
        </div>
        <div class="article contact3">
          <br />
          <br />
          <img src="images/map_icon.png" alt="Map Icon" class="align-center medium" width="70" height="70"/>
          <p>1900 Commerce St, Tacoma, WA 98402</p>
          <br />
          <img src="images/phone_icon.png" alt="Phone Icon" class="align-center medium" width="50" height="50"/>
          <p>(253) 692-4913</p>
          <br />
          <img src="images/email_icon.png" alt="Email Icon" class="align-center medium" width="50" height="50"/>
          <p><a href="catayobbtea@gmail.com">catayobbtea@gmail.com</a></p>
        </div>
      </div>
      <div id="footer">
        <p>&copy; Copyright 2021 Catayo Bubble Tea Shop</p>
      </div>
  </body>
</HTML>

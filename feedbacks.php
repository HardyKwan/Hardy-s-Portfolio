<HTML>
  <head>
    <title>Catayo Bubble Tea Shop</title>
    <link rel="stylesheet"
          type="text/css"
          href="css/styles.css">
  </head>
  <body>
     <form action="http://example.com/join.php" method="get">
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
       <div class="article feedbacks">
         <h1>Submitted Comments</h1>
         <br/>
         <table width="800"
         cellpadding="8"
         cellspacing="1"
         border="1">
           <tr><th>Name</th><th>Email</th><th>Favorite tea</th><th>Rating</th></tr>
         <?php
             $dsn = 'mysql:host=cssgate.insttech.washington.edu;dbname=hardyjhk';
             $username = 'hardyjhk';
             $password = 'NejudUv';

             $db = new PDO($dsn, $username, $password);
             $customers = $db->query('SELECT * FROM customers');
             foreach ($customers as $customer) {
               echo "<tr><td>" . $customer['customer_name'] . "</td>";
               echo "<td>" . $customer['email'] . "</td>";
               echo "<td>" . $customer['favorite_tea'] . "</td>";
               echo "<td>";
                       for ($i = $customer['rating']; $i >= 1; $i--) {
                         echo "<img width='30' height='30' src='images/boba.png' />";
                       }
               echo "</td></tr>";
             }
        ?>
        </table>
       </div>
     </div>
     <div id="footer">
       <p>&copy; Copyright 2021 Catayo Bubble Tea Shop</p>
     </div>
  </body>
</HTML>

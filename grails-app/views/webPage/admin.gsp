<!DOCTYPE html>
<html lang="en"><!-- Basic -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Live Dinner Restaurant - Responsive HTML5 Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->

    <asset:link rel="shortcut icon" href="favicon.ico" type="x-icon"/>
    <asset:link rel="apple-touch-icon" href="apple-touch-icon.png"/>

    <!-- Bootstrap CSS -->
    <asset:stylesheet href="bootstrap.min.css"/>
    <!-- Site CSS -->
    <asset:stylesheet href="style.css"/>
    <!-- Responsive CSS -->
    <asset:stylesheet href="responsive.css"/>
    <!-- Custom CSS -->
    <asset:stylesheet href="custom.css"/>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        #create-student1{
            text-align:center;
            width:350px;
            height:500px;
            padding:20px;
            margin:20px;
            float:left;
            border: 2px red solid;
        }
        #create-student2{
            text:center;
            width:500px;
            height:500px;
            padding:20px;
            margin:20px;
            float:left;
            border: 2px red solid;
        }
        #create-student2 input,textarea{
            margin:5px;
        }
        
    </style>

</head>

<body>
<!-- Start header -->
<header class="top-navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.html">
                <asset:image src="logo.png" alt="" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbars-rs-food">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="menu.html">Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown-a">
                            <a class="dropdown-item" href="reservation.html">Reservation</a>
                            <a class="dropdown-item" href="stuff.html">Stuff</a>
                            <a class="dropdown-item" href="gallery.html">Gallery</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="blog.html">blog</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                    <li class="nav-item active"><a class="nav-link" href="admin.html">Admin</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- End header -->
<div>
    <br><br><br><br>
</div>
<!--start developer form-->
        <div id="create-student1">
        <br><br><br>
        <h3>Add Developer Details Here...</h3><br>
            <g:form resource="${this.webPage}" method="POST">
                <fieldset class="form">
                    <f:all bean="webPage"/>
                </fieldset><br>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Create" />
                </fieldset>
            </g:form>
        </div>
<!--end developer form-->

<!--start Blog form-->
    <div id="create-student2">
        <strong>Add Post Here...</strong><br>
            <input type="text" id="title" placeholder="Enter Post Title"/> <br>
            <textarea cols="50" rows="5" id="post_shortcut" placeholder="Enter post-shortcut"></textarea><br>
            <textarea cols="50" rows="5" id="post_details" placeholder="Enter post-details"></textarea><br>
            <button style="width:100px;margin-left:320px" id = "button1" name = "button1" onClick = "postAjax()">post</button>
    </div>
<!--end Blog form-->


<a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>

<!-- ALL JS FILES -->
<asset:javascript src="jquery-3.2.1.min.js"></asset:javascript>
<asset:javascript src="popper.min.js"></asset:javascript>
<asset:javascript src="bootstrap.min.js"></asset:javascript>
<!-- ALL PLUGINS -->
<asset:javascript src="jquery.superslides.min.js"></asset:javascript>
<asset:javascript src="images-loded.min.js"></asset:javascript>
<asset:javascript src="isotope.min.js"></asset:javascript>
<asset:javascript src="baguetteBox.min.js"></asset:javascript>
<asset:javascript src="form-validator.min.js"></asset:javascript>
<asset:javascript src="contact-form-script.js"></asset:javascript>
<asset:javascript src="custom.js"></asset:javascript>
</body>
<script>
        function postAjax() {
            $(document).ready(function() {
                const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
                var title = $('#title').val(); 
                var today = new Date();
                var date = today.getDate()+' '+ monthNames[today.getMonth()]+', '+(today.getFullYear()+1);
                var today1 = new Date();
                var time = today1.getHours() + ":" + today1.getMinutes(); 
                var post_shortcut = $('#post_shortcut').val(); 
                var post_details = $('#post_details').val(); 

                if(title == "" || date == "" || time == "" || post_shortcut == "" || post_details == "") {
                    alert('***please fillup all fields !!');
                    return false;
                }

                var URL="${createLink(controller:'webPage',action:'post_student_ajax_req')}"

                $.ajax({
                    url: URL,
                    type: "POST",
                    datatype: "html",
                    data:{title:title,date:date,time:time,post_shortcut:post_shortcut,post_details:post_details},
                    success:function(data)
                    {
                        alert(data);
                        $('#title').val("");
                        $('#post_shortcut').val("");$('#post_details').val("");
                    }
                }) 
            })
        }

    </script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body {background-color:#FFE4CA;}
#d1{
	width:400px;
	margin:auto;
	margin-top:50px;
}
h1{
	text-align:center;
	color:red;
}
#wrapper {
            position: relative;
            width: 400px;
            height: 250px;
            overflow: hidden;
            margin: auto;
        }
        ul {
            position: absolute;
            left: 0px;
        }
        #ul1 {
            width: 1200px;
            left: 0;
            transition: all .5px;
            padding:0;
            margin:0;
        }

        li {
            left: 0px;
            float: left;
            list-style: none;
        }

        #ul1 li {
            width: 400px;
            height: 250px;
            overflow:hidden;
            float: left;
        }

        #ul1 li img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        #dot {
            bottom: 2px;
            width: 100%;
            display: flex;
            justify-content: center;
            margin:5px;
        }
        #dot li {
            background-color: lightgreen;
            width: 20px;
            height: 10px;
            margin: 0 5px;
        }

</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="d1">
<form action="Gate" method="post">
account(admin):<input type="text" name="uname"><br><br>
<input type="submit" value="log-in">
</form>
</div>
<br><br><br>
<div id="wrapper">
        <ul id="ul1">
            <li><img id="pic1" src="images/1.jpg"></li>
            <li><img id="pic2" src="images/2.jpg"></li>
            <li><img id="pic3" src="images/3.jpg"></li>
        </ul>
        <ul id="dot">
            <li id="1"></li>
            <li id="2"></li>
            <li id="3"></li>
        </ul>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
    <script>
        let slideNum = 0;
        let slideCount = $("#ul1 li").length;
        let lastIndex = slideCount - 1;
        /*$("#dot li").mouseenter(function(){
             slideNum = $(this).index();
             console.log(slideNum);
             show();
        });*/
        function show(){
            $("#dot li").eq(slideNum).css("background-color","lightgreen").
            siblings().css({"background-color":"transparent","border":"1px solid white"});
            let slidemove = 0-400*slideNum;
            $("#ul1").css("left",slidemove);
        }
        function play(){
            stop = window.setInterval(function(){
                slideNum++;
                console.log(slideNum);
                if (slideNum>lastIndex)
                    slideNum=0;
                show();
            },2000);
        }play();
    </script>
</body>
</html>
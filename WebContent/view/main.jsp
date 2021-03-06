<%@page import="vo.MovieMainVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	MovieDAO mvDAO = MovieDAO.getInstance();
	List<MovieMainVO> curList = mvDAO.selectMainPoster("O");
	List<MovieMainVO> soonList = mvDAO.selectMainPoster("N");
	
	%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <!-- botstrap -->
    <link
      href="../common/bootstrap-3.3.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- botstrap -->
    <script src="../common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

    <!-- coin-slider -->
    <script
      type="text/javascript"
      src="../common/coin/coin-slider.min.js"
    ></script>
    
    <link
      rel="stylesheet"
      href="../common/coin/coin-slider-styles.css"
      type="text/css"
    />

    <!-- swiper-slider -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

    <style type="text/css">
      body,
      html {
        width: 100%;
        height: 100%;
      }
      body {
        margin: 0px;
        background-color: black;
        overflow-x: hidden;
      }
      a {
        text-decoration: none;
        color: white;
      }
      a:hover {
        color: white;
        text-decoration: none;
      }
      /* #header-wrap {
        display: flex;
        flex-direction: row;
        justify-content: center;
      } */
      #wrap {
        display: flex;
        width: 100%;
        flex-direction: column;
        justify-content: space-between;
      }
      #wrap-main {
        width: 100%;
        height: 804px;
      }
      ul {
        list-style: none;
      }
      #header {
        width: 100%;
        min-width: 950px;
        height: 122px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        position: absolute;
        z-index: 3;
        margin-bottom: auto;
      }
      #header-top {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0px;
      }
      #header-bottom {
        display: flex;
        flex-direction: row;
        justify-content: center;
        width: 85%;
        border-top: 1px solid #b2b2b2;
        margin: 0 auto;
      }
      #header-bottom ul {
        text-align: center;
        margin: 0px;
        padding: 0px;
      }
      #header-bottom ul li {
        margin: 10px 0;
        font-family: "Noto Sans KR", sans-serif;
        float: left;
      }
      #left {
        width: 25%;
      }
      #title {
        font-size: 36px;
        font-family: "Noto Sans KR", sans-serif;
      }
      #login {
        width: 25%;
        text-align: center;
      }
      #login a {
        color: #656565;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 12px;
      }
      #login a:hover {
        color: #656565;
      }
      #main {
        width: 100%;
        min-width: 950px;
        display: flex;
        flex-direction: row;
        justify-content: center;
        position: absolute;
        z-index: 1;
      }
      #main-poster {
        width: 100%;
      }

      .coin-slider {
        overflow: visible;
      }

      #footer {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-items: center;
        width: 100%;
        min-width: 950px;
        min-height: 140px;
        background-color: black;
        border-top: 1px solid #656565;
        margin-top: auto;
      }
      #footertxt {
        color: #a2a2a2;
        font-size: 12px;
      }
      #footer-right {
        width: 20%;
      }
      .header-bottom-ul li {
        float: left;
        margin-right: 5px;
      }
      .header-bottom-ul li::before {
        padding-left: 5px;
        color: #b2b2b2;
        content: "???";
      }

      .header-bottom-ul li:first-child::before {
        content: "";
      }
      #gradi-wrap {
        display: flex;
        flex-direction: row;
        justify-content: center;
      }
      #gradi {
        width: 1920px;
        height: 774px;
        position: absolute;
        z-index: 2;
        /* margin: 0 auto; */
        pointer-events: none;
        background: linear-gradient(
            to bottom,
            rgb(0, 0, 0) 0%,
            rgba(0, 0, 0, 0) 35%
          ),
          linear-gradient(to top, rgb(0, 0, 0) 0%, rgba(0, 0, 0, 0) 35%),
          linear-gradient(to right, rgb(0, 0, 0) 0%, rgba(0, 0, 0, 0) 15%),
          linear-gradient(to left, rgb(0, 0, 0) 0%, rgba(0, 0, 0, 0) 15%);
      }
      #containerPoster {
        height: 300px;
        margin: 0 auto;
        background-color: black;
        margin: 5% 0;
      }

      /* ???????????? ???????????? */
      .swiper-container {
        width: 850px;
        height: 300px;
        border-radius: 7px;
      }
      .swiper-slide {
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .swiper-slide img {
        height: 250px;
        width: 150px;
        border-radius: 10px;
      }

      #cs-buttons-main-poster {
        margin: 0;
      }
    </style>

    <script type="text/javascript">
      /* ?????????????????? */
      $(document).ready(function () {
        $("#main-poster").coinslider({
          width: 1920,
          height: 774,
          navigation: true,
          delay: 1000,
          effect: "straight",
          links: true,
        });
      });

      window.onload = function () {
        document.getElementById("cs-buttons-main-poster").style.left = "49.3%";
        new Swiper(".swiper-container", {
          slidesPerView: 5, // ????????? ????????? ???????????? ??????
          spaceBetween: 30, // ??????????????? ??????
          slidesPerGroup: 5, // ???????????? ?????? ???, slidesPerView ??? ?????? ?????? ??????????????? ??????

          // ???????????? ?????? ?????? ?????? ???????????? ?????????
          // 3?????? ????????? ????????? 1?????? ????????? 2?????? ???????????? ????????? 3?????? ??????
          loopFillGroupWithBlank: true,

          loop: true, // ?????? ??????

          navigation: {
            // ???????????????
            nextEl: ".swiper-button-next", // ?????? ?????? ????????????
            prevEl: ".swiper-button-prev", // ?????? ?????? ????????????
          },
        });
        // document.getElementById("coin-slider-main-poster").style.Width =
        //   "100vw";
        // document.getElementById("main-poster").style.Width = "100vw";
      };
    </script>
  </head>
  <body>
    <div id="wrap">
      <div id="wrap-main">
        <div id="gradi-wrap">
          <div id="gradi"></div>
        </div>
        <div id="header">
          <div id="header-top">
            <div id="left"></div>
            <div id="title"><a href="">D.D Cinema</a></div>
            <div id="login">
              <%
          	if(session.getAttribute("id")==null){
          		%>
          		
            <a href="http://localhost/movie_reservation/view/login/login.jsp">?????????</a>
            
            <a href="http://localhost/movie_reservation/view/login/sign_Up.jsp">????????????</a>
          	<% }else{%>
          	<form method ="post" action="main.jsp">
            <a href="http://localhost/movie_reservation/view/login/logout.jsp">????????????</a>
            </form>
            <a href="http://localhost/movie_reservation/view/mypage/mypage_main.jsp">???????????????</a>
          	<%
          		}      
          		%>
            </div>
          </div>
          <div id="header-bottom">
            <ul class="header-bottom-ul">
              <%
          		if(session.getAttribute("id") != null){
          	%>
            <li>
              <a href="http://localhost/movie_reservation/view/reservation/reservation.jsp">??????</a>
            </li>
            <%} else{ %>
				<%  } %>
              <li><a href="cur_movie.jsp">???????????????</a></li>
              <li><a href="soon_movie.jsp">???????????????</a></li>
            </ul>
          </div>
        </div>
        <div id="main">
          <div id="main-poster">
          <%for(int i=0;i<soonList.size();i++){ %>
            <a href="movie_info.jsp?mvNo=<%=soonList.get(i).getMvNo()%>">
              <img src="<%=soonList.get(i).getMvSoonPoster()%>"/>
            </a>
            <%} %>
          </div>
        </div>
      </div>

      <div id="containerPoster">
        <div class="swiper-container">
          <div class="swiper-wrapper">
          	<%for(int i=0;i<curList.size();i++){ %>
          		<div class="swiper-slide">
            		<a href="movie_info.jsp?mvNo=<%= curList.get(i).getMvNo() %>">
              		<img src="<%=curList.get(i).getMvPoster()%>"/>
            		</a>
            	</div>
            		<%} %>
          </div>
          <!-- ??????????????? -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </div>
      </div>
      <div id="footer">
        <div id="footertxt">
          Double Dragon Cinema<br />
          ??????????????? ????????? ???????????? 132 ?????????????????? 8??? ?????????????????? ????????????
          1544<br />
          ?????? ????????? ????????????????????? 000-00-000000 ???????????? ?????? ?????? ?????????
          ?????????<br />
          COPYRIGHT??Double Dragon Cinema.
        </div>
        <div id="footer-right"></div>
      </div>
    </div>
  </body>
</html>
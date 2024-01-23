<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="kor">
    <head>
        <meta charset="utf-8">
        <title>형준닷컴</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        
        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/2432d5047b.js" crossorigin="anonymous"></script>

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
        
    </head>
	<style>
		@font-face {
			font-family: 'godic';
			src: url('${pageContext.request.contextPath}/font/godic.ttf') format('truetype');
		}
		
		body {
			font-family: 'godic', sans-serif;
			color: black !important;
		}
		
		#mainGo {
			color: #fd5d5d !important;
		}
	</style>
    <body data-bs-spy="scroll" data-bs-target="#navBar" id="weddingHome">

        <!-- 로딩 표시 Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- 로딩 표시 End -->

		<jsp:include page="../main/navbar.jsp"/>

        <!-- Carousel Start -->
        <div class="container-fluid carousel-header px-2">
            <div id="carouselId" class="carousel slide" data-bs-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-bs-target="#carouselId" data-bs-slide-to="0" class="active"></li>
                    <li data-bs-target="#carouselId" data-bs-slide-to="1"></li>
                    <li data-bs-target="#carouselId" data-bs-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active" style="min-height: 55vh;">
                        <img src="${pageContext.request.contextPath}/resources/image/logo.jpg" class="img-fluid" alt="Image">
                        <div class="carousel-caption">
                            <div class="p-3 mx-auto animated zoomIn" style="max-width: 900px;">
                                <div class="d-inline-block border-end-0 border-start-0 border-secondary p-2 mb-4" style="border-style: double;">
                                    <h4 class="text-white text-uppercase fw-bold mb-0" style="letter-spacing: 3px;">개인 프로젝트</h4>
                                </div>
                                <h3 class="display-1 text-capitalize text-white mb-3">포트폴리오 사이트 만들기</h3>
                                <div class="d-inline-block border-end-0 border-start-0 border-secondary p-2 mb-5" style="border-style: double;">
                                    <h4 class="text-white text-uppercase fw-bold mb-0" style="letter-spacing: 3px;">2024.01.22</h4>
                                </div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <a class="btn btn-primary btn-primary-outline-0 py-3 px-5" href="#">보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style="min-height: 55vh;">
                        <img src="${pageContext.request.contextPath}/resources/image/logo.jpg" class="img-fluid" alt="Image">
                        <div class="carousel-caption">
                            <div class="p-3 mx-auto animated zoomIn" style="max-width: 900px;">
                                <div class="d-inline-block border-end-0 border-start-0 border-secondary p-2 mb-5" style="border-style: double;">
                                    <h4 class="text-white text-uppercase fw-bold mb-0" style="letter-spacing: 3px;">파이널 프로젝트</h4>
                                </div>
                                <h1 class="display-1 text-capitalize text-white mb-3">4인 단체 프로젝트</h1>
                                <div class="d-inline-block border-end-0 border-start-0 border-secondary p-2 mb-4" style="border-style: double;">
                                    <h4 class="text-white text-uppercase fw-bold mb-0" style="letter-spacing: 3px;">2023.11.06</h4>
                                </div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <a class="btn btn-primary btn-primary-outline-0 py-3 px-5" href="#">보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style="min-height: 55vh;">
                        <img src="${pageContext.request.contextPath}/resources/image/logo.jpg" class="img-fluid bg-secondary" alt="Image">
                        <div class="carousel-caption">
                            <div class="p-3 mx-auto animated zoomIn" style="max-width: 900px;">
                                <div class="d-inline-block border-end-0 border-start-0 border-secondary p-2 mb-4" style="border-style: double;">
                                    <h4 class="text-white text-uppercase fw-bold mb-0" style="letter-spacing: 3px;">AWS</h4>
                                </div>
                                <h1 class="display-1 text-capitalize text-white mb-3">AWS 이해하기</h1>
                                <div class="d-inline-block border-end-0 border-start-0 border-secondary p-2 mb-4" style="border-style: double;">
                                    <h4 class="text-white text-uppercase fw-bold mb-0" style="letter-spacing: 3px;">2024.01.30</h4>
                                </div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <a class="btn btn-primary btn-primary-outline-0 py-3 px-5" href="#">보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- Hello! Start -->
        <div class="container-fluid position-relative py-5" id="weddingAbout">
            <div class="container position-relative py-5">
                <div class="mx-auto text-center mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 800;">
                    <h1 class="text-primary display-1">어서오세요!</h1>
                    <h4 class="text-dark mb-0">형준 닷컴에 찾아와주셔서 감사합니다!</h4>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row g-4 align-items-center" style="justify-content: center;">
                            <div class="col-lg-5 wow fadeInUp" data-wow-delay="0.3s" style="width: 800px;">
                                <div class="d-flex">
                                    <div class="text-end my-auto pe-4">
                                        <h3 class="text-primary mb-3" style="text-align: left;">백엔드 개발자를 지망하는 박형준입니다.</h3>
                                        <p class="text-dark mb-0" style="line-height: 30px; text-align: left;">23.05 ~ 23.11 기간 동안 Java 기반 클라우드 활용 백엔드 개발자 교육과정을 이수하였습니다.<br>교육과정 중 1개월간 웹사이트 구축 4인 프로젝트를 진행하였고 학원 내부평가를 거쳐 1등을 달성 했습니다.<br><br>현재는 학원을 다니며 부족하다고 느낀 컴퓨터 전공지식을 깊게 공부하기 위해 정보처리기사를 준비하고 있습니다.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hello! End -->


        <!-- Story Start -->
        <div class="container-fluid story position-relative py-5" id="weddingStory">
            <div class="container position-relative py-5">
                <div class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">
                    <h1 class="display-4">약식 프로필</h1>
                </div>
                <div class="story-timeline">
                	<div class="row flex-column-reverse flex-md-row wow fadeInUp" data-wow-delay="0.3s">
                        <div class="col-md-6 text-end border-end border-top border-secondary p-4 ps-0">
                            <div class="h-100 d-flex flex-column justify-content-center bg-secondary p-4" style="text-align: left;">
                                <h4 class="text-dark mb-2"><i class="fa-solid fa-user"></i>&nbsp;인적사항</h4>
                                <p class="m-0 fs-5">
                                	<strong>성명 : 박형준</strong><br>
									<strong>이메일 : parkhj0209@naver.com</strong><br>
									<strong>휴대폰 : 010-6789-7216</strong><br>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6 border-start border-top border-secondary p-4">
                            <div class="d-inline-flex align-items-center h-100">
                                <!-- <img src="img/story-2.jpg" class="img-fluid w-100 img-border" alt="">  -->
                            </div>
                        </div>
                    </div>
                    <div class="row wow fadeInUp" data-wow-delay="0.2s">
                        <div class="col-md-6 text-end border-0 border-top border-end border-secondary p-4">
                            <div class="d-inline-flex align-items-center h-100">
                                <!-- <img src="img/story-1.jpg" class="img-fluid w-100 img-border" alt="">  -->
                            </div>
                        </div>
                        <div class="col-md-6 border-start border-top border-secondary p-4 pe-0">
                            <div class="h-100 d-flex flex-column justify-content-center bg-secondary p-4">
                                <h4 class="mb-2 text-dark"><i class="fa-solid fa-paperclip"></i>&nbsp;개인채널</h4>
                                <p class="m-0 fs-5">
                                	<strong>ITDA 프로젝트 시연 영상 ->&nbsp;&nbsp;<a href="https://www.youtube.com/watch?v=awDHKsONkD0">보러가기</a></strong><br>
				   					<strong>깃 : <a href="https://github.com/pphj/portfolio">https://github.com/pphj/portfolio</a></strong><br>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row flex-column-reverse flex-md-row wow fadeInUp" data-wow-delay="0.3s">
                        <div class="col-md-6 text-end border-end border-top border-secondary p-4 ps-0">
                            <div class="h-100 d-flex flex-column justify-content-center bg-secondary p-4" style="text-align: left;">
                                <h4 class="text-dark mb-2"><i class="fa-solid fa-flask"></i>&nbsp;기술스택</h4>
                                <p class="m-0 fs-5">
                                	<strong>Back-End : Java 11 <i class="fa-brands fa-java"></i> , Spring Boot , myBatis</strong><br>
								    <strong>Front-End :  javaScript <i class="fa-brands fa-js"></i>, jQuery, Bootstrap <i class="fa-brands fa-bootstrap"></i></strong><br>
								    <strong>DataBase : Oracle</strong><br>
								    <strong>etc : AWS <i class="fa-brands fa-aws"></i>, Jenkins <i class="fa-brands fa-jenkins"></i>, github <i class="fa-brands fa-github"></i></strong><br>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6 border-start border-top border-secondary p-4">
                            <div class="d-inline-flex align-items-center h-100">
                                <!-- <img src="img/story-2.jpg" class="img-fluid w-100 img-border" alt="">  -->
                            </div>
                        </div>
                    </div>
                    <div class="row wow fadeInUp" data-wow-delay="0.4s">
                        <div class="col-md-6 text-end border-end border-top border-secondary p-4 ps-0">
                            <div class="d-inline-flex align-items-center h-100">
                                <!-- <img src="img/story-3.jpg" class="img-fluid w-100 img-border" alt=""> -->
                            </div>
                        </div>
                        <div class="col-md-6 border-start border-top border-secondary p-4 pe-0">
                            <div class="h-100 d-flex flex-column justify-content-center bg-secondary p-4">
                                <h4 class="text-dark mb-2"><i class="fa-solid fa-pen"></i>&nbsp;교육내용</h4>
                                <p class="m-0 fs-5">
	                                <strong>기관명 : <a href="https://www.jhta.co.kr/main">중앙 HTA</a></strong><br>
					   				<strong>교육명 : Java 기반 백엔드 & 클라우드 활용 개발자 양성과정</strong><i style="color: #e712f3;">&nbsp;2023.05 ~ 2023.11</i><br>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row flex-column-reverse flex-md-row wow fadeInUp" data-wow-delay="0.5s">
                        <div class="col-md-6 text-end border border-start-0 border-secondary p-4 ps-0">
                            <div class="h-100 d-flex flex-column justify-content-center bg-secondary p-4" style="text-align: left;">
                                <h4 class="text-dark mb-2"><i class="fa-solid fa-book"></i>&nbsp;자격증 및 어학</h4>
                                <p class="m-0 fs-5">
	                                <strong>전산회계 1급</strong><i style="color: #e712f3;">&nbsp;&nbsp;2017.11 (22년 갱신)</i><br>
				   					<strong>TOEIC 690</strong><i style="color: #e712f3;">&nbsp;&nbsp;2023.06</i><br>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6 border border-end-0 border-secondary p-4">
                            <div class="d-inline-flex align-items-center h-100">
                                <!-- <img src="" class="img-fluid w-100 img-border" alt="">  -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Story End -->


        <!-- 주요 게시글 링크 Start -->
        <div class="container-fluid gallery position-relative py-5" id="weddingGallery">
            <div class="container position-relative py-5">
                <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 800px;">
                    <h1 class="display-2 text-dark">주요 게시글</h1>
                    <p class="fs-5 text-dark">프로젝트 내용 중 주요 부분을 정리해 놓았습니다. 클릭하면 해당 글로 이동합니다.</p>
                </div>
                <div class="row g-4">
                    <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.2s">
                        <div class="gallery-item">
                            <div class="gallery-overlay bg-light border-secondary border-top-0 p-4" style="border-style: double;">
                                <h5>test 1</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.4s">
                        <div class="gallery-item">
                            <div class="gallery-overlay bg-light border-secondary border-top-0 p-4" style="border-style: double;">
                                <h5>test 2</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="gallery-item">
                            <div class="gallery-overlay bg-light border-secondary border-top-0 p-4" style="border-style: double;">
                                <h5>test 3</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.8s">
                        <div class="gallery-item">
                            <div class="gallery-overlay bg-light border-secondary border-top-0 p-4" style="border-style: double;">
                                <h5>test 4</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 주요 게시글 링크 end -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary btn-primary-outline-0 btn-md-square back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/lib/lightbox/js/lightbox.min.js"></script>
    

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    </body>

</html>
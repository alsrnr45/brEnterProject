<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 부트스트랩 탬플릿 -->
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="resources/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- fullcalendar CDNs-->
    <link href='resources/scheduleResources/lib/main.css' rel='stylesheet' />
    <script src='resources/scheduleResources/lib/main.js'></script>
    <script src='resources/scheduleResources/lib/locales/ko.js'></script>
<title>Insert title here</title>
<style>
    @import url("https://fonts.googleapis.com/css?family=Roboto");
    * {
    box-sizing: border-box;
    font-size: 13px;
    }

    body {
    background: #f7f7f7;
    margin: 0;
    }

    .centered {
    font-family: "Roboto", sans-serif;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 90%;
    }

    .info {
    width: 100%;
    max-width: 895px;
    margin: 50px auto;
    }

    .code {
    background: #dfdfdf;
    padding: 10px;
    color: #9e9e9e;
    font-size: 12px;
    border-radius: 3px;
    }

    #schedule {
    width: 100%;
    margin: 0 auto;
    max-width: 895px;
    background: #fff;
    font-family: "Roboto", sans-serif;
    display: flex;
    position: asbolute;
    }

    .s-legend {
    display: flex;
    position: relative;
    flex-direction: column;
    width: 150px;
    }
    .s-legend .s-head-info {
    height: 100%;
    }
    .s-legend .s-name {
    margin: 20px auto;
    }
    .s-legend .s-week-day {
    height: 100%;
    position: relative;
    box-shadow: inset 0 1px 0 0.5px #f5f5f5;
    }
    .s-legend .s-week-day .s-day {
    width: 100%;
    margin: 20px auto;
    }

    .s-head-info {
    font-weight: 900;
    max-height: 50px;
    position: relative;
    width: 100%;
    }

    .s-wrapper {
    display: flex;
    }

    .s-block {
    display: block;
    text-align: center;
    }

    .s-week-day {
    min-width: 50px;
    max-width: 150px;
    width: 100%;
    }

    .s-cell {
    text-align: center;
    }

    .s-container {
    width: 100%;
    overflow: auto;
    }
    .s-container .s-head-info {
    align-items: center;
    display: flex;
    }
    .s-container .s-head-info .s-head-hour {
    width: 100%;
    height: 55px;
    max-height: 55px;
    padding: 12px 0;
    min-width: 76.5px;
    border-left: 1.2px solid #e9e9e9;
    }
    .s-container .s-head-info .s-head-hour .s-number {
    font-size: 15px;
    }
    .s-container .s-head-info .s-head-hour .s-hourly-interval {
    color: #cccccc;
    font-size: 8px;
    }
    .s-container .s-rows-container {
    display: flex;
    position: relative;
    }
    .s-container .s-rows-container .s-activities {
    position: absolute;
    width: 100%;
    height: 100%;
    }
    .s-container .s-rows-container .s-activities .s-act-row {
    position: relative;
    height: 55px;
    }
    .s-container .s-rows-container .s-activities .s-act-row .green {
    background: linear-gradient(to right, #00b09b, #96c93d);
    }
    .s-container .s-rows-container .s-activities .s-act-row .orange {
    background: linear-gradient(to right, #F2994A, #F2C94C);
    }
    .s-container .s-rows-container .s-activities .s-act-row .red {
    background: linear-gradient(to right, #CB356B, #BD3F32);
    }
    .s-container .s-rows-container .s-activities .s-act-row .yellow {
    background: linear-gradient(to right, #fffc00, #fffc00);
    }
    .s-container .s-rows-container .s-activities .s-act-row .blue {
    background: linear-gradient(to right, #36D1DC, #5B86E5);
    }
    .s-container .s-rows-container .s-activities .s-act-row .pink {
    background: linear-gradient(to right, #834d9b, #d04ed6);
    }
    .s-container .s-rows-container .s-activities .s-act-row .black {
    background: linear-gradient(to right, #000428, #004e92);
    }
    .s-container .s-rows-container .s-activities .s-act-row .s-act-tab {
    height: 45px;
    padding: 15px;
    border-radius: 3px;
    position: absolute;
    top: 5px;
    }
    .s-container .s-rows-container .s-activities .s-act-row .s-act-tab .s-wrapper {
    display: block;
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    }
    .s-container .s-rows-container .s-activities .s-act-row .s-act-tab .s-act-teacher, .s-container .s-rows-container .s-activities .s-act-row .s-act-tab .s-act-room, .s-container .s-rows-container .s-activities .s-act-row .s-act-tab .s-act-group {
    font-size: 7px;
    color: white;
    position: absolute;
    margin: 5px;
    }
    .s-container .s-rows-container .s-activities .s-act-row .s-act-tab .s-act-group {
    bottom: 0;
    left: 0;
    }
    .s-container .s-rows-container .s-activities .s-act-row .s-act-tab .s-act-name {
    color: white;
    }
    .s-container .s-rows-container .s-activities .s-act-row .s-act-tab .s-act-teacher {
    left: 0;
    top: 0;
    }
    .s-container .s-rows-container .s-activities .s-act-row .s-act-tab .s-act-room {
    top: 0;
    right: 0;
    }

    .s-hour-row {
    height: 100%;
    width: 100%;
    min-width: 76.5px;
    }
    .s-hour-row .s-hour-wrapper {
    display: flex;
    }
    .s-hour-row .s-hour-wrapper .s-half-hour:nth-child(2) {
    border-left: 0.5px solid #e9e9e9;
    }
    .s-hour-row .s-hour-wrapper .s-half-hour {
    width: 50%;
    height: 55px;
    border-left: 1.2px solid #e9e9e9;
    }

    @media only screen and (max-width: 480px) {
    .s-legend {
        width: 100px;
    }
    }
</style>
</head>
<body>
       <!-- 상단바 -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <jsp:include page="../common/userHeader.jsp"/>
    </nav>
    
    <div id="layoutSidenav">
        
        <!-- 메뉴바 -->
        <div id="layoutSidenav_nav">
            <jsp:include page="../common/userMenu.jsp"/>
        </div>

        <!--컨텐츠-->
        <div id="layoutSidenav_content">
            <div class='centered'>
                <div class='info'>
                    <p>Try adding your own activity. Open the console and paste this command:</p>
                    <div class='code'>schedule.activities.add(4,"Physics", "8.00-10.30", 102, "A", "B.Konon","pink");</div>
                </div>
                <div id='schedule'>
                    <div class='s-legend'>
                    <div class='s-cell s-head-info'>
                        <div class='s-name'>TT</div>
                    </div>
                    <div class='s-week-day s-cell'>
                        <div class='s-day'>Mon</div>
                    </div>
                    <div class='s-week-day s-cell'>
                        <div class='s-day'>Tue</div>
                    </div>
                    <div class='s-week-day s-cell'>
                        <div class='s-day'>Wed</div>
                    </div>
                    <div class='s-week-day s-cell'>
                        <div class='s-day'>Thu</div>
                    </div>
                    <div class='s-week-day s-cell'>
                        <div class='s-day'>Fri</div>
                    </div>
                    </div>
                    <div class='s-container s-block'>
                    <div class='s-head-info'>
                        <div class='s-head-hour'>
                        <div class='s-number'>0</div>
                        <div class='s-hourly-interval'>7.10-7.55</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>1</div>
                        <div class='s-hourly-interval'>8.00 - 8.45</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>2</div>
                        <div class='s-hourly-interval'>8.50 - 9.35</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>3</div>
                        <div class='s-hourly-interval'>9.45 - 10.30</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>4</div>
                        <div class='s-hourly-interval'>10.50 - 11.35</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>5</div>
                        <div class='s-hourly-interval'>11.45 - 12.30</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>6</div>
                        <div class='s-hourly-interval'>12.50 - 13.35</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>7</div>
                        <div class='s-hourly-interval'>13.45 - 14.30</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>8</div>
                        <div class='s-hourly-interval'>14.35 - 15.20</div>
                        </div>
                        <div class='s-head-hour'>
                        <div class='s-number'>9</div>
                        <div class='s-hourly-interval'>15.25 - 16.10</div>
                        </div>
                    </div>
                    <div class='s-rows-container'>
                        <div class='s-activities'>
                        <div class='s-act-row'>
                            <div class='s-act-tab green' data-hours='7.32-8.45'>
                            <div class='s-act-name'>English</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>A. Rygulska</div>
                                <div class='s-act-room'>105</div>
                                <div class='s-act-group'>G1</div>
                            </div>
                            </div>
                            <div class='s-act-tab orange' data-hours='9.45-12.50'>
                            <div class='s-act-name'>Math</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>D. Kozlowicz</div>
                                <div class='s-act-room'>121</div>
                            </div>
                            </div>
                            <div class='s-act-tab green' data-hours='13.45-14.30'>
                            <div class='s-act-name'>Math</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>D. Kozlowicz</div>
                                <div class='s-act-room'>121</div>
                            </div>
                            </div>
                        </div>
                        <div class='s-act-row'>
                            <div class='s-act-tab blue' data-hours='8.50-10.08'>
                            <div class='s-act-name'>Exam</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>A. Rygulska</div>
                                <div class='s-act-room'>105</div>
                                <div class='s-act-group'>G1</div>
                            </div>
                            </div>
                            <div class='s-act-tab black' data-hours='10.50-12.30'>
                            <div class='s-act-name'>Math</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>D. Kozlowicz</div>
                                <div class='s-act-room'>121</div>
                            </div>
                            </div>
                            <div class='s-act-tab orange' data-hours='14.15-15.20'>
                            <div class='s-act-name'>Fitness</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>D. Kozlowicz</div>
                                <div class='s-act-room'>121</div>
                            </div>
                            </div>
                        </div>
                        <div class='s-act-row'></div>
                        <div class='s-act-row'>
                            <div class='s-act-tab blue' data-hours='7.10-7.55'>
                            <div class='s-act-name'>English</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>A. Rygulska</div>
                                <div class='s-act-room'>105</div>
                                <div class='s-act-group'>G1</div>
                            </div>
                            </div>
                            <div class='s-act-tab red' data-hours='8.23-9.35'>
                            <div class='s-act-name'>Deutsch</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>D. Kozlowicz</div>
                                <div class='s-act-room'>121</div>
                            </div>
                            </div>
                            <div class='s-act-tab pink' data-hours='15.05-16.10'>
                            <div class='s-act-name'>Bio</div>
                            <div class='s-wrapper'>
                                <div class='s-act-teacher'>D. Kozlowicz</div>
                                <div class='s-act-room'>121</div>
                            </div>
                            </div>
                        </div>
                        <div class='s-act-row'></div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                        <div class='s-row s-hour-row'>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        <div class='s-hour-wrapper s-cell'>
                            <div class='s-half-hour'></div>
                            <div class='s-half-hour'></div>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
                </div>
        
        </div>
    </div>
	
</body>
</html>
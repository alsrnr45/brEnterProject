<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-size: 10px;
  font-family: sans-serif;
  line-height: 1.6;
}

body {
  background: #78ACCD;
  color: #333333;
  font-size: 1.5rem;
}

ul {
  list-style: none;
}

.card {
  background: #ffffff;
  width: 90%;
  max-width: 40rem;
  min-height: 40rem;
  margin: 5rem auto;
  display: grid;
  grid-template-rows: 8rem auto 10rem;
  box-shadow: 0 1rem 2.5rem #1b405e;
}
.card__header, .card__footer {
  padding: 0 1.25rem;
  color: #7D8994;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.card__body {
  padding: 1.5rem 2rem;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
.card__body--days {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 4rem;
}
.card__body--days li {
  flex: 1;
  font-weight: bold;
  text-transform: uppercase;
  text-align: center;
  color: #7D8994;
  margin: 0 1px;
}
.card__body--dates {
  display: grid;
  gap: 3px;
  grid-template-columns: repeat(7, 1fr);
  justify-items: center;
  text-align: center;
}
.card__body--dates li {
  width: 3.5rem;
  height: 3.5rem;
  display: grid;
  place-items: center;
  font-weight: bold;
  position: relative;
}
.card__body--dates li.prev,
.card__body--dates li.next {
  color: #ccc;
}
.card__body--dates li.active {
  background: #DE6E46;
  color: #ffffff;
  border-radius: 50%;
}
.card__body--dates li.circle {
  border: 2px solid;
  border-radius: 50%;
}
.card__body--dates li.circle span {
  position: absolute;
  top: -0.75rem;
  right: -0.5rem;
  width: 1.75rem;
  height: 1.75rem;
  font-size: 1.2rem;
  color: #ffffff;
  border-radius: 50%;
}
.card__body--dates .circle.orange {
  border-color: #DE6E46;
}
.card__body--dates .circle.orange span {
  background: #DE6E46;
}
.card__body--dates .circle.purple {
  border-color: #AE5989;
}
.card__body--dates .circle.purple span {
  background: #AE5989;
}
.card__footer {
  color: #333333;
  font-weight: bold;
}
.card__footer .add {
  text-decoration: none;
  color: inherit;
  border: 2px solid #DE6E46;
  border-radius: 50%;
  width: 3.5rem;
  height: 3.5rem;
  padding-top: 0.25rem;
  display: grid;
  place-items: center;
}
</style>
</head>
<body>	
  <main class="card">
    <section class="card__header">
      <h3>Thursday 7th</h3>
      <h3>January 2020</h3>
    </section>
    <section class="card__body">
      <ul class="card__body--days">
        <li>mon</li>
        <li>tue</li>
        <li>wed</li>
        <li>thu</li>
        <li>fri</li>
        <li>sat</li>
        <li>sun</li>
      </ul>
      <ul class="card__body--dates">
        <li class="prev">30</li>
        <li class="prev">31</li>
        <li>1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
        <li>5</li>
        <li>6</li>
        <li class="active">7</li>
        <li>8</li>
        <li>9</li>
        <li>10</li>
        <li>11</li>
        <li>12</li>
        <li>13</li>
        <li>14</li>
        <li>15</li>
        <li class="circle orange">16 <span>5</span></li>
        <li>17</li>
        <li>18</li>
        <li class="circle purple">19 <span>6</span></li>
        <li>20</li>
        <li>21</li>
        <li>22</li>
        <li>23</li>
        <li>24</li>
        <li>25</li>
        <li>26</li>
        <li>27</li>
        <li>28</li>
        <li>29</li>
        <li>30</li>
        <li>31</li>
        <li class="next">1</li>
        <li class="next">2</li>
      </ul>
    </section>
    <div class="card__footer">
      <p>11:35 am</p>
      <a href="#" class="add">+</a>
      <p>12<sup>o</sup> C</p>
    </div>
  </main>
</body>
</html>
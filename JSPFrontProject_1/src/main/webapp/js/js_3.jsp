<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    이항 연산자 개요
    - Front-End: HTML, CSS, JavaScript (jQuery, Vue, React)
    - Back-End: Java, JSP, MVC, SpringBoot
    - DataBase: Oracle, MyBatis, JPA

    1. 산술 연산자 (+, -, *, /, %)
       - / : JavaScript에서는 정수/정수 결과가 실수로 나옴 (예: 5/2 = 2.5)
       - % : 나머지 연산 (왼쪽 피연산자의 부호를 따름)
    2. 비교 연산자 (==, ===, !=, !==, <, >, <=, >=)
       - == : 암묵적 형변환 후 값만 비교 ('10' == 10 -> true)
       - === : 데이터 타입과 값을 모두 엄격하게 비교 ('10' === 10 -> false)
       
    * 주의: 주석 내부에 문자열로 'm < n' 같은 표현을 공백 없이 붙여 쓰면 
            JSP 파서가 HTML 태그로 오인하여 에러가 발생할 수 있습니다.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이항 연산자 및 유효성 검사</title>
<script type="text/javascript">
window.onload = function() {
    let a = 5;
    let b = 2;
    console.log("a+b=" + (a + b)); // 7
    console.log("a-b=" + (a - b)); // 3
    console.log("a*b=" + (a * b)); // 10
    console.log("a/b=" + (a / b)); // 2.5
    console.log("a%b=" + (a % b)); // 1
    
    let c = "10";
    let f = 20000;
    console.log(c + f); // "1020000" (문자열 결합)
    console.log(parseInt(c) + f); // 20010 (정수 변환 후 연산)
    
    let m = 10;
    let n = "10";
    console.log("m==n:" + (m == n));   // true
    console.log("m===n:" + (m === n)); // false
    console.log("m!==n:" + (m !== n)); // true
    console.log("m!=n:" + (m != n));   // false
    console.log("m < n:" + (m < n));   // false
    console.log("m > n:" + (m > n));   // false
    console.log("m <= n:" + (m <= n)); // true
    console.log("m >= n:" + (m >= n)); // true
};

function ok() {
    let frm = document.frm;
    if (frm.id.value === "") {
        alert("아이디 입력!!");
        frm.id.focus();
        return;
    }
    if (frm.pwd.value === "") {
        alert("비번 입력!!");
        frm.pwd.focus();
        return;
    }
    if (frm.pwd1.value === "") {
        alert("비번 재입력 입력!!");
        frm.pwd1.focus();
        return;
    }
    if (frm.pwd.value !== frm.pwd1.value) {
        alert("비밀번호가 틀립니다");
        frm.pwd1.focus();
        return;
    }
    
    // 유효성 검사 통과 시 전송
    frm.submit();
}
</script>
</head>
<body>
  <form name="frm" action="#" method="post">
   ID: <input type="text" name="id" size="15" /><br />
   Password: <input type="password" name="pwd" size="15" /><br />
   재확인: <input type="password" name="pwd1" size="15" /><br />
   <input type="button" value="확인" onclick="ok()" />
  </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="ymj.board.*"%>
<!DOCTYPE html>
<%
  //content.jsp=>글수정버튼 클릭->updtaeFrorm.jsp?num=3&pageNum=1
  int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	
	BoardDAO dbPro=new BoardDAO();
	BoardDTO article=dbPro.updateGetArticle(num);//조회수X

	System.out.println("updateForm.jsp의 매개변수 확인");//안써도 무방하지만 쓰는게 에러를 잡기에 편한 디버깅 코딩
	System.out.println("num=>"+num+",pageNum=>"+pageNum);
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#e0ffff">  
<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum %>" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>">
	   <input type="hidden" name="num" value="<%=num%>">
	   <%-- <input type="hidden" name="pageNum" value="<%=pageNum%>"> --%>
	   
	   </td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center">Email</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40"><%=article.getContent()%></textarea></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="#b0e0e6" align="center" >비밀번호</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="12" name="passwd">
     
	 </td>
  </tr>
  <tr>      
   <td colspan=2 bgcolor="#b0e0e6" align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>
</form>     
</body>
</html>      

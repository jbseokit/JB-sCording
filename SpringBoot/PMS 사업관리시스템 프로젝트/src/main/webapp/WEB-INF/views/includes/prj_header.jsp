<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div style="background-color: #646464; color: white;  height: 100px; font-size: 20px;
       align: left; display: table-cell; vertical-align: bottom; ">
프로젝트 자원관리
</div>
<table style="border: 1px solid; width: 100%; height: 18px; ">
   <tr>
      <td style= "border-right: 1px solid;" onclick="location.href='info'">프로젝트 정보 관리</td>
      <td style= "border-right: 1px solid;" onclick="location.href='m_info'">프로젝트 인원 관리</td>
      <td onclick="location.href='s_info'">프로젝트 일정 관리</td>
   </tr>
</table>
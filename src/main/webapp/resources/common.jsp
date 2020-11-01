<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="bootstrapCSS" value="/resources/css/bootstrap.min.css"></c:url>
<c:url var="customCSS" value="/resources/css/style.css"></c:url>
<c:url var="jqueryJS" value="/resources/js/jquery.min.js"></c:url>
<c:url var="bootstrapJS" value="/resources/js/bootstrap.bundle.min.js"></c:url>
<c:url var="img" value="/resources/img/icon.png"></c:url>

<link rel="icon" href="${img }" type="image/png" sizes="16x16">
<link type="text/css" rel="stylesheet" href="${bootstrapCSS}"/>
<link type="text/css" rel="stylesheet" href="${customCSS}"/>
<script type="text/javascript" src="${jqueryJS}"></script>
<script type="text/javascript" src="${bootstrapJS}"></script>

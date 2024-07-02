<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<div class="container text-center bg-dark">
		<h1 class="text-light">Register</h1>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-info mb-3 " style="max-width: 18rem;">
				<div class="card-header">Fill this in!!</div>
				<div class="card-body"></div>

				<form:form action="/register" method="post" modelAttribute="newUser">
					<div>
						<form:label path="username" class="text-light">Username</form:label>
						<form:errors class="text-danger" path="username" />
						<form:input class="w-100" path="username" />
					</div>
					<div>
						<form:label path="email" class="text-light">Email</form:label>
						<form:errors class="text-danger" path="email" />
						<form:input class="w-100" path="email" />
					</div>
					<div>
						<form:label path="password" class="text-light">Password</form:label>
						<form:errors class="text-danger" path="password" />
						<form:input class="w-100" type="password" path="password" />
					</div>
					<div>
						<form:label path="confirm" class="text-light">Confirm Password</form:label>
						<form:errors class="text-danger" path="confirm" />
						<form:input class="w-100" type="password" path="confirm" />
					</div>
					<input type="submit" value="Submit" />
				</form:form>
			</div>
		</div>
		<h2>Login</h2>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-info mb-3 " style="max-width: 18rem;">
				<div class="card-header">Fill this in!!</div>
				<div class="card-body"></div>
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div>
						<form:label path="email">email</form:label>
						<form:errors class="text-danger" path="email" />
						<form:input class="w-100" path="email" />
					</div>
					<div>
						<form:label path="password">Password</form:label>
						<form:errors class="text-danger" path="password" />
						<form:input class="w-100" type="password" path="password" />
					</div>
					<input type="submit" value="Submit" />
				</form:form>


			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Produtos</title>

<!-- ATALHO PARA TRAZER A URL DE CONTEXTO DO PROJETO -->
<c:set value="${pageContext.request.contextPath}" var="contextPath" />

<!-- ATALHOS PARA OS ARQUIVOS ESTATICOS DO WEBJAR -->
<spring:url value="${contextPath}/webjars/bootstrap/5.2.3/css" var="css" />
<spring:url value="${contextPath}/webjars/jquery" var="jquery" />
<spring:url value="${contextPath}/webjars/bootstrap/js" var="js" />

<!-- APONTAMENTO PARA O CSS DO BOOTSTRAP -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- CSS PARA NOSAS CUSTOMIZACOES -->
<link href="/css/style.css" rel="stylesheet">


<!-- LINKS PARA USAR FONTE CUSTOMIZAVEL DO GOOGLE FONTES -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">

</head>
<body>
	<header>
		<%@include file="../navbar/navbar.html"%>
	</header>

	<main>
		<section id="formulario" class="bg-light pb-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="well">

							<h2 class="fonte-titulo texto-cor-especial" id="titulo">Produto</h2>

							<form:form modelAttribute="produtoModel"
								action="${contextPath}/produto/update/${produtoModel.id}"
								method="put">

								<spring:hasBindErrors name="produtoModel">
									<div class="alert alert-danger" role="alert">
										<form:errors path="*" class="has-error" />
									</div>
								</spring:hasBindErrors>

								<div class="form-group">
									<form:input path="id" type="hidden" name="id" />
								</div>


								<div class="form-group">
									<label class="control-label" for="nome">Nome:</label>
									<form:input type="text" name="nome" path="nome" id="nome"
										class="form-control" />
									<font color="red"><form:errors path="nome"></form:errors></font>
								</div>

								<div class="form-group">
									<label class="control-label" for="idCategoria">Categoria:</label>
									<form:select path="categoriaModel.idCategoria"
										name="categoriaModel.idCategoria" id="idCategoria"
										class="form-select">
										<form:options items="${categorias}" itemValue="idCategoria"
											itemLabel="nomeCategoria" />
									</form:select>
								</div>

								<div class="form-group">
									<label class="control-label" for="idMarca">Marca:</label>
									<form:select path="marcaModel.idMarca"
										name="marcaModel.idMarca" id="idMarca" class="form-select">
										<form:options items="${marcas}" itemValue="idMarca"
											itemLabel="nomeMarca" />
									</form:select>
								</div>

								<div class="form-group">
									<label class="control-label" for="sku">SKU:</label>
									<form:input type="text" path="sku" name="sku" id="sku"
										class="form-control" />
									<font color="red"><form:errors path="sku"></form:errors></font>
								</div>

								<div class="form-group">
									<label class="control-label" for="descricao">Descrição:</label>
									<form:textarea class="form-control" path="descricao"
										name="descricao" id="descricao" rows="4" cols="100" />
									<font color="red"><form:errors path="descricao"></form:errors></font>
								</div>

								<div class="form-group">
									<label class="control-label" for="preco">Preço:</label>
									<form:input type="number" id="preco" path="preco" name="preco"
										step=".01" class="form-control" />
									<font color="red"><form:errors path="preco"></form:errors></font>
								</div>

								<div class="form-group">
									<label class="control-label" for="caracteristica">Características:</label>
									<form:textarea id="caracteristica" class="form-control"
										path="caracteristicas" name="caracteristicas" rows="4"
										cols="100"></form:textarea>
									<font color="red"><form:errors path="caracteristicas"></form:errors></font>
								</div>
								<hr>

								<a class="btn btn-secondary btn-sm"
									href="${contextPath}/produto">Cancelar</a>
								<button type="submit" class="btn btn-primary btn-sm">Gravar</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<script src="${jquery}/jquery.min.js"></script>
	<script src="${js}/bootstrap.min.js"></script>

</body>
</html>
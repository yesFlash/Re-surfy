<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link href="../resources/css/get.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootStrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- Header-->
<div class = recommend_recipe>
<div class="slide_div_wrap">
	<div class="slide_div">
	<c:forEach items="${get}" var="recipe">
		<div>
			<a>
				<img src="${recipe.image}">
			</a>
			<c:out value="${recipe.recipeName}" />
			</div>
			</c:forEach>	
		</div>	
	</div>	
</div>

<br>
<!-- Section-->
<div class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class='row'>
			<div class="col-lg-12">
				<form id='searchForm' action="/recipe/get" method='get'>
					<select name='type'>
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
						<option value="R"
							<c:out value="${pageMaker.cri.type eq 'R'?'selected':''}"/>>음식 이름</option>
						<option value="F"
							<c:out value="${pageMaker.cri.type eq 'F'?'selected':''}"/>>음식 종류</option>
						<option value="FR"
							<c:out value="${pageMaker.cri.type eq 'RF'?'selected':''}"/>>음식 이름
							or 종류</option>
					</select> <input type='text' name='keyword'
						value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
						type='hidden' name='pageNum'
						value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
						type='hidden' name='amount'
						value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class='btn btn-default'>Search</button>
				</form>
			</div>
		</div>
			<div class="card-container">
				<c:forEach items="${get}" var="recipe">
					<div class="card">
						<div class="card-img">
							<img class="card-img-top" src="${recipe.image}" alt="..." />
						</div>
						<div class="card-head">
							<c:out value="${recipe.recipeName}" />
						</div>
						<div class="card-main">
							<div>
								난이도 : <c:out value="${recipe.difficulty}" />
							</div>
							<div>
								종류 : <c:out value="${recipe.foodType}" />
							</div>
							<div>
								기준인분 : <c:out value="${recipe.person}" />
							</div>
							<div>
								조리시간 : <c:out value="${recipe.time}" />
							</div>
						</div>
						<div class="card-footer">
							<a class="btn btn-outline-dark mt-auto"
								href="/recipe/detail?bno=<c:out value="${recipe.bno}" />">레시피 보기</a>
						</div>
					</div>
				</c:forEach>

				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
								<%-- href="${pageMaker.startPage -1}">Previous</a></li> --%>
								<a href="?type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}">Previous</a>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<%-- <a href="${num}">${num}</a> --%>
								<a href="?type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${num}&amount=${pageMaker.cri.amount}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
							<%--  ${pageMaker.cri.pageNum = ${pageMaker.endPage} + 1 --%>
							<%-- <a href="${pageMaker.endPage + 1}">Next</a></li> --%>
							<a href="?type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}&pageNum=${pageMaker.endPage + 1}&amount=${pageMaker.cri.amount}">Next</a>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
				<form id='actionForm' action="/recipe/get" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount}'> <input
						type='hidden' name='type'
						value='<c:out value="${ pageMaker.cri.type }"/>'> <input
						type='hidden' name='keyword'
						value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				</form>
</div>


<!--  end Pagination -->

<script type="text/javascript">
	$(document).ready(
			function() {
			var result = '<c:out value="${result}"/>';
			checkModal(result);
			history.replaceState({}, null, null);
			function checkModal(result) {
				if (result === '' || history.state) {
					return;
				}
				if (parseInt(result) > 0) {
					$(".modal-body").html(
							"게시글 " + parseInt(result)
							+ " 번이 등록되었습니다.");
				}
							$("#myModal").modal("show");
						}
						$("#regBtn").on("click", function() {
							self.location = "/recipe/registerRecipe";
						});
						var actionForm = $("#actionForm");
						$(".paginate_button a").on(
								"click",
								function(e) {
								e.preventDefault();
									console.log('click');
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						$(".move")
								.on("click",
								function(e) {
								e.preventDefault();
								actionForm
								.append("<input type='hidden' name='bno' value='"
								+ $(this).attr("href")+ "'>");
								actionForm.attr("action","/recipe/detail");
								actionForm.submit();
								});
						var searchForm = $("#searchForm");
						$("#searchForm button").on(
								"click",
								function(e) {
									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}
									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();
									searchForm.submit();
								});

					});
	
</script>
<script>
$(document).ready(function(){
			$(".slide_div").slick({
				  centerMode: true,
				  centerPadding: '90px',
				  slidesToShow: 4,
				  slidesToScroll : 1,
				  autoplay : true,
				  autoplaySpeed : 1500,
				  responsive: [
				    {
				      breakpoint: 768,
				      settings: {
				        arrows: false,
				        centerMode: true,
				        centerPadding: '30px',
				        slidesToShow: 3
				      }
				    },
				    {
				      breakpoint: 480,
				      settings: {
				        arrows: false,
				        centerMode: true,
				        centerPadding: '30px',
				        slidesToShow: 1
				      }
				    }
				  ]
			});
});
</script>

<%@include file="../includes/footer.jsp"%>

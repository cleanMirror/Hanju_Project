<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList/lists.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>한주 일반구매</title>
  </head>
  <body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="app">
        <section class="selectSection">
            <!-- 카테고리 버튼 클릭 (1) -->
            <div class="productsListSelect">
                <a href="productList.do">
                    <span class="selected">전체상품</span>
                </a>
                <a href="newProducts.do">
                    <span>신상품</span>
                </a>
                <a href="javascript:void(0);">
                    <span>베스트</span>
                </a>
            </div>
            <!-- 
              카테고리 버튼 클릭 (2) 
              : 클릭시 전통주, 굿즈, 선물용 페이지로 이동 
            -->
            <div class="productsPartList">
                <a href="traditionProducts.do">
                    <span>전통주</span>
                </a>
                <a href="javascript:void(0);">
                    <span class="selected">선물세트</span>
                </a>
            </div>
        </section>
        <!-- 상품 리스트 영역 -->
        <section class="productContainer">
        <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
          <ul v-for="item in products"> 
            <li class="productList">
              <a @click="fnDetailPage(item.sellId)">
                <div class="productInfo">
                  <div class="img-wrap">
                    <img :src="item.filePath" :alt="item.fileOrgName" />
                  </div>
                  <p class="productName">
                    {{ item.productName }}
                  </p>
                  <div class="priceSection">
                    <p class="price" v-if="item.discount == 0" style="font-size:28px;"> <!-- 할인율 0일 경우 -->
                        {{ item.priceComma }} 
                      <span class="mini">원</span>
                    </p>
                    <p class="price" v-else> <!-- 할인율 존재할 경우 -->
                      <del style="font-size:14px; font-weight: 400; margin-right:8px;">{{ item.priceComma }} 원</del>
                      <p v-if="item.discount != 0">
                        <span class="discount">{{item.discount}} % </span>
                          <span class="price productPrice">
                            {{item.discountPrice}} <span class="mini">원</span>
                          </span>
                      </p>
                    </p>
                  </div>
                  <div class="otherInfoSection">
                    <p class="madeBy">
                      <span class="mini madeBy">생산지</span> {{ item.madeBy }}
                    </p>
                    <p class="alcohol">
                      <span class="material-symbols-outlined">local_bar</span>
                      <span class="mini title">알코올 도수</span> {{ item.alcohol }} %
                    </p>
                    <p class="productGrade">
                      <img src="../../image/star_icon.png" alt="별표" />
                      <span class="mini grade">
                        평점
                      </span> 
                      <span :value="item.productId" class="avg" v-if="item.average > 0">
                        {{ item.average }}
                        <span class="mini count">
                          ({{ item.comentCnt }})
                        </span>
                      </span>
                      <span :value="item.productId" class="avg" v-if="item.average == 0">
                        평점 없음
                      </span>
                    </p>
                  </div>           
                </div>
              </a>
            </li>
          </ul>
        </section>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        products : [],
      };
    },
    methods: {
        fnList() {
            var self = this;
            var paramap = {};
            $.ajax({
                url: "giftSets.dox",
                dataType: "json",
                type: "POST",
                data: [],
                success: (data) => {
                    self.products = data.list;
                },
            });
        },
        fnDetailPage(sellId) {
          location.href = `/details/details.do?id=\${sellId}`;
        }
    },
    mounted() {
        var self = this;
		self.fnList();
    },
  });
  app.mount("#app");
</script>
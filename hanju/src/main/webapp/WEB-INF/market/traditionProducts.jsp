<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainCss.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productList/lists.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>한주</title>
  </head>
  <body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="app">
        <section class="selectSection">
            <!-- 카테고리 버튼 클릭 (1) -->
            <div class="productsListSelect">
                <a href="productList.do">
                    <span class="selected">일반구매</span>
                </a>
                <a href="javascript:void(0);">
                    <span>픽업</span>
                </a>
                <a href="javascript:void(0);">
                    <span>공동구매</span>
                </a>
                <a href="javascript:void(0);">
                    <span>펀딩</span>
                </a>
            </div>
            <!-- 
              카테고리 버튼 클릭 (2) 
              : 클릭시 전통주, 굿즈, 선물용 페이지로 이동 
            -->
            <div class="productsPartList">
                <a href="traditionProducts.do">
                    <span class="selected">전통주</span>
                </a>
                <a href="giftSets.do">
                    <span>선물세트</span>
                </a>
            </div>
        </section>
        <!-- 분류 코드 리스트 -->
        <div class="kindList">
          <label v-for="item in codeList">
            <input type="checkbox" v-model="selectCodes" :value="item.code" @change="fnTradCode">
            {{item.codeName}}
          </label>
        </div>
        <!-- 상품 리스트 영역 -->
        <section class="productContainer">
            <!-- 상품 리스트 : 해당 리스트를 클릭시, '상세페이지'로 이동 -->
            <ul v-for="item in products">
                <li class="productList">
                    <a href="javascript:void(0); ">
                        <div>
                            <div class="img-wrap">
                                <img :src="item.filePath" :alt="item.fileOrgName" />
                            </div>
                            <p class="productName">{{item.productName}}</p>
                            <p class="price">\ {{item.priceComma}}</p>
                            <p>{{item.alcohol}} %</p>
                            <p>평점 0.0</p>
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
        codeList : [],
        selectCodes : []
      };
    },
    methods: {
      fnTradCode() {  //  종류 선택 체크박스
        var self = this;
        var paramap = {};
        $.ajax({
            url: "codeList.dox",
            dataType: "json",
            type: "POST",
            data: [],
            success: (data) => {
              console.log(self.codeList);
              self.codeList = data.codeList;
            },
        });
      },
      fnList() {  // 상품 리스트
        var self = this;
        var paramap = {};
        console.log("선택 : "+self.selectCodes);
        if(self.selectCodes.length > 0){
          var fCode = JSON.stringify(self.selectCodes);
          paramap = {selectCodes : fCode};
          console.log("선택 : "+self.selectCodes);
        }
        $.ajax({
            url: "traditionAlcohol.dox",
            dataType: "json",
            type: "POST",
            data: paramap,
            success: (data) => {
              console.log(data);
              self.products = data.tradList;
            },
        });
      },
    },
    mounted() {
      var self = this;
		  self.fnList();
      self.fnTradCode();
    },
  });
  app.mount("#app");
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/review.css"/>
<script src="/js/jquery.js"></script>
<script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
        <div id="container">
            <div id="contents">
                <div id="tit">
                    <h2>리뷰</h2>
                </div>
                <div id="inside">
                    <div id="stateReview">
                        <div class="ing">
                            <a href="../user/review.do">작성 가능한 리뷰</a>
                        </div>
                        <div class="com">
                            <a href="../user/reviewCom.do">작성한 리뷰</a>
                        </div>
                    </div>
                    <table>
                        <tr>
                            <th>상품</th>
                            <th>리뷰</th>
                        </tr>
                        <tr>
                            <td class="product">
                                <div class="reviewArea">
                                    <a href="" class="thum">
                                        <img>
                                    </a>
                                    <div class="text">
                                    <a href="" class=""></a>
                                    </div>
                                </div>
                            </td>
                            <td class="write">
                                <div>
                                    <a ></a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {};
    },
    methods: {
        fnReviewWrite(){
            
        }
    },
    mounted() {},
  });
  app.mount("#app");
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/userCss/modify.css"/>
    <script src="/js/jquery.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
  </head>

  <body>
    <div id="app">
      <div class="joinBody">
        <div class="joincontent">
          <div class="joinTit">
            <h2>회원 정보 수정</h2>
          </div>
          <h3>기본정보</h3>
          <div class="required"><a>*</a>필수입력사항</div>
          <table>
            <colgroup>
              <col style="width: 150px;">
              <col style="width: auto;">
            </colgroup>
            <tr>
              <th>아이디<a>*</a></th>
              <td>
                <input type="text" id="userId" v-model="userId"><span>(영문소문자/숫자,4~16자)</span>
              </td>
            </tr>
            <tr>
              <th>새 비밀번호</th>
              <td>
                <input type="password" id="newPassword" v-model="newPassword" @input="fnNewPwdCheck"><span>(영문대소문자/숫자/특수문자 중 2가지
                  이상
                  조합,10자~16자)</span>
                <div class="msg">{{newPwdCkMsg}}</div>
              </td>
            </tr>
            <tr>
              <th>새 비밀번호 확인<a>*</a></th>
              <td><input type="password" id="newPasswordCheck" v-model="newPasswordCheck" @input="fnNewPwdCheck2"></td>
              <div class="msg">{{newPwdCkMsg}}</div>
            </tr>
            <tr>
              <th>이름<a>*</a></th>
              <td><input type="text" id="userName" v-model="userName"></td>
            </tr>
            <tr>
              <th>주소<a>*</a></th>
              <td>
                <div>
                  <input type="text" id="post" v-model="zipNo" placeholder="우편번호">
                  <button @click="fnSearchAddr" class="adrBtn">주소검색</button>
                </div>
                <div><input type="text" id="addr1" v-model="roadAddrPart1" placeholder="기본주소"></div>
                <div><input type="text" id="addr2" v-model="addrDetail" placeholder="나머지 주소(선택 입력 가능)"></div>
              </td>
            </tr>
            <tr>
              <th>휴대전화<a>*</a></th>
              <td>
                <select id="phone1" v-model="phone1">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                </select>-<input type="text" id="phone2" v-model="phone2" maxlength="4">-<input type="text" id="phone3" v-model="phone3" maxlength="4">
                <button @click="fnPhoneNumber" class="phoneNumber">변경하기</button>
              </td>
            </tr>
            <tr>
              <th>이메일<a>*</a></th>
              <td>
                <input type="email" id="email" v-model="email" @change="fnEmail">
                <select id="emailDomain" v-model="emailDomain" @change="fnDomain">
                  <option value="직접입력">직접입력</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>
                  <option value="hotmail.com">hotmail.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="icloud.com">icloud.com</option>
                </select>
                <div class="msg">{{emailMsg}}</div>
              </td>
            </tr>
          </table>

          <h3>추가정보</h3>
          <table>
            <tr>
              <th>생년월일</th>
              <td>
                <input type="text" id="year" v-model="year" maxlength="4">년
                <input type="text" id="month" v-model="month" maxlength="2">월
                <input type="text" id="day" v-model="day" maxlength="2">일
              </td>
            </tr>
          </table>
          <div class="joinComBtn">
            <button id="backBtn" @click="backBtn">회원정보수정</button>
            <button id="ComBtn" @click="joinBtn">취소</button>
            <button id="DelBtn" @click="deleteBtn">회원탈퇴</button>
          </div>
        </div>
      </div>
    </div>
  </body>

  </html>
  <script>
    const app = Vue.createApp({
      data() {
        return {
          status: 'C',
          userId: "${sessionId}",
          password: "",
          pwdCkMsg: "",
          newPassword: "",
          newPasswordCheck: "",
          newPwdCkMsg: "",
          userName:"",
          zipNo: "",
          roadFullAddr: "",
          roadAddrPart1: "",
          addrDetail: "",
          tel1: '02',
          tel2: "",
          tel3: "",
          phone1: '010',
          phone2: "",
          phone3: "",
          email: "",
          emailDomain: '직접입력',
          emailMsg: "",
          year:"",
          month:"",
          day:"",
        };
      },
      methods: {
        validate() {
          var self = this;

          const phoneText = /^[0-9]{4}$/;
          
          
          if (!phoneText.test(this.phone2) || !phoneText.test(this.phone3)) {
            alert('휴대폰번호 형식이 올바르지 않습니다.')
            return false;
          }

          if(self.password == null){
            alert('비밀번호 항목은 필수 입력값입니다.')
            return false;
          }

          
          if(self.userName == null){
            alert('이름 항목은 필수 입력값입니다.')
            return false;
          }

          if(self.zipNo == null || self.roadAddrPart1 == null){
            alert('주소 항목은 필수 입력값입니다.')
            return false;
          }

          if(self.email == null || self.emailDomain == null){
            alert('이메일 항목은 필수 입력값입니다.')
            return false;
          }
        },

        fnPhoneNumber(){
          location.href="/";
        },

        fnPwdCheck() {
          var self = this;

          if (self.newPassword == '') {
            self.newPwdCkMsg = "비밀번호를 입력해주세요";
            return false;
          }else if (self.password != self.password) {
            self.pwdCkMsg = "비밀번호가 일치하지 않습니다."
            return false;
          } else {
            self.pwdCkMsg = "";
          }

        },
        
        fnNewPwdCheck() {
          var self = this;

          const pwdText = /^(?:(?=.*[a-zA-Z])(?=.*[0-9])|(?=.*[a-zA-Z])(?=.*[#?!@$%^&*-])|(?=.*[0-9])(?=.*[#?!@$%^&*-])).{10,16}$/;

          if (!pwdText.test(self.newPassword)) {
            self.newPwdCkMsg = "영문대소문자/숫자/특수문자 중 2가지 이상 조합,10자~16자";
            return false;
          } else {
            self.newPwdCkMsg = "";
          }

          
        },
        fnNewPwdCheck2() {
          var self = this;

          if (self.newPassword != self.newPasswordCheck) {
            self.newPwdCkMsg = "비밀번호가 일치하지 않습니다."
            return false;
          } else {
            self.newPwdCkMsg = "";
          }

        },
        fnSearchAddr() {
          var self = this;
          var option = "width = 500, height = 500, top = 100, left = 200, location = no";
          window.open("juso.do", "addr", option);
        },
        fnResult(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
          var self = this;
          self.zipNo = zipNo; //<- 위에 넣은 값
          self.roadAddrPart1 = roadAddrPart1;
          self.addrDetail = addrDetail;
          self.roadFullAddr = roadFullAddr;
          // 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
          console.log(zipNo);
          console.log(roadAddrPart1);
          console.log(addrDetail);
        },
        fnEmail() {
          var self = this;

          if (self.email == '') {
            self.emailMsg = "이메일을 입력해주세요";
            return false;
          }else{
            self.emailMsg = "";
          }
        },
        fnDomain(){
          var self = this;

          var prefix = "";

          if (self.email.indexOf('@') == -1 ) { 
            prefix = self.email;
          }else if(self.emailDomain == '직접입력'){
            self.emailDomain = "";
          } else {
            prefix = self.email.substring(0, self.email.indexOf('@') ); 
          }
          self.email = prefix + "@" + self.emailDomain;
        },


        backBtn(){
          location.href="/user/modify.do";
        },

        joinBtn(){
          var self = this;

          const phone = self.phone1 + "-" + self.phone2 + "-" + self.phone3;
          const birthday = self.year + "-" + self.month + "-" + self.day;

          var nparmap = {
            status:self.status,
            userId: self.userId,
            password: self.newPassword,
            userName: self.userName,
            roadFullAddr:self.roadFullAddr,
            phone : phone,
            email : self.email,
            birthday : birthday
           
          };
          if(self.validate() == false){
                return;
              }
          $.ajax({
            url: "join.dox",
            dataType: "json",
            type: "POST",
            data: nparmap,
            success: function (data) {
              console.log(data);
              $.pageChange("mypage.do", {});
            }
          });

        },

        deleteBtn(){
          location.href="/";
        },

        fnInfo(){
          var self = this;
                var nparmap = {
                    userId:self.userId
                };
                
          $.ajax({
            url:"join.dox", 
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) { 
              console.log(data);
              self.password = data.password
              self.userName = data.userName
              self.phone = data.phone
              self.email = data.email
              self.birthday = data.birthday
            }
          });
        }

      },
      mounted() {
        var self = this;
        window.vueAppInstance = this;
        self.fnInfo();
        

      },




    });
    app.mount("#app");

    function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
      if (window.vueAppInstance) {
        window.vueAppInstance.fnResult(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo);
      } else {
        console.error("Vue app instance is not available.");
      }
    }
  </script>
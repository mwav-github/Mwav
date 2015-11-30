<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Head_Import -->
<!-- /////////// -->
<jsp:include page="/PartsOfContent/Head_Import.jsp" flush="false" />
<!-- /////////// -->
</head>

<body>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<p class="bg-primary" style="font-size: 35px">
				Mwav <small>Naming_DOCS</small>
			</p>

		</div>

		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">

			<!-- Content Column -->
			<div class="col-md-12">
				<div class="row">
					<h1 class="page-header">Table of Contents</h1>
					<ul>
						<li><a href="#Naming Common Rules">Naming Common Rules</a>

							<ol>
								<li><a href="#Primary Rules">Primary Rules</a></li>
								<li><a href="#MVC Rules">MVC Rules</a></li>
							</ol></li>
						<li><a href="#JAVA">JAVA</a>
							<ol>
								<li><a href="#Package">Package</a></li>
								<li><a href="#Class & Interface">Class & Interface</a></li>
								<li><a href="#Method">Method</a></li>
								<li><a href="#Field Names">Field Names</a></li>
							</ol></li>
						<li><a href="#JSP, HTML">JSP, HTML</a></li>
					</ul>

				</div>

				<div class="col-md-12">
					<br>
					<h2>표기법 설명</h2>
					<div class="table-responsive">
						<table class="table table-bordered table-striped">
							<colgroup>
								<col class="col-xs-2">
								<col class="col-xs-4">
								<col class="col-xs-2">
								<col class="col-xs-4">
							</colgroup>
							<thead>
								<tr>
									<th>표기법 명명</th>
									<th>설명</th>
									<th>예시</th>
									<th>사용처</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row"><code>파스칼 표기법 </code></th>
									<td>이 명명 규칙에는 단어의 시작 문자는 대문자로하며 기타 문자가 소문자입니다.</td>
									<td>예 : SupplierCode</td>
									<td><a href="#Class & Interface">2.2 Class & Interface</a></td>
								</tr>
								<tr>
									<th scope="row"><code>카멜 표기법</code></th>
									<td>모든 단어의 명명 규칙 첫 문자에서 첫 단어를 제외하고는 대문자이고 다른 문자는 소문자입니다.</td>
									<td>예 : supplierCode</td>
									<td><a href="#Method">2.3 Method</a>, <a href="#Field Names">2.4 Field
											Names</a></td>
								</tr>
								<tr>
									<th scope="row"><code>헝가리어 표기법</code></th>
									<td>이 명명 규칙에서 변수 이름은 데이터 형식을 나타내는 작은 편지의 그룹으로 시작합니다.</td>
									<td>예 : bLoop (B는 boolean 타입을 나타냅니다), iSum은 (i는 정수 데이터 형식을
										표시).</td>
									<td></td>
								</tr>
								<tr>
									<th scope="row"><code>언더바 표기법</code></th>
									<td>언더스코어 표기법은 변수를 만들 때, 각 단어를 구분하기 위하여 언더스코어(언더라인, 언더바 _
										)를 사용한다.</td>
									<td>예 : second_valuable;</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>


					<div class="row Naming Conventions">
						<a id="Naming Common Rules"></a>
						<div class="text-center">
							<h1 style="color: #00abec;">1. Naming Common Rules</h1>
							<hr>
						</div>


						<p>
							명명 규약을 따르게 되면 일반적으로 더 낳은 가독성이 제공되고 이름 충돌로 인한 오류 발생을 최소화 시킬 수 있게
							된다. <br>본 명명 규약은 Mwav의 공식적인 명명 규약이며, 또한 본 명명 규약은 회사차원의 규약이므로
							배포를 금하며 임의로 수정시에는 구성원들간의 협의가 필요하다.
						</p>
						<p>(A그룹 대상) *문서에 대한 직접 수정은 아래 책임자에 한하여, 수정한다.</p>
						<p class="lead">문서 책임자 : 김주성 (정) 조남진 (부)</p>
						<br /> <br /> <a id="Primary Rules"></a>
						<div class="text-left">
							<h2 style="color: #f37d27;">1.1 Primary Rules</h2>
							<hr>
							<p>1. 모든 이름은 명확한 의미를 전달할 수 있도록 짓는다.</p>
							<p>2. 모든 이름은 영문 알파벳, 숫자, 밑줄(_) 만을 사용하여 짓는다.</p>
							<p>3. 모든 이름의 길이는 두 자 이상이어야 한다. 단, 반복문의 카운트 변수 제외.
							<p>4. ‘temp’, ‘tmp’와 같이 정확한 용도를 파악하기 힘든 이름은 사용하지 않는다.</p>
							<p>
								<strong>5. 모든 의미있는 변수는 DB필드명과 동일하게 작성하며, 단 pk는 제외한다.</strong>
							</p>
						</div>
						<br /> <a id="MVC Rules"></a>
						<div class="text-left">
							<h2 style="color: #f37d27;">1.2 MVC Rules</h2>
							<hr>
							<p>
								1. Controller : 웹 클라이언트에서 들어온 요청을 해당 비지니스 로직으로 분기시켜주고, 수행결과의 응답을
								해주는 Dispatcher의 역할을 담당하는 클래스 </br> *명명시에 +Controller로 하며, 각각의 CASE에
								따라 표기한다.
							</p>
							<p>2. DAO(DataAccessObject), VO(ValueObject), Service,
								ServiceImpl 모두 1번가 동일한 형태로 명명해준다.</p>
							<br>

							<div class="text-left well">
								<p class="bg-danger">
									<strong>*각 공통 접미어</strong>
								</p>

								<ul>
									<li><strong>Model</strong> : 접미어 없음</li>
									<li><strong>Controller</strong> : <em>*Controller</em></li>
									<li><strong>Service Interface</strong> : <em>*Service</em></li>
									<li><strong>Service Implement</strong> : <em>*ServiceImpl</em>
									</li>
									<li><strong>Dao Interface</strong> : <em>*Dao</em></li>
								</ul>
								<br>
								<p class="bg-danger">MVC 순서대로 나열 (- Controller > Service >
									ServiceImpl > DAO > SQL(XML) > Controller > JSP)</p>
								<p class="bg-danger">Ex) MemberController -> MemberService
									-> MemberServiceImpl -> MemberDAO</p>
							</div>
						</div>
					</div>

					<div class="enter"></div>

					<div class="row JAVA">
						<a id="JAVA"></a>
						<div class="text-center">
							<h1 style="color: #00abec;">2. JAVA</h1>
							<hr>
						</div>

						<a id="Package"></a>
						<div class="text-left">
							<h2 style="color: #f37d27;">2.1 Package</h2>
							<hr>
							<p>1. 모든 패키지 명은 영문 소문자만을 사용한다.</p>
							<p>2. 패키지는 기능 단위로 구분하며 가능한 짧은 이름을 사용하되 해당 패키지의 용도를 명확히 구분할 수
								있도록 한다.</p>
							<p>3. 표준 패키지의 확장/보충 기능을 담당할 경우 표준 패키지의 이름을 따른다.</p>
							<p>
								4. package는 최소 2레벨 이상 ( [1레벨].[2레벨])로 구성한다. <br> Mwav에서는,
								"new.mwav.board"라는 package를 사용하기로 한다.
							<p>&nbsp; 4.1 1레벨 : 가장 높은 레벨의 도메인 이름 중 하나이어야 한다. 현재는 com,
								edu, gov, mil, net, org 또는 1981 년 ISO Standard 316 에 명시화 된 나라 구별
								코드 영어 두문자가 쓰인다.</p>
							<p>&nbsp; 4.2 2레벨 : 프로젝트 명을 명시한다. (단 common 제외) *이후 패키지명에
								대해서는 적절한 네이밍으로 나타낸다.</p>
							<br>

							<div class="text-left well">
								<p class="bg-info">Ex) net.mwav.board / net.mwav.member /
									net.common</p>
							</div>
						</div>
						<a id="Class & Interface"></a>
						<div class="text-left">
							<h2 style="color: #f37d27;">
								2.2 Class & Interface <strong>(파스칼 표기법)</strong>
							</h2>
							<hr>
							<p>1. 인터페이스 명은 클래스 명과 동일한 규칙을 적용한다.</p>
							<p>2. 추상 클래스(Abstract Class)의 구분은 따로 하지 않는다.</p>
							<p>3. 클래스 명은 명사 또는 명사구를 사용한다.</p>
							<p>
								4. 클래스의 역할을 정확히 표현할 수 있는 단어를 택하되 너무 길어지지 않도록 주의한다. (표현력과 길이 사이의
								적절한 타협점을 찾도록 할 것)<br>
							<p>
								5. 일반적으로 축약어를 사용하지 않으며 광범위하게 사용되는 축약어만을 허용한다. </br> (만약 약어가 URL 이나
								HTML 같이 더 많이 넓게 사용되어진다면 사용해도 좋다).
							</p>
							<p>6. 복합 단어일 경우 각 단어의 첫 글자는 대문자이어야 한다.</p>
							<p>
								7. <strong>DB테이블 명 + 의미있는 단어를 선택한다.</strong>
							</p>
							<p>
								8. <strong>파스칼 표기법을 원칙으로 한다. </strong> <br>
							<div class="text-left well">
								<p class="bg-info">Ex) BoardController / EmailSender /
									CommandMap</p>
							</div>
						</div>
						<br /> <a id="Method"></a>
						<div class="text-left">
							<h2 style="color: #f37d27;">
								2.3 Method <strong>(카멜 표기법)</strong>
							</h2>
							<hr>
							<p>1. 메소드 명은 동사 또는 동사구를 사용한다.</p>
							<p>
								2. 첫 단어는 소문자로 시작하며 뒤이은 각 단어들의 첫 문자는 대문자, 그 외에는 소문자 사용을 원칙으로 한다.
								<br> 즉 <strong>카멜표기법</strong>을 사용한다.
							</p>
							<p>3. 속성(변수)에 관한 메소드들은 ‘get’이나 ‘set’으로 시작한다</p>
							<p>
								4. boolean 조건 검사 메소드는 ‘is’또는 ‘has’ 형태의 이름을 갖는다. <br>
							<p>5. 길이를 반환하는 메소드 명은 ‘getLength’로 한다.</p>
							<p>6. 복합 단어일 경우 각 단어의 첫 글자는 대문자이어야 한다.</p>

							<p>7. 이벤트 리스너의 메소드는 ‘명사’+ ‘동사(과거/진행형)’의 형태를 갖는다.</p>
							<div class="text-left well">
								<p>
									<strong>1. Service, DAO, VO 외 에서의 메소드</strong>
								</p>
								<p class="bg-danger">4,5,6번 예시</p>
								<br> <span>draw()</span><br> <span>getId()</span><br>
								<span>setLocale() // 속성 설정</span><br> <span>isVisible()
									// boolean 조건 검사</span><br> <span>hasMoreElements() //
									boolean 조건 검사</span><br> <span>getLength() // 길이 반환</span><br>
								<span>toByteArray() // 포맷 변경</span><br>

								<p class="bg-danger">7번 예시</p>

								<span>windowClosing(), actionPerformed()</span> <br>

							</div>
							<div class="text-left well">

								<p>
									<strong>2. Service, DAO, VO 내의 메소드</strong>
								</p>
								<br>
								<p>2.1 Service 내 에서의 메소드</p>
								<p class="bg-danger">기능별 접두어 (소문자로 시작하는 camelCase의 동사 + 명사의
									조합)</p>
								<ul>
									<li><strong>Service</strong>

										<ul>
											<li><strong>Create</strong> : <em>create*</em> 또는 <em>add*</em>
											</li>
											<li><strong>Retrieve</strong> : <em>get*</em> 또는 <em>check*</em>
											</li>
											<li><strong>Update</strong> : <em>modify*</em> 또는 <em>change*</em>
											</li>
											<li><strong>Destroy</strong> : <em>destroy*</em> 또는 <em>remove*</em>
											</li>
										</ul></li>
								</ul>
								<br>

								<p>//Example MemberService</p>
								<span>public List &lt;Member&gt; getList(); </span><br> <span>public
									Member getOne(int id);</span><br> <span>public boolean
									checkDuplicate(String loginId);</span><br> <span>public
									boolean create();</span><br> <span>public boolean
									modify(int id);</span><br> <span>public boolean
									destroy(int id);</span><br> <span>public boolean
									addAuth(int id);</span><br> <span>public boolean
									removeAuth(int id); </span><br> <span></span><br> <span></span><br>
								<span></span><br> <span></span><br> <span></span><br>

								<p>
									<span>2. DAO, VO 등의 내에서의 메소드</span><br>

								</p>
								<ul>
									<li><strong>Dao</strong>

										<ul>
											<li><strong>Insert</strong> : <em>insert*</em></li>
											<li><strong>Select</strong> : <em>select*</em></li>
											<li><strong>Update</strong> : <em>update*</em></li>
											<li><strong>Delete</strong> : <em>delete*</em></li>
										</ul></li>
								</ul>
								<span>-select 결과 1개 = selectOne</span><br> <span>-select
									결과 2개이상 = selectList</span><br> <span>-select 갯수출력 =
									selectCount</span><br> <br> <br>
								<p>//Example MemberDao</p>
								<span>public List&lt;Member&gt; selectList();</span><br> <span>public
									Member selectOne(int id);</span><br> <span>public int
									selectCount(String loginId);</span><br> <span>public
									boolean insert();</span><br> <span>public boolean
									update(int id);</span><br> <span>public boolean
									updateStatus(int id);</span><br> <span>public boolean
									delete(int id);</span><br> <span>public boolean
									insertAuth(int id);</span><br> <span>public boolean
									deleteAuth(int id);</span><br>
							</div>

						</div>
						<a id="Field Names"></a>
						<div class="text-left">
							<h2 style="color: #f37d27;">
								2.4 Field Names <strong>(카멜표기법 *상수제외)</strong>
							</h2>
							<hr>
							<p>1. 필드 명은 명사 또는 명사구를 사용한다.</p>
							<p>2. 필드의 용도를 정확히 표현할 수 있는 단어를 택하되 너무 길어지지 않도록 주의한다.</p>
							<p>&nbsp;(표현력과 길이 사이의 적절한 타협점을 찾도록 할 것)</p>
							<p>3. 일반적으로 축약어를 사용하지 않으며 광범위하게 사용되는 축약어만을 허용한다.</p>
							<p>4. 클래스 변수는 static 을 의미하는 ‘s’로, 인스턴스 변수는 field 를 의미하는 ‘f’로
								시작한다.</p>
							<p>&nbsp; (클래스/인스턴스 변수 사이의 구분뿐 아니라 지역 변수나 메소드, 파라미터 명과도 명확히
								구분되기 때문에 프로그래머의 실수로 인한 오류를 줄일 수 있다)</p>
							<p>5. 각 단어들의 첫 문자는 대문자, 그 외에는 소문자 사용을 원칙으로 한다.</p>
							<br>
							<p>6. (상수) ‘static final’ 수식자를 갖는 변수, 또는 인터페이스에 정의된 변수인 경우
								아래와 같은 규칙을 따른다.</p>
							<p>&nbsp;&nbsp; 6.1 상수는 공통의 상의 후에 지정을 원칙으로 한다.</p>
							<p>&nbsp;&nbsp; 6.2 상수 명은 하나 이상의 단어가 ‘_’로 결합된 형태를 취하며 대문자만을
								사용한다.</p>
							<p>&nbsp;&nbsp; 6.3 같은 속성에 대한 선택값을 나타내는 상수들은 공통된 접두어 또는 접미어를
								사용한다.</p>
							<br>

							<div class="text-left well">
								<p>//Example field</p>
								<p>예: sInstanceCount // 클래스 변수</p>
								<p>fElements // 인스턴스 변수</p>
								<p>fUniqueId // 축약어도 같은 규칙 적용</p>
								<br>
								<p>(상수_예)</p>
								<p>MIN_VALUE, MAX_VALUE // 동일 접미어 사용</p>
							</div>
						</div>
					</div>



					<div class="enter"></div>
					<div class="row Naming Conventions">
						<a id="JSP, HTML"></a>
						<div class="text-center">
							<h1 style="color: #00abec;">3. JSP, HTML</h1>
							<hr>
						</div>

						<p>
							<strong>JSP, HTML은 기존에 있는 파일 Naming을 준수하며, 신규 생성 필요시만
								아래의 규칙에 의거 생성한다. </strong>
						</p>
						<br>


						<div class="text-left">
							<p>- File 과 Folder 모두 동일하게 소문자 Under score(_) 구분의 명사 조합.</p>
							<p>
								&nbsp;&nbsp; * 1개의 폴더 안에 1개의 페이지 존재시에는 <strong>폴더명 +
									.jsp / .html</strong>
							</p>
							<p>
								&nbsp;&nbsp; * 1개의 폴더 안에 여러 개의 페이지 존재시에는 <strong>폴더명 약어
									+ 액션명 또는 의미있는 단어.jsp / .html</strong>
							</p>
							<br>
							<p>- Folder 는 단위 프로그램 기준으로 최소단위의 단어 사용.</p>
							<p>- 필요에 따라 구성원 협의 하에 별도 네이밍 제작 가능.</p>
							<br /> <br />

						</div>
						<br />

						<div class="text-left well">
							<p>//Example JSP, HTML</p>
							<br>
							<p>[신규 생성 필요시]</p>
							<p>-1개의 폴더 안에 1개의 페이지</p>
							<p>폴더명 : ThePress / 파일명 : ThePress.jsp, ThePress.html</p>
							<br>
							<p>-1개의 폴더 안에 여러개의 페이지</p>
							<p>폴더명 : Terms / 파일명 : TermsPrivateInfo.jsp ,
								TermJuvenile.html</p>


						</div>
					</div>





					<div class="enter"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer>
		<!--/////////////////////////////////////////////////// -->
		<jsp:include page="/PartsOfContent/SiteFooter/FrontFooter.jsp"
			flush="false" />
		<!--/////////////////////////////////////////////////// -->
	</footer>
</body>

</html>
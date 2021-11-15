package mbti.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mbti.model.vo.Mbti;

/**
 * Servlet implementation class MbtiResultViewServlet
 */
@WebServlet("/mbti/resultView")
public class MbtiResultViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MbtiResultViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int test1 = Integer.parseInt(request.getParameter("test1"));
		int test2 = Integer.parseInt(request.getParameter("test2"));
		int test3 = Integer.parseInt(request.getParameter("test3"));
		int test4 = Integer.parseInt(request.getParameter("test4"));
		
		Mbti mbti = new Mbti();
		
		/*
		 나의 여행 유형은? // 나와 어울리는 제주 여행지?		  
		 */
		/*
		 * e i
		 * n s
		 * t f
		 * j p
		 */
		if(test1 == 2 && test2 == 1 && test3 == 1 && test4 == 2) {
			// INTP <새로움추구 열혈탐험가> 논리를 바탕으로 톡톡 튀는 생각의 현실화를 꿈꾸는 당신! 여행도 누구보다 빠르게, 남들과는 다르게 다니는 타입! ~~장소추천~~ 항상 새로운 아이디어가 넘치는 INTP에게 강추!
			mbti.setMbtiType("새로움 추구 열혈탐험가 INTP");
			mbti.setMbtiContent("논리를 바탕으로 톡톡 튀는 생각의 현실화를 꿈꾸는 당신!\n여행도 누구보다 빠르게, 남들과는 다르게 다니는 타입!");
			mbti.setReco("레고박물관 브릭캠퍼스 제주");
			mbti.setRecoContent("어딜 봐도 레고가 가득한 레고 박물관 브릭캠퍼스 제주!\n항상 새로운 아이디어가 넘치는 INTP에게 강추!");
			mbti.setRecoImage("intp.jpg");
		} else if(test1 == 2 && test2 == 1 && test3 == 1 && test4 == 1) {
			// INTJ <여행지 전자두뇌> 분석력이 뛰어난 당신! 여행지가 결정되면 기후, 역사까지 모든 정보 검색 시작! ~~장소추천~~ 여행지의 모든 것을 알고 싶은 정보탐구형 INTJ에게 딱!
			mbti.setMbtiType("여행지 전자두뇌 INTJ");
			mbti.setMbtiContent("분석력이 뛰어난 당신! 여행지가 결정되면 \n기후, 역사까지 모든 정보 검색 시작!");
			mbti.setReco("소인국테마파크");
			mbti.setRecoContent("국내 최대의 미니어처 테마파크!\n여행지의 모든 것을 알고 싶은 정보탐구형 INTJ에게 강력 추천!");
			mbti.setRecoImage("intj.jpg");
		} else if(test1 == 1 && test2 == 1 && test3 == 1 && test4 == 2) {
			// ENTP <여행 의욕 만수르> 나만의 논리로 원하는 것을 추구하는 독보적 마이웨이! 그러나 하고 싶은 게 너무 많아 계획 세우기가 어려운 타입! ~~장소추천~~ 의욕 넘치는 ENTP가 좋아할 만한 체험도 준비 완료!
			mbti.setMbtiType("여행 의욕 만수르 ENTP");
			mbti.setMbtiContent("나만의 논리로 원하는 것을 추구하는 독보적 마이웨이! \n그러나 하고 싶은 게 너무 많아 계획 세우기가 어려운 타입!");
			mbti.setReco("성읍랜드");
			mbti.setRecoContent("각종 액티비티 체험도 한가득! 포토존도 한가득!\n의욕 넘치는 ENTP가 좋아할 만한 승마, 카트, 코스프레 등 각종 체험도 준비 완료!");
			mbti.setRecoImage("entp.jpg");
		} else if(test1 == 1 && test2 == 1 && test3 == 1 && test4 == 1) {
			// ENTJ <여행지 솔로몬> 타고난 통솔력과 결단력이 있는 당신! 여행지에서 의견 충돌이 생기면 문제 해결을 주도하는 타입! ~~장소추천~~ 다양한 공간과 체험은 리더력을 발산하고픈 ENTJ에게 딱!
			mbti.setMbtiType("여행지 솔로몬 ENTJ");
			mbti.setMbtiContent("타고난 통솔력과 결단력이 있는 당신! \n여행지에서 의견 충돌이 생기면 문제 해결을 주도하는 타입!");
			mbti.setReco("하도해녀체험마을");
			mbti.setRecoContent("제주도에서만 할 수 있는 체험이 있다고??\n고되도 특별한 체험을 선호하는 ENTJ에게는 하도해녀체험마을이 딱!");
			mbti.setRecoImage("entj.jpg");
		} else if(test1 == 2 && test2 == 1 && test3 == 2 && test4 == 2) {
			// INFP <여행지 운명론자? 떠나기 전엔 고민, 하지만 도착하면 재밌게 노는 당신! 넘치는 감성으로 여행지에서의 낭만을 꿈꾸는 운명론자! ~~장소추천~~ 풍부한 상상력으로 로맨틱한 순간을 원하는 INFP에게 딱!
			mbti.setMbtiType("여행지 운명론자 INFP");
			mbti.setMbtiContent("떠나기 전엔 고민, 하지만 도착하면 재밌게 노는 당신! \n넘치는 감성으로 여행지에서의 낭만을 꿈꾸는 운명론자!");
			mbti.setReco("카페세탁쏘");
			mbti.setRecoContent("따뜻한 감성 카페 카페세탁쏘!\n풍부한 상상력으로 로맨틱한 순간을 원하는 감성 말랭이 INFP에게 추천!");
			mbti.setRecoImage("infp.jpg");
		} else if(test1 == 2 && test2 == 1 && test3 == 2 && test4 == 1) {
			// INFJ <여행지 프로찍사> 긍정적인 사고로 자신만의 이상향을 추구하는 당신! 여행지에서는 인생샷 스팟을 귀신같이 찾아내는 타입! ~~장소추천~~ 아름다운 곳에서 추억을 남기기 원하는 INFJ에게 강추!
			mbti.setMbtiType("여행지 프로찍사 INFJ");
			mbti.setMbtiContent("긍정적인 사고로 자신만의 이상향을 추구하는 당신! \n여행지에서는 인생샷 스팟을 귀신같이 찾아내는 타입!");
			mbti.setReco("상효원수목원");
			mbti.setRecoContent("어딜봐도 아름다운 자연이 가득한 상효원수목원!\n아름다운 곳에서 추억을 남기기 원하는 INFJ에게 강추!");
			mbti.setRecoImage("infj.jpg");
		} else if(test1 == 1 && test2 == 1 && test3 == 2 && test4 == 2) {
			// ENFP <인스턴트 여행가> 말주변이 좋은 인싸 중 인싸인 당신! 10년은 돼보이는 인생친구, 오늘 처음 만난 거 리얼?! ~~장소추천~~ 즉흥여행을 좋아하는 ENFP를 순식간에 감성 속으로 초대합니다! 게-하
			mbti.setMbtiType("인스턴트 여행가 ENFP");
			mbti.setMbtiContent("말주변이 좋은 인싸 중 인싸인 당신! \n10년은 돼보이는 인생친구, 오늘 처음 만난 거 리얼?!");
			mbti.setReco("도렐 제주 본점");
			mbti.setRecoContent("분위기도 죽이고 감성은 더 죽이고!\n즉흥과 술을 좋아하는 ENFP는 완전 빠져들걸? 인-하(인싸 하이라는 뜻)");
			mbti.setRecoImage("enfp.jpg");
		} else if(test1 == 1 && test2 == 1 && test3 == 2 && test4 == 1) {
			// ENFJ <여행 준비물 봇짐러> 넘치는 배려심으로 궂은일을 마다하지 않는 당신! 친구들이 필요한 물품까지 준비하는 만능 보부상! ~~장소추천~~ 쇼핑부터 이벤트와 체험까지, 무엇이든 준비된 ENFJ에게 딱!
			mbti.setMbtiType("여행 준비물 봇짐러 ENFJ");
			mbti.setMbtiContent("넘치는 배려심으로 궂은일을 마다하지 않는 당신! \n친구들이 필요한 물품까지 준비하는 만능 보부상!");
			mbti.setReco("언더제주캔들");
			mbti.setRecoContent("예쁜 거 옆에 또 예쁜 거 옆에 더 예쁜 거..!♡\n쇼핑부터 이벤트와 체험까지, 무엇이든 준비된 ENFJ에게 딱!");
			mbti.setRecoImage("enfj.jpg");
		} else if(test1 == 1 && test2 == 1 && test3 == 1 && test4 == 2) {
			// ISTP <솔로 플레이어> 다소 내성적인 당신은 여행도 혼자가 더 재밌는 타입! 혼자일 때 오히려 더 대담할 수도?! ~~장소추천~~ 혼자서도 제대로 즐길 줄 아는 ISTP형에게 강추!
			mbti.setMbtiType("솔로 플레이어 ISTP");
			mbti.setMbtiContent("다소 내성적인 당신은 여행도 혼자가 더 재밌는 타입! \n혼자일 때 오히려 더 대담할 수도?!");
			mbti.setReco("세리월드");
			mbti.setRecoContent("열기구도 있고 미로도 있고 승마도 있고 카트도 있고...\n혼자서도 제대로 즐길 줄 아는 ISTP형에게 강추!");
			mbti.setRecoImage("istp.jpg");
		} else if(test1 == 2 && test2 == 2 && test3 == 1 && test4 == 1) {
			// ISTJ <걸어다니는 인간플래너> 세세하고 꼼꼼한 당신! 예산, 동선 등 여행의 모든 것을 엑셀로 만들어 정리하는 타입! ~~장소추천~~ 스케줄 관리에 철저한 ISTJ에게 딱 맞는 복합문화공간!
			mbti.setMbtiType("걸어다니는 인간플래너 ISTJ");
			mbti.setMbtiContent("세세하고 꼼꼼한 당신! 예산, 동선 등 \n여행의 모든 것을 엑셀로 만들어 정리하는 타입!");
			mbti.setReco("산방산");
			mbti.setRecoContent("제주도 왔으면 탄산온천은 필수 아닌가요?\n하루종일 스케줄 관리로 머리 아픈 ISTJ에게 딱 맞는 힐링 공간!");
			mbti.setRecoImage("istj.jpg");
		} else if(test1 == 1 && test2 == 2 && test3 == 1 && test4 == 2) {
			// ESTP <여행지 핵인싸> 말이 필요없는 자유로운 영혼의 소유자! 톡방 지분율 80%로 여행을 종용하지만 계획은 나몰라라! ~~장소추천~~ ESTP라면 다양한 이벤트를 즐기며 소울메이트를 만날지도!
			mbti.setMbtiType("여행지 핵인싸 ESTP");
			mbti.setMbtiContent("말이 필요없는 자유로운 영혼의 소유자! \n톡방 지분율 80%로 여행을 종용하지만 계획은 나몰라라!");
			mbti.setReco("커피가게쉬고가게");
			mbti.setRecoContent("홈메이드 감성 카페+청결한 게스트하우스의 조합!\nESTP라면  자유로운 분위기 속에서 소울메이트를 만날지도!");
			mbti.setRecoImage("estp.jpg");
		} else if(test1 == 1 && test2 == 2 && test3 == 1 && test4 == 1) {
			// ESTJ <우리동네 여행대장> 엄청난 추진력으로 원하는 계획을 만들어가는 당신, 그러나 주관이 뚜렷한 만큼 노선 변경에 극히 예민한 타입! ~~장소추천~~ 심신안정을 찾고 싶은 ESTJ들에게 추천하는 여행지!
			mbti.setMbtiType("우리동네 여행대장 ESTJ");
			mbti.setMbtiContent("엄청난 추진력으로 원하는 계획을 만들어가는 당신, \n그러나 주관이 뚜렷한 만큼 노선 변경에 극히 예민한 타입!");
			mbti.setReco("함덕해수욕장");
			mbti.setRecoContent("제주도에서는 해변 보는 것만으로도 힐링이라구요!\n심신안정을 찾고 싶은 ESTJ들에게 추천하는 파란 잉크빛 물결!");
			mbti.setRecoImage("estj.jpg");
		} else if(test1 == 2 && test2 == 2 && test3 == 2 && test4 == 2) {
			// ISFP <느긋한 여행가> 언제 어디서나 여유 있는 삶을 원하는 당신! 여행에서 가장 중요한 것도 바로 느긋하게 쉬는 일?! ~~장소추천~~ 휴양이 좋은 ISFP에겐 푸르른 이 곳이 안성맞춤!
			mbti.setMbtiType("느긋한 여행가 ISFP");
			mbti.setMbtiContent("언제 어디서나 여유 있는 삶을 원하는 당신! \n여행에서 가장 중요한 것도 바로 느긋하게 쉬는 일?!");
			mbti.setReco("소천지");
			mbti.setRecoContent("숨겨진 명물 소천지! \n휴양이 좋은 ISFP에겐 푸르른 이 곳이 안성맞춤!");
			mbti.setRecoImage("isfp");
		} else if(test1 == 2 && test2 == 2 && test3 == 2 && test4 == 1) {
			// ISFJ <일석이조 여행집사> 차분하게 상황을 정리하는 여행지 최고의 서포터! 서로 다른 의견도 적절히 조율해 두 마리 토끼를 잡는 타입! ~~장소추천~~ 힐링과 재미, 모두 놓칠 수 없는 ISFJ에게 안성맞춤!
			mbti.setMbtiType("일석이조 여행집사 ISFJ");
			mbti.setMbtiContent("차분하게 상황을 정리하는 여행지 최고의 서포터! \n서로 다른 의견도 적절히 조율해 두 마리 토끼를 잡는 타입!");
			mbti.setReco("레고박물관 브릭캠버스");
			mbti.setRecoContent("어딜봐도 레고가 가득한 레고 박물관 브릭캠버스!\n힐링과 재미, 모두 놓칠 수 없는 ISFJ에게 안성맞춤!");
			mbti.setRecoImage("isfj");
		} else if(test1 == 1 && test2 == 2 && test3 == 2 && test4 == 2) {
			// ESFP <여행 트렌드 베타테스터> 왕성한 호기심은 여행지에서도 마찬가지! 새로운 장소와 액티비티는 꼭 경험해봐야 하는 타입! ~~장소추천~~ 새롭고 다양한 전시/공연은 트렌드리더인 ESFP 취향 저격!
			mbti.setMbtiType("여행 트렌드 베타테스터 ESFP");
			mbti.setMbtiContent("왕성한 호기심은 여행지에서도 마찬가지! \n새로운 장소와 액티비티는 꼭 경험해봐야 하는 타입!");
			mbti.setReco("레고박물관 브릭캠버스");
			mbti.setRecoContent("어딜봐도 레고가 가득한 레고 박물관 브릭캠버스!\n새롭고 다양한 전시/공연은 트렌드리더인 ESFP 취향 저격!");
			mbti.setRecoImage("esfp");
		} else if(test1 == 1 && test2 == 2 && test3 == 2 && test4 == 1) {
			// ESFJ <여행지 무드메이커> 친구들의 선호도를 기반으로 여행을 계획하는 당신! 무엇이든 호응해주는 리액션봇으로 여행의 분위기를 주도! ~~장소추천~~ 마음 맞는 사람들과의 시간을 좋아하는 ESFJ에게 강추!
			mbti.setMbtiType("여행지 무드메이커 ESFJ");
			mbti.setMbtiContent("친구들의 선호도를 기반으로 여행을 계획하는 당신! \n무엇이든 호응해주는 리액션봇으로 여행의 분위기를 주도!");
			mbti.setReco("레고박물관 브릭캠버스");
			mbti.setRecoContent("어딜봐도 레고가 가득한 레고 박물관 브릭캠버스!\n마음 맞는 사람들과의 시간을 좋아하는 ESFJ에게 강추!");
			mbti.setRecoImage("esfj");
		}
		
		
		
		
		
		
		
		
		request.setAttribute("mbti", mbti);
		request.getRequestDispatcher("/views/mbti/test_result.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

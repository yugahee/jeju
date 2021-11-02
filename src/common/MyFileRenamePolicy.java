package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		String fileName = originFile.getName();  // EX. 원본 파일명 "user.png"
		String ext = "";                         // 확장자만 추출해서 담을 변수
		int dot = fileName.lastIndexOf(".");     // "."의 인덱스 위치
		if(dot != -1) {                          // "."이라는 문자가 fileName안에 존재한다면
			ext = fileName.substring(dot);       // "."의 위치부터 마지막까지 추출 EX. ".png"
		}
		
		/* 년월일시분초 포맷 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		/* 최종 수정할 파일명 (년월일시분초 + 최대 5자리 랜덤 값 + 파일확장자) */
		String rename = sdf.format(new Date()) + (int)(Math.random() * 100000) + ext;
		
		/* 변경 된 파일명으로 동일 경로에 파일 생성 */
		File newFile = new File(originFile.getParent(), rename);   // getParent() : 상위 경로
		
		/* 리네임 된 새로운 파일 리턴 */
		return newFile;
		
	}

}

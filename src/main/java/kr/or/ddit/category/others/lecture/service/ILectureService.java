package kr.or.ddit.category.others.lecture.service;

import java.util.List;

import kr.or.ddit.category.others.culture.model.CultureVo;
import kr.or.ddit.category.others.lecture.model.LectureVo;

public interface ILectureService {

	
	
	/**
	 * Method : getLectureList
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체강의
	 */
	List<LectureVo> getLectureList();
	//관리용
	List<LectureVo> getLectureAllList();
	//문화센터 목록
	List<CultureVo> getCultureList();
	
	/**
	 * Method : getLecture
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param lec_id
	 * @return
	 * Method 설명 :  특정강의
	 */
	LectureVo getLecture(int lec_id);
	
	
	/**
	 * Method : getLecture
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param lec_id
	 * @return
	 * Method 설명 :  특정센터
	 */
	
	CultureVo getCulture(int culture_id);
	
	
	
	/**
	 * Method : getCertainLectureList
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param lec_type
	 * @return
	 * Method 설명 : 분류별강좌목록
	 */
	List<LectureVo> getCertainLectureList(String lec_type);
	/**
	 * Method : deleteLecture
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param lec_id
	 * @return
	 * Method 설명 : 강좌삭제
	 */
	int deleteLecture(int lec_id);
	/**
	 * Method : useLecture
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param lec_id
	 * @return
	 * Method 설명 : 강좌사용
	 */
	int useLecture(int lec_id);
	/**
	 * Method : updateLecture
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param LectureVo
	 * @return
	 * Method 설명 : 강좌수정
	 */
	int updateLecture(LectureVo LectureVo);
	/**
	 * Method : InsertLecture
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param LectureVo
	 * @return
	 * Method 설명 : 강좌추가
	 */
	int  InsertLecture(LectureVo LectureVo);
	
}

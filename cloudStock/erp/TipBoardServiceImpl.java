package com.cloudStock.erp;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class TipBoardServiceImpl implements TipBoardService{
	
	@Autowired 
	private TipBoardDAO tipBoardDAO;
	private String fileUploadDir = "C:\\Users\\goonz\\OneDrive\\바탕 화면\\두번째 프로젝트 테스트\\workspace_prj2_테스트\\2ND_FINAL_PRJ\\src\\main\\resources\\static\\resources\\tip_board_img\\";
	
	public List<Map<String,String>> getTipBoardList(TipBoardSearchDTO tipBoardSearchDTO){
		
		List<Map<String,String>> tipBoardList = this.tipBoardDAO.getTipBoardList(tipBoardSearchDTO);
		
		return tipBoardList;
	}
	
	public int getTipBoardListAllCnt(TipBoardSearchDTO tipBoardSearchDTO) {
		
		
		int tipBoardListAllCnt = this.tipBoardDAO.getTipBoardListAllCnt(tipBoardSearchDTO);
		return tipBoardListAllCnt;
	}
	
	public TipBoardDTO getTipBoard(int tip_b_no) {
		
		int updateCnt = this.tipBoardDAO.updateReadCount(tip_b_no);
		
		TipBoardDTO tipBoard = null;
				
		if(updateCnt==1) {
			tipBoard = this.tipBoardDAO.getTipBoard(tip_b_no);
		}
		return tipBoard;
	}
	
	public TipBoardDTO getTipBoardDTO_without_upReadCount(int tip_b_no) {
		TipBoardDTO tipBoardDTO = this.tipBoardDAO.getTipBoard(tip_b_no);
		return tipBoardDTO;
	}
	
	public int updateTipBoard(TipBoardDTO tipBoardDTO, MultipartFile multi) throws Exception {
		FileUpload3 fileUpload = null;
		
		if(multi!=null && multi.isEmpty()==false) {
			fileUpload = new FileUpload3(
					multi
					, fileUploadDir
					, tipBoardDTO.getTip_pic()
			);
			tipBoardDTO.setTip_pic(fileUpload.getNewFileName());
		}
		
		int updateCnt = this.tipBoardDAO.updateTipBoard(tipBoardDTO);	
		
		if(updateCnt==1) {
			if(multi.isEmpty()==false) {
				
				fileUpload.uploadFile();
			
				System.out.println("파일이미지 변경 성공");
			}
		}	
		return updateCnt;
	}
	
	
	public int insertTipBoard(TipBoardDTO tipBoardDTO, MultipartFile multi) throws Exception {
		FileUpload3 fileUpload = null;
		
		if(multi!=null && multi.isEmpty()==false) {
			fileUpload = new FileUpload3(
					multi				// MultipartFile 객체
					, fileUploadDir		// 파일 업로드 저장 경로
					, tipBoardDTO.getTip_pic()	//삭제할 기존 파일명
			);
			tipBoardDTO.setTip_pic(fileUpload.getNewFileName());
		}
		
		int tipBoardRegCnt = this.tipBoardDAO.insertTipBoard(tipBoardDTO);
		
		if(multi!=null && multi.isEmpty()==false) {
			fileUpload.uploadFile();
		}	
		
		return tipBoardRegCnt;
	}
	
	public int deleteTipBoard(TipBoardDTO tipBoardDTO) {
		int deleteCnt = this.tipBoardDAO.deleteTipBoard(tipBoardDTO);
		return deleteCnt;
	}
	
	public TipBoardDTO getAdmin_pwd(TipBoardDTO tipBoardDTO) {
		TipBoardDTO admin_pwd = this.tipBoardDAO.getAdminPwd(tipBoardDTO);
		return admin_pwd;
	}
	
}

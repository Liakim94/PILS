package kr.co.xicom.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.xicom.cmmn.model.AttachVO;
import kr.co.xicom.cmmn.web.EgovProperties;
import kr.co.xicom.cms.model.BoardVO;
import kr.co.xicom.cms.service.BoardService;
import kr.co.xicom.cms.service.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static String dbType = EgovProperties.getProperty("Globals.DbType").toString();
	
	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private DataSourceTransactionManager transactionManager;
	

	@Override
	public int add(BoardVO vo, AttachVO attachVO) throws Exception {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
			int result = 0;
			
			try{
				result = boardMapper.addBoard(vo);
				
				if(vo.getRef() == 0){ //REF 업데이트
					boardMapper.updateRef(vo);
				}
				
				if(vo.getLvl() > 0){
					boardMapper.updateLevel(vo);
				}
				
				if(vo.getStep() > 0){
					boardMapper.updateStep(vo);
				}
				
				if(result > 0 && (attachVO.getArrFilename() != null)){ 
					
					for(int i = 0; i < attachVO.getArrFilename().length; i++){
						
						AttachVO fileMap = new AttachVO();
						fileMap.setBoardSeq(vo.getBoardSeq());
						fileMap.setBbsId(vo.getBbsId());
						fileMap.setRegSeq(vo.getRegSeq());
						fileMap.setUpdSeq(vo.getUpdSeq());
						fileMap.setUsrTyp(vo.getUsrTyp());
						fileMap.setRegNm(vo.getRegNm());
						fileMap.setUpdNm(vo.getUpdNm());
						fileMap.setFileNm(attachVO.getArrOriginalFilename()[i].toString());
						fileMap.setFileSz(attachVO.getArrFilesize()[i]);
						fileMap.setFileExt(attachVO.getArrFileext()[i].toString());
						fileMap.setSvFileNm(attachVO.getArrFilename()[i].toString());
						fileMap.setFileStd(vo.getFileStd());
						fileMap.setFilePath(attachVO.getArrFilepath()[i].toString());
						fileMap.setFileMime(attachVO.getArrFiletype()[i].toString());
//						result = attachMapper.addAttach(fileMap);
					}
				
				}
				transactionManager.commit(status);
				//System.out.println("result=================="+result);
			}catch(Exception e){
				transactionManager.rollback(status);
			}
			
			return result;
			
		}
	
	@Override
	public Map<String, Object> list(BoardVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BoardVO> list = null;
		int cnt = 0;
		
		list = boardMapper.listBoard(vo);
		cnt = boardMapper.boardCount(vo);
		
		map.put("resultList", list);
		map.put("resultCnt", cnt);
		
		return map;
	}

	@Override
	public BoardVO getView(BoardVO vo) throws Exception {
		return boardMapper.getBoard(vo);
	}

	@Override
	public int update(BoardVO vo, AttachVO attachVO, String arg) throws Exception {
		
			//Mysql 추가 시작
			if(arg.equals("board"))
			{
				DefaultTransactionDefinition def = new DefaultTransactionDefinition();
				def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
				
				TransactionStatus status = transactionManager.getTransaction(def);
				
				int result = 0;
				
				try{
					result = boardMapper.updateBoard(vo); 
					
					if(result > 0 && (attachVO.getArrFilename() != null)){ 
						
						for(int i = 0; i < attachVO.getArrFilename().length; i++){
							
							AttachVO fileMap = new AttachVO();
							fileMap.setBoardSeq(vo.getBoardSeq());
							fileMap.setBbsId(vo.getBbsId());
							fileMap.setRegSeq(vo.getUpdSeq());
							fileMap.setUsrTyp(vo.getUsrTyp());
							fileMap.setRegNm(vo.getUpdNm());
							fileMap.setFileNm(attachVO.getArrOriginalFilename()[i].toString());
							fileMap.setFileSz(attachVO.getArrFilesize()[i]);
							fileMap.setFileExt(attachVO.getArrFileext()[i].toString());
							fileMap.setSvFileNm(attachVO.getArrFilename()[i].toString());
							fileMap.setFileStd(vo.getFileStd());
							fileMap.setFilePath(attachVO.getArrFilepath()[i].toString());
							fileMap.setFileMime(attachVO.getArrFiletype()[i].toString());
//							result = attachMapper.addAttach(fileMap);
						}
					}
					
//					if(result > 0 && (attachVO.getDeletefile() != null)){
//						result = attachMapper.deleteAttach(attachVO);
//					}
					
					transactionManager.commit(status);
					//System.out.println("result=================="+result);
				}catch(Exception e){
					transactionManager.rollback(status);
				}
				
				return result;
				
			} 
//			else if(arg.equals("stat"))
//			{
//				return attachMapper.updateStat(vo);
//			}
//			else if(arg.equals("move"))
//			{
//				return attachMapper.moveBoard(vo);
//			}
//			else if(arg.equals("copy"))
//			{
//				int result = 0;
//				for(int i = 0; i < vo.getChkNo().length; i++){
//					vo.setBoardSeq(Integer.parseInt(vo.getChkNo()[i]));
//
//					result = attachMapper.copyBoard(vo);
//				}
//
//				return result;
//			}
			else return 0;
			//Mysql 추가 종료
		}
		

	@Override
	public void read(BoardVO boardVO) throws Exception {
		boardMapper.readBoard(boardVO);
	}

	@Override
	public int updateStat(BoardVO boardVO) throws Exception {
		return boardMapper.updateStat(boardVO);
	}

	@Override
	public String getMenu(int bbsId) throws Exception {
		return boardMapper.getMenu(bbsId);
	}

}

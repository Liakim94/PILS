package kr.co.xicom.front.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.co.xicom.front.service.mapper.AttachMapper;
import kr.co.xicom.util.HtmlTagUtils;
import kr.go.smes.fileservice.FileService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.service.BoardService;
import kr.co.xicom.front.service.mapper.BoardMapper;

import javax.annotation.Resource;

@Service
public class BoardServiceImpl implements BoardService {

	// WildRain 추가 2023-01-13
	/** Logger */
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private DataSourceTransactionManager transactionManager;

	// WildRain 추가 2023-01-13
	/** 첨부파일 Mapper */
	@Resource
	private AttachMapper attachMapper;

	// WildRain 추가 2013-01-13
	/** 파일서비스 */
	@Resource
	private FileService nasFileService;

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

			// WildRain 수정 2023-01-13
			// << 첨부파일 데이터 처리 >>
			// - 첨부파일의 업로드는 이미 FileUploader.js에 의해 특정 위치에
			//   업로드된 상태이며, 여기서는 업로드 결과 JSON 파일을 이용하여
			//   데이터베이스에 정보를 저장한다.
			String jsonFileList = HtmlTagUtils.restore(vo.getJsonFileList());
			if (StringUtils.isNotBlank(jsonFileList)) {
				// 업로드 결과 JSON 문자열을 파싱한다.
				Gson gson = new Gson();
				List<AttachVO> attachList = gson.fromJson(jsonFileList, new TypeToken<List<AttachVO>>(){}.getType());
				if (attachList != null) {
					for (int i=0; i<attachList.size(); i++) {
						AttachVO attach = attachList.get(i);
						attach.setBoardSeq(vo.getBoardSeq());
						attach.setBbsId(vo.getBbsId());
						attach.setRegSeq(vo.getRegSeq());
						attach.setUpdSeq(vo.getUpdSeq());
						attach.setUsrTyp(vo.getUsrTyp());
						attach.setRegNm(vo.getRegNm());
						attach.setUpdNm(vo.getUpdNm());
						FilenameUtils.getExtension(attach.getFileNm());
						attach.setFileStd(vo.getFileStd());

						attachMapper.create(attach);
					}
				}
			}

			transactionManager.commit(status);
		}
		catch(Exception e){
			LOGGER.error(e.getMessage(), e);
			transactionManager.rollback(status);
		}

		return result;

	}

	@Override
	public Map<String, Object> list(BoardVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<BoardVO> list = null;
		int cnt = 0;

		try {
			list = boardMapper.listBoard(vo);
			cnt = boardMapper.boardCount(vo);

			map.put("resultList", list);
			map.put("resultCnt", cnt);
		}
		catch (Exception e){
			System.out.println("error!!"+e.toString());
		}

		return map;

	}

	@Override
	public BoardVO getView(BoardVO vo) throws Exception {
		return boardMapper.getBoard(vo);
	}

	@Override
	public int update(BoardVO vo, AttachVO attachVO, String arg) throws Exception {

		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

		TransactionStatus status = transactionManager.getTransaction(def);

		int result = 0;

		try{

			// 게시글 업데이트 처리
			result = boardMapper.updateBoard(vo);

			// WildRain 수정 2023-01-13
			// 기존 첨부파일 정보 삭제
			AttachVO attach = new AttachVO();
			attach.setBoardSeq(vo.getBoardSeq());
			attach.setBbsId(vo.getBbsId());
			this.attachMapper.delete(attach);

			// 다시 첨부파일 정보 등록
			String jsonFileList = HtmlTagUtils.restore(vo.getJsonFileList());
			if (StringUtils.isNotBlank(jsonFileList)) {
				// 업로드 결과 JSON 문자열을 파싱한다.
				Gson gson = new Gson();
				List<AttachVO> attachList = gson.fromJson(jsonFileList, new TypeToken<List<AttachVO>>(){}.getType());
				if (attachList != null) {
					for (int i=0; i<attachList.size(); i++) {
						attach = attachList.get(i);
						attach.setBoardSeq(vo.getBoardSeq());
						attach.setBbsId(vo.getBbsId());
						attach.setRegSeq(vo.getRegSeq());
						attach.setUpdSeq(vo.getUpdSeq());
						attach.setUsrTyp(vo.getUsrTyp());
						attach.setRegNm(vo.getRegNm());
						attach.setUpdNm(vo.getUpdNm());
						FilenameUtils.getExtension(attach.getFileNm());
						attach.setFileStd(vo.getFileStd());

						attachMapper.create(attach);
					}
				}
			}

			// 실제 첨부파일 삭제 처리
			String jsonDeleteFileList = HtmlTagUtils.restore(vo.getJsonDeletedFileList());
			if (StringUtils.isNotBlank(jsonDeleteFileList)) {
				Gson gson = new Gson();
				List<AttachVO> deleteFileList = gson.fromJson(jsonDeleteFileList, new TypeToken<List<AttachVO>>(){}.getType());
				if (deleteFileList != null && deleteFileList.size() > 0) {
					for (AttachVO delFile : deleteFileList) {
						this.nasFileService.deleteFile(delFile.getFilePath(), delFile.getFileNm());
					}
				}
			}

			transactionManager.commit(status);
		}
		catch(Exception e){
			transactionManager.rollback(status);
		}

		return result;
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

	// WildRain 추가 2023-01-13
	/** 게시글 첨부파일 리스트 추출 */
	@Override
	public List<AttachVO> getAttachList(BoardVO boardVO) throws Exception {

		AttachVO attachVO = new AttachVO();
		attachVO.setBoardSeq(boardVO.getBoardSeq());
		attachVO.setBbsId(boardVO.getBbsId());

		return attachMapper.list(attachVO);
	}

	//Do 추가 2023-02-01
	//걸어온 발자취 list
	@Override
	public Map<String, Object> readyList(BoardVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<BoardVO> list = boardMapper.readyList(vo);
		int cnt =  boardMapper.boardCount(vo);
			map.put("resultList", list);
			map.put("resultCnt", cnt);
		return map;

	}
}

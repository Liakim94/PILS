package kr.co.xicom.cms.service.impl;

import java.util.ArrayList;
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
import kr.co.xicom.cmmn.web.EgovWebUtil;
import kr.co.xicom.cms.model.BbsVO;
import kr.co.xicom.cms.service.BbsService;
import kr.co.xicom.cms.service.mapper.BbsMapper;

@Service
public class BbsServiceImpl implements BbsService {
	
	@Autowired
	private BbsMapper bbsMapper;
	
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public int add(BbsVO vo) throws Exception {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
			//return bbsMapper.addBbs(vo);
			int result = 0;
			
			try{
				result = bbsMapper.addBbs(vo);
				
				if(result > 0){
					
					/*if(vo.getArrSeqDept() != null){
						for(int i = 0; i < vo.getArrSeqDept().length; i++){
							vo.setAuthTyp("D");
							vo.setAuthSeq(vo.getArrSeqDept()[i]);
							vo.setAuthRwx(vo.getArrRwxDept()[i]);
							result = bbsMapper.addAuth(vo);
						}
					}
					if(vo.getArrSeqGrp() != null){
						for(int i = 0; i < vo.getArrSeqGrp().length; i++){
							vo.setAuthTyp("G");
							vo.setAuthSeq(vo.getArrSeqGrp()[i]);
							vo.setAuthRwx(vo.getArrRwxGrp()[i]);
							result = bbsMapper.addAuth(vo);
						}
					}
					if(vo.getArrSeqEmp() != null){
						for(int i = 0; i < vo.getArrSeqEmp().length; i++){
							vo.setAuthTyp("E");
							vo.setAuthSeq(vo.getArrSeqEmp()[i]);
							vo.setAuthRwx(vo.getArrRwxEmp()[i]);
							result = bbsMapper.addAuth(vo);
						}
					}*/
					
					/*권한 추가*/
					List<BbsVO> arrAuthList = new ArrayList<BbsVO>();
					Map<String, Object> map = new HashMap<String, Object>();
					
					
					String[] authList = null;
					
					if(!EgovWebUtil.nvl(vo.getAuthList()).equals("") && vo.getAuthList().split(",").length > 0 ){
						authList = vo.getAuthList().split(",");
						//System.out.println(authList.length);
						for(int i = 0; i < authList.length; i++){
							//System.out.println(authList[i]);
							String[] arrAuth = null;
							arrAuth = authList[i].split("¶");
							
							BbsVO bbsVO = new BbsVO(); 
							
							bbsVO.setAuthTyp(arrAuth[0].substring(0, 1));
							bbsVO.setAuthSeq(Integer.parseInt(arrAuth[0].substring(1)));
							bbsVO.setAuthText(arrAuth[1]);
							bbsVO.setAuthRwx(arrAuth[2]);
							
							arrAuthList.add(bbsVO);
							
						}
						
						map.put("bbsId", vo.getBbsId());
						map.put("list",arrAuthList);
						
						
						bbsMapper.addAuth(map);
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
	public Map<String, Object> list(BbsVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BbsVO> list = null;
		int cnt = 0;
		
		list = bbsMapper.listBbs(vo);
		cnt = bbsMapper.bbsCount(vo);
		
		map.put("resultList", list);
		map.put("resultCnt", cnt);
		
		return map;
	}

	@Override
	public BbsVO getView(BbsVO vo) throws Exception {
		return bbsMapper.getBbs(vo);
	}

	@Override
	public int update(BbsVO vo, String cmd) throws Exception {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		
			if(cmd.equals("bbs"))
			{
				int result = 0;
				try{
					result =  bbsMapper.updateBbs(vo);
					if(result > 0){
						/*권한 추가*/
						List<BbsVO> arrAuthList = new ArrayList<BbsVO>();
						Map<String, Object> map = new HashMap<String, Object>();
						
						
						String[] authList = null;
						
						if(!EgovWebUtil.nvl(vo.getAuthList()).equals("") && vo.getAuthList().split(",").length > 0 ){
							authList = vo.getAuthList().split(",");
							//System.out.println(authList.length);
							for(int i = 0; i < authList.length; i++){
								//System.out.println(authList[i]);
								String[] arrAuth = null;
								arrAuth = authList[i].split("¶");
								
								BbsVO bbsVO = new BbsVO(); 
								
								bbsVO.setAuthTyp(arrAuth[0].substring(0, 1));
								bbsVO.setAuthSeq(Integer.parseInt(arrAuth[0].substring(1)));
								bbsVO.setAuthText(arrAuth[1]);
								bbsVO.setAuthRwx(arrAuth[2]);
								
								arrAuthList.add(bbsVO);
								
							}
							
							map.put("bbsId", vo.getBbsId());
							map.put("list",arrAuthList);
							
							
							bbsMapper.addAuth(map);
						}
					}
					transactionManager.commit(status);
				}catch(Exception e){
					transactionManager.rollback(status);
				}
				return result;
				
			} 
			else if(cmd.equals("stat"))
			{
				int result = 0;
				result = bbsMapper.updateStat(vo);
				return result;
			} 
			else return 0;
		}
		

	@Override
	public EgovMap getUC(BbsVO vo) throws Exception {
		return null;
	}


	@Override
	public List<EgovMap> getAuthList(BbsVO vo) throws Exception {
		return bbsMapper.getAuthList(vo);
	}
	
}

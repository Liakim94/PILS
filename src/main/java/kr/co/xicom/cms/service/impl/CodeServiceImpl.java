package kr.co.xicom.cms.service.impl;

import java.util.List;

import kr.co.xicom.cmmn.web.EgovProperties;
import kr.co.xicom.cmmn.web.EgovWebUtil;
import kr.co.xicom.cms.model.CodeVO;
import kr.co.xicom.cms.service.CodeService;
import kr.co.xicom.cms.service.mapper.CodeMapper;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper codeMapper;
	

	@Override
	public List<CodeVO> list() throws Exception {
		return codeMapper.getCategoryList() ;
	}

	@Override
	public List<CodeVO> list(CodeVO vo) throws Exception {
		return codeMapper.getCodeList(vo);
	}

	@Override
	public int add(CodeVO vo) throws Exception {
		return codeMapper.addCode(vo);
	}

	@Override
	public CodeVO get(CodeVO vo) throws Exception {
		return codeMapper.getCodeById(vo);
	}

	@Override
	public int update(CodeVO vo) throws Exception {
		return codeMapper.updateCode(vo);
	}

	@Override
	public int update(String data, String arg) throws Exception {
		int result = 0;
		int success = 0;
		if(EgovWebUtil.nvl(arg).equals("sort")){
			String jsonString = "";
			jsonString = EgovWebUtil.resetXSSMinimum(data);
			jsonString = jsonString.substring(1, jsonString.length()-1);
			//System.out.println(jsonString);
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonString);
			
			for(int i = 0; i < jsonArray.size(); i++){
				//System.out.println("========================");
				String ctgr = "";
				String cd = "";
				int sort = 0;
				
				JSONObject jsonObject = (JSONObject) jsonArray.get(i);
				ctgr = (String) jsonObject.get("name").toString();
				cd = (String) jsonObject.get("id").toString();
				sort = i;
				
				CodeVO vo = new CodeVO();
				vo.setCtgr(EgovWebUtil.nvl(ctgr));
				vo.setCd(EgovWebUtil.nvl(cd));
				vo.setSort(sort);
				success = codeMapper.updateCodeSort(vo);
			}
			result += success; 
		}
		return result;
	}


}

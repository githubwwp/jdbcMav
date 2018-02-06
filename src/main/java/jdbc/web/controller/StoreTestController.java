package jdbc.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jdbc.entity.vo.UserTestVo;
import jdbc.util.ObjectUtil;
import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("storeTest")
@Scope("prototype")
public class StoreTestController {

    
    @RequestMapping("getAbcStore.do")
    public ModelAndView getAbcStore(){
        Map<String, Object> model = new HashMap<String, Object>();
        List<UserTestVo> userTestVos = new ArrayList<UserTestVo>();
        for(int i=0; i< 5; i++){
            UserTestVo userTestVo = new UserTestVo();
            userTestVo.setId(ObjectUtil.getRandInt(1000));
            userTestVo.setName(ObjectUtil.getRandStr(10));
            userTestVo.setBirthday(new Date());
            userTestVo.setAddress(ObjectUtil.getRandStr(100));
            
            userTestVos.add(userTestVo);
        }
        model.put("userTestVos", userTestVos);
        return new ModelAndView(new JsonView(), model);
    }
    
    
}

package jdbc.web.controller.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import net.sf.json.spring.web.servlet.view.JsonView;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("jsData")
public class JsDataController {

    @RequestMapping("modelData")
    public ModelAndView modelData() {
        Map<String, Object> rstMap = new HashMap<String, Object>();

        
        
        Map<String, Object> user = new HashMap<String, Object>();
        List<Object> posts = new ArrayList<Object>();
        user.put("posts", posts);
        user.put("age", 33);
        user.put("name", "wwp");

        for (int i = 0; i < 4; i++) {
            Map<String, Object> post = new HashMap<String, Object>();
            post.put("id", "post" + new Random().nextInt(1000));
            post.put("cc", UUID.randomUUID());
            posts.add(post);
        }

        rstMap.put("user", user);
        return new ModelAndView(new JsonView(), rstMap);
    }
}

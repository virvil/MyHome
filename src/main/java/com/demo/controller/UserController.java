package com.demo.controller;

import com.alibaba.fastjson.JSON;
import jdk.nashorn.internal.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author:Virvil
 * @Description:
 * @Datte:Created in 16:39 2018/6/6
 * Modified By:
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/check.action",method = RequestMethod.POST,produces ="application/json;charset=UTF-8" )
    @ResponseBody
    public String login(HttpServletRequest request, @RequestParam(value = "VerificationCode") String code) {
        Map result = new HashMap<String,Object>();
        String randCode = request.getSession().getAttribute("randCode").toString();
        if (randCode.toLowerCase().equals(code.toLowerCase())){
            result.put("msg","验证码输入正确");
            result.put("success",true);
        }else {
            result.put("msg","验证码输入错误");
            result.put("success",false);
        }
        System.out.println(JSON.toJSONString(result));
        return JSON.toJSONString(result);
    }
}

package com.paotui.controller;

import com.paotui.entity.Dongtaifenxiang;
import com.paotui.entity.Gonggao;
import com.paotui.entity.Paotuixiangmu;
import com.paotui.service.DongtaifenxiangService;
import com.paotui.service.GonggaoService;
import com.paotui.service.PaotuixiangmuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class IndexController {

    @Autowired
    private PaotuixiangmuService paotuixiangmuService;
    @Autowired
    private GonggaoService gonggaoService;
    @Autowired
    private DongtaifenxiangService dongtaifenxiangService;

    @GetMapping({"/", "/index"})
    public String index(@RequestParam(value = "keyword", required = false) String keyword,
                        @RequestParam(value = "fenleiId", required = false) Integer fenleiId,
                        Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        params.put("fenleiId", fenleiId);
        params.put("status", 0);
        List<Paotuixiangmu> projectList = paotuixiangmuService.list(params);
        model.addAttribute("projectList", projectList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("fenleiId", fenleiId);

        List<Gonggao> gonggaoList = gonggaoService.list(new HashMap<>());
        model.addAttribute("gonggaoList", gonggaoList);

        List<Dongtaifenxiang> dongtaiList = dongtaifenxiangService.list(new HashMap<>());
        model.addAttribute("dongtaiList", dongtaiList);

        return "common/index";
    }
}

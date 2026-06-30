package com.paotui.controller;

import com.paotui.entity.*;
import com.paotui.service.*;
import com.paotui.util.FileUploadUtil;
import com.paotui.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/paotui")
public class PaotuiController {

    @Autowired
    private PaotuiService paotuiService;
    @Autowired
    private PaotuixiangmuService paotuixiangmuService;
    @Autowired
    private PaotuifenleiService paotuifenleiService;
    @Autowired
    private JiedanxinxiService jiedanxinxiService;
    @Autowired
    private QuerendingdanService querendingdanService;
    @Autowired
    private JiaoyifankuiService jiaoyifankuiService;

    @GetMapping("/index")
    public String index(HttpSession session, Model model) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        model.addAttribute("paotui", paotui);

        Map<String, Object> params = new HashMap<>();
        params.put("paotuiId", paotui.getId());
        model.addAttribute("myJiedanCount", jiedanxinxiService.list(params).size());

        params.clear();
        params.put("paotuiId", paotui.getId());
        model.addAttribute("myConfirmCount", querendingdanService.list(params).size());
        return "paotui/index";
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        model.addAttribute("paotui", paotuiService.getById(paotui.getId()));
        return "paotui/profile";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(Paotui paotui, @RequestParam(value = "file", required = false) MultipartFile file,
                                HttpServletRequest request, HttpSession session) {
        Paotui login = (Paotui) session.getAttribute("paotui");
        paotui.setId(login.getId());
        if (file != null && !file.isEmpty()) {
            paotui.setAvatar(FileUploadUtil.upload(file, request, "upload"));
        }
        paotuiService.update(paotui);
        session.setAttribute("paotui", paotuiService.getById(login.getId()));
        return "redirect:/paotui/profile";
    }

    @PostMapping("/updatePassword")
    @ResponseBody
    public R updatePassword(@RequestParam("oldPassword") String oldPassword,
                            @RequestParam("newPassword") String newPassword,
                            HttpSession session) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        Paotui db = paotuiService.getById(paotui.getId());
        if (!db.getPassword().equals(oldPassword)) {
            return R.error("原密码错误");
        }
        Paotui update = new Paotui();
        update.setId(paotui.getId());
        update.setPassword(newPassword);
        paotuiService.update(update);
        return R.ok("修改成功");
    }

    // 查看可接单项目
    @GetMapping("/project/list")
    public String projectList(@RequestParam(value = "keyword", required = false) String keyword,
                              @RequestParam(value = "fenleiId", required = false) Integer fenleiId,
                              Model model) {
        List<Paotuixiangmu> list = paotuixiangmuService.listCanJiedan(keyword, fenleiId);
        model.addAttribute("list", list);
        model.addAttribute("fenleiList", paotuifenleiService.all());
        model.addAttribute("keyword", keyword);
        model.addAttribute("fenleiId", fenleiId);
        return "paotui/project_list";
    }

    // 接单
    @PostMapping("/project/jiedan")
    @ResponseBody
    public R jiedan(@RequestParam("projectId") Integer projectId, HttpSession session) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        Paotuixiangmu project = paotuixiangmuService.getById(projectId);
        if (project == null || project.getStatus() != 0) {
            return R.error("该项目已被接单或不存在");
        }

        Jiedanxinxi exist = jiedanxinxiService.selectByProjectIdAndPaotuiId(projectId, paotui.getId());
        if (exist != null) {
            return R.error("您已经接过该订单");
        }

        Jiedanxinxi order = new Jiedanxinxi();
        order.setOrderNo("JD" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + (int)(Math.random() * 1000));
        order.setProjectId(projectId);
        order.setUserId(project.getUserId());
        order.setPaotuiId(paotui.getId());
        order.setPaotuiName(paotui.getName());
        order.setPaotuiPhone(paotui.getPhone());
        order.setFee(project.getFee());
        order.setStatus(1);
        jiedanxinxiService.add(order);

        paotuixiangmuService.updateStatus(projectId, 1);
        return R.ok("接单成功");
    }

    // 我的接单
    @GetMapping("/order/list")
    public String orderList(HttpSession session, Model model) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        Map<String, Object> params = new HashMap<>();
        params.put("paotuiId", paotui.getId());
        List<Jiedanxinxi> list = jiedanxinxiService.list(params);
        model.addAttribute("list", list);
        return "paotui/order_list";
    }

    // 跑腿员送达订单
    @GetMapping("/order/deliver/{id}")
    public String deliver(@PathVariable("id") Integer id, HttpSession session) {
        Jiedanxinxi order = jiedanxinxiService.getById(id);
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        if (order != null && paotui != null && order.getPaotuiId().equals(paotui.getId()) && order.getStatus() == 1) {
            jiedanxinxiService.deliver(id);
        }
        return "redirect:/paotui/order/list";
    }

    // 确认订单查看
    @GetMapping("/confirm/list")
    public String confirmList(HttpSession session, Model model) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        Map<String, Object> params = new HashMap<>();
        params.put("paotuiId", paotui.getId());
        List<Querendingdan> list = querendingdanService.list(params);
        model.addAttribute("list", list);
        return "paotui/confirm_list";
    }

    // 交易反馈
    @GetMapping("/fankui/list")
    public String fankuiList(HttpSession session, Model model) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        Map<String, Object> params = new HashMap<>();
        params.put("paotuiId", paotui.getId());
        List<Jiaoyifankui> list = jiaoyifankuiService.list(params);
        model.addAttribute("list", list);
        return "paotui/fankui_list";
    }

    @GetMapping("/fankui/add")
    public String fankuiAdd(Model model, HttpSession session) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        Map<String, Object> params = new HashMap<>();
        params.put("paotuiId", paotui.getId());
        model.addAttribute("confirmList", querendingdanService.list(params));
        return "paotui/fankui_add";
    }

    @PostMapping("/fankui/save")
    public String fankuiSave(Jiaoyifankui fankui, HttpSession session) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        fankui.setPaotuiId(paotui.getId());
        fankui.setPaotuiName(paotui.getName());
        Querendingdan confirm = querendingdanService.getByOrderNo(fankui.getOrderNo());
        if (confirm != null) {
            fankui.setProjectId(confirm.getProjectId());
        }
        jiaoyifankuiService.add(fankui);
        return "redirect:/paotui/fankui/list";
    }

    @GetMapping("/fankui/edit/{id}")
    public String fankuiEdit(@PathVariable("id") Integer id, Model model, HttpSession session) {
        Paotui paotui = (Paotui) session.getAttribute("paotui");
        model.addAttribute("fankui", jiaoyifankuiService.getById(id));
        Map<String, Object> params = new HashMap<>();
        params.put("paotuiId", paotui.getId());
        model.addAttribute("confirmList", querendingdanService.list(params));
        return "paotui/fankui_edit";
    }

    @PostMapping("/fankui/update")
    public String fankuiUpdate(Jiaoyifankui fankui) {
        Querendingdan confirm = querendingdanService.getByOrderNo(fankui.getOrderNo());
        if (confirm != null) {
            fankui.setProjectId(confirm.getProjectId());
        }
        jiaoyifankuiService.update(fankui);
        return "redirect:/paotui/fankui/list";
    }

    @GetMapping("/fankui/delete/{id}")
    public String fankuiDelete(@PathVariable("id") Integer id) {
        jiaoyifankuiService.delete(id);
        return "redirect:/paotui/fankui/list";
    }
}

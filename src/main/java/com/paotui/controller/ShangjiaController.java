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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/shangjia")
public class ShangjiaController {

    @Autowired
    private ShangjiaService shangjiaService;
    @Autowired
    private PaotuixiangmuService paotuixiangmuService;
    @Autowired
    private PaotuifenleiService paotuifenleiService;
    @Autowired
    private JiedanxinxiService jiedanxinxiService;
    @Autowired
    private TixingxinxiService tixingxinxiService;

    @GetMapping("/index")
    public String index(HttpSession session, Model model) {
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        model.addAttribute("shangjia", shangjia);

        Map<String, Object> params = new HashMap<>();
        params.put("shangjiaId", shangjia.getId());
        model.addAttribute("projectCount", paotuixiangmuService.list(params).size());

        params.clear();
        params.put("shangjiaId", shangjia.getId());
        model.addAttribute("tixingCount", tixingxinxiService.list(params).size());
        return "shangjia/index";
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        model.addAttribute("shangjia", shangjiaService.getById(shangjia.getId()));
        return "shangjia/profile";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(Shangjia shangjia, HttpSession session) {
        Shangjia login = (Shangjia) session.getAttribute("shangjia");
        shangjia.setId(login.getId());
        shangjiaService.update(shangjia);
        session.setAttribute("shangjia", shangjiaService.getById(login.getId()));
        return "redirect:/shangjia/profile";
    }

    @PostMapping("/updatePassword")
    @ResponseBody
    public R updatePassword(@RequestParam("oldPassword") String oldPassword,
                            @RequestParam("newPassword") String newPassword,
                            HttpSession session) {
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        Shangjia db = shangjiaService.getById(shangjia.getId());
        if (!db.getPassword().equals(oldPassword)) {
            return R.error("原密码错误");
        }
        Shangjia update = new Shangjia();
        update.setId(shangjia.getId());
        update.setPassword(newPassword);
        shangjiaService.update(update);
        return R.ok("修改成功");
    }

    // 跑腿项目管理
    @GetMapping("/project/list")
    public String projectList(HttpSession session, Model model) {
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        Map<String, Object> params = new HashMap<>();
        params.put("shangjiaId", shangjia.getId());
        List<Paotuixiangmu> list = paotuixiangmuService.list(params);
        model.addAttribute("list", list);
        return "shangjia/project_list";
    }

    @GetMapping("/project/add")
    public String projectAdd(Model model) {
        model.addAttribute("fenleiList", paotuifenleiService.all());
        return "shangjia/project_add";
    }

    @PostMapping("/project/save")
    public String projectSave(Paotuixiangmu project,
                              @RequestParam(value = "file", required = false) MultipartFile file,
                              HttpServletRequest request, HttpSession session) {
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        project.setShangjiaId(shangjia.getId());
        project.setStatus(0);
        if (file != null && !file.isEmpty()) {
            project.setCover(FileUploadUtil.upload(file, request, "upload"));
        }
        paotuixiangmuService.add(project);
        return "redirect:/shangjia/project/list";
    }

    @GetMapping("/project/edit/{id}")
    public String projectEdit(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("project", paotuixiangmuService.getById(id));
        model.addAttribute("fenleiList", paotuifenleiService.all());
        return "shangjia/project_edit";
    }

    @PostMapping("/project/update")
    public String projectUpdate(Paotuixiangmu project,
                                @RequestParam(value = "file", required = false) MultipartFile file,
                                HttpServletRequest request) {
        if (file != null && !file.isEmpty()) {
            project.setCover(FileUploadUtil.upload(file, request, "upload"));
        }
        paotuixiangmuService.update(project);
        return "redirect:/shangjia/project/list";
    }

    @GetMapping("/project/delete/{id}")
    public String projectDelete(@PathVariable("id") Integer id) {
        paotuixiangmuService.delete(id);
        return "redirect:/shangjia/project/list";
    }

    // 接单信息管理
    @GetMapping("/order/list")
    public String orderList(HttpSession session, Model model) {
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        Map<String, Object> params = new HashMap<>();
        params.put("shangjiaId", shangjia.getId());
        List<Paotuixiangmu> projects = paotuixiangmuService.list(params);
        model.addAttribute("projectList", projects);

        List<Integer> projectIds = new java.util.ArrayList<>();
        for (Paotuixiangmu p : projects) {
            projectIds.add(p.getId());
        }
        if (!projectIds.isEmpty()) {
            params.clear();
            params.put("projectIds", projectIds);
            model.addAttribute("orderList", jiedanxinxiService.list(params));
        } else {
            model.addAttribute("orderList", new java.util.ArrayList<>());
        }
        return "shangjia/order_list";
    }

    @GetMapping("/order/accept/{id}")
    public String accept(@PathVariable("id") Integer id, HttpSession session) {
        jiedanxinxiService.accept(id);
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        Jiedanxinxi order = jiedanxinxiService.getById(id);
        // 发送提醒
        Tixingxinxi tixing = new Tixingxinxi();
        tixing.setShangjiaId(shangjia.getId());
        tixing.setOrderNo(order.getOrderNo());
        tixing.setTitle("订单已接受");
        tixing.setContent("您发布的订单 " + order.getOrderNo() + " 已被接单员接受");
        tixingxinxiService.add(tixing);
        return "redirect:/shangjia/order/list";
    }

    @GetMapping("/order/reject/{id}")
    public String reject(@PathVariable("id") Integer id, HttpSession session) {
        jiedanxinxiService.reject(id);
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        Jiedanxinxi order = jiedanxinxiService.getById(id);
        // 恢复项目状态
        paotuixiangmuService.updateStatus(order.getProjectId(), 0);
        // 发送提醒
        Tixingxinxi tixing = new Tixingxinxi();
        tixing.setShangjiaId(shangjia.getId());
        tixing.setOrderNo(order.getOrderNo());
        tixing.setTitle("订单已拒绝");
        tixing.setContent("您发布的订单 " + order.getOrderNo() + " 已被拒绝");
        tixingxinxiService.add(tixing);
        return "redirect:/shangjia/order/list";
    }

    // 提醒信息管理
    @GetMapping("/tixing/list")
    public String tixingList(HttpSession session, Model model) {
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        Map<String, Object> params = new HashMap<>();
        params.put("shangjiaId", shangjia.getId());
        List<Tixingxinxi> list = tixingxinxiService.list(params);
        model.addAttribute("list", list);
        return "shangjia/tixing_list";
    }

    @GetMapping("/tixing/add")
    public String tixingAdd() {
        return "shangjia/tixing_add";
    }

    @PostMapping("/tixing/save")
    public String tixingSave(Tixingxinxi tixing, HttpSession session) {
        Shangjia shangjia = (Shangjia) session.getAttribute("shangjia");
        tixing.setShangjiaId(shangjia.getId());
        tixingxinxiService.add(tixing);
        return "redirect:/shangjia/tixing/list";
    }

    @GetMapping("/tixing/read/{id}")
    public String tixingRead(@PathVariable("id") Integer id) {
        tixingxinxiService.read(id);
        return "redirect:/shangjia/tixing/list";
    }

    @GetMapping("/tixing/delete/{id}")
    public String tixingDelete(@PathVariable("id") Integer id) {
        tixingxinxiService.delete(id);
        return "redirect:/shangjia/tixing/list";
    }
}
